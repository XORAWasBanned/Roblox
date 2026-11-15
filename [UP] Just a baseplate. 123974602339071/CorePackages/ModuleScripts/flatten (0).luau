-- Path: CorePackages.Packages._Index.llama.llama.List.flatten
local function v_u_11(p1) -- name: flatten
	-- upvalues: (copy) v_u_11
	local v2 = type(p1)
	local v3 = v2 == "table"
	local v4 = "expected a table for first argument, got " .. v2
	assert(v3, v4)
	local v5 = {}
	local v6 = 1
	for v7 = 1, #p1 do
		local v8 = p1[v7]
		if type(v8) == "table" then
			local v9 = v_u_11(p1[v7])
			for v10 = 1, #v9 do
				v5[v6] = v9[v10]
				v6 = v6 + 1
			end
		else
			v5[v6] = p1[v7]
			v6 = v6 + 1
		end
	end
	return v5
end
return v_u_11