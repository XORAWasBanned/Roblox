-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.utilities.introspectionFromSchema
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Parent.LuauPolyfill).Object
local v_u_3 = require(v1.jsutils.invariant).invariant
require(v1.type.schema)
local v_u_4 = require(v1.language.parser).parse
local v_u_5 = require(v1.execution.execute).executeSync
local v_u_6 = require(script.Parent.getIntrospectionQuery).getIntrospectionQuery
return {
	["introspectionFromSchema"] = function(p7, p8) -- name: introspectionFromSchema
		-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5, (copy) v_u_3
		local v9 = v_u_5({
			["schema"] = p7,
			["document"] = v_u_4(v_u_6((v_u_2.assign({
				["specifiedByUrl"] = true,
				["directiveIsRepeatable"] = true,
				["schemaDescription"] = true,
				["inputValueDeprecation"] = true
			}, p8))))
		})
		local v10 = v_u_3
		local v11 = not v9.errors
		if v11 then
			v11 = v9.data
		end
		v10(v11)
		return v9.data
	end
}