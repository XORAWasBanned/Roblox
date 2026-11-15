-- Path: CorePackages.Packages._Index.llama.llama.List.flatMap
local function v_u_16(p1, p2) -- name: flatMap
	-- upvalues: (copy) v_u_16
	local v3 = type(p1)
	local v4 = v3 == "table"
	local v5 = "expected a table for first argument, got " .. v3
	assert(v4, v5)
	local v6 = type(p2)
	local v7 = v6 == "function"
	local v8 = "expected a function for second argument, got " .. v6
	assert(v7, v8)
	local v9 = {}
	local v10 = 1
	for v11 = 1, #p1 do
		local v12 = p1[v11]
		if type(v12) == "table" then
			local v13 = v_u_16(p1[v11], p2)
			for v14 = 1, #v13 do
				v9[v10] = v13[v14]
				v10 = v10 + 1
			end
		else
			local v15 = p2(p1[v11], v11)
			if v15 == nil then
				continue
			end
			v9[v10] = v15
			v10 = v10 + 1
		end
	end
	return v9
end
return v_u_16