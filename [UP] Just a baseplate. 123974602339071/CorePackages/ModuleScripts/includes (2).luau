-- Path: CorePackages.Packages._Index.llama.llama.List.includes
return function(p1, p2) -- name: includes
	local v3 = type(p1)
	local v4 = v3 == "table"
	local v5 = "expected a table for first argument, got " .. v3
	assert(v4, v5)
	for v6 = 1, #p1 do
		if p1[v6] ~= p2 then
			continue
		end
		return true
	end
	return false
end