-- Path: CorePackages.Packages._Index.llama.llama.List.removeValue
local v_u_1 = require(script.Parent.Parent.List.toSet)
return function(p2, ...) -- name: removeValue
	-- upvalues: (copy) v_u_1
	local v3 = type(p2)
	local v4 = v3 == "table"
	local v5 = "expected a table for first argument, got " .. v3
	assert(v4, v5)
	local v6 = v_u_1({ ... })
	local v7 = {}
	local v8 = 1
	for v9 = 1, #p2 do
		if v6[p2[v9]] then
			continue
		end
		v7[v8] = p2[v9]
		v8 = v8 + 1
	end
	return v7
end