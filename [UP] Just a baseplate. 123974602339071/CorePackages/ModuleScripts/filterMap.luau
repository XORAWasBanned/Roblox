-- Path: CorePackages.Packages._Index.Cryo.Cryo.List.filterMap
return function(p1, p2) -- name: filterMap
	local v3 = {}
	local v4 = 1
	for v5 = 1, #p1 do
		local v6 = p2(p1[v5], v5)
		if v6 == nil then
			continue
		end
		v3[v4] = v6
		v4 = v4 + 1
	end
	return v3
end