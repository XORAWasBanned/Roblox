-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities
local v1 = {}
local v2 = script.Parent
local v3 = v2.Parent
local v4 = require(v2.jsutils.invariant).invariant
local v5 = require(script.globals).DEV
v4(typeof(v5) == "boolean", (tostring(v5)))
v1.DEV = v5
local v6 = require(v3.LuauPolyfill).Object
v1.NULL = require(script.globals).NULL
local v7 = require(script.graphql.directives)
v1.shouldInclude = v7.shouldInclude
v1.hasDirectives = v7.hasDirectives
v1.hasClientExports = v7.hasClientExports
v1.getDirectiveNames = v7.getDirectiveNames
v1.getInclusionDirectives = v7.getInclusionDirectives
local v8 = require(script.graphql.fragments)
v1.createFragmentMap = v8.createFragmentMap
v1.getFragmentQueryDocument = v8.getFragmentQueryDocument
v1.getFragmentFromSelection = v8.getFragmentFromSelection
local v9 = require(script.graphql.getFromAST)
v1.checkDocument = v9.checkDocument
v1.getOperationDefinition = v9.getOperationDefinition
v1.getOperationName = v9.getOperationName
v1.getFragmentDefinitions = v9.getFragmentDefinitions
v1.getQueryDefinition = v9.getQueryDefinition
v1.getFragmentDefinition = v9.getFragmentDefinition
v1.getMainDefinition = v9.getMainDefinition
v1.getDefaultValues = v9.getDefaultValues
local v10 = require(script.graphql.storeUtils)
v1.makeReference = v10.makeReference
v1.isDocumentNode = v10.isDocumentNode
v1.isReference = v10.isReference
v1.isField = v10.isField
v1.isInlineFragment = v10.isInlineFragment
v1.valueToObjectRepresentation = v10.valueToObjectRepresentation
v1.storeKeyNameFromField = v10.storeKeyNameFromField
v1.argumentsObjectFromField = v10.argumentsObjectFromField
v1.resultKeyNameFromField = v10.resultKeyNameFromField
v1.getStoreKeyName = v10.getStoreKeyName
v1.getTypenameFromResult = v10.getTypenameFromResult
local v11 = require(script.graphql.transform)
v1.addTypenameToDocument = v11.addTypenameToDocument
v1.buildQueryFromSelectionSet = v11.buildQueryFromSelectionSet
v1.removeDirectivesFromDocument = v11.removeDirectivesFromDocument
v1.removeConnectionDirectiveFromDocument = v11.removeConnectionDirectiveFromDocument
v1.removeArgumentsFromDocument = v11.removeArgumentsFromDocument
v1.removeFragmentSpreadFromDocument = v11.removeFragmentSpreadFromDocument
v1.removeClientSetsFromDocument = v11.removeClientSetsFromDocument
local v12 = require(script.policies.pagination)
v1.concatPagination = v12.concatPagination
v1.offsetLimitPagination = v12.offsetLimitPagination
v1.relayStylePagination = v12.relayStylePagination
v1.Observable = require(script.observables.Observable).Observable
v6.assign(v1, require(script.common.mergeDeep))
v6.assign(v1, require(script.common.cloneDeep))
v6.assign(v1, require(script.common.maybeDeepFreeze))
v6.assign(v1, require(script.common.stringifyForDisplay))
v6.assign(v1, require(script.observables.iteration))
v6.assign(v1, require(script.observables.asyncMap))
local v13 = require(script.observables.Concast)
v6.assign(v1, v13)
v6.assign(v1, require(script.observables.subclassing))
v6.assign(v1, require(script.common.arrays))
v6.assign(v1, require(script.common.objects))
v6.assign(v1, require(script.common.errorHandling))
v6.assign(v1, require(script.common.canUse))
v6.assign(v1, require(script.common.compact))
v6.assign(v1, require(script.common.makeUniqueId))
return v1