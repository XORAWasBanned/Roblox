-- Path: CorePackages.Packages._Index.GenericPagination.GenericPagination.dependencies
local v1 = script.Parent
local v2 = v1.Parent
return {
	["t"] = require(v2.t),
	["LinkedList"] = require(v1.LinkedList),
	["Promise"] = require(v2.Promise)
}