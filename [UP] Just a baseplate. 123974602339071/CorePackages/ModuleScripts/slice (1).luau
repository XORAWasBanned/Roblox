-- Path: CorePackages.Packages._Index.llama.llama.List.slice
return function(p1, p2, p3) -- name: slice
	local v4 = type(p1)
	local v5 = v4 == "table"
	local v6 = "expected a table for first argument, got " .. v4
	assert(v5, v6)
	local v7 = #p1
	local v8 = p2 or 1
	local v9 = p3 or v7
	local v10 = v8 <= v9
	assert(v10, "start index must be less than or equal to end index")
	local v11 = {}
	local v12 = 1
	for v13 = math.max(1, v8), math.min(v9, v7) do
		v11[v12] = p1[v13]
		v12 = v12 + 1
	end
	return v11
end