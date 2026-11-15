-- Path: CorePackages.Packages._Index.Dash.Dash.collectArray
local v1 = script.Parent
require(v1.Types)
local v_u_2 = table.insert
return function(p3, p4) -- name: collectArray
	-- upvalues: (copy) v_u_2
	local v5 = {}
	for v6, v7 in p3 do
		local v8 = p4(v6, v7)
		if v8 == nil then
			continue
		end
		v_u_2(v5, v8)
	end
	return v5
end