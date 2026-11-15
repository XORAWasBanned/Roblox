-- Path: CorePackages.Packages._Index.Cryo.Cryo.Dictionary.filter
return function(p1, p2) -- name: filter
	local v3 = {}
	for v4, v5 in p1 do
		if not p2(v5, v4) then
			continue
		end
		v3[v4] = v5
	end
	return v3
end