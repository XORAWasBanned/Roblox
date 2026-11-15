-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Slider.calculateSliderFraction
return function(p1, p2, p3) -- name: calculateSliderFraction
	local v4 = p2.AbsolutePosition
	local v5 = p2.AbsoluteSize
	local v6 = v4 + v5 * 0.5
	local v7 = p2.AbsoluteRotation
	local v8 = math.rad(v7)
	local v9
	if p3 then
		v9 = Vector2.new(math.sin(v8), -math.cos(v8))
	else
		v9 = Vector2.new(math.cos(v8), (math.sin(v8)))
	end
	local v10
	if p3 then
		v10 = v5.Y
	else
		v10 = v5.X
	end
	local v11 = (p1 - v6):Dot(v9) / v10 + 0.5
	return math.clamp(v11, 0, 1)
end