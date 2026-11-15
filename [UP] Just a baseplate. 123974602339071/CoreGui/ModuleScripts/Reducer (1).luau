-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Reducer
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = {
	["promptRequest"] = require(script.PromptRequestReducer)
}
return v2.combineReducers(v3)