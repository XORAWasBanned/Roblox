-- Path: CorePackages.Packages._Index.Markdown.Markdown.Utils.TextStyle
local v1 = script:FindFirstAncestor("Markdown")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
require(v1.Types)
require(v2.InlineLayout)
local v_u_4 = require(v2.MarkdownCore).Enums.InlineEngineTag
return {
	["getCodeTextStyles"] = function(p5) -- name: getCodeTextStyles
		-- upvalues: (copy) v_u_3
		return v_u_3.joinDeep(p5.textStyles, p5.codeStyles)
	end,
	["getBaseTextElementEngineTags"] = function(p6) -- name: getBaseTextElementEngineTags
		-- upvalues: (copy) v_u_4
		if not p6 then
			return nil
		end
		local v7 = {}
		if p6.bold then
			local v8 = {
				["name"] = v_u_4.BOLD,
				["attributes"] = {}
			}
			table.insert(v7, v8)
		end
		if p6.italic then
			local v9 = {
				["name"] = v_u_4.ITALIC,
				["attributes"] = {}
			}
			table.insert(v7, v9)
		end
		if p6.strike then
			local v10 = {
				["name"] = v_u_4.STRIKE,
				["attributes"] = {}
			}
			table.insert(v7, v10)
		end
		if p6.color then
			local v11 = {
				["name"] = v_u_4.FONT,
				["attributes"] = {
					["color"] = p6.color
				}
			}
			table.insert(v7, v11)
		end
		if p6.underline then
			local v12 = {
				["name"] = v_u_4.UNDERLINE,
				["attributes"] = {}
			}
			table.insert(v7, v12)
		end
		return v7
	end,
	["normalizeStyleFont"] = function(p13) -- name: normalizeStyleFont
		-- upvalues: (copy) v_u_3
		if not p13 then
			return p13
		end
		local v14 = v_u_3.omit(p13, { "font" })
		if v14.fontFace == nil and p13.font ~= nil then
			local v15 = p13.font
			local v16
			if typeof(v15) == "Font" then
				v16 = p13.font
			else
				v16 = Font.fromEnum(p13.font)
			end
			v14.fontFace = v16
		end
		return v14
	end
}