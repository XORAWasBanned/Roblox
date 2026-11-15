-- Path: CorePackages.Packages._Index.llama.llama.List.sort
local v_u_1 = require(script.Parent.copy)
return function(p2, p3) -- name: sort
	-- upvalues: (copy) v_u_1
	local v4 = type(p2)
	local v5 = v4 == "table"
	local v6 = "expected a table for first argument, got " .. v4
	assert(v5, v6)
	local v7 = v_u_1(p2)
	table.sort(v7, p3)
	return v7
end