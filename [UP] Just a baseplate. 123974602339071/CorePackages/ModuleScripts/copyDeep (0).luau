-- Path: CorePackages.Packages._Index.llama.llama.List.copyDeep
local function v_u_8(p1) -- name: copyDeep
	-- upvalues: (copy) v_u_8
	local v2 = type(p1)
	local v3 = v2 == "table"
	local v4 = "expected a table for first argument, got " .. v2
	assert(v3, v4)
	local v5 = {}
	for v6 = 1, #p1 do
		local v7 = p1[v6]
		if type(v7) == "table" then
			v5[v6] = v_u_8(p1[v6])
		else
			v5[v6] = p1[v6]
		end
	end
	return v5
end
return v_u_8