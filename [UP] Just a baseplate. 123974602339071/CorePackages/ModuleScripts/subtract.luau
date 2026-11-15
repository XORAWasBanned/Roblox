-- Path: CorePackages.Packages._Index.llama.llama.Set.subtract
return function(p1, ...) -- name: subtract
	local v2 = {}
	for v3, _ in pairs(p1) do
		v2[v3] = true
	end
	for v4 = 1, select("#", ...) do
		v2[select(v4, ...)] = nil
	end
	return v2
end