-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Reducers.chatReducer
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v3 = require(v1.Packages.Rodux)
local v4 = {
	["chatSettings"] = require(script.Parent.chatSettings),
	["messages"] = require(script.Parent.messages),
	["userMessages"] = require(script.Parent.userMessages),
	["voiceState"] = require(v2.Modules.VoiceChat.Reducers.voiceState),
	["components"] = require(script.Parent.components)
}
return v3.combineReducers(v4)