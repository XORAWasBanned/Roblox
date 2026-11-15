-- Path: CorePackages.Packages._Index.llama.llama.List.get
return function(p1, p2) -- name: get
	local v3 = type(p1)
	local v4 = v3 == "table"
	local v5 = "expected a table for first argument, got " .. v3
	assert(v4, v5)
	local v6 = type(p2)
	local v7
	if v6 == "number" then
		v7 = p2 % 1 == 0
	else
		v7 = false
	end
	local v8 = "expected second argument to be an integer, got " .. v6
	assert(v7, v8)
	return p1[p2]
end