-- Path: CorePackages.Packages._Index.Dash.Dash.omit
local v1 = script.Parent
local v_u_2 = require(v1.collectSet)
local v_u_3 = require(v1.forEach)
require(v1.Types)
return function(p_u_4, p5) -- name: omit
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v_u_6 = {}
	local v_u_7 = v_u_2(p5)
	v_u_3(p_u_4, function(_, p8)
		-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) p_u_4
		if not v_u_7[p8] then
			v_u_6[p8] = p_u_4[p8]
		end
	end)
	return v_u_6
end