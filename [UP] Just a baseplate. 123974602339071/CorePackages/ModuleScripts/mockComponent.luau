-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.mockComponent
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Parent.React)
local v_u_3 = require(v1.Enums.ColorMode)
local v_u_4 = require(v1.Providers.Foundation)
require(v1.Providers.Preferences.PreferencesProvider)
local v_u_5 = require(v1.Components.View)
return function(p6, p7, p8)
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3, (copy) v_u_5
	return v_u_2.createElement(v_u_4, {
		["colorMode"] = p8 or v_u_3.Dark,
		["preferences"] = p7
	}, {
		["Content"] = v_u_2.createElement(v_u_5, {
			["Size"] = UDim2.fromScale(1, 1)
		}, p6)
	})
end