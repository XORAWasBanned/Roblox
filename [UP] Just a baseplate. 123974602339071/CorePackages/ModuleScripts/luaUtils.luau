-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.luaUtils
local v1 = script.Parent.Parent
local v2 = require(v1.LuauPolyfill).Object
local v3 = require(script.makeIntervalImpl)
return v2.assign({
	["Object"] = require(script.Object)
}, v3(delay))