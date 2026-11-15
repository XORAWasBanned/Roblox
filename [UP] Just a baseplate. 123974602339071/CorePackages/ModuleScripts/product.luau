-- Path: CorePackages.Packages._Index.Dash.Dash.product
local v1 = script.Parent
local v_u_2 = require(v1.reduce)
return function(p3) -- name: product
	-- upvalues: (copy) v_u_2
	return v_u_2(p3, function(p4, p5)
		return p4 * p5
	end, 1)
end