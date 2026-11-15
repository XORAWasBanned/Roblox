-- Path: CorePackages.Packages._Index.Otter-31ab8d40-0.1.4.Otter.spring
local v_u_1 = require(script.Parent.assign)
local v_u_2 = math.abs
local v_u_3 = math.exp
local v_u_4 = math.sin
local v_u_5 = math.cos
local v_u_6 = math.sqrt
local function v_u_36(p7, p8, p9) -- name: step
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4, (copy) v_u_2
	local v10 = p7.__dampingRatio
	local v11 = p7.__frequency * 2 * 3.141592653589793
	local v12 = p7.__goalPosition
	local v13 = p7.__restingVelocityLimit
	local v14 = p7.__restingPositionLimit
	local v15 = p8.value
	local v16 = p8.velocity or 0
	local v17 = v15 - v12
	local v18 = v_u_3(-p9 * v10 * v11)
	local v19, v20
	if v10 == 1 then
		v19 = (v16 * p9 + v17 * (v11 * p9 + 1)) * v18 + v12
		v20 = (v16 - v11 * p9 * (v17 * v11 + v16)) * v18
	elseif v10 < 1 then
		local v21 = v_u_6(1 - v10 * v10)
		local v22 = v_u_5(v11 * v21 * p9)
		local v23 = v_u_4(v11 * v21 * p9)
		local v24
		if v21 > 0.0001 then
			v24 = v23 / v21
		else
			local v25 = p9 * v11
			v24 = v25 + (v25 * v25 * (v21 * v21) * (v21 * v21) / 20 - v21 * v21) * (v25 * v25 * v25) / 6
		end
		local v26
		if v11 * v21 > 0.0001 then
			v26 = v23 / (v11 * v21)
		else
			local v27 = v11 * v21
			v26 = p9 + (p9 * p9 * (v27 * v27) * (v27 * v27) / 20 - v27 * v27) * (p9 * p9 * p9) / 6
		end
		v19 = (v17 * (v22 + v10 * v24) + v16 * v26) * v18 + v12
		v20 = (v16 * (v22 - v24 * v10) - v17 * (v24 * v11)) * v18
	else
		local v28 = v_u_6(v10 * v10 - 1)
		local v29 = -v11 * (v10 - v28)
		local v30 = -v11 * (v10 + v28)
		local v31 = (v16 - v29 * v17) / (2 * v11 * v28)
		local v32 = (v17 - v31) * v_u_3(v29 * p9)
		local v33 = v31 * v_u_3(v30 * p9)
		v19 = v32 + v33 + v12
		v20 = v29 * v32 + v30 * v33
	end
	local v34 = v_u_2(v19 - p7.__goalPosition)
	local v35
	if v_u_2(v20) < v13 then
		v35 = v34 < v14
	else
		v35 = false
	end
	if v35 then
		v19 = p7.__goalPosition
		v20 = 0
	end
	return {
		["value"] = v19,
		["velocity"] = v20,
		["complete"] = v35
	}
end
return function(p37, p38) -- name: spring
	-- upvalues: (copy) v_u_1, (copy) v_u_36
	local v39 = typeof(p37) == "number"
	assert(v39)
	local v40 = {
		["dampingRatio"] = 1,
		["frequency"] = 1,
		["restingVelocityLimit"] = 0.001,
		["restingPositionLimit"] = 0.01
	}
	if p38 ~= nil then
		local v41 = typeof(p38) == "table"
		assert(v41)
		v_u_1(v40, p38)
	end
	local v42 = v40.dampingRatio
	local v43 = v40.frequency
	local v44 = v40.restingVelocityLimit
	local v45 = v40.restingPositionLimit
	local v46 = typeof(v42) == "number"
	assert(v46)
	local v47 = typeof(v43) == "number"
	assert(v47)
	local v48 = typeof(v44) == "number"
	assert(v48)
	local v49 = typeof(v45) == "number"
	assert(v49)
	local v50 = v44 >= 0
	assert(v50, "Expected restingVelocityLimit >= 0")
	local v51 = v45 >= 0
	assert(v51, "Expected restingPositionLimit >= 0")
	return {
		["__dampingRatio"] = v42,
		["__frequency"] = v43,
		["__restingVelocityLimit"] = v44,
		["__restingPositionLimit"] = v45,
		["__goalPosition"] = p37,
		["step"] = v_u_36
	}
end