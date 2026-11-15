-- Path: CorePackages.Packages._Index.llama.llama.List.findWhere
return function(p1, p2, p3) -- name: find
	local v4 = type(p1)
	local v5 = v4 == "table"
	local v6 = "expected a table for first argument, got " .. v4
	assert(v5, v6)
	local v7 = type(p2)
	local v8 = v7 == "function"
	local v9 = "expected a function for second argument, got " .. v7
	assert(v8, v9)
	for v10 = p3 or 1, #p1 do
		if not p2(p1[v10], v10) then
			continue
		end
		return v10
	end
	return nil
end