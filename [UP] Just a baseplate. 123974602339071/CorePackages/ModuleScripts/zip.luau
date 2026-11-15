-- Path: CorePackages.Packages._Index.Dash.Dash.zip
return function(p_u_1, p_u_2) -- name: zip
	local v_u_3 = nil
	local v_u_4 = nil
	local v_u_5 = nil
	local v_u_6 = nil
	return function()
		-- upvalues: (ref) v_u_3, (ref) v_u_5, (copy) p_u_1, (ref) v_u_4, (ref) v_u_6, (copy) p_u_2
		local v7, v8 = next(p_u_1, v_u_3)
		v_u_3 = v7
		v_u_5 = v8
		local v9, v10 = next(p_u_2, v_u_4)
		v_u_4 = v9
		v_u_6 = v10
		if v_u_5 and v_u_6 then
			return v_u_5, v_u_6
		else
			return nil
		end
	end
end