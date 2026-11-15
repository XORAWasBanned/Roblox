-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Utils.getFormatTime
return function(p1) -- name: getFormatTime
	local v2 = p1 / 60
	local v3 = math.floor(v2)
	local v4 = p1 % 60
	local v5 = math.floor(v4)
	return string.format("%01d:%02d", v3, v5)
end