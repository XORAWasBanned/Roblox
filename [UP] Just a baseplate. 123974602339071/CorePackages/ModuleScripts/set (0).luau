-- Path: CorePackages.Packages._Index.llama.llama.List.set
return function(p1, p2, p3) -- name: set
	local v4 = type(p1)
	local v5 = v4 == "table"
	local v6 = "expected a table for first argument, got " .. v4
	assert(v5, v6)
	local v7 = #p1
	local v8 = p2 <= v7
	assert(v8, "index must be less than or equal to the list length")
	local v9 = p2 >= 1
	assert(v9, "index must be greater than or equal to 1")
	local v10 = {}
	local v11 = 1
	for v12 = 1, v7 do
		if v12 == p2 then
			v10[v11] = p3
		else
			v10[v11] = p1[v12]
		end
		v11 = v11 + 1
	end
	return v10
end