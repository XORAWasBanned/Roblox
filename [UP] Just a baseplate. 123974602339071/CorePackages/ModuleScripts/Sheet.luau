-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Sheet
require(script.Types)
local v1 = require(script.Actions)
local v2 = require(script.Content)
local v3 = require(script.FullBleed)
local v4 = require(script.Header)
return {
	["Root"] = require(script.Sheet),
	["Actions"] = v1,
	["Content"] = v2,
	["FullBleed"] = v3,
	["Header"] = v4
}