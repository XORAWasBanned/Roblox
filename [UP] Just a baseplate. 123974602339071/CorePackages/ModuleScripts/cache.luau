-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.cache
local v1 = {}
local v2 = script.Parent
local v3 = v2.Parent
local v4 = require(v3.LuauPolyfill).Object
local v5 = require(v2.jsutils.invariant).invariant
local v6 = require(script.Parent.utilities).DEV
v5(typeof(v6) == "boolean", v6)
v1.ApolloCache = require(script.core.cache).ApolloCache
require(script.core.types.Cache)
require(script.core.types.DataProxy)
v1.MissingFieldError = require(script.core.types.common).MissingFieldError
local v7 = require(script.Parent.utilities.graphql.storeUtils)
v1.isReference = v7.isReference
v1.makeReference = v7.makeReference
v1.EntityStore = require(script.inmemory.entityStore).EntityStore
v1.fieldNameFromStoreName = require(script.inmemory.helpers).fieldNameFromStoreName
v1.InMemoryCache = require(script.inmemory.inMemoryCache).InMemoryCache
local v8 = require(script.inmemory.reactiveVars)
v1.makeVar = v8.makeVar
v1.cacheSlot = v8.cacheSlot
local v9 = require(script.inmemory.policies)
v1.defaultDataIdFromObject = v9.defaultDataIdFromObject
v1.Policies = v9.Policies
v1.None = v9.None
v1.canonicalStringify = require(script.inmemory["object-canon"]).canonicalStringify
local v10 = require(script.inmemory.types)
v4.assign(v1, v10)
return v1