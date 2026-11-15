-- Path: CorePackages.Packages._Index.Merge.Merge.typedefs-mergers.union
local v1 = script.Parent.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v_u_3 = v2.Boolean
local v_u_4 = v2.Object
local v5 = {}
local v_u_6 = require(v1.GraphQL).Kind
local v_u_7 = require(script.Parent.directives).mergeDirectives
local v_u_8 = require(script.Parent["merge-named-type-array"]).mergeNamedTypeArray
require(script.Parent["merge-typedefs_types"])
function v5.mergeUnion(p9, p10, p11) -- name: mergeUnion
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_6, (copy) v_u_8, (copy) v_u_4
	if p10 then
		local v12 = {
			["name"] = p9.name
		}
		local v13
		if v_u_3.toJSBoolean(p9.description) then
			v13 = p9.description
		else
			v13 = p10.description
		end
		v12.description = v13
		v12.directives = v_u_7(p9.directives, p10.directives, p11)
		local v14
		if p11 and v_u_3.toJSBoolean(p11.convertExtensions) or (p9.kind == "UnionTypeDefinition" or p10.kind == "UnionTypeDefinition") then
			v14 = v_u_6.UNION_TYPE_DEFINITION
		else
			v14 = v_u_6.UNION_TYPE_EXTENSION
		end
		v12.kind = v14
		v12.loc = p9.loc
		v12.types = v_u_8(p9.types, p10.types, p11)
		return v12
	elseif p11 and v_u_3.toJSBoolean(p11.convertExtensions) then
		return v_u_4.assign({}, p9, {
			["kind"] = v_u_6.UNION_TYPE_DEFINITION
		})
	else
		return p9
	end
end
return v5