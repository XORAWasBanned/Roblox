-- Path: CoreGui.RobloxGui.Modules.Groups.GroupsApp
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v3 = v1:WaitForChild("RobloxGui")
local v4 = require(v2.Workspace.Packages.Groups).GroupsInExperienceApp.createApp()
v4.mountCoreUI(v3)
return v4