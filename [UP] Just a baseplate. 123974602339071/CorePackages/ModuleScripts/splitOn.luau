-- Path: CorePackages.Packages._Index.Dash.Dash.splitOn
local v_u_1 = table.insert
return function(p2, p3) -- name: splitOn
	-- upvalues: (copy) v_u_1
	local v4 = {}
	local v5 = {}
	local v6 = 1
	if not p3 then
		for v7 = 1, #p2 do
			v_u_1(v4, p2:sub(v7, v7))
		end
		return v4
	end
	local v8, v9 = p2:find(p3, v6)
	while v8 do
		v_u_1(v5, p2:sub(v8, v9))
		v_u_1(v4, p2:sub(v6, v8 - 1))
		v6 = v9 + 1
		v8, v9 = p2:find(p3, v6)
	end
	v_u_1(v4, p2:sub(v6))
	return v4, v5
end