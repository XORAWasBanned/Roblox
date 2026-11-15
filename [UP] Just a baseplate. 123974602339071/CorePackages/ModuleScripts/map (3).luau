-- Path: CorePackages.Packages._Index.llama.llama.Dictionary.map
return function(p1, p2) -- name: map
	local v3 = type(p1)
	local v4 = v3 == "table"
	local v5 = "expected a table for first argument, got " .. v3
	assert(v4, v5)
	local v6 = type(p2)
	local v7 = v6 == "function"
	local v8 = "expected a function for second argument, got " .. v6
	assert(v7, v8)
	local v9 = {}
	for v10, v11 in pairs(p1) do
		local v12, v13 = p2(v11, v10)
		v9[v13 or v10] = v12
	end
	return v9
end