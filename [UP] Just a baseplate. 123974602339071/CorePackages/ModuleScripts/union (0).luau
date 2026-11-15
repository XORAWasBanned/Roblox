-- Path: CorePackages.Packages._Index.Dash.Dash.union
local v1 = script.Parent
local v_u_2 = require(v1.None)
require(v1.Types)
return function(p3, p4) -- name: union
	-- upvalues: (copy) v_u_2
	local v5 = table.clone(p3)
	for v6, v7 in p4 do
		if v7 == v_u_2 then
			v5[v6] = nil
		else
			v5[v6] = v7
		end
	end
	return v5
end