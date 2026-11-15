-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.react.components.Query
local v1 = {}
local v2 = script.Parent.Parent.Parent
local v3 = v2.Parent
local v4 = require(v3.LuauPolyfill)
local v_u_5 = v4.Boolean
local v_u_6 = v4.Object
require(v2.core)
require(script.Parent.types)
local v_u_7 = require(script.Parent.Parent.hooks).useQuery
function v1.Query(p8) -- name: Query
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_5
	local v9 = p8.children
	local v10 = v_u_7(p8.query, (v_u_6.assign({}, p8, {
		["children"] = v_u_6.None,
		["query"] = v_u_6.None
	})))
	if v_u_5.toJSBoolean(v10) then
		return v9(v10)
	else
		return nil
	end
end
return v1