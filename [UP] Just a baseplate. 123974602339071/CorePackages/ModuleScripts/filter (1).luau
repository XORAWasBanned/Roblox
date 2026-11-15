-- Path: CorePackages.Packages._Index.Cryo.Cryo.List.filter
return function(p1, p2) -- name: filter
	local v3 = {}
	local v4 = 1
	for v5 = 1, #p1 do
		local v6 = p1[v5]
		if not p2(v6, v5) then
			continue
		end
		v3[v4] = v6
		v4 = v4 + 1
	end
	return v3
end