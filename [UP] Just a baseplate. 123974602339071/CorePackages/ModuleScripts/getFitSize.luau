-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Utils.getFitSize
return function(p1, p2) -- name: getFitSize
	if p1.X == 0 or (p1.Y == 0 or (p2.X == 0 or p2.Y == 0)) then
		return UDim2.fromScale(1, 1)
	else
		local v3 = p1.X / p1.Y
		local v4 = p2.X / p2.Y
		if v3 < v4 then
			return UDim2.fromScale(1, v3 / v4)
		else
			return UDim2.fromScale(v4 / v3, 1)
		end
	end
end