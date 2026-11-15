-- Path: CorePackages.Packages._Index.llama.llama.List.update
local v_u_1 = require(script.Parent.copy)
local function v_u_3(p2) -- name: noUpdate
	return p2
end
local function v_u_5(p4, ...) -- name: call
	if type(p4) == "function" then
		return p4(...)
	end
end
return function(p6, p7, p8, p9) -- name: update
	-- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_5
	local v10 = type(p6)
	local v11 = v10 == "table"
	local v12 = "expected a table for first argument, got " .. v10
	assert(v11, v12)
	local v13 = type(p7)
	local v14
	if v13 == "number" then
		v14 = p7 % 1 == 0
	else
		v14 = false
	end
	local v15 = "expected an integer for second argument, got " .. v13
	assert(v14, v15)
	local v16 = v_u_1(p6)
	local v17 = p8 or v_u_3
	local v18
	if v16[p7] == nil then
		v18 = v_u_5(p9, false, p7)
	else
		v18 = v17(v16[p7], p7)
		v_u_5(p9, true, v18, p7)
	end
	v16[p7] = v18
	return v16
end