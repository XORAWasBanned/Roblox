-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.link.http
local v1 = {
	["parseAndCheckHttpResponse"] = require(script.parseAndCheckHttpResponse).parseAndCheckHttpResponse,
	["serializeFetchParameter"] = require(script.serializeFetchParameter).serializeFetchParameter
}
local v2 = require(script.selectHttpOptionsAndBody)
v1.fallbackHttpConfig = v2.fallbackHttpConfig
v1.selectHttpOptionsAndBody = v2.selectHttpOptionsAndBody
v1.checkFetcher = require(script.checkFetcher).checkFetcher
v1.createSignalIfSupported = require(script.createSignalIfSupported).createSignalIfSupported
v1.selectURI = require(script.selectURI).selectURI
v1.createHttpLink = require(script.createHttpLink).createHttpLink
v1.HttpLink = require(script.HttpLink).HttpLink
v1.rewriteURIForGET = require(script.rewriteURIForGET).rewriteURIForGET
return v1