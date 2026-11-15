-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.isScrollingFrameOverflowingY
return function(p1, p2) -- name: isScrollingFrameOverflowingY
	local v3 = p2 == nil and 1 or p2
	return p1.AbsoluteCanvasSize.Y > p1.AbsoluteWindowSize.Y + v3
end