-- Path: CorePackages.Packages._Index.llama.llama.Set.toList
return function(p1) -- name: toList
	local v2 = {}
	local v3 = 1
	for v4, _ in pairs(p1) do
		v2[v3] = v4
		v3 = v3 + 1
	end
	return v2
end