-- Path: CorePackages.Packages._Index.Merge.Merge.merge-resolvers
local v1 = script.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v_u_3 = v2.Array
local v_u_4 = v2.Boolean
local v_u_5 = v2.String
local v6 = {}
local v_u_7 = require(v1.Utils).mergeDeep
local function v_u_22(p8, p9) -- name: mergeResolvers
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_22, (copy) v_u_7, (copy) v_u_5
	if not v_u_4.toJSBoolean(p8) or v_u_3.isArray(p8) and #p8 == 0 then
		return {}
	end
	if not v_u_4.toJSBoolean(v_u_3.isArray(p8)) then
		return p8
	end
	if #p8 == 1 then
		return not v_u_4.toJSBoolean(p8[1]) and {} or p8[1]
	end
	local v10 = {}
	for _, v12 in p8 do
		if v_u_4.toJSBoolean(v_u_3.isArray(v12)) then
			local v12 = v_u_22(v12)
		end
		local v13 = v_u_4.toJSBoolean
		local v14
		if typeof(v12) == "table" then
			v14 = v12
		else
			v14 = false
		end
		if not v13(v14) then
			continue
		end
		table.insert(v10, v12)
	end
	local v15 = v_u_7(v10, true)
	local v16 = v_u_4.toJSBoolean
	local v17
	if typeof(p9) == "table" then
		v17 = p9.exclusions
	else
		v17 = nil
	end
	if v16(v17) then
		for _, v18 in p9.exclusions do
			local v19 = v_u_5.split(v18, ".")
			local v20, v21 = table.unpack(v19, 1, 2)
			if v_u_4.toJSBoolean(v21) and v21 ~= "*" then
				if not v_u_4.toJSBoolean(v15[v20]) then
					continue
				end
				v15[v20][v21] = nil
			else
				v15[v20] = nil
			end
		end
	end
	return v15
end
v6.mergeResolvers = v_u_22
return v6