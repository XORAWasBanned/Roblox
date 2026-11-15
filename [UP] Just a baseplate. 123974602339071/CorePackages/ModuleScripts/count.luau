-- Path: CorePackages.Packages._Index.Dash.Dash.count
local function v_u_1()
	return true
end
return function(p2, p3) -- name: count
	-- upvalues: (copy) v_u_1
	local v4 = p3 or v_u_1
	local v5 = 0
	for v6, v7 in p2 do
		if not v4(v7, v6) then
			continue
		end
		v5 = v5 + 1
	end
	return v5
end