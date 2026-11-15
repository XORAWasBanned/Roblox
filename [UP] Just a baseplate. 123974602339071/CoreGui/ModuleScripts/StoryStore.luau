-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Helpers.StoryStore
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = require(script.Parent.Parent.Reducers.chatReducer)
return v2.Store.new(v3)