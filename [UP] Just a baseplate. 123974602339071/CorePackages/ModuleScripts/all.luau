-- Path: CorePackages.Packages._Index.Dash.Dash.all
local function v_u_2(p1)
	return p1
end
return function(p3, p4) -- name: all
	-- upvalues: (copy) v_u_2
	local v5 = p4 or v_u_2
	for v6, v7 in p3 do
		if v5(v7, v6) then
			continue
		end
		return false
	end
	return true
end