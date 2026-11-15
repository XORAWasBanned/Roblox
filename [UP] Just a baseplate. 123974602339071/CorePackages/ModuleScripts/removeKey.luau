-- Path: CorePackages.Packages._Index.llama.llama.Dictionary.removeKey
local v_u_1 = require(script.Parent.copy)
return function(p2, ...) -- name: removeKey
	-- upvalues: (copy) v_u_1
	local v3 = type(p2)
	local v4 = v3 == "table"
	local v5 = "expected a table for first argument, got " .. v3
	assert(v4, v5)
	local v6 = v_u_1(p2)
	for v7 = 1, select("#", ...) do
		v6[select(v7, ...)] = nil
	end
	return v6
end