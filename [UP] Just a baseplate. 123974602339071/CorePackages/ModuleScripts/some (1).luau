-- Path: CorePackages.Packages._Index.llama.llama.Dictionary.some
return function(p1, p2) -- name: some
	local v3 = type(p2)
	local v4 = v3 == "function"
	local v5 = "expected a function for second argument, got " .. v3
	assert(v4, v5)
	for v6, v7 in pairs(p1) do
		if not p2(v7, v6) then
			continue
		end
		return true
	end
	return false
end