-- Path: CorePackages.Packages._Index.llama.llama.Dictionary.flatMap
local v_u_1 = require(script.Parent.join)
local function v_u_15(p2, p3) -- name: flatMap
	-- upvalues: (copy) v_u_1, (copy) v_u_15
	local v4 = type(p2)
	local v5 = v4 == "table"
	local v6 = "expected a table for first argument, got " .. v4
	assert(v5, v6)
	local v7 = type(p3)
	local v8 = v7 == "function"
	local v9 = "expected a function for second argument, got " .. v7
	assert(v8, v9)
	local v10 = {}
	for v11, v12 in pairs(p2) do
		if type(v12) == "table" then
			v10 = v_u_1(v_u_15(v12, p3), v10)
		else
			local v13, v14 = p3(v12, v11)
			v10[v14 or v11] = v13
		end
	end
	return v10
end
return v_u_15