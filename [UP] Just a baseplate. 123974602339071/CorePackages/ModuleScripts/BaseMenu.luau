-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.BaseMenu
local v1 = require(script.BaseMenu)
local v2 = require(script.BaseMenuContext)
local v3 = require(script.BaseMenuGroup)
return {
	["Root"] = v1,
	["Item"] = require(script.BaseMenuItem),
	["Context"] = v2,
	["Group"] = v3
}