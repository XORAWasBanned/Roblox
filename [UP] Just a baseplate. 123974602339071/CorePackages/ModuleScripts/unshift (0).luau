-- Path: CorePackages.Packages._Index.llama.llama.List.unshift
return function(p1, ...) -- name: unshift
	local v2 = type(p1)
	local v3 = v2 == "table"
	local v4 = "expected a table for first argument, got " .. v2
	assert(v3, v4)
	local v5 = select("#", ...)
	local v6 = {}
	for v7 = 1, v5 do
		v6[v7] = select(v7, ...)
	end
	for v8 = 1, #p1 do
		v6[v5 + v8] = p1[v8]
	end
	return v6
end