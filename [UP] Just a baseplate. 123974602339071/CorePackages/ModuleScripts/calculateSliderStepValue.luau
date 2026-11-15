-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Slider.calculateSliderStepValue
return function(p1, p2, p3) -- name: calculateSliderStepValue
	if p2 <= 0 then
		return p1
	end
	local v4 = (p1 - p3.Min) / p2 + 0.5
	local v5 = math.floor(v4)
	local v6 = p3.Min + v5 * p2
	local v7 = p3.Min
	local v8 = p3.Max
	return math.clamp(v6, v7, v8)
end