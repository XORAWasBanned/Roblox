-- Path: CorePackages.Packages._Index.Dash.Dash.map
local v1 = script.Parent
require(v1.Types)
local v_u_2 = require(v1.assertEqual)
return function(p3, p4) -- name: map
	-- upvalues: (copy) v_u_2
	local v5 = {}
	for v6, v7 in p3 do
		local v8 = p4(v7, v6)
		v_u_2(v8 == nil, false, "Returned nil from a Dash.map handler")
		v5[v6] = v8
	end
	return v5
end