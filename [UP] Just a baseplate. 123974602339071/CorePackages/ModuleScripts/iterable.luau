-- Path: CorePackages.Packages._Index.Dash.Dash.iterable
local v1 = script.Parent
require(v1.Types)
return function(p_u_2) -- name: iterable
	local v_u_3 = 1
	local v_u_4 = true
	local v_u_5 = nil
	return function()
		-- upvalues: (ref) v_u_4, (copy) p_u_2, (ref) v_u_3, (ref) v_u_5
		if v_u_4 then
			local v6 = p_u_2[v_u_3]
			if v6 ~= nil then
				local v7 = v_u_3
				v_u_3 = v_u_3 + 1
				return v7, v6
			end
			v_u_4 = false
		end
		repeat
			v_u_5 = next(p_u_2, v_u_5)
			local v8 = v_u_5
		until typeof(v8) ~= "number" or (v_u_5 <= 0 or (v_u_5 >= v_u_3 or v_u_5 % 1 ~= 0))
		if v_u_5 == nil then
			return nil
		else
			return v_u_5, p_u_2[v_u_5]
		end
	end
end