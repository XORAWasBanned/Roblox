-- Path: CorePackages.Packages._Index.llama.llama.List.findLast
return function(p1, p2, p3) -- name: find
	local v4 = type(p1)
	local v5 = v4 == "table"
	local v6 = "expected a table for first argument, got " .. v4
	assert(v5, v6)
	for v7 = p3 or #p1, 1, -1 do
		if p1[v7] ~= p2 then
			continue
		end
		return v7
	end
	return nil
end