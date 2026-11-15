-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.core
local v1 = {}
local v2 = script.Parent
local v3 = v2.Parent
local v4 = require(v3.LuauPolyfill).Object
local v5 = require(v2.utilities).DEV
local v6 = require(script.ApolloClient)
v1.ApolloClient = v6.ApolloClient
v1.mergeOptions = v6.mergeOptions
local v7 = require(script.ObservableQuery)
v1.applyNextFetchPolicy = v7.applyNextFetchPolicy
v1.ObservableQuery = v7.ObservableQuery
require(script.watchQueryOptions)
v1.NetworkStatus = require(script.networkStatus).NetworkStatus
local v8 = require(script.types)
v4.assign(v1, v8)
require(script.LocalState)
local v9 = require(script.Parent.errors)
v1.isApolloError = v9.isApolloError
v1.ApolloError = v9.ApolloError
local v10 = require(script.Parent.cache)
v1.ApolloCache = v10.ApolloCache
v1.defaultDataIdFromObject = v10.defaultDataIdFromObject
v1.InMemoryCache = v10.InMemoryCache
v1.MissingFieldError = v10.MissingFieldError
v1.makeVar = v10.makeVar
v1.None = v10.None
local v11 = require(script.Parent.cache.inmemory.types)
v4.assign(v1, v11)
local v12 = require(script.Parent.link.core)
v4.assign(v1, v12)
local v13 = require(script.Parent.link.http)
v4.assign(v1, v13)
local v14 = require(script.Parent.link.utils)
v1.fromError = v14.fromError
v1.toPromise = v14.toPromise
v1.fromPromise = v14.fromPromise
v1.throwServerError = v14.throwServerError
local v15 = require(script.Parent.utilities)
v1.Observable = v15.Observable
v1.isReference = v15.isReference
v1.makeReference = v15.makeReference
v1.NULL = v15.NULL
local v16 = require(v2.jsutils.invariant).setVerbosity
v1.setLogVerbosity = v16
v16(v5 and "log" or "silent")
local v17 = require(v3.GraphQLTag)
v1.gql = v17.default
v1.resetCaches = v17.resetCaches
v1.disableFragmentWarnings = v17.disableFragmentWarnings
v1.enableExperimentalFragmentVariables = v17.enableExperimentalFragmentVariables
v1.disableExperimentalFragmentVariables = v17.disableExperimentalFragmentVariables
return v1