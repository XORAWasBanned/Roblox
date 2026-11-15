-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Slider.calculateDirectionalStepValue
local v_u_1 = require(script.Parent.SliderStepDirection)
local v_u_2 = require(script.Parent.SliderStepSize)
return function(p3, p4, p5, p6, p7) -- name: calculateDirectionalStepValue
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v8 = p5.Max - p5.Min
	if p7 == v_u_2.Page then
		local v9 = 0.1 * v8
		p6 = math.max(v9, p6 or 0)
	elseif not p6 or p6 <= 0 then
		p6 = 0.01 * v8
	end
	if p4 ~= v_u_1.Increment then
		p6 = -p6
	end
	local v10 = p3 + p6
	local v11 = p5.Min
	local v12 = p5.Max
	return math.clamp(v10, v11, v12)
end