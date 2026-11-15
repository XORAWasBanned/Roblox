-- Path: CorePackages.Packages._Index.Dash.Dash.keyBy
local v1 = script.Parent
local v_u_2 = require(v1.collect)
return function(p3, p_u_4) -- name: keyBy
	-- upvalues: (copy) v_u_2
	return v_u_2(p3, function(p5, p6)
		-- upvalues: (copy) p_u_4
		local v7 = p_u_4
		local v8
		if typeof(v7) == "function" then
			v8 = p_u_4(p6, p5)
		else
			v8 = p6[p_u_4]
		end
		return v8, p6
	end)
end