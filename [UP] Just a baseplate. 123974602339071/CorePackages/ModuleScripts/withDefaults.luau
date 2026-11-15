-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.withDefaults
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.Dash)
local v_u_3 = require(v1.ReactIs)
local function v_u_12(p4, p5) -- name: deepJoin
	-- upvalues: (copy) v_u_3, (copy) v_u_12
	local v6 = table.clone(p4)
	for v7, v8 in p5 do
		local v9
		if type(v8) == "table" then
			v9 = not v_u_3.isBinding(v8)
		else
			v9 = false
		end
		if v9 then
			local v10 = v6[v7]
			local v11
			if type(v10) == "table" then
				v11 = not v_u_3.isBinding(v10)
			else
				v11 = false
			end
			if v11 then
				v6[v7] = v_u_12(v6[v7], v8)
			else
				v6[v7] = v8
			end
		else
			v6[v7] = v8
		end
	end
	return v6
end
return function(p13, p14) -- name: withDefaults
	-- upvalues: (copy) v_u_12, (copy) v_u_2
	local v15 = {}
	if type(p13) == "table" and type(p14) == "table" then
		for v16, _ in p14 do
			v15[v16] = p13[v16]
		end
	end
	local v17 = v_u_12(p14, v15)
	return v_u_2.union(p13, v17)
end