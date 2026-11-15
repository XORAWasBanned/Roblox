-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.link.http.selectURI
local v1 = script.Parent.Parent.Parent.Parent
local v_u_2 = require(v1.LuauPolyfill).Boolean
local v3 = {}
require(script.Parent.Parent.core.types)
function v3.selectURI(p4, p5) -- name: selectURI
	-- upvalues: (copy) v_u_2
	local v6 = p4:getContext().uri
	if v_u_2.toJSBoolean(v6) then
		return v6
	else
		return typeof(p5) ~= "function" and (v_u_2.toJSBoolean(p5) and p5 and p5 or "/graphql") or p5(p4)
	end
end
return v3