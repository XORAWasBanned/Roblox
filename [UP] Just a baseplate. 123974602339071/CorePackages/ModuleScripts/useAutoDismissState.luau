-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Hooks.useAutoDismissState
local v1 = script:FindFirstAncestor("MomentsCreationFlow").Parent
local v2 = require(v1.React)
local v_u_3 = v2.useCallback
local v_u_4 = v2.useEffect
local v_u_5 = v2.useRef
local v_u_6 = v2.useState
return function(p7, p_u_8) -- name: useAutoDismissState
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_3, (copy) v_u_4
	local v_u_9 = v_u_5(nil)
	local v10, v_u_11 = v_u_6(p7 or true)
	local v_u_12 = v_u_3(function()
		-- upvalues: (copy) v_u_9, (copy) v_u_11, (copy) p_u_8
		if v_u_9.current then
			task.cancel(v_u_9.current)
		end
		v_u_11(true)
		v_u_9.current = task.delay(p_u_8 or 5, function()
			-- upvalues: (ref) v_u_11
			v_u_11(false)
		end)
	end, { p_u_8, v10 })
	v_u_4(function()
		-- upvalues: (copy) v_u_12, (copy) v_u_9
		v_u_12()
		return function()
			-- upvalues: (ref) v_u_9
			if v_u_9.current then
				task.cancel(v_u_9.current)
				v_u_9.current = nil
			end
		end
	end, { p_u_8 })
	return v10, v_u_12
end