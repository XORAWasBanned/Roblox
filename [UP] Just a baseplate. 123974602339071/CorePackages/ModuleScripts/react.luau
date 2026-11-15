-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.react
local v1 = {}
local v2 = script.Parent
local v3 = v2.Parent
local v4 = require(v3.LuauPolyfill).Object
local v5 = require(v2.jsutils.invariant).invariant
local v6 = require(v2.utilities).DEV
v5(typeof(v6) == "boolean", (tostring(v6)))
local v7 = require(script.context)
v1.ApolloProvider = v7.ApolloProvider
v1.ApolloConsumer = v7.ApolloConsumer
v1.getApolloContext = v7.getApolloContext
v1.resetApolloContext = v7.resetApolloContext
local v8 = require(script.hooks)
v4.assign(v1, v8)
local v9 = require(script.parser)
v1.DocumentType = v9.DocumentType
v1.operationName = v9.operationName
v1.parser = v9.parser
local v10 = require(script.types.types)
v4.assign(v1, v10)
return v1