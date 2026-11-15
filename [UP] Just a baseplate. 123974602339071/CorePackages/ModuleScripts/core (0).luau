-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.link.core
local v1 = {}
local v2 = script.Parent.Parent
local v3 = v2.Parent
local v4 = require(v3.LuauPolyfill).Object
local v5 = require(v2.jsutils.invariant).invariant
local v6 = require(v2.utilities).DEV
v5(typeof(v6) == "boolean", (tostring(v6)))
v1.empty = require(script.empty).empty
v1.from = require(script.from).from
v1.split = require(script.split).split
v1.concat = require(script.concat).concat
v1.execute = require(script.execute).execute
v1.ApolloLink = require(script.ApolloLink).ApolloLink
local v7 = require(script.types)
v4.assign(v1, v7)
return v1