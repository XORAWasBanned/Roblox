-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow
local v1 = require(script.Constants)
local v2 = require(script.Context.CreationFlowContext)
local v3 = require(script.Context.CreationFlowContextProvider)
local v4 = require(script.Components.CreationFlowScreen)
local v5 = require(script.Analytics.EventNames)
local v6 = require(script.Reducers.installReducer)
local v7 = require(script.Actions.CreationFlowStateUpdated)
local v8 = require(script.Actions.SelectedCaptureUpdated)
local v9 = require(script.Enums.CreationFlowLocalization)
local v10 = require(script.Enums.CreationFlowState)
local v11 = script.Parent
require(v11.MomentsCommon)
local v12 = {
	["EventNames"] = v5,
	["Actions"] = {
		["CreationFlowStateUpdated"] = v7,
		["SelectedCaptureUpdated"] = v8
	},
	["Constants"] = {
		["RoduxKey"] = v1.RoduxKey
	},
	["installReducer"] = v6,
	["CreationFlowContext"] = v2,
	["CreationFlowContextProvider"] = v3,
	["CreationFlowScreen"] = v4,
	["Enums"] = {
		["CreationFlowState"] = v10
	},
	["CreationFlowLocalization"] = v9,
	["jest.config"] = script["jest.config"]
}
return v12