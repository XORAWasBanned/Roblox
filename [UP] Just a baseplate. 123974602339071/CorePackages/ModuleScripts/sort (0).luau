-- Path: CorePackages.Packages._Index.Cryo.Cryo.List.sort
return function(p1, p2) -- name: sort
	local v3 = {}
	for v4 = 1, #p1 do
		v3[v4] = p1[v4]
	end
	table.sort(v3, p2)
	return v3
end