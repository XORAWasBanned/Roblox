-- Path: CorePackages.Packages._Index.llama.llama.Set.union
return function(...) -- name: union
	local v1 = {}
	for v2 = 1, select("#", ...) do
		for v3, _ in pairs(select(v2, ...)) do
			v1[v3] = true
		end
	end
	return v1
end