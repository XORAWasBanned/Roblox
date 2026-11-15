-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.react.context.ApolloConsumer
local v1 = script.Parent.Parent.Parent
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(script.Parent.ApolloContext).getApolloContext
local v_u_5 = require(v1.jsutils.invariant).invariant
require(v1.core.ApolloClient)
function ApolloConsumer(p_u_6) -- name: ApolloConsumer
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_5
	local v7 = v_u_4()
	return v_u_3.createElement(v7.Consumer, nil, function(p8)
		-- upvalues: (ref) v_u_5, (copy) p_u_6
		local v9 = v_u_5
		local v10
		if p8 then
			v10 = p8.client
		else
			v10 = p8
		end
		v9(v10, "Could not find \"client\" in the context of ApolloConsumer. Wrap the root component in an <ApolloProvider>.")
		return p_u_6.children(p8.client)
	end)
end
return {
	["ApolloConsumer"] = ApolloConsumer
}