-- Path: CorePackages.Packages._Index.Dash.Dash.slice
local v_u_1 = table.insert
return function(p2, p3, p4) -- name: slice
	-- upvalues: (copy) v_u_1
	local v5 = {}
	local v6 = p3 or 1
	local v7 = p4 or #p2
	if v6 < 0 then
		v6 = #p2 + v6
	end
	if v7 and v7 < 0 then
		v7 = #p2 + v7
	end
	for v8 = v6, v7 do
		v_u_1(v5, p2[v8])
	end
	return v5
end