-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.react.context.ApolloProvider
local v1 = script.Parent.Parent.Parent
local v2 = v1.Parent
require(v2.LuauPolyfill)
local v_u_3 = require(v2.React)
local v_u_4 = require(script.Parent.ApolloContext).getApolloContext
local v_u_5 = require(v1.jsutils.invariant).invariant
require(v1.core.ApolloClient)
function ApolloProvider(p_u_6) -- name: ApolloProvider
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_5
	local v_u_7 = v_u_4()
	return v_u_3.createElement(v_u_7.Consumer, nil, function(p8)
		-- upvalues: (copy) p_u_6, (ref) v_u_5, (ref) v_u_3, (copy) v_u_7
		local v9 = p8 == nil and {} or p8
		if p_u_6.client and v9.client ~= p_u_6.client then
			v9.client = p_u_6.client
		end
		v_u_5(v9.client, "ApolloProvider was not passed a client instance. Make sure you pass in your client via the \"client\" prop.")
		return v_u_3.createElement(v_u_7.Provider, {
			["value"] = v9
		}, p_u_6.children)
	end)
end
return {
	["ApolloProvider"] = ApolloProvider
}