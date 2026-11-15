-- Path: CorePackages.Packages._Index.llama.llama.List.insert
return function(p1, p2, ...) -- name: insert
	local v3 = type(p1)
	local v4 = v3 == "table"
	local v5 = "expected a table for first argument, got " .. v3
	assert(v4, v5)
	local v6 = #p1
	local v7
	if p2 >= 1 then
		v7 = p2 <= v6 + 1
	else
		v7 = false
	end
	assert(v7, "index must be in bounds of list")
	local v8 = {}
	local v9 = 1
	for v10 = 1, v6 do
		if v10 == p2 then
			for v11 = 1, select("#", ...) do
				v8[v9] = select(v11, ...)
				v9 = v9 + 1
			end
		end
		v8[v9] = p1[v10]
		v9 = v9 + 1
	end
	return v8
end