-- Path: CorePackages.Packages._Index.llama.llama.List.reduceRight
return function(p1, p2, p3) -- name: reduceRight
	local v4 = type(p1)
	local v5 = v4 == "table"
	local v6 = "expected a table for first argument, got " .. v4
	assert(v5, v6)
	local v7 = type(p2)
	local v8 = v7 == "function"
	local v9 = "expected a function for second argument, got " .. v7
	assert(v8, v9)
	local v10 = #p1
	local v11
	if p3 == nil then
		v11 = p1[v10]
	else
		v11 = p3
	end
	if p3 == nil then
		v10 = v10 - 1 or v10
	end
	for v12 = v10, 1, -1 do
		v11 = p2(v11, p1[v12], v12)
	end
	return v11
end