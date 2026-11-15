-- Path: CorePackages.Packages._Index.llama.llama.Set.add
return function(p1, ...) -- name: add
	local v2 = {}
	for v3, _ in pairs(p1) do
		v2[v3] = true
	end
	for v4 = 1, select("#", ...) do
		v2[select(v4, ...)] = true
	end
	return v2
end