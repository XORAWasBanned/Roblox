-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.HeaderBar
local v1 = require(script.Actions)
local v2 = require(script.Content)
local v3 = require(script.Leading)
return {
	["Root"] = require(script.HeaderBar),
	["Leading"] = v3,
	["Trailing"] = require(script.Trailing),
	["Content"] = v2,
	["Actions"] = v1
}