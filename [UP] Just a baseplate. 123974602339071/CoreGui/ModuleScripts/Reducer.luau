-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Reducer
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = require(script.PromptInfo)
local v4 = require(script.ScreenSize)
local v5 = {
	["promptInfo"] = v3,
	["screenSize"] = v4,
	["ScreenSize"] = v4,
	["gameName"] = require(script.GameName),
	["analyticsInfo"] = require(script.AnalyticsInfo)
}
return v2.combineReducers(v5)