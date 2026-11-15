-- Path: CoreGui.RobloxGui.Modules.Feedback.Reducers
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = {
	["common"] = require(script.common),
	["displayOptions"] = require(script.displayOptions),
	["feedbackFlowState"] = require(script.feedbackFlowState),
	["FetchingStatus"] = require(v1.Workspace.Packages.Http).Reducers.FetchingStatus
}
return v2.combineReducers(v3)