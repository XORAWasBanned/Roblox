-- Path: CorePackages.Packages._Index.Merge.Merge.typedefs-mergers.enum-values
local v1 = script.Parent.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v_u_3 = v2.Array
local v_u_4 = v2.Boolean
local v_u_5 = v2.Map
local v6 = {}
require(v1.GraphQL)
local v_u_7 = require(script.Parent.directives).mergeDirectives
require(script.Parent["merge-typedefs_types"])
local v_u_8 = require(v1.Utils).compareNodes
function v6.mergeEnumValues(p9, p10, p11) -- name: mergeEnumValues
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_5, (copy) v_u_7, (copy) v_u_8
	local v12 = v_u_4.toJSBoolean
	local v13
	if typeof(p11) == "table" then
		v13 = p11.consistentEnumMerge
	else
		v13 = nil
	end
	local v14
	if v12(v13) then
		v14 = {}
		if v_u_4.toJSBoolean(p9) then
			v14 = v_u_3.concat(v14, p9)
		end
	else
		v14 = p10
		p10 = p9
	end
	local v15 = v_u_5.new()
	if p10 then
		for _, v16 in p10 do
			v15:set(v16.name.value, v16)
		end
	end
	if v14 then
		for _, v17 in v14 do
			local v18 = v17.name.value
			if v_u_4.toJSBoolean(v15:has(v18)) then
				local v19 = v15:get(v18)
				v19.description = v_u_4.toJSBoolean(v17.description) and v17.description or v19.description
				v19.directives = v_u_7(v17.directives, v19.directives)
			else
				v15:set(v18, v17)
			end
		end
	end
	local v20 = v_u_3.concat({}, v15:values())
	if p11 and v_u_4.toJSBoolean(p11.sort) then
		v_u_3.sort(v20, v_u_8)
	end
	return v20
end
return v6