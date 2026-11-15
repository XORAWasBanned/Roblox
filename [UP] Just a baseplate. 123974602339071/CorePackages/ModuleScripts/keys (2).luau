-- Path: CorePackages.Packages._Index.llama.llama.Dictionary.keys
return function(p1) -- name: keys
	local v2 = type(p1)
	local v3 = v2 == "table"
	local v4 = "expected a table for first argument, got " .. v2
	assert(v3, v4)
	local v5 = {}
	local v6 = 1
	for v7, _ in pairs(p1) do
		v5[v6] = v7
		v6 = v6 + 1
	end
	return v5
end