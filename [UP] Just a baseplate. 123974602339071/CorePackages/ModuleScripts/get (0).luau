-- Path: CorePackages.Packages._Index.llama.llama.Dictionary.get
return function(p1, p2) -- name: get
	local v3 = type(p1)
	local v4 = v3 == "table"
	local v5 = "expected a table for first argument, got " .. v3
	assert(v4, v5)
	local v6 = p2 ~= nil
	assert(v6, "expected second argument to be anything but nil, got nil")
	return p1[p2]
end