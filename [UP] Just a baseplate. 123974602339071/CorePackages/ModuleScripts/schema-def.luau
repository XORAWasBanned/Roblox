-- Path: CorePackages.Packages._Index.Merge.Merge.typedefs-mergers.schema-def
local v1 = script.Parent.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v_u_3 = v2.Array
local v_u_4 = v2.Boolean
local v_u_5 = v2.Object
local v6 = {}
local v_u_7 = require(v1.GraphQL).Kind
local v_u_8 = require(script.Parent.directives).mergeDirectives
require(script.Parent["merge-typedefs_types"])
local v_u_9 = {
	["query"] = "Query",
	["mutation"] = "Mutation",
	["subscription"] = "Subscription"
}
v6.DEFAULT_OPERATION_TYPE_NAME_MAP = v_u_9
local function v_u_20(p10, p11) -- name: mergeOperationTypes
	-- upvalues: (copy) v_u_9, (copy) v_u_3, (copy) v_u_4
	local v12 = p10 == nil and {} or p10
	local v13 = p11 == nil and {} or p11
	local v14 = {}
	for _, v_u_15 in v_u_9 do
		local v17 = v_u_3.find(v12, function(p16)
			-- upvalues: (copy) v_u_15
			return p16.operation == v_u_15
		end)
		local v19 = v_u_4.toJSBoolean(v17) and v17 and v17 or v_u_3.find(v13, function(p18)
			-- upvalues: (copy) v_u_15
			return p18.operation == v_u_15
		end)
		if not v19 then
			continue
		end
		table.insert(v14, v19)
	end
	return v14
end
function v6.mergeSchemaDefs(p21, p22, p23) -- name: mergeSchemaDefs
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_8, (copy) v_u_20, (copy) v_u_5
	if v_u_4.toJSBoolean(p22) then
		local v24 = {}
		local v25
		if p21.kind == v_u_7.SCHEMA_DEFINITION or p22.kind == v_u_7.SCHEMA_DEFINITION then
			v25 = v_u_7.SCHEMA_DEFINITION
		else
			v25 = v_u_7.SCHEMA_EXTENSION
		end
		v24.kind = v25
		v24.description = v_u_4.toJSBoolean(p21.description) and p21.description or p22.description
		v24.directives = v_u_8(p21.directives, p22.directives, p23)
		v24.operationTypes = v_u_20(p21.operationTypes, p22.operationTypes)
		return v24
	elseif p23 and v_u_4.toJSBoolean(p23.convertExtensions) then
		return v_u_5.assign({}, p21, {
			["kind"] = v_u_7.SCHEMA_DEFINITION
		})
	else
		return p21
	end
end
return v6