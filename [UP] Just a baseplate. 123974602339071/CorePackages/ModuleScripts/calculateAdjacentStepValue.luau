-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Slider.calculateAdjacentStepValue
local v_u_1 = require(script.Parent.SliderStepDirection)
local v_u_2 = require(script.Parent.SliderStepSize)
return function(p3, p4, p5, p6, p7) -- name: calculateAdjacentStepValue
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v8 = p5.Max - p5.Min
	local v9 = p4 == v_u_1.Increment
	if not p6 or p6 <= 0 then
		local v10
		if p7 == v_u_2.Page then
			v10 = 0.1 * v8
		else
			v10 = 0.01 * v8
		end
		if not v9 then
			v10 = -v10
		end
		local v11 = p3 + v10
		local v12 = p5.Min
		local v13 = p5.Max
		return math.clamp(v11, v12, v13)
	end
	local v14
	if p7 == v_u_2.Page then
		local v15 = 0.1 * v8 / p6
		local v16 = math.round(v15)
		v14 = math.max(1, v16)
	else
		v14 = 1
	end
	local v17 = (p3 - p5.Min) / p6
	local v18 = math.abs(v17)
	local v19 = math.max(1, v18) * 1e-6
	local v20
	if v9 then
		local v21 = v17 + v19
		v20 = math.floor(v21) + v14
	else
		local v22 = v17 - v19
		v20 = math.ceil(v22) - v14
	end
	local v23 = p5.Min + v20 * p6
	local v24 = p5.Min
	local v25 = p5.Max
	return math.clamp(v23, v24, v25)
end