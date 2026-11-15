-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.react.components.Mutation
local v1 = {}
local v2 = script.Parent.Parent.Parent
local v3 = v2.Parent
local v_u_4 = require(v3.LuauPolyfill).Boolean
require(v2.core)
require(script.Parent.types)
local v_u_5 = require(script.Parent.Parent.hooks).useMutation
function v1.Mutation(p6) -- name: Mutation
	-- upvalues: (copy) v_u_5, (copy) v_u_4
	local v7 = v_u_5(p6.mutation, p6)
	local v8, v9 = table.unpack(v7, 1, 2)
	if v_u_4.toJSBoolean(p6.children) then
		return p6.children(v8, v9)
	else
		return nil
	end
end
return v1