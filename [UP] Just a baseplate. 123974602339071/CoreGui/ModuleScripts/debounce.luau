-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Utility.debounce
return function(p_u_1, p_u_2)
	local v_u_3 = 0
	return function(...)
		-- upvalues: (ref) v_u_3, (copy) p_u_2, (copy) p_u_1
		local v_u_4 = { ... }
		local v_u_5 = time()
		v_u_3 = v_u_5
		delay(p_u_2, function()
			-- upvalues: (ref) v_u_3, (copy) v_u_5, (ref) p_u_1, (copy) v_u_4
			if v_u_3 == v_u_5 then
				local v6 = v_u_4
				p_u_1(unpack(v6))
			end
		end)
	end
end