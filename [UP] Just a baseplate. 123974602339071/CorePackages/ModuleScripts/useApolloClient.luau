-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.react.hooks.useApolloClient
local v1 = script.Parent.Parent.Parent
local v2 = v1.Parent
local v3 = {}
local v_u_4 = require(v2.React)
local v_u_5 = require(v1.jsutils.invariant).invariant
local v_u_6 = require(v1.react.context).getApolloContext
require(v1.core)
function useApolloClient() -- name: useApolloClient
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_5
	local v7 = v_u_4.useContext(v_u_6()).client
	v_u_5(v7, "No Apollo Client instance can be found. Please ensure that you have called `ApolloProvider` higher up in your tree.")
	return v7
end
v3.useApolloClient = useApolloClient
return v3