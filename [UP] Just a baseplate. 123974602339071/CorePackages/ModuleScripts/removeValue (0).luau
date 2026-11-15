-- Path: CorePackages.Packages._Index.llama.llama.Dictionary.removeValue
local v_u_1 = require(script.Parent.Parent.List.toSet)
return function(p2, ...) -- name: removeValues
	-- upvalues: (copy) v_u_1
	local v3 = type(p2)
	local v4 = v3 == "table"
	local v5 = "expected a table for first argument, got " .. v3
	assert(v4, v5)
	local v6 = v_u_1({ ... })
	local v7 = {}
	for v8, v9 in pairs(p2) do
		if v6[v9] then
			continue
		end
		v7[v8] = v9
	end
	return v7
end