-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.react.hooks.useQuery
local v1 = {}
local v2 = script.Parent.Parent.Parent
local v3 = v2.Parent
require(v3.GraphQL)
require(v2.jsutils.typedDocumentNode)
require(script.Parent.Parent.types.types)
local v_u_4 = require(script.Parent.utils.useBaseQuery).useBaseQuery
require(v2.core)
function v1.useQuery(p5, p6) -- name: useQuery
	-- upvalues: (copy) v_u_4
	return v_u_4(p5, p6, false)
end
return v1