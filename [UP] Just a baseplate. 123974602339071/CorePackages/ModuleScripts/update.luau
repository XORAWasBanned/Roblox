-- Path: CorePackages.Packages._Index.llama.llama.Dictionary.update
local v_u_1 = require(script.Parent.copy)
local function v_u_4(p2, p3) -- name: noUpdate
	return p2, p3
end
local function v_u_6(p5, ...) -- name: call
	if type(p5) == "function" then
		return p5(...)
	end
end
return function(p7, p8, p9, p10) -- name: update
	-- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_6
	local v11 = type(p7)
	local v12 = v11 == "table"
	local v13 = "expected a table for first argument, got " .. v11
	assert(v12, v13)
	local v14 = p8 ~= nil
	assert(v14, "expected second argument to be anything but nil, got nil")
	local v15 = v_u_1(p7)
	local v16 = p9 or v_u_4
	local v17, v18
	if v15[p8] == nil then
		v17, v18 = v_u_6(p10, false, p8)
	else
		v17, v18 = v16(v15[p8], p8)
		v_u_6(p10, true, v17, v18 or p8)
	end
	v15[v18 or p8] = v17
	return v15
end