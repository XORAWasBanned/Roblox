-- Path: CorePackages.Packages._Index.Cryo.Cryo.Dictionary.map
return function(p1, p2) -- name: map
	local v3 = {}
	for v4, v5 in p1 do
		local v6, v7 = p2(v5, v4)
		if v7 == nil then
			v7 = v4
		end
		if v6 == nil then
			continue
		end
		v3[v7] = v6
	end
	return v3
end