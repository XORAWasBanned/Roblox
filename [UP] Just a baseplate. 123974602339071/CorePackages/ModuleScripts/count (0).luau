-- Path: CorePackages.Packages._Index.llama.llama.Dictionary.count
local function v_u_1() -- name: alwaysTrue
	return true
end
return function(p2, p3) -- name: count
	-- upvalues: (copy) v_u_1
	local v4 = type(p2)
	local v5 = v4 == "table"
	local v6 = "expected a table for first argument, got " .. v4
	assert(v5, v6)
	local v7 = p3 or v_u_1
	local v8 = 0
	for v9, v10 in pairs(p2) do
		if not v7(v10, v9) then
			continue
		end
		v8 = v8 + 1
	end
	return v8
end