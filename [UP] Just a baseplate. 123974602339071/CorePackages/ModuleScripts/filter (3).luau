-- Path: CorePackages.Packages._Index.llama.llama.Dictionary.filter
return function(p1, p2) -- name: filter
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
		if not p2(v11, v10) then
			continue
		end
		v9[v10] = v11
	end
	return v9
end