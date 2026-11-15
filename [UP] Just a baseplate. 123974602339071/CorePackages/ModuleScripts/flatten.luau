-- Path: CorePackages.Packages._Index.llama.llama.Dictionary.flatten
local v_u_1 = require(script.Parent.join)
local function v_u_9(p2) -- name: flatten
	-- upvalues: (copy) v_u_1, (copy) v_u_9
	local v3 = type(p2)
	local v4 = v3 == "table"
	local v5 = "expected a table for first argument, got " .. v3
	assert(v4, v5)
	local v6 = {}
	for v7, v8 in pairs(p2) do
		if type(v8) == "table" then
			v6 = v_u_1(v_u_9(v8), v6)
		else
			v6[v7] = v8
		end
	end
	return v6
end
return v_u_9