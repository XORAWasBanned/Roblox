-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Slider.calculateSliderValueFraction
return function(p1, p2) -- name: calculateSliderValueFraction
	local v3 = (p1 - p2.Min) / (p2.Max - p2.Min)
	return math.clamp(v3, 0, 1)
end