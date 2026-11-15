-- Path: CorePackages.Packages._Index.llama.llama.List.reduce
return function(p1, p2, p3) -- name: reduce
	local v4 = type(p1)
	local v5 = v4 == "table"
	local v6 = "expected a table for first argument, got " .. v4
	assert(v5, v6)
	local v7 = type(p2)
	local v8 = v7 == "function"
	local v9 = "expected a function for second argument, got " .. v7
	assert(v8, v9)
	local v10
	if p3 == nil then
		v10 = p1[1]
	else
		v10 = p3
	end
	for v11 = p3 == nil and 2 or 1, #p1 do
		v10 = p2(v10, p1[v11], v11)
	end
	return v10
end