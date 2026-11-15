-- Path: CorePackages.Packages._Index.Cryo.Cryo.List.reverse
return function(p1) -- name: reverse
	local v2 = #p1
	local v3 = v2 + 1
	local v4 = {}
	for v5 = 1, v2 do
		v4[v5] = p1[v3 - v5]
	end
	return v4
end