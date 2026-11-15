-- Path: CorePackages.Packages._Index.Dash.Dash.groupBy
local v1 = script.Parent
require(v1.Types)
local v_u_2 = table.insert
return function(p3, p4) -- name: groupBy
	-- upvalues: (copy) v_u_2
	local v5 = {}
	for v6, v7 in p3 do
		local v8
		if typeof(p4) == "function" then
			v8 = p4(v7, v6)
		else
			v8 = v7[p4]
		end
		if v8 == nil then
			continue
		end
		if v5[v8] == nil then
			v5[v8] = { v7 }
		else
			v_u_2(v5[v8], v7)
		end
	end
	return v5
end