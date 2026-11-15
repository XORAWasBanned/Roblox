-- Path: CoreGui.RobloxGui.Modules.AvatarGeneration.SelfieQr
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v3 = v1:WaitForChild("RobloxGui")
local v4 = require(v2.Workspace.Packages.SelfieQr).SelfieQRFactory.createFactory()
v4.mountCoreUI(v3)
return v4