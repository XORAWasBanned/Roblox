-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.execution
local v1 = require(script.execute)
local v2 = require(script.values)
return {
	["responsePathAsArray"] = require(script.Parent.jsutils.Path).pathToArray,
	["execute"] = v1.execute,
	["executeSync"] = v1.executeSync,
	["defaultFieldResolver"] = v1.defaultFieldResolver,
	["defaultTypeResolver"] = v1.defaultTypeResolver,
	["getDirectiveValues"] = v2.getDirectiveValues
}