-- Path: CorePackages.Packages._Index.Cryo.Cryo.List.map
return function(p1, p2) -- name: map
	local v3 = {}
	for v4 = 1, #p1 do
		v3[v4] = p2(p1[v4], v4)
	end
	return v3
end