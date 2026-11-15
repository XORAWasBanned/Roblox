-- Path: CorePackages.Packages._Index.Merge.Merge.typedefs-mergers.scalar
local v1 = script.Parent.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v_u_3 = v2.Boolean
local v_u_4 = v2.Object
local v5 = {}
local v_u_6 = require(v1.GraphQL).Kind
local v_u_7 = require(script.Parent.directives).mergeDirectives
require(script.Parent["merge-typedefs_types"])
function v5.mergeScalar(p8, p9, p10) -- name: mergeScalar
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_4, (copy) v_u_6
	if p9 then
		local v11 = {
			["name"] = p8.name
		}
		local v12
		if v_u_3.toJSBoolean(p8.description) then
			v12 = p8.description
		else
			v12 = p9.description
		end
		v11.description = v12
		v11.kind = (p10 and v_u_3.toJSBoolean(p10.convertExtensions) or (p8.kind == "ScalarTypeDefinition" or p9.kind == "ScalarTypeDefinition")) and "ScalarTypeDefinition" or "ScalarTypeExtension"
		v11.loc = p8.loc
		v11.directives = v_u_7(p8.directives, p9.directives, p10)
		return v11
	elseif p10 and v_u_3.toJSBoolean(p10.convertExtensions) then
		return v_u_4.assign({}, p8, {
			["kind"] = v_u_6.SCALAR_TYPE_DEFINITION
		})
	else
		return p8
	end
end
return v5