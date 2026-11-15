-- Path: CorePackages.Packages._Index.Cryo.Cryo.List.replaceIndex
return function(p1, p2, p3) -- name: replaceIndex
	local v4 = #p1
	local v5 = p2 <= v4
	assert(v5, "index must be less or equal than the list length")
	local v6 = {}
	for v7 = 1, v4 do
		if v7 == p2 then
			v6[v7] = p3
		else
			v6[v7] = p1[v7]
		end
	end
	return v6
end