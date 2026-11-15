-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.link.http.HttpLink
local v1 = {}
local v_u_2 = require(script.Parent.Parent.core).ApolloLink
require(script.Parent.selectHttpOptionsAndBody)
local v_u_3 = require(script.Parent.createHttpLink).createHttpLink
local v_u_4 = setmetatable({}, {
	["__index"] = v_u_2
})
v_u_4.__index = v_u_4
function v_u_4.new(p5) -- name: new
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
	local v6 = p5 == nil and {} or p5
	local v7 = v_u_2.new(v_u_3(v6).request)
	local v8 = v_u_4
	local v9 = setmetatable(v7, v8)
	v9.options = v6
	return v9
end
v1.HttpLink = v_u_4
return v1