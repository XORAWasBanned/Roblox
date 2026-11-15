-- Path: CorePackages.Packages._Index.ReactFocusNavigation.ReactFocusNavigation.useEventLifecycleRef
local v1 = script.Parent.Parent
local v_u_2 = require(v1.React)
return function(p_u_3, p_u_4) -- name: useEventLifecycleRef
	-- upvalues: (copy) v_u_2
	local v_u_5 = v_u_2.useRef(nil)
	return v_u_2.useCallback(function(p6)
		-- upvalues: (copy) v_u_5, (copy) p_u_4, (copy) p_u_3
		if v_u_5.current and p_u_4 then
			p_u_4(v_u_5.current)
		end
		if p6 then
			p_u_3(p6)
		end
		v_u_5.current = p6
	end, { p_u_3, p_u_4 })
end