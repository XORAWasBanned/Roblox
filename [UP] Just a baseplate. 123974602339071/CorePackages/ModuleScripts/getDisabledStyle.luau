-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.getDisabledStyle
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Constants)
require(v1.Components.Types)
return function(p3, p4)
	-- upvalues: (copy) v_u_2
	return p4 and {
		["Color3"] = p3.Color3,
		["Transparency"] = 1 - (1 - (p3.Transparency or 0)) * v_u_2.DISABLED_TRANSPARENCY
	} or p3
end