-- Path: CorePackages.Packages._Index.Dash.Dash.pipe
return function(p_u_1, ...) -- name: pipe
	local v_u_2 = select("#", ...)
	if v_u_2 == 0 then
		return p_u_1
	end
	local v_u_3 = { ... }
	return function(...)
		-- upvalues: (copy) p_u_1, (copy) v_u_2, (copy) v_u_3
		local v4 = { p_u_1(...) }
		for v5 = 1, v_u_2 do
			v4 = { v_u_3[v5](unpack(v4)) }
		end
		return unpack(v4)
	end
end