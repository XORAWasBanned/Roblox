-- Path: CorePackages.Packages._Index.llama.llama.Dictionary.includes
return function(p1, p2) -- name: includes
	local v3 = type(p1)
	local v4 = v3 == "table"
	local v5 = "expected a table for first argument, got " .. v3
	assert(v4, v5)
	for _, v6 in pairs(p1) do
		if v6 ~= p2 then
			continue
		end
		return true
	end
	return false
end