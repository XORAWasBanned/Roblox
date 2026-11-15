-- Path: CorePackages.Packages._Index.MarkdownCore.MarkdownCore.Utils.Highlighter.Theme
local v1 = script:FindFirstAncestor("Utils").Parent
local v2 = require(script.defaultTokenColors)
require(v1.Types)
local v_u_10 = {
	["tokenColors"] = {},
	["defaultColors"] = v2,
	["setColors"] = function(p3) -- name: setColors
		-- upvalues: (copy) v_u_10
		local v4 = type(p3) == "table"
		assert(v4, "Theme.updateColors expects a table")
		for v5, v6 in p3 do
			v_u_10.tokenColors[v5] = v6
		end
	end,
	["getColoredRichText"] = function(p7, p8) -- name: getColoredRichText
		return "<font color=\"#" .. p7:ToHex() .. "\">" .. p8 .. "</font>"
	end,
	["getColor"] = function(p9) -- name: getColor
		-- upvalues: (copy) v_u_10
		return v_u_10.tokenColors[p9]
	end
}
v_u_10.setColors(v2)
return v_u_10