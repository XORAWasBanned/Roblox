-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.react.hooks.useLazyQuery
local v1 = script.Parent.Parent.Parent
local v2 = v1.Parent
require(v2.GraphQL)
require(v1.jsutils.typedDocumentNode)
require(v1.react.types.types)
local v_u_3 = require(script.Parent.utils.useBaseQuery).useBaseQuery
require(v1.core)
return {
	["useLazyQuery"] = function(p4, p5) -- name: useLazyQuery
		-- upvalues: (copy) v_u_3
		return v_u_3(p4, p5, true)
	end
}