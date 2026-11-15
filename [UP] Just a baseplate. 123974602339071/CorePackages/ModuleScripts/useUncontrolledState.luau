-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalInput.useUncontrolledState
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.React)
return function(p_u_3, p_u_4) -- name: useUncontrolledState
	-- upvalues: (copy) v_u_2
	local v5, v_u_6 = v_u_2.useState(p_u_3 or false)
	v_u_2.useEffect(function()
		-- upvalues: (copy) p_u_3, (copy) v_u_6
		if p_u_3 ~= nil then
			v_u_6(p_u_3)
		end
	end, { p_u_3 })
	return v5, v_u_2.useCallback(function(p7)
		-- upvalues: (copy) p_u_3, (copy) v_u_6, (copy) p_u_4
		if p_u_3 == nil then
			v_u_6(p7)
		end
		p_u_4(p7)
	end, { p_u_3, p_u_4 })
end