-- Path: CorePackages.Packages._Index.Cryo.Cryo.List.removeValue
return function(p1, p2) -- name: removeValue
	local v3 = {}
	local v4 = 1
	for v5 = 1, #p1 do
		if p1[v5] == p2 then
			continue
		end
		v3[v4] = p1[v5]
		v4 = v4 + 1
	end
	return v3
end