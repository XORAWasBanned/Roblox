-- Path: CorePackages.Packages._Index.llama.llama.Dictionary.flip
return function(p1) -- name: flip
	local v2 = type(p1)
	local v3 = v2 == "table"
	local v4 = "expected a table for first argument, got " .. v2
	assert(v3, v4)
	local v5 = {}
	for v6, v7 in pairs(p1) do
		v5[v7] = v6
	end
	return v5
end