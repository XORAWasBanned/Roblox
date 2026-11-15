-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Hooks.useTimeHysteresis
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
return function(p_u_3, p_u_4, p5, p6, _)
	-- upvalues: (copy) v_u_2
	local v_u_7 = p5 or p_u_4
	local v_u_8, v_u_9 = v_u_2.useState(p6 or false)
	local v_u_10, v_u_11 = v_u_2.useState(false)
	local v_u_12 = v_u_2.useRef(p6 or 0)
	local v_u_13 = v_u_2.useRef(false)
	local v14 = {
		v_u_8,
		v_u_10,
		p_u_3,
		p_u_4,
		v_u_7
	}
	v_u_2.useEffect(function()
		-- upvalues: (copy) v_u_12, (copy) v_u_11, (copy) v_u_10, (copy) v_u_8, (copy) p_u_4, (copy) p_u_3, (copy) v_u_13, (ref) v_u_7
		local v_u_15 = tick()
		local v_u_16 = nil
		local v_u_17 = false
		if v_u_8 then
			local v18 = p_u_4 - v_u_12.current
			local v_u_19 = p_u_4
			if v18 > 0 then
				local v_u_20 = true
				v_u_16 = task.delay(v18, function()
					-- upvalues: (ref) v_u_17, (ref) v_u_16, (ref) v_u_12, (copy) v_u_19, (ref) v_u_11, (copy) v_u_20
					v_u_17 = true
					v_u_16 = nil
					v_u_12.current = v_u_19
					v_u_11(v_u_20)
				end)
			elseif v_u_10 ~= true then
				v_u_17 = true
				v_u_11(true)
			end
		else
			local v21 = v_u_12.current - p_u_3
			local v_u_22 = p_u_3
			if v21 > 0 then
				local v_u_23 = false
				v_u_16 = task.delay(v21, function()
					-- upvalues: (ref) v_u_17, (ref) v_u_16, (ref) v_u_12, (copy) v_u_22, (ref) v_u_11, (copy) v_u_23
					v_u_17 = true
					v_u_16 = nil
					v_u_12.current = v_u_22
					v_u_11(v_u_23)
				end)
			elseif v_u_10 ~= false then
				v_u_17 = true
				v_u_11(false)
			end
		end
		local v_u_24 = v_u_8
		return function()
			-- upvalues: (ref) v_u_17, (ref) v_u_16, (ref) v_u_13, (copy) v_u_15, (copy) v_u_24, (ref) v_u_12, (ref) v_u_7
			if not v_u_17 then
				if v_u_16 then
					task.cancel(v_u_16)
				end
				if not v_u_13.current then
					local v25 = tick() - v_u_15
					if not v_u_24 then
						v25 = v25 * -1
					end
					local v26 = v_u_12
					local v27 = v_u_12.current + v25
					local v28 = v_u_7
					v26.current = math.clamp(v27, 0, v28)
				end
			end
			v_u_13.current = false
		end
	end, v14)
	return v_u_10, v_u_2.useCallback(function(p29, p30)
		-- upvalues: (copy) v_u_13, (copy) v_u_12, (ref) v_u_7, (copy) v_u_9
		v_u_13.current = p30
		if p30 then
			if p29 then
				v_u_12.current = v_u_7
			else
				v_u_12.current = 0
			end
		end
		v_u_9(p29)
	end, { v_u_9 })
end