-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.globals.DEV
local v1 = {}
local v2 = script.Parent.Parent.Parent.Parent
local v_u_3 = require(v2.LuauPolyfill).Boolean
local v_u_4 = require(script.Parent.Parent.common.global).default
local _, v5 = xpcall(function()
	-- upvalues: (copy) v_u_3
	return v_u_3.toJSBoolean(_G.__DEV__)
end, function()
	-- upvalues: (copy) v_u_4
	v_u_4.__DEV__ = true
	return v_u_4.__DEV__
end)
v1.default = v5
return v1