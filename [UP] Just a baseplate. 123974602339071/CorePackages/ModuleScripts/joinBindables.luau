-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.joinBindables
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactIs)
require(v1.Components.Types)
return function(p5, p_u_6) -- name: joinBindables
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local v7 = {}
	local v_u_8 = {}
	local v9 = false
	for v10, v11 in p5 do
		if v_u_4.isBinding(v11) then
			v7[v10] = v11
			v9 = true
		else
			v_u_8[v10] = v11
		end
	end
	if v9 then
		return v_u_3.joinBindings(v7):map(function(p12)
			-- upvalues: (copy) v_u_8, (copy) p_u_6
			local v13 = table.clone(v_u_8)
			for v14, v15 in p12 do
				v13[v14] = v15
			end
			return p_u_6(v13)
		end)
	else
		return p_u_6(v_u_8)
	end
end