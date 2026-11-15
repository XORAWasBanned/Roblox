-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.useRotation
local v1 = script:FindFirstAncestor("Foundation").Parent
require(v1.React)
local v_u_2 = require(v1.ReactUtils).useClock
return function(p_u_3) -- name: useRotation
	-- upvalues: (copy) v_u_2
	return v_u_2():map(function(p4)
		-- upvalues: (copy) p_u_3
		return p4 * 360 * (p_u_3 or 1)
	end)
end