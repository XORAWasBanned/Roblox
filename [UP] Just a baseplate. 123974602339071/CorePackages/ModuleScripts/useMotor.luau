-- Path: CorePackages.Packages._Index.ReactOtter.ReactOtter.useMotor
local v1 = script.Parent.Parent
local v_u_2 = require(v1.React)
local v_u_3 = require(v1.Otter)
return function(p4, p_u_5, p_u_6) -- name: useMotor
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v_u_7 = v_u_2.useRef(nil)
	local v8 = v_u_2.useRef(nil)
	if not v_u_7.current then
		local v_u_9
		if typeof(p4) == "number" then
			v_u_9 = v_u_3.createSingleMotor(p4)
		else
			v_u_9 = v_u_3.createGroupMotor(p4)
		end
		function v8.current(p10)
			-- upvalues: (ref) v_u_9
			v_u_9:setGoal(p10)
		end
		v_u_7.current = v_u_9
	end
	v_u_2.useEffect(function()
		-- upvalues: (copy) v_u_7, (copy) p_u_6, (copy) p_u_5
		local v_u_11 = nil
		local v_u_12
		if v_u_7.current then
			if p_u_6 then
				v_u_11 = v_u_7.current:onComplete(p_u_6)
			end
			v_u_12 = v_u_7.current:onStep(p_u_5)
		else
			v_u_12 = nil
		end
		return function()
			-- upvalues: (ref) v_u_11, (ref) v_u_12
			if v_u_11 then
				v_u_11()
			end
			if v_u_12 then
				v_u_12()
			end
		end
	end, { p_u_5, p_u_6 })
	v_u_2.useEffect(function()
		-- upvalues: (copy) v_u_7
		return function()
			-- upvalues: (ref) v_u_7
			if v_u_7.current then
				v_u_7.current:destroy()
				v_u_7.current = nil
			end
		end
	end, { v_u_7.current })
	return v8.current
end