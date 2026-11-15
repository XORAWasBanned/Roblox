-- Path: CorePackages.Packages._Index.CollisionMatchers2D.CollisionMatchers2D.toRect
return function(p1) -- name: toRect
	local v2 = typeof(p1)
	if v2 == "Rect" then
		return p1
	end
	if v2 == "Instance" then
		return Rect.new(p1.AbsolutePosition, p1.AbsolutePosition + p1.AbsoluteSize)
	end
end