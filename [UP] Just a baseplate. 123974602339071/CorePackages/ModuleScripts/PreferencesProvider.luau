-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Preferences.PreferencesProvider
local v1 = script.Parent
local v2 = script:FindFirstAncestor("Foundation")
local v3 = v2.Parent
local v_u_4 = require(v3.React)
local v_u_5 = require(v1.PreferencesContext)
local v_u_6 = require(v2.Utility.withDefaults)
local v_u_7 = {
	["preferredTextSize"] = nil,
	["preferredTransparency"] = 1,
	["reducedMotion"] = false,
	["scale"] = 1,
	["preferredTextSize"] = Enum.PreferredTextSize.Medium
}
return function(p_u_8) -- name: PreferencesProvider
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_7, (copy) v_u_5
	local v9 = {
		["value"] = v_u_4.useMemo(function()
			-- upvalues: (ref) v_u_6, (copy) p_u_8, (ref) v_u_7
			return v_u_6({
				["preferredTextSize"] = p_u_8.preferredTextSize,
				["preferredTransparency"] = p_u_8.preferredTransparency,
				["reducedMotion"] = p_u_8.reducedMotion
			}, v_u_7)
		end, { p_u_8.preferredTextSize, p_u_8.preferredTransparency, p_u_8.reducedMotion })
	}
	return v_u_4.createElement(v_u_5.Provider, v9, p_u_8.children)
end