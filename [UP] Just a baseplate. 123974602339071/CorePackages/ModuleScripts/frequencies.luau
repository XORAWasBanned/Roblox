-- Path: CorePackages.Packages._Index.Dash.Dash.frequencies
local v1 = script.Parent
require(v1.Types)
local v_u_2 = require(v1.reduce)
return function(p3, p_u_4) -- name: frequencies
	-- upvalues: (copy) v_u_2
	return v_u_2(p3, function(p5, p6, p7)
		-- upvalues: (copy) p_u_4
		if p_u_4 then
			p6 = p_u_4(p6, p7)
		end
		if p5[p6] == nil then
			p5[p6] = 1
			return p5
		else
			p5[p6] = p5[p6] + 1
			return p5
		end
	end, {})
end