-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.CommonMarkComplianceParser.BuildTree
local v1 = script:FindFirstAncestor("Markdown")
require(v1.Types)
local v2 = require(script.Parent.Parent.Constants)
local v_u_3 = v2.LISTS
local v_u_4 = v2.STYLED_TEXT
local v_u_5 = v2.DIVIDERS
local v_u_6 = require(v1.Enums.NodeType)
local v_u_7 = require(script.Parent.Parent.getNodeType)
local v_u_8 = require(script.Parent.Parent.isNodeBlock)
local v_u_9 = require(v1.Parent.MarkdownCore).Flags
local v_u_10 = table.insert
local v_u_11 = {
	["area"] = true,
	["base"] = true,
	["br"] = true,
	["col"] = true,
	["embed"] = true,
	["hr"] = true,
	["img"] = true,
	["input"] = true,
	["link"] = true,
	["meta"] = true,
	["source"] = true,
	["track"] = true,
	["wbr"] = true
}
local v_u_12 = {
	["Button"] = true
}
local v_u_13 = {}
local function v_u_16(p14, p15) -- name: createTextNode
	-- upvalues: (copy) v_u_7
	return {
		["name"] = "TEXT",
		["text"] = nil,
		["children"] = nil,
		["offset"] = nil,
		["type"] = nil,
		["text"] = p14.text,
		["children"] = {},
		["offset"] = p14.offset,
		["type"] = v_u_7("TEXT", p15)
	}
end
local function v_u_22(p17, p18, p19) -- name: createHorizontalRuleNode
	-- upvalues: (copy) v_u_6, (copy) v_u_7
	local v20
	if p18.type == v_u_6.Root then
		v20 = true
	elseif p18.type == v_u_6.Block then
		v20 = p18.name ~= "TABLE_ROW"
	else
		v20 = false
	end
	local v21 = v20 and "DIVIDER" or "BREAK"
	return {
		["name"] = v21,
		["children"] = {},
		["offset"] = p17.offset,
		["type"] = v_u_7(v21, p19)
	}
end
local function v_u_26(p23, p24) -- name: isLineStartAfter
	if p23.isBlock then
		return true
	end
	if p23.name ~= "TEXT" then
		return false
	end
	local v25 = string.match(p23.text, "\n([^\n]*)$")
	if v25 then
		return string.find(v25, "^[ \t]*$") ~= nil
	end
	if p24 then
		p24 = string.find(p23.text, "^[ \t]*$") ~= nil
	end
	return p24
end
local function v_u_30(p27) -- name: isWellFormedOpenTag
	local v28 = string.match(p27, "^<%a[%w%-]*(.-)>$")
	while v28 and string.find(v28, "%S") do
		local v29 = string.match(v28, "^%s+[%a_:][%w_%.:%-]*(.*)$")
		if not v29 then
			return false
		end
		v28 = string.match(v29, "^%s*=%s*\"[^\"]*\"(.*)$") or string.match(v29, "^%s*=%s*\'[^\']*\'(.*)$") or (string.match(v29, "^%s*=%s*[^%s\"\'=<>`]+(.*)$") or v29)
	end
	return v28 ~= nil
end
local function v_u_55(p31, p32) -- name: findUnpairedTags
	-- upvalues: (copy) v_u_26, (copy) v_u_11, (copy) v_u_10, (copy) v_u_12, (copy) v_u_30
	local v33 = true
	local v34 = false
	local v35 = {}
	local v36 = 1
	local v37 = {}
	for _, v38 in p31 do
		local v39 = v_u_26(v38, v33)
		if v38.isBlock then
			if v34 then
				for v40 = #v35, v36, -1 do
					v37[v35[v40].token] = true
					v35[v40] = nil
				end
			end
			for v41, v42 in v35 do
				if not p32.inlineTags[v42.tag] then
					continue
				end
				for v43 = #v35, v41, -1 do
					v37[v35[v43].token] = true
					v35[v43] = nil
				end
			end
			v34 = v38.name == "TABLE_ROW"
			if v34 then
				v36 = #v35 + 1
			else
				v36 = 1
			end
		elseif v34 and v38.name == "TABLE_DIVIDER" then
			for v44 = #v35, v36, -1 do
				v37[v35[v44].token] = true
				v35[v44] = nil
			end
		end
		if v38.capture then
			local v45 = v38.capture[1]
			if v38.name == "OPEN" and not v_u_11[v45] then
				v_u_10(v35, {
					["token"] = v38,
					["tag"] = v45,
					["startsLine"] = v33
				})
				v33 = v39
			elseif v38.name == "CLOSE" then
				local v46 = nil
				for v47 = #v35, v36, -1 do
					if v35[v47].tag ~= v45 then
						continue
					end
					v46 = v47
				end
				if v46 then
					local v48 = v46 + 1
					for v49 = #v35, v48, -1 do
						v37[v35[v49].token] = true
						v35[v49] = nil
					end
					v35[v46] = nil
					v33 = v39
				else
					v37[v38] = true
					v33 = v39
				end
			else
				v33 = v39
			end
		else
			v33 = v39
		end
	end
	for _, v50 in v35 do
		if p32.isStreaming then
			local v51 = v50.token
			local v52 = v50.startsLine
			local v53 = v51.capture[1]
			local v54 = not v_u_12[v53]
			if v54 then
				if p32.inlineTags[v53] == true or v52 then
					v52 = v_u_30(v51.text)
				end
			else
				v52 = v54
			end
			if v52 then
				continue
			end
		end
		v37[v50.token] = true
	end
	return v37
end
function v_u_13.buildTree(p56, p57) -- name: buildTree
	-- upvalues: (copy) v_u_9, (copy) v_u_55, (copy) v_u_6, (copy) v_u_7, (copy) v_u_10, (copy) v_u_13, (copy) v_u_12, (copy) v_u_4, (copy) v_u_16, (copy) v_u_3, (copy) v_u_8, (copy) v_u_5, (copy) v_u_22, (copy) v_u_11
	local v58 = not v_u_9.FFlagMarkdownTagFallbacks and {} or v_u_55(p56, p57)
	local v59 = {
		["name"] = "ROOT",
		["children"] = nil,
		["offset"] = 1,
		["type"] = nil,
		["children"] = {},
		["type"] = v_u_6.Root
	}
	local v60 = 1
	local v61 = { v59 }
	while true do
		while true do
			if v60 > #p56 then
				v_u_13.closeNode(v61, function(p62)
					-- upvalues: (ref) v_u_8
					return v_u_8(p62)
				end)
				v_u_13.closeNode(v61, function(p63)
					return p63.name == "ROOT"
				end)
				return v59
			end
			local v_u_64 = p56[v60]
			local v65 = v61[#v61]
			if v_u_64.name ~= "CODE_BLOCK" or not v_u_64.capture then
				break
			end
			local v66 = string.gsub(v_u_64.capture[2], "^%s*(.-)%s*$", "%1")
			v_u_10(v65.children, {
				["name"] = "CODE_BLOCK",
				["text"] = nil,
				["children"] = nil,
				["attributes"] = nil,
				["offset"] = nil,
				["type"] = nil,
				["text"] = v66,
				["children"] = {},
				["attributes"] = {
					["language"] = v_u_64.capture[1]
				},
				["offset"] = v_u_64.offset,
				["type"] = v_u_7("CODE_BLOCK", p57)
			})
			v60 = v60 + 1
		end
		if v_u_64.name == "EMPHASIS_START" then
			v_u_10(v61, {
				["name"] = "STYLED_TEXT",
				["attributes"] = nil,
				["children"] = nil,
				["offset"] = nil,
				["type"] = nil,
				["attributes"] = {
					["style"] = v_u_64.text
				},
				["children"] = {},
				["offset"] = v_u_64.offset,
				["type"] = v_u_7("STYLED_TEXT", p57)
			})
			v60 = v60 + 1
		elseif v_u_64.name == "EMPHASIS_END" then
			v_u_13.closeNode(v61, function(p67)
				return p67.name == "STYLED_TEXT"
			end)
			v60 = v60 + 1
		elseif v_u_9.FFlagMarkdownTagFallbacks and (v58[v_u_64] and (v_u_64.name == "OPEN" and (v_u_64.capture and v_u_12[v_u_64.capture[1]]))) then
			local v68 = v_u_64.capture[2]
			v_u_10(v65.children, {
				["name"] = "TAG",
				["text"] = nil,
				["attributes"] = nil,
				["children"] = nil,
				["offset"] = nil,
				["type"] = nil,
				["text"] = v_u_64.capture[1],
				["attributes"] = not v68 and {} or v_u_13.parseXmlAttributes(v68),
				["children"] = {},
				["offset"] = v_u_64.offset,
				["type"] = v_u_6.Block
			})
			v60 = v60 + 1
		elseif v_u_4[v_u_64.name] or v_u_9.FFlagMarkdownTagFallbacks and v58[v_u_64] then
			v_u_10(v65.children, (v_u_16(v_u_64, p57)))
			v60 = v60 + 1
		elseif v_u_3[v_u_64.name] and v_u_64.capture then
			v_u_13.closeNode(v61, function(p69)
				-- upvalues: (ref) v_u_8
				return v_u_8(p69)
			end)
			v_u_10(v61, {
				["name"] = "LIST_ITEM",
				["children"] = nil,
				["attributes"] = nil,
				["offset"] = nil,
				["type"] = nil,
				["children"] = {},
				["attributes"] = {
					["depth"] = #v_u_64.capture[1],
					["prefix"] = v_u_64.capture[2]
				},
				["offset"] = v_u_64.offset,
				["type"] = v_u_7("LIST_ITEM", p57)
			})
			v60 = v60 + 1
		elseif v_u_64.name == "HEADING" and not v_u_64.isBlock then
			if not v_u_13.closeNode(v61, function(p70)
				return p70.name == "HEADING"
			end) then
				v_u_10(v65.children, (v_u_16(v_u_64, p57)))
			end
			v60 = v60 + 1
		elseif v_u_64.isBlock then
			v_u_13.closeNode(v61, function(p71)
				-- upvalues: (ref) v_u_8
				return v_u_8(p71)
			end)
			local v72
			if v_u_5[v_u_64.name] then
				v72 = v61[#v61].children
			else
				v72 = v61
			end
			local v73 = {}
			local v74 = {}
			if v_u_64.name == "HEADING" and v_u_64.capture then
				v73.depth = #v_u_64.capture[1]
			end
			v_u_10(v72, {
				["name"] = v_u_64.name,
				["children"] = v74,
				["attributes"] = v73,
				["offset"] = v_u_64.offset,
				["type"] = v_u_7(v_u_64.name, p57)
			})
			v60 = v60 + 1
		elseif v_u_64.name == "ESCAPE" and v_u_64.capture then
			v_u_10(v65.children, {
				["name"] = "TEXT",
				["text"] = nil,
				["offset"] = nil,
				["children"] = nil,
				["type"] = nil,
				["text"] = v_u_64.capture[1],
				["offset"] = v_u_64.offset,
				["children"] = {},
				["type"] = v_u_7("TEXT", p57)
			})
			v60 = v60 + 1
		elseif v_u_64.name == "LINK_START" and v_u_64.capture then
			v_u_10(v61, {
				["text"] = nil,
				["name"] = "LINK",
				["attributes"] = nil,
				["children"] = nil,
				["offset"] = nil,
				["type"] = nil,
				["text"] = v_u_64.capture[1],
				["attributes"] = {
					["url"] = v_u_64.capture[2],
					["title"] = v_u_64.capture[3]
				},
				["children"] = {},
				["offset"] = v_u_64.offset,
				["type"] = v_u_7("LINK", p57)
			})
			v60 = v60 + 1
		elseif v_u_64.name == "LINK_END" then
			v_u_13.closeNode(v61, function(p75)
				return p75.name == "LINK"
			end)
			v60 = v60 + 1
		elseif v_u_64.name == "IMAGE" and v_u_64.capture then
			v_u_10(v65.children, {
				["name"] = v_u_64.name,
				["text"] = v_u_64.capture[1],
				["attributes"] = {
					["url"] = v_u_64.capture[2],
					["title"] = v_u_64.capture[3]
				},
				["offset"] = v_u_64.offset,
				["children"] = {},
				["type"] = v_u_7("IMAGE", p57)
			})
			v60 = v60 + 1
		elseif v_u_64.name == "OPEN_CLOSE" and v_u_64.capture then
			local v76 = v_u_64.capture[1]
			local v77 = v_u_64.capture[2]
			if v_u_64.capture and v76 == "br" then
				v_u_10(v65.children, {
					["name"] = "BREAK",
					["children"] = nil,
					["offset"] = nil,
					["type"] = nil,
					["children"] = {},
					["offset"] = v_u_64.offset,
					["type"] = v_u_7("BREAK", p57)
				})
			elseif v_u_9.FFlagMarkdownTagFallbacks and v76 == "hr" then
				v_u_10(v65.children, (v_u_22(v_u_64, v65, p57)))
			else
				local v78 = v65.children
				local v79 = {
					["name"] = "TAG",
					["text"] = nil,
					["attributes"] = nil,
					["children"] = nil,
					["offset"] = nil,
					["type"] = nil,
					["text"] = v76,
					["attributes"] = not v77 and {} or v_u_13.parseXmlAttributes(v77),
					["children"] = {},
					["offset"] = v_u_64.offset
				}
				local v80
				if p57.inlineTags[v76] then
					v80 = v_u_6.InlineSpan
				else
					v80 = v_u_6.Block
				end
				v79.type = v80
				v_u_10(v78, v79)
			end
			v60 = v60 + 1
		elseif v_u_64.name == "OPEN" and v_u_64.capture then
			local v81 = v_u_64.capture[1]
			local v82 = v_u_64.capture[2]
			if v_u_64.capture and v81 == "br" then
				v_u_10(v65.children, {
					["name"] = "BREAK",
					["children"] = nil,
					["offset"] = nil,
					["type"] = nil,
					["children"] = {},
					["offset"] = v_u_64.offset,
					["type"] = v_u_7("BREAK", p57)
				})
			elseif v_u_9.FFlagMarkdownTagFallbacks and v81 == "hr" then
				v_u_10(v65.children, (v_u_22(v_u_64, v65, p57)))
			elseif v_u_9.FFlagMarkdownTagFallbacks and v_u_11[v81] then
				local v83 = v65.children
				local v84 = {
					["name"] = "TAG",
					["text"] = nil,
					["attributes"] = nil,
					["children"] = nil,
					["offset"] = nil,
					["type"] = nil,
					["text"] = v81,
					["attributes"] = not v82 and {} or v_u_13.parseXmlAttributes(v82),
					["children"] = {},
					["offset"] = v_u_64.offset
				}
				local v85
				if p57.inlineTags[v81] then
					v85 = v_u_6.InlineSpan
				else
					v85 = v_u_6.Block
				end
				v84.type = v85
				v_u_10(v83, v84)
			else
				local v86 = {
					["name"] = "TAG",
					["text"] = nil,
					["attributes"] = nil,
					["children"] = nil,
					["offset"] = nil,
					["type"] = nil,
					["text"] = v81,
					["attributes"] = not v82 and {} or v_u_13.parseXmlAttributes(v82),
					["children"] = {},
					["offset"] = v_u_64.offset
				}
				local v87
				if p57.inlineTags[v81] then
					v87 = v_u_6.InlineSpan
				else
					v87 = v_u_6.Block
				end
				v86.type = v87
				v_u_10(v61, v86)
			end
			v60 = v60 + 1
		elseif v_u_9.FFlagMarkdownTagFallbacks and (v_u_64.name == "CLOSE" and v_u_64.capture) then
			local v_u_88 = v_u_64.capture[1]
			if not v_u_13.closeNode(v61, function(p89)
				-- upvalues: (copy) v_u_88
				local v90
				if p89.name == "TAG" then
					v90 = p89.text == v_u_88
				else
					v90 = false
				end
				return v90
			end) then
				v_u_10(v65.children, (v_u_16(v_u_64, p57)))
			end
			v60 = v60 + 1
		elseif v_u_64.name == "CLOSE" and v_u_64.capture then
			local v_u_91 = v_u_64.capture[1]
			local v95 = v_u_13.closeNode(v61, function(p92)
				-- upvalues: (copy) v_u_91, (copy) v_u_64
				if p92.name ~= "TAG" then
					return false
				end
				local v93 = p92.text == v_u_91
				local v94 = ("Found <%*> at %* when trying to close </%*> at %*"):format(p92.text, p92.offset, v_u_91, v_u_64.offset)
				assert(v93, v94)
				return true
			end)
			local v96 = ("No open tag exists trying to close </%*> at %*"):format(v_u_91, v_u_64.offset)
			assert(v95, v96)
			v60 = v60 + 1
		elseif v65.name == "HEADING" then
			local v97 = string.find(v_u_64.text, "\n", 1, true)
			if v97 then
				local v98 = v_u_64.text
				local v99 = v97 - 1
				local v100 = string.sub(v98, 1, v99)
				local v101 = v_u_64.text
				local v102 = v97 + 1
				local v103 = string.sub(v101, v102)
				if string.find(v103, "%S") == nil then
					v_u_10(v65.children, {
						["name"] = v_u_64.name,
						["text"] = v_u_64.text,
						["children"] = {},
						["offset"] = v_u_64.offset,
						["type"] = v_u_7(v_u_64.name, p57)
					})
					v60 = v60 + 1
				else
					v_u_10(v65.children, {
						["name"] = v_u_64.name,
						["text"] = v100,
						["children"] = {},
						["offset"] = v_u_64.offset,
						["type"] = v_u_7(v_u_64.name, p57)
					})
					v_u_13.closeNode(v61, function(p104)
						return p104.name == "HEADING"
					end)
					v_u_10(v61, {
						["name"] = "PARAGRAPH",
						["children"] = nil,
						["offset"] = nil,
						["type"] = nil,
						["children"] = {
							{
								["name"] = "TEXT",
								["text"] = nil,
								["children"] = nil,
								["offset"] = nil,
								["type"] = nil,
								["text"] = v103,
								["children"] = {},
								["offset"] = v_u_64.offset + v97 + 1,
								["type"] = v_u_7("TEXT", p57)
							}
						},
						["offset"] = v_u_64.offset,
						["type"] = v_u_7("PARAGRAPH", p57)
					})
					v60 = v60 + 1
				end
			else
				v_u_10(v65.children, {
					["name"] = v_u_64.name,
					["text"] = v_u_64.text,
					["children"] = {},
					["offset"] = v_u_64.offset,
					["type"] = v_u_7(v_u_64.name, p57)
				})
				v60 = v60 + 1
			end
		else
			v_u_10(v65.children, {
				["name"] = v_u_64.name,
				["text"] = v_u_64.text,
				["children"] = {},
				["offset"] = v_u_64.offset,
				["type"] = v_u_7(v_u_64.name, p57)
			})
			v60 = v60 + 1
		end
	end
end
function v_u_13.closeNode(p105, p106) -- name: closeNode
	-- upvalues: (copy) v_u_13, (copy) v_u_10
	local v107 = v_u_13.findLastNodeIndex(p105, p106)
	if not v107 then
		return nil
	end
	local v108 = p105[v107]
	for v109 = v107 + 1, #p105 do
		v_u_10(v108.children, p105[v109])
	end
	for _ = v107 + 1, #p105 do
		table.remove(p105)
	end
	local v110 = p105[v107 - 1]
	if v110 then
		table.remove(p105)
		v_u_10(v110.children, v108)
	end
	return v108
end
function v_u_13.findLastNodeIndex(p111, p112) -- name: findLastNodeIndex
	for v113 = #p111, 1, -1 do
		local v114 = p111[v113]
		local v115
		if typeof(p112) == "string" then
			v115 = v114.name == p112
		else
			v115 = p112(v114)
		end
		if not v115 then
			continue
		end
		return v113
	end
	return nil
end
function v_u_13.parseXmlAttributes(p116) -- name: parseXmlAttributes
	local v117 = {}
	for v118, v119 in p116:gmatch("%s*([A-Za-z0-9_-]+)=\"([^\"]+)\"%s*") do
		v117[v118] = v119
	end
	return v117
end
return v_u_13.buildTree