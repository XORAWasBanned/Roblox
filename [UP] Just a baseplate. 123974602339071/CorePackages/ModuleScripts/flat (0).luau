-- Path: CorePackages.Packages._Index.Dash.Dash.flat
local v1 = script.Parent
local v_u_2 = require(v1.append)
local v_u_3 = require(v1.forEach)
return function(p4) -- name: flat
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v_u_5 = {}
	v_u_3(p4, function(p6)
		-- upvalues: (ref) v_u_2, (copy) v_u_5
		v_u_2(v_u_5, p6)
	end)
	return v_u_5
end