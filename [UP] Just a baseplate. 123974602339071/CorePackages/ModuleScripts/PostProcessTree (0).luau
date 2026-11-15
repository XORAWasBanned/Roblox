-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.WikiMarkdownParser.PostProcessTree
local v1 = script:FindFirstAncestor("Markdown")
require(v1.Types)
local v_u_2 = table.insert
local v3 = require(script.Parent.Parent.Constants)
local v_u_4 = v3.CONTAINERS
local v_u_5 = v3.INLINE_TEXT
local v_u_6 = v3.PLAIN_TEXT
local v_u_7 = v3.STYLED_TEXT
local v_u_8 = require(script.Parent.Parent.getNodeType)
local v_u_9 = require(script.Parent.Parent.isNodeBlock)
local v_u_90 = {
	["postProcessTree"] = function(p10, p11) -- name: postProcessTree
		-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_90, (copy) v_u_2, (copy) v_u_6, (copy) v_u_9
		local v12 = {}
		local v13 = 1
		local v14 = p10.children
		local v15
		if p10.name == "TAG" then
			v15 = p11.inlineTags[p10.text]
		else
			v15 = false
		end
		local v16 = v_u_4[p10.name]
		if v16 then
			v16 = not v15
		end
		while v13 <= #v14 do
			local v17 = v14[v13]
			local v18 = v17.name == "TAG" and v17.text
			if v18 then
				v18 = p11.inlineTags[v17.text]
			end
			if (v_u_5[v17.name] or v18) and v16 then
				local v19, v20 = v_u_90.buildParagraph(v14, v13, p11)
				local v21 = v19 > 0
				assert(v21, "Did not find an inline node when expected")
				if #v20.children > 0 then
					v_u_2(v12, v20)
				end
				v13 = v13 + v19
			elseif v_u_6[v17.name] then
				local v22, v23 = v_u_90.mergeTextNodes(v14, v13, p11)
				local v24 = v22 > 0
				assert(v24, "Did not find a text node when expected")
				if v23.text and #v23.text > 0 then
					v_u_2(v12, v23)
				end
				v13 = v13 + v22
			elseif v17.name == "LIST_ITEM" then
				local v25, v26 = v_u_90.buildList(v14, v13, p11)
				v_u_2(v12, v26)
				local v27 = v25 > 0
				assert(v27, "Did not find a list node when expected")
				v13 = v13 + v25
			elseif v17.name == "TABLE_ROW" then
				local v28, v29 = v_u_90.buildTable(v14, v13, p11)
				v_u_2(v12, v29)
				local v30 = v28 > 0
				assert(v30, "Did not find a table row node when expected")
				v13 = v13 + v28
			elseif v17.name == "LINE_BREAK" then
				v13 = v13 + 1
			else
				v17.children = v_u_90.postProcessTree(v17, p11)
				v_u_2(v12, v17)
				v13 = v13 + 1
			end
		end
		if v_u_9(p10) then
			local v31 = v12[1]
			if v31 and v31.text then
				v31.text = v31.text:gsub("^%s+", "")
			end
			local v32 = v12[#v12]
			if v32 and v32.text then
				v32.text = v32.text:gsub("%s+$", "")
			end
		end
		return v12
	end,
	["buildParagraph"] = function(p33, p34, p35) -- name: buildParagraph
		-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_90, (copy) v_u_2, (copy) v_u_8
		local v36 = p34
		local v37 = 0
		local v38 = {}
		while p34 <= #p33 do
			local v39 = p33[p34]
			local v40 = v39.name == "TAG" and v39.text
			if v40 then
				v40 = p35.inlineTags[v39.text]
			end
			local v41 = v_u_5[v39.name] or v40
			if v_u_6[v39.name] then
				local v42, v43 = v_u_90.mergeTextNodes(p33, p34, p35)
				if v43.text and #v43.text > 0 then
					v_u_2(v38, v43)
				end
				local v44 = v42 > 0
				assert(v44, "Did not find a rich text node when expected")
				v37 = v37 + v42
				p34 = p34 + v42
			else
				if not v41 then
					break
				end
				v_u_2(v38, v39)
				v37 = v37 + 1
				p34 = p34 + 1
			end
		end
		return v37, {
			["name"] = "PARAGRAPH",
			["children"] = nil,
			["offset"] = nil,
			["type"] = nil,
			["children"] = v38,
			["offset"] = p33[v36].offset,
			["type"] = v_u_8("PARAGRAPH", p35)
		}
	end,
	["outputRichText"] = function(p45, p46) -- name: outputRichText
		-- upvalues: (copy) v_u_7, (copy) v_u_90
		local v47
		if p45.attributes then
			v47 = v_u_7[p45.attributes.style]
		else
			v47 = nil
		end
		if v47 then
			local v48, v49 = v_u_90.mergeTextNodes(p45.children, 1, p46)
			local v50 = v48 == #p45.children
			local v51 = ("Found non-inline content inside inline element at %*"):format(p45.offset)
			assert(v50, v51)
			return ("<%*>%*</%*>"):format(v47, v49.text, v47)
		end
		if p45.text then
			return p45.text
		end
		local v52 = ("No text for node at %*"):format(p45.offset)
		assert(false, v52)
	end,
	["buildList"] = function(p53, p54, p55) -- name: buildList
		-- upvalues: (copy) v_u_90, (copy) v_u_2, (copy) v_u_8
		local v56 = p53[p54].attributes.depth
		local v57 = p54
		local v58 = {}
		local v59 = 0
		while p54 <= #p53 do
			local v60 = p53[p54]
			if v60.name ~= "LIST_ITEM" then
				break
			end
			if v60.attributes.depth == v56 then
				v60.children = v_u_90.postProcessTree(v60, p55)
				v_u_2(v58, v60)
				v59 = v59 + 1
				p54 = p54 + 1
			else
				if v56 >= v60.attributes.depth then
					break
				end
				local v61, v62 = v_u_90.buildList(p53, p54, p55)
				v_u_2(v58, v62)
				local v63 = v61 > 0
				assert(v63, "Did not find a list node when expected")
				p54 = p54 + v61
				v59 = v59 + v61
			end
		end
		return v59, {
			["name"] = "LIST",
			["attributes"] = nil,
			["children"] = nil,
			["offset"] = nil,
			["type"] = nil,
			["attributes"] = {
				["depth"] = v56
			},
			["children"] = v58,
			["offset"] = p53[v57].offset,
			["type"] = v_u_8("LIST", p55)
		}
	end,
	["buildTable"] = function(p64, p65, p66) -- name: buildTable
		-- upvalues: (copy) v_u_90, (copy) v_u_2, (copy) v_u_8
		local v67 = 0
		local v68 = {}
		for v69 = p65, #p64 do
			local v70 = p64[v69]
			if v70.name ~= "TABLE_ROW" then
				break
			end
			local v71 = v_u_90.buildTableCells(v70, p66)
			if v71 then
				v70.children = v71
				v_u_2(v68, v70)
			elseif #v68 > 0 then
				v68[#v68].name = "TABLE_HEADER"
			end
			v67 = v67 + 1
		end
		return v67, {
			["name"] = "TABLE",
			["children"] = nil,
			["offset"] = nil,
			["type"] = nil,
			["children"] = v68,
			["offset"] = p64[p65].offset,
			["type"] = v_u_8("TABLE", p66)
		}
	end,
	["buildTableCells"] = function(p72, p73) -- name: buildTableCells
		-- upvalues: (copy) v_u_8, (copy) v_u_90, (copy) v_u_2
		local v74 = p72.children[1]
		local v75 = {}
		local v76 = true
		local v77 = {}
		for v78 = 1, #p72.children do
			local v79 = p72.children[v78]
			if v79.name == "TABLE_DIVIDER" then
				local v80 = {
					["name"] = "TABLE_CELL",
					["children"] = nil,
					["offset"] = nil,
					["type"] = nil,
					["children"] = v75
				}
				local v81
				if v75[1] then
					v81 = v75[1].offset
				else
					v81 = p72.offset
				end
				v80.offset = v81
				v80.type = v_u_8("TABLE_CELL", p73)
				v80.children = v_u_90.postProcessTree(v80, p73)
				v_u_2(v77, v80)
				local v82 = v74.text
				if v82 then
					v82 = v74.text:match("^[ \t-=]+$") ~= nil
				end
				v75 = {}
				v76 = v76 and v82 and v82 or false
			else
				v_u_2(v75, v79)
			end
		end
		if v76 then
			return nil
		else
			return v77
		end
	end,
	["mergeTextNodes"] = function(p83, p84, p85) -- name: mergeTextNodes
		-- upvalues: (copy) v_u_6, (copy) v_u_8
		local v86 = ""
		local v87 = 0
		for v88 = p84, #p83 do
			local v89 = p83[v88]
			if not v_u_6[v89.name] then
				break
			end
			v86 = v86 .. v89.text
			v87 = v87 + 1
		end
		return v87, {
			["name"] = "TEXT",
			["text"] = nil,
			["children"] = nil,
			["offset"] = nil,
			["type"] = nil,
			["text"] = v86:gsub("^\n*(.-)\n*$", "%1"),
			["children"] = {},
			["offset"] = p83[p84].offset,
			["type"] = v_u_8("TEXT", p85)
		}
	end
}
return v_u_90.postProcessTree