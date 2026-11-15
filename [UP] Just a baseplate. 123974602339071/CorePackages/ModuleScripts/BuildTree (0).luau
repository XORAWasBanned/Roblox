-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.WikiMarkdownParser.BuildTree
local v1 = script:FindFirstAncestor("Markdown")
require(v1.Types)
local v2 = require(script.Parent.Parent.Constants)
local v_u_3 = v2.LISTS
local v_u_4 = v2.STYLED_TEXT
local v_u_5 = v2.DIVIDERS
local v_u_6 = table.insert
local v_u_7 = require(v1.Enums.NodeType)
local v_u_8 = require(script.Parent.Parent.getNodeType)
local v_u_9 = require(script.Parent.Parent.isNodeBlock)
local v_u_60 = {
	["buildTree"] = function(p10, p11) -- name: buildTree
		-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_6, (copy) v_u_4, (copy) v_u_60, (copy) v_u_3, (copy) v_u_9, (copy) v_u_5
		local v12 = {
			["name"] = "ROOT",
			["children"] = nil,
			["offset"] = 1,
			["type"] = nil,
			["children"] = {},
			["type"] = v_u_7.Root
		}
		local v13 = 1
		local v14 = { v12 }
		while v13 <= #p10 do
			local v_u_15 = p10[v13]
			local v16 = v14[#v14]
			if v_u_15.name == "CODE_BLOCK" and v_u_15.capture then
				local v17 = string.gsub(v_u_15.capture[2], "^%s*(.-)%s*$", "%1")
				v_u_6(v16.children, {
					["name"] = "CODE_BLOCK",
					["text"] = nil,
					["children"] = nil,
					["attributes"] = nil,
					["offset"] = nil,
					["type"] = nil,
					["text"] = v17,
					["children"] = {},
					["attributes"] = {
						["language"] = v_u_15.capture[1]
					},
					["offset"] = v_u_15.offset,
					["type"] = v_u_8("CODE_BLOCK", p11)
				})
			elseif v_u_15.name == "INLINE_CODE" and v_u_15.capture then
				v_u_6(v16.children, {
					["name"] = "STYLED_TEXT",
					["attributes"] = nil,
					["children"] = nil,
					["offset"] = nil,
					["type"] = nil,
					["attributes"] = {
						["style"] = "INLINE_CODE"
					},
					["children"] = {
						{
							["name"] = "TEXT",
							["text"] = nil,
							["children"] = nil,
							["offset"] = nil,
							["type"] = nil,
							["text"] = v_u_15.capture[1],
							["children"] = {},
							["offset"] = v_u_15.offset,
							["type"] = v_u_8("TEXT", p11)
						}
					},
					["offset"] = v_u_15.offset,
					["type"] = v_u_8("STYLED_TEXT", p11)
				})
			elseif v_u_4[v_u_15.name] then
				if not v_u_60.closeNode(v14, function(p18)
					-- upvalues: (copy) v_u_15
					if p18.name ~= "STYLED_TEXT" or not (p18.attributes and p18.attributes.style) then
						return false
					end
					local v19 = p18.attributes.style == v_u_15.name
					local v20 = ("Can\'t put %* at %* inside %* at %*"):format(v_u_15.name, v_u_15.offset, p18.attributes.style, p18.offset)
					assert(v19, v20)
					return true
				end) then
					v_u_6(v14, {
						["name"] = "STYLED_TEXT",
						["attributes"] = nil,
						["children"] = nil,
						["offset"] = nil,
						["type"] = nil,
						["attributes"] = {
							["style"] = v_u_15.name
						},
						["children"] = {},
						["offset"] = v_u_15.offset,
						["type"] = v_u_8("STYLED_TEXT", p11)
					})
				end
			elseif v_u_3[v_u_15.name] and v_u_15.capture then
				v_u_60.closeNode(v14, function(p21)
					-- upvalues: (ref) v_u_9
					return v_u_9(p21)
				end)
				v_u_6(v14, {
					["name"] = "LIST_ITEM",
					["children"] = nil,
					["attributes"] = nil,
					["offset"] = nil,
					["type"] = nil,
					["children"] = {},
					["attributes"] = {
						["depth"] = #v_u_15.capture[1],
						["prefix"] = v_u_15.capture[2]
					},
					["offset"] = v_u_15.offset,
					["type"] = v_u_8("LIST_ITEM", p11)
				})
			elseif v_u_15.isBlock then
				v_u_60.closeNode(v14, function(p22)
					-- upvalues: (ref) v_u_9
					return v_u_9(p22)
				end)
				local v23 = {}
				if v_u_15.name == "HEADING" and v_u_15.capture then
					v23.depth = #v_u_15.capture[1]
				end
				local v24
				if v_u_5[v_u_15.name] then
					v24 = v14[#v14].children
				else
					v24 = v14
				end
				v_u_6(v24, {
					["name"] = v_u_15.name,
					["children"] = {},
					["attributes"] = v23,
					["offset"] = v_u_15.offset,
					["type"] = v_u_8(v_u_15.name, p11)
				})
			elseif v_u_15.name == "ESCAPE" and v_u_15.capture then
				v_u_6(v16.children, {
					["name"] = "TEXT",
					["text"] = nil,
					["offset"] = nil,
					["children"] = nil,
					["type"] = nil,
					["text"] = v_u_15.capture[1],
					["offset"] = v_u_15.offset,
					["children"] = {},
					["type"] = v_u_8("TEXT", p11)
				})
			elseif v_u_15.name == "LINK" and v_u_15.capture then
				local v25 = string.find(v_u_15.text, v_u_15.capture[1], 1, true)
				local v26 = v16.children
				local v27 = {
					["name"] = "LINK",
					["text"] = nil,
					["url"] = nil,
					["offset"] = nil,
					["children"] = nil,
					["type"] = nil,
					["text"] = v_u_15.capture[1],
					["url"] = v_u_15.capture[2],
					["offset"] = v_u_15.offset,
					["children"] = {
						{
							["name"] = "TEXT",
							["text"] = nil,
							["offset"] = nil,
							["children"] = nil,
							["type"] = nil,
							["text"] = v_u_15.capture[1],
							["offset"] = v25 or v_u_15.offset,
							["children"] = {},
							["type"] = v_u_8("TEXT", p11)
						}
					},
					["type"] = v_u_8("LINK", p11)
				}
				v_u_6(v26, v27)
			elseif v_u_15.name == "IMAGE" and v_u_15.capture then
				v_u_6(v16.children, {
					["name"] = v_u_15.name,
					["text"] = v_u_15.capture[1],
					["url"] = v_u_15.capture[2],
					["offset"] = v_u_15.offset,
					["children"] = {},
					["type"] = v_u_8("IMAGE", p11)
				})
			elseif v_u_15.name == "OPEN_CLOSE" and v_u_15.capture then
				local v28 = v_u_15.capture[1]
				local v29 = v_u_15.capture[2]
				if v_u_15.capture and v28 == "br" then
					v_u_6(v16.children, {
						["name"] = "BREAK",
						["children"] = nil,
						["offset"] = nil,
						["type"] = nil,
						["children"] = {},
						["offset"] = v_u_15.offset,
						["type"] = v_u_8("BREAK", p11)
					})
				else
					local v30 = v16.children
					local v31 = {
						["name"] = "TAG",
						["text"] = nil,
						["attributes"] = nil,
						["children"] = nil,
						["offset"] = nil,
						["type"] = nil,
						["text"] = v28,
						["attributes"] = not v29 and {} or v_u_60.parseXmlAttributes(v29),
						["children"] = {},
						["offset"] = v_u_15.offset
					}
					local v32
					if p11.inlineTags[v28] then
						v32 = v_u_7.InlineSpan
					else
						v32 = v_u_7.Block
					end
					v31.type = v32
					v_u_6(v30, v31)
				end
			elseif v_u_15.name == "OPEN" and v_u_15.capture then
				local v33 = v_u_15.capture[1]
				local v34 = v_u_15.capture[2]
				if v_u_15.capture and v33 == "br" then
					v_u_6(v16.children, {
						["name"] = "BREAK",
						["children"] = nil,
						["offset"] = nil,
						["type"] = nil,
						["children"] = {},
						["offset"] = v_u_15.offset,
						["type"] = v_u_8("BREAK", p11)
					})
				else
					local v35 = {
						["name"] = "TAG",
						["text"] = nil,
						["attributes"] = nil,
						["children"] = nil,
						["offset"] = nil,
						["type"] = nil,
						["text"] = v33,
						["attributes"] = not v34 and {} or v_u_60.parseXmlAttributes(v34),
						["children"] = {},
						["offset"] = v_u_15.offset
					}
					local v36
					if p11.inlineTags[v33] then
						v36 = v_u_7.InlineSpan
					else
						v36 = v_u_7.Block
					end
					v35.type = v36
					v_u_6(v14, v35)
				end
			elseif v_u_15.name == "CLOSE" and v_u_15.capture then
				local v_u_37 = v_u_15.capture[1]
				local v41 = v_u_60.closeNode(v14, function(p38)
					-- upvalues: (copy) v_u_37, (copy) v_u_15
					if p38.name ~= "TAG" then
						return false
					end
					local v39 = p38.text == v_u_37
					local v40 = ("Found <%*> at %* when trying to close </%*> at %*"):format(p38.text, p38.offset, v_u_37, v_u_15.offset)
					assert(v39, v40)
					return true
				end)
				local v42 = ("No open tag exists trying to close </%*> at %*"):format(v_u_37, v_u_15.offset)
				assert(v41, v42)
			else
				v_u_6(v16.children, {
					["name"] = v_u_15.name,
					["text"] = v_u_15.text,
					["children"] = {},
					["offset"] = v_u_15.offset,
					["type"] = v_u_8(v_u_15.name, p11)
				})
			end
			v13 = v13 + 1
		end
		v_u_60.closeNode(v14, function(p43)
			-- upvalues: (ref) v_u_9
			return v_u_9(p43)
		end)
		v_u_60.closeNode(v14, function(p44)
			return p44.name == "ROOT"
		end)
		return v12
	end,
	["closeNode"] = function(p45, p46) -- name: closeNode
		-- upvalues: (copy) v_u_60, (copy) v_u_6
		local v47 = v_u_60.findLastNodeIndex(p45, p46)
		if not v47 then
			return nil
		end
		local v48 = p45[v47]
		for v49 = v47 + 1, #p45 do
			v_u_6(v48.children, p45[v49])
		end
		for _ = v47 + 1, #p45 do
			table.remove(p45)
		end
		local v50 = p45[v47 - 1]
		if v50 then
			table.remove(p45)
			v_u_6(v50.children, v48)
		end
		return v48
	end,
	["findLastNodeIndex"] = function(p51, p52) -- name: findLastNodeIndex
		for v53 = #p51, 1, -1 do
			local v54 = p51[v53]
			local v55
			if typeof(p52) == "string" then
				v55 = v54.name == p52
			else
				v55 = p52(v54)
			end
			if not v55 then
				continue
			end
			return v53
		end
		return nil
	end,
	["parseXmlAttributes"] = function(p56) -- name: parseXmlAttributes
		local v57 = {}
		for v58, v59 in p56:gmatch("%s*([A-Za-z0-9_-]+)=\"([^\"]+)\"%s*") do
			v57[v58] = v59
		end
		return v57
	end
}
return v_u_60.buildTree