-- Path: CorePackages.Packages._Index.FocusNavigation.FocusNavigation
require(script.Parent.EventPropagation)
local v1 = require(script.FocusNavigationService)
local v2 = require(script.isValidFocusTarget)
local v3 = require(script.EngineInterface)
require(script.types)
local v4 = {
	["isValidFocusTarget"] = v2,
	["FocusNavigationService"] = v1,
	["EngineInterface"] = {
		["CoreGui"] = v3.CoreGui,
		["PlayerGui"] = v3.PlayerGui
	}
}
return v4