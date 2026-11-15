-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Reducers.EmotesMenuReducer
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = script.Parent
local v4 = {
	["displayOptions"] = require(v3.DisplayOptions),
	["emotesPage"] = require(v3.EmotesPage),
	["emotesWheel"] = require(v3.EmotesWheel),
	["layout"] = require(v3.Layout),
	["locale"] = require(v3.Locale)
}
return v2.combineReducers(v4)