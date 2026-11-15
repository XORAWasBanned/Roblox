-- Path: CorePackages.Packages._Index.Motion-31ab8d40-0.1.0.Motion.Utility.useMotion
local v1 = script.Parent
local v2 = v1.Parent
local v3 = v2.Parent
local v_u_4 = require(v3.React)
local v_u_5 = require(v1.useAnimatedValue)
require(v2.Types)
local v_u_6 = require(v1.TimingConfigs)
local v_u_7 = require(v2.Enums.TransitionPreset)
return function(p8) -- name: useMotion
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_7, (copy) v_u_6
	local v_u_9 = v_u_4.useRef({})
	local v10 = {}
	local v_u_11 = {}
	for v12, v13 in p8 do
		if type(v13) == "table" and v12 == "transition" then
			continue
		end
		local v14, v15 = v_u_5(v13)
		v10[v12] = v14
		v_u_11[v12] = v15
	end
	return v10, function(p_u_16, p_u_17) -- name: animate
		-- upvalues: (copy) v_u_11, (copy) v_u_9, (ref) v_u_7, (ref) v_u_6
		if p_u_16 then
			local v_u_18 = 0
			local v_u_19 = {}
			for v20 in v_u_11 do
				if v20 == "transition" or p_u_16[v20] == nil then
					continue
				end
				v_u_18 = v_u_18 + 1
			end
			local v21 = 0
			local v_u_22 = v21
			for v_u_23, v_u_24 in v_u_11 do
				if v_u_23 == "transition" or p_u_16[v_u_23] == nil then
					continue
				end
				if v_u_9.current[v_u_23] then
					local v25 = v_u_9.current[v_u_23]
					if v25 then
						task.cancel(v25)
					end
					v_u_9.current[v_u_23] = nil
				end
				local v26 = p_u_16.transition or {
					[v_u_7.Default] = v_u_6.getDefaultTransition()
				}
				local v27 = v26[v_u_23] or (v26[v_u_7.Default] or v_u_6.getDefaultTransition())
				local v_u_28 = table.clone(v27)
				function v_u_28.onComplete()
					-- upvalues: (copy) v_u_23, (copy) v_u_19, (copy) p_u_16, (ref) v_u_22, (copy) p_u_17, (ref) v_u_18
					local v29 = v_u_23
					v_u_19[v29] = p_u_16[v29]
					v_u_22 = v_u_22 + 1
					if p_u_17 and p_u_17.onAnimationComplete then
						p_u_17.onAnimationComplete(v29)
					end
					if v_u_22 == v_u_18 and (p_u_17 and p_u_17.onAnimationComplete) then
						p_u_17.onAnimationComplete(true)
					end
				end
				local v30 = v_u_28.delay or 0
				if v30 > 0 then
					local v31 = task.delay(v30, function()
						-- upvalues: (ref) v_u_9, (copy) v_u_23, (copy) v_u_24, (copy) p_u_16, (copy) v_u_28
						v_u_9.current[v_u_23] = nil
						v_u_24(p_u_16[v_u_23], v_u_28)
					end)
					v_u_9.current[v_u_23] = v31
				else
					v_u_24(p_u_16[v_u_23], v_u_28)
				end
			end
		end
	end
end