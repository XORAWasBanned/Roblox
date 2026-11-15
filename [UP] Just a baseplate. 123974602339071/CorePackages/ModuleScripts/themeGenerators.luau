-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Style.Tokens.themeGenerators
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = v1.Parent
local v_u_3 = require(v1.Enums.ColorMode)
local v_u_4 = require(v1.Utility.Flags)
local v_u_5 = require(v_u_2.RbxDesignFoundations)
local v_u_6 = require(v1.Enums.ThemeName)
return {
	["getGenerator"] = function(p7, p8) -- name: getGenerator
		-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_2, (copy) v_u_6, (copy) v_u_3
		local v9
		if v_u_4.FoundationFontFaceMigration then
			v9 = v_u_5.themes
		else
			v9 = require(v_u_2.RbxDesignFoundationsV4).themes
		end
		local v10 = (v9[p7] or v9[v_u_6.Default])()
		if p8 == v_u_3.Light then
			return v10.Light
		else
			return v10.Dark
		end
	end
}