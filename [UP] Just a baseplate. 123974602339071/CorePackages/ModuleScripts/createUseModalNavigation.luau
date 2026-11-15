-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.createUseModalNavigation
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.React)
return function(p_u_3) -- name: createUseModalNavigation
	-- upvalues: (copy) v_u_2
	return function()
		-- upvalues: (ref) v_u_2, (copy) p_u_3
		local v4 = v_u_2.useContext(p_u_3)
		return {
			["closeAffordanceRef"] = v4.closeAffordanceRef,
			["setContentStartRef"] = v4.setContentStartRef
		}
	end
end