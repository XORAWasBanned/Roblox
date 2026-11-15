-- Path: CorePackages.Packages._Index.Otter-31ab8d40-1.3.7.Otter.ease
require(script.Parent.types)
local function v_u_27(p1, p2) -- name: cubicBezier
	local v3 = typeof(p2) == "table"
	assert(v3, "Expected values to be a table")
	local v4 = #p2 == 4
	assert(v4, "Expected values to have 4 elements")
	local v5, v6, v7, v8 = table.unpack(p2)
	local v9
	if v5 >= 0 then
		v9 = v5 <= 1
	else
		v9 = false
	end
	assert(v9, "x1 must be between 0 and 1")
	local v10
	if v7 >= 0 then
		v10 = v7 <= 1
	else
		v10 = false
	end
	assert(v10, "x2 must be between 0 and 1")
	if p1 <= 0 then
		return 0
	end
	if p1 >= 1 then
		return 1
	end
	local v11 = 0
	local v12 = 0
	local v13 = 1
	for _ = 1, 10 do
		v11 = v11 + 1
		local v14 = (v12 + v13) / 2
		local v15 = 1 - v14
		local v16 = v15 * v15
		local v17 = v14 * v14
		local v18 = v16 * 3 * v14 * v5 + v15 * 3 * v17 * v7 + v14 * v17
		local v19 = v18 - p1
		if math.abs(v19) < 0.0001 then
			local v20 = 1 - v14
			local v21 = v20 * v20
			local v22 = v14 * v14
			return v21 * 3 * v14 * v6 + v20 * 3 * v22 * v8 + v14 * v22
		end
		if v18 < p1 then
			v12 = v14
		else
			v13 = v14
		end
	end
	local v23 = (v12 + v13) / 2
	local v24 = 1 - v23
	local v25 = v24 * v24
	local v26 = v23 * v23
	return v25 * 3 * v23 * v6 + v24 * 3 * v26 * v8 + v23 * v26
end
local v_u_47 = {
	[Enum.EasingStyle.Linear] = function(p28, _) -- name: linear
		return p28
	end,
	[Enum.EasingStyle.Quad] = function(p29, _) -- name: quad
		return p29 * p29
	end,
	[Enum.EasingStyle.Cubic] = function(p30, _) -- name: cubic
		return p30 * p30 * p30
	end,
	[Enum.EasingStyle.Quart] = function(p31, _) -- name: quart
		return p31 * p31 * p31 * p31
	end,
	[Enum.EasingStyle.Quint] = function(p32, _) -- name: quint
		return p32 * p32 * p32 * p32 * p32
	end,
	[Enum.EasingStyle.Exponential] = function(p33, _) -- name: exponential
		if p33 == 0 then
			return 0
		end
		local v34 = (p33 - 1) * 10
		return math.pow(2, v34)
	end,
	[Enum.EasingStyle.Sine] = function(p35, _) -- name: sine
		local v36 = p35 * 3.141592653589793 / 2
		return 1 - math.cos(v36)
	end,
	[Enum.EasingStyle.Back] = function(p37, _) -- name: back
		return p37 * 2.70158 * p37 * p37 - p37 * 1.70158 * p37
	end,
	[Enum.EasingStyle.Bounce] = function(p38, _) -- name: bounce
		local v39 = 1 - p38
		local v40
		if v39 < 0.36363636363636365 then
			v40 = v39 * 7.5625 * v39
		elseif v39 < 0.7272727272727273 then
			v40 = (v39 - 0.5454545454545454) * 7.5625 * (v39 - 0.5454545454545454) + 0.75
		elseif v39 < 0.9090909090909091 then
			v40 = (v39 - 0.8181818181818182) * 7.5625 * (v39 - 0.8181818181818182) + 0.9375
		else
			v40 = (v39 - 0.9545454545454546) * 7.5625 * (v39 - 0.9545454545454546) + 0.984375
		end
		return 1 - v40
	end,
	[Enum.EasingStyle.Elastic] = function(p41, _) -- name: elastic
		if p41 == 0 then
			return 0
		end
		if p41 == 1 then
			return 1
		end
		local v42 = p41 * 10 - 10
		local v43 = -math.pow(2, v42)
		local v44 = (p41 * 10 - 10.75) * 2.0943951023931953
		return v43 * math.sin(v44)
	end,
	[Enum.EasingStyle.Circular] = function(p45, _) -- name: circular
		local v46 = 1 - p45 * p45
		return -(math.sqrt(v46) - 1)
	end
}
return function(p_u_48, p49) -- name: ease
	-- upvalues: (copy) v_u_47, (copy) v_u_27
	local v_u_50 = not (p49 and p49.duration) and 1 or p49.duration
	local v_u_51
	if p49 and p49.easingStyle then
		v_u_51 = p49.easingStyle
	else
		v_u_51 = Enum.EasingStyle.Linear
	end
	local v_u_52
	if typeof(v_u_51) == "EnumItem" or typeof(v_u_51) == "string" then
		v_u_52 = v_u_47[v_u_51]
	else
		v_u_52 = v_u_27
	end
	local v61 = {
		["step"] = function(p53, p54) -- name: step
			-- upvalues: (copy) p_u_48, (copy) v_u_50, (copy) v_u_52, (copy) v_u_51
			local v55
			if p53.initialValue == nil then
				v55 = p53.value or 0
			else
				v55 = p53.initialValue
			end
			local v56 = (p53.elapsed or 0) + p54
			if p53.goal and p_u_48 ~= p53.goal then
				v55 = p53.value
				v56 = 0
			end
			local v57 = v56 / v_u_50
			local v58 = v_u_52(math.min(v57, 1), v_u_51)
			local v59 = v55 + (p_u_48 - v55) * v58
			local v60 = v_u_50 <= v56 and true or v55 == p_u_48
			if v60 then
				v59 = p_u_48
				v55 = p_u_48
				v56 = 0
			end
			return {
				["initialValue"] = v55,
				["goal"] = p_u_48,
				["value"] = v59,
				["elapsed"] = v56,
				["complete"] = v60
			}
		end
	}
	local v62
	if p49 then
		v62 = p49.startingValue
	else
		v62 = nil
	end
	v61.startingValue = v62
	return v61
end