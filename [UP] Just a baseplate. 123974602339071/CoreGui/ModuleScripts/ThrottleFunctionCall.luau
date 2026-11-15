-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.ThrottleFunctionCall
return function(p_u_1, p_u_2)
	local v_u_3 = false
	return function(...)
		-- upvalues: (ref) v_u_3, (copy) p_u_1, (copy) p_u_2
		if not v_u_3 then
			v_u_3 = true
			task.delay(p_u_1, function()
				-- upvalues: (ref) v_u_3
				v_u_3 = false
			end)
			return p_u_2(...)
		end
	end
end