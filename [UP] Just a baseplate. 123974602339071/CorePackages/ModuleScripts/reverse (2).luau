-- Path: CorePackages.Packages._Index.llama.llama.List.reverse
return function(p1) -- name: reverse
	local v2 = type(p1)
	local v3 = v2 == "table"
	local v4 = "expected a table for first argument, got " .. v2
	assert(v3, v4)
	local v5 = #p1
	local v6 = v5 + 1
	local v7 = {}
	for v8 = 1, v5 do
		v7[v8] = p1[v6 - v8]
	end
	return v7
end