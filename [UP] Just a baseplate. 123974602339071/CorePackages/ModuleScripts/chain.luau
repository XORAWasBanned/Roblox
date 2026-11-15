-- Path: CorePackages.Packages._Index.Dash.Dash.chain
return function(...) -- name: chain
	local v_u_1 = { ... }
	local v_u_2 = #v_u_1
	local v_u_3 = 1
	return function()
		-- upvalues: (ref) v_u_3, (copy) v_u_2, (copy) v_u_1
		while v_u_3 <= v_u_2 do
			local v4 = { v_u_1[v_u_3]() }
			if v4[1] ~= nil then
				return table.unpack(v4)
			end
			v_u_3 = v_u_3 + 1
		end
		return nil
	end
end