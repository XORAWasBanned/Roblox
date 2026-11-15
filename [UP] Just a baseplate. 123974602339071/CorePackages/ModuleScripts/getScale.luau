-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Utils.getScale
return function(p1, p2, p3) -- name: getScale
	if p1.X == 0 or (p1.Y == 0 or (p2.X == 0 or p2.Y == 0)) then
		return 1
	end
	local v4 = p1.X / p1.Y
	local v5 = p2.X / p2.Y
	local v6
	if p3 == Enum.ScaleType.Fit == (v4 < v5) then
		v6 = p1.X
	else
		v6 = p1.Y * v5
	end
	return v6 / 1280
end