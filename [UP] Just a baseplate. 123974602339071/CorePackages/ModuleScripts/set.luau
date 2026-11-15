-- Path: CorePackages.Packages._Index.llama.llama.Dictionary.set
local v_u_1 = require(script.Parent.copy)
return function(p2, p3, p4) -- name: set
	-- upvalues: (copy) v_u_1
	local v5 = type(p2)
	local v6 = v5 == "table"
	local v7 = "expected a table for first argument, got " .. v5
	assert(v6, v7)
	local v8 = p3 ~= nil
	assert(v8, "expected second argument to be anything but nil, got nil")
	local v9 = v_u_1(p2)
	v9[p3] = p4
	return v9
end