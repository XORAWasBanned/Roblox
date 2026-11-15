-- Path: CorePackages.Packages._Index.MarkdownCore.MarkdownCore.Utils.Highlighter
local v1 = script:FindFirstAncestor("Utils").Parent
require(v1.Types)
local v_u_2 = require(script.Utility)
local v_u_3 = require(script.Theme)
local v_u_4 = require(script.Theme.defaultTokenColors)
local v_u_15 = {
	["defaultLexer"] = require(script.Lexer),
	["highlight"] = function(p5, p6) -- name: highlight
		-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_2, (copy) v_u_15
		if p6 then
			v_u_3.setColors(p6)
		else
			v_u_3.setColors(v_u_4)
		end
		local v7 = v_u_2.convertTabsToSpaces(v_u_2.removeControlChars(p5))
		local v8 = v_u_15.defaultLexer
		local v9 = v_u_3.getColor("iden")
		local v10 = ""
		for v11, v12 in v8.scan(v7) do
			local v13 = v_u_3.getColor(v11) or v9
			v10 = v10 .. v_u_3.getColoredRichText(v13, v_u_2.sanitizeRichText(v12))
		end
		return v10
	end,
	["getTokenColor"] = function(p14) -- name: getTokenColor
		-- upvalues: (copy) v_u_3
		return v_u_3.getColor(p14)
	end
}
return v_u_15