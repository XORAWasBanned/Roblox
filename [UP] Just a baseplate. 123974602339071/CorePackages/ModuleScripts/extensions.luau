-- Path: CorePackages.Packages._Index.Merge.Merge.extensions
local v1 = script.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v_u_3 = v2.Array
local v_u_4 = v2.Boolean
local v_u_5 = v2.Object
local v6 = {}
require(v1.GraphQL)
local v_u_7 = require(v1.Utils).mergeDeep
v6.extractExtensionsFromSchema = require(v1.Utils).extractExtensionsFromSchema
function v6.mergeExtensions(p8) -- name: mergeExtensions
	-- upvalues: (copy) v_u_7
	return v_u_7(p8)
end
local function v_u_11(p9, p10) -- name: applyExtensionObject
	-- upvalues: (copy) v_u_7, (copy) v_u_4
	if p9 then
		p9.extensions = v_u_7({ v_u_4.toJSBoolean(p9.extensions) and (p9.extensions or {}) or {}, v_u_4.toJSBoolean(p10) and p10 and p10 or {} })
	end
end
function v6.applyExtensions(p12, p13) -- name: applyExtensions
	-- upvalues: (copy) v_u_11, (copy) v_u_5, (copy) v_u_4, (copy) v_u_3
	v_u_11(p12, p13.schemaExtensions)
	for _, v14 in v_u_5.entries(v_u_4.toJSBoolean(p13.types) and p13.types or {}) do
		local v15 = v14[1]
		local v16 = v14[2]
		local v17 = p12:getType(v15)
		if not v_u_4.toJSBoolean(v17) then
			continue
		end
		v_u_11(v17, v16.extensions)
		if v16.type == "object" or v16.type == "interface" then
			for _, v18 in v_u_5.entries(v16.fields) do
				local v19 = v18[1]
				local v20 = v18[2]
				local v21 = v17:getFields():get(v19)
				if not v_u_4.toJSBoolean(v21) then
					continue
				end
				v_u_11(v21, v20.extensions)
				for _, v22 in v_u_5.entries(v20.arguments) do
					local v_u_23, v24 = table.unpack(v22, 1, 2)
					v_u_11(v_u_3.find(v21.args, function(p25)
						-- upvalues: (copy) v_u_23
						return p25.name == v_u_23
					end), v24)
				end
			end
		elseif v16.type == "input" then
			for _, v26 in v_u_5.entries(v16.fields) do
				local v27, v28 = table.unpack(v26, 1, 2)
				v_u_11(v17:getFields():get(v27), v28.extensions)
			end
		else
			if v16.type ~= "enum" then
				continue
			end
			for _, v29 in v_u_5.entries(v16.values) do
				local v30, v31 = table.unpack(v29, 1, 2)
				v_u_11(v17:getValue(v30), v31)
			end
		end
	end
	return p12
end
return v6