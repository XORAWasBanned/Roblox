-- Path: CorePackages.Packages._Index.llama.llama.List.pop
return function(p1, p2) -- name: pop
	local v3 = type(p1)
	local v4 = v3 == "table"
	local v5 = "expected a table for first argument, got " .. v3
	assert(v4, v5)
	local v6 = p2 or 1
	local v7 = type(v6)
	local v8
	if v7 == "number" then
		v8 = v6 % 1 == 0
	else
		v8 = false
	end
	local v9 = "expected an integer for second argument, got " .. v7
	assert(v8, v9)
	local v10 = {}
	for v11 = 1, #p1 - v6 do
		v10[v11] = p1[v11]
	end
	return v10
end