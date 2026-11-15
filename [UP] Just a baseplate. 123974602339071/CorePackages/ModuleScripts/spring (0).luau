-- Path: CorePackages.Packages._Index.Otter-31ab8d40-1.3.7.Otter.spring
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Collections).Object.assign
require(script.Parent.types)
local v_u_3 = math.abs
local v_u_4 = math.exp
local v_u_5 = math.sin
local v_u_6 = math.cos
local v_u_7 = math.sqrt
return function(p_u_8, p9) -- name: spring
	-- upvalues: (copy) v_u_2, (copy) v_u_7, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5, (copy) v_u_3
	local v10 = {
		["dampingRatio"] = 1,
		["frequency"] = 1,
		["restingVelocityLimit"] = 0.001,
		["restingPositionLimit"] = 0.01
	}
	if p9 ~= nil then
		v_u_2(v10, p9)
	end
	local v_u_11 = v10.restingVelocityLimit
	local v_u_12 = v10.restingPositionLimit
	local v13 = v10.damping
	local v14 = v10.stiffness
	local v15 = v10.mass
	local v_u_16, v17
	if typeof(v13) == "number" and (typeof(v14) == "number" and typeof(v15) == "number") then
		v_u_16 = v13 / (v_u_7(v15 * v14) * 2)
		v17 = v_u_7(v14 / v15) / 2 / 3.141592653589793
	else
		v_u_16 = v10.dampingRatio
		v17 = v10.frequency
	end
	local v_u_18 = v17 * 2 * 3.141592653589793
	local v19 = v_u_11 >= 0
	assert(v19, "Expected restingVelocityLimit >= 0")
	local v20 = v_u_12 >= 0
	assert(v20, "Expected restingPositionLimit >= 0")
	local v44 = {
		["step"] = function(p21, p22) -- name: step
			-- upvalues: (copy) p_u_8, (copy) v_u_16, (copy) v_u_18, (ref) v_u_4, (ref) v_u_7, (ref) v_u_6, (ref) v_u_5, (copy) p_u_8, (ref) v_u_3, (copy) v_u_11, (copy) v_u_12
			local v23 = p21.value
			local v24 = p21.velocity or 0
			local v25 = v23 - p_u_8
			local v26 = v_u_4(-p22 * v_u_16 * v_u_18)
			local v27, v28
			if v_u_16 == 1 then
				v27 = (v24 * p22 + v25 * (v_u_18 * p22 + 1)) * v26 + p_u_8
				v28 = (v24 - v_u_18 * p22 * (v25 * v_u_18 + v24)) * v26
			elseif v_u_16 < 1 then
				local v29 = v_u_7(1 - v_u_16 * v_u_16)
				local v30 = v_u_6(v_u_18 * v29 * p22)
				local v31 = v_u_5(v_u_18 * v29 * p22)
				local v32
				if v29 > 0.0001 then
					v32 = v31 / v29
				else
					local v33 = p22 * v_u_18
					v32 = v33 + (v33 * v33 * (v29 * v29) * (v29 * v29) / 20 - v29 * v29) * (v33 * v33 * v33) / 6
				end
				local v34
				if v_u_18 * v29 > 0.0001 then
					v34 = v31 / (v_u_18 * v29)
				else
					local v35 = v_u_18 * v29
					v34 = p22 + (p22 * p22 * (v35 * v35) * (v35 * v35) / 20 - v35 * v35) * (p22 * p22 * p22) / 6
				end
				v27 = (v25 * (v30 + v_u_16 * v32) + v24 * v34) * v26 + p_u_8
				v28 = (v24 * (v30 - v32 * v_u_16) - v25 * (v32 * v_u_18)) * v26
			else
				local v36 = v_u_7(v_u_16 * v_u_16 - 1)
				local v37 = -v_u_18 * (v_u_16 - v36)
				local v38 = -v_u_18 * (v_u_16 + v36)
				local v39 = (v24 - v37 * v25) / (2 * v_u_18 * v36)
				local v40 = (v25 - v39) * v_u_4(v37 * p22)
				local v41 = v39 * v_u_4(v38 * p22)
				v27 = v40 + v41 + p_u_8
				v28 = v37 * v40 + v38 * v41
			end
			local v42 = v_u_3(v27 - p_u_8)
			local v43
			if v_u_3(v28) < v_u_11 then
				v43 = v42 < v_u_12
			else
				v43 = false
			end
			if v43 then
				v27 = p_u_8
				v28 = 0
			end
			return {
				["value"] = v27,
				["velocity"] = v28,
				["complete"] = v43
			}
		end
	}
	local v45
	if p9 then
		v45 = p9.startingValue
	else
		v45 = nil
	end
	v44.startingValue = v45
	return v44
end