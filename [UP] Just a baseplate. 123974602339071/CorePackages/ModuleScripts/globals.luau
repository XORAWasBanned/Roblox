-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.globals
local v1 = {
	["DEV"] = require(script.DEV).default
}
local v2 = require(script.graphql).removeTemporaryGlobals
v1.removeTemporaryGlobals = v2
v1.NULL = require(script.null).NULL
v2()
return v1