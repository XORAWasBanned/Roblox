-- Path: CorePackages.Packages._Index.Dash.Dash.reverse
local v_u_1 = table.insert
return function(p2) -- name: reverse
	-- upvalues: (copy) v_u_1
	local v3 = {}
	for v4 = #p2, 1, -1 do
		v_u_1(v3, p2[v4])
	end
	return v3
end