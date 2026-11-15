-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.isPointInGuiObjectBounds
return function(p1, p2) -- name: isPointInGuiObjectBounds
	if not p1 then
		return false
	end
	local v3 = p1.AbsolutePosition
	local v4 = p1.AbsoluteSize
	local v5 = v3.X
	local v6 = v3.Y
	local v7 = v3.X + v4.X
	local v8 = v3.Y + v4.Y
	local v9
	if v5 <= p2.X and (p2.X <= v7 and v6 <= p2.Y) then
		v9 = p2.Y <= v8
	else
		v9 = false
	end
	return v9
end