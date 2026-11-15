-- Path: CoreGui.RobloxGui.Modules.PlayerFeedback
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v3 = require(v1.Workspace.Packages.CoreScriptsPlayerFeedback).createApp()
v3.instance.Parent = v2
return v3