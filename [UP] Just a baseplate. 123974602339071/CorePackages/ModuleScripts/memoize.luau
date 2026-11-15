-- Path: CorePackages.Packages._Index.Dash.Dash.memoize
local v1 = script.Parent
require(v1.Types)
return function(p_u_2, p_u_3) -- name: memoize
	local v_u_4 = {}
	return function(...)
		-- upvalues: (copy) p_u_3, (copy) v_u_4, (copy) p_u_2
		local v5 = { ... }
		local v6
		if p_u_3 then
			v6 = p_u_3(...)
		else
			v6 = table.concat(v5, "|")
		end
		if v_u_4[v6] == nil then
			v_u_4[v6] = p_u_2(...)
		end
		return v_u_4[v6]
	end
end