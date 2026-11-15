-- Path: CorePackages.Packages._Index.llama.llama.List.push
return function(p1, ...) -- name: push
	local v2 = type(p1)
	local v3 = v2 == "table"
	local v4 = "expected a table for first argument, got " .. v2
	assert(v3, v4)
	local v5 = #p1
	local v6 = {}
	for v7 = 1, v5 do
		v6[v7] = p1[v7]
	end
	for v8 = 1, select("#", ...) do
		v6[v5 + v8] = select(v8, ...)
	end
	return v6
end