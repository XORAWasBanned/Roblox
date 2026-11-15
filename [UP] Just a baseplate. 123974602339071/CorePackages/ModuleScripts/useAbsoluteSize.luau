-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.useAbsoluteSize
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.React)
return function(p_u_3) -- name: useAbsoluteSize
	-- upvalues: (copy) v_u_2
	local v4, v_u_5 = v_u_2.useState(Vector2.zero)
	return v4, v_u_2.useCallback(function(p6)
		-- upvalues: (copy) v_u_5, (copy) p_u_3
		v_u_5(p6.AbsoluteSize)
		if p_u_3 then
			p_u_3(p6)
		end
	end, { p_u_3 })
end