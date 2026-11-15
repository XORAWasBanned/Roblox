-- Path: CorePackages.Packages._Index.Merge.Merge.typedefs-mergers.enum
local v1 = script.Parent.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v_u_3 = v2.Boolean
local v_u_4 = v2.Object
local v5 = {}
local v_u_6 = require(v1.GraphQL).Kind
local v_u_7 = require(script.Parent.directives).mergeDirectives
local v_u_8 = require(script.Parent["enum-values"]).mergeEnumValues
require(script.Parent["merge-typedefs_types"])
function v5.mergeEnum(p9, p10, p11) -- name: mergeEnum
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_8, (copy) v_u_4, (copy) v_u_6
	if v_u_3.toJSBoolean(p10) then
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
		v12.kind = (p11 and v_u_3.toJSBoolean(p11.convertExtensions) or (p9.kind == "EnumTypeDefinition" or p10.kind == "EnumTypeDefinition")) and "EnumTypeDefinition" or "EnumTypeExtension"
		v12.loc = p9.loc
		v12.directives = v_u_7(p9.directives, p10.directives, p11)
		v12.values = v_u_8(p9.values, p10.values, p11)
		return v12
	elseif p11 and v_u_3.toJSBoolean(p11.convertExtensions) then
		return v_u_4.assign({}, p9, {
			["kind"] = v_u_6.ENUM_TYPE_DEFINITION
		})
	else
		return p9
	end
end
return v5