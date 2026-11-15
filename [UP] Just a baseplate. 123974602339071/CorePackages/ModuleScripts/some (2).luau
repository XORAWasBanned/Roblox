-- Path: CorePackages.Packages._Index.llama.llama.List.some
return function(p1, p2) -- name: some
	local v3 = type(p1)
	local v4 = v3 == "table"
	local v5 = "expected a table for first argument, got " .. v3
	assert(v4, v5)
	local v6 = type(p2)
	local v7 = v6 == "function"
	local v8 = "expected a function for second argument, got " .. v6
	assert(v7, v8)
	for v9 = 1, #p1 do
		if not p2(p1[v9], v9) then
			continue
		end
		return true
	end
	return false
end