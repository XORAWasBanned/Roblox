-- Path: CoreGui.RobloxGui.Modules.Captures.CapturesApp
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v3 = v1:WaitForChild("RobloxGui")
local v4 = require(v2.Workspace.Packages.Chrome).Enabled
local v5 = require(v2.Workspace.Packages.CapturesInExperience)
local v6 = v5.App.createApp()
local v7 = Instance.new("ScreenGui")
v7.DisplayOrder = v5.Constants.CarouselDisplayOrder
v7.Name = "ScreenshotsCarousel"
v7.ResetOnSpawn = false
v7.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
v7.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
v7.Parent = v1
local v8 = Instance.new("ScreenGui")
v8.DisplayOrder = v5.Constants.CarouselDisplayOrder
v8.Name = "CaptureManager"
v8.ResetOnSpawn = false
v8.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
v8.Parent = v1
local v9 = Instance.new("ScreenGui")
v9.DisplayOrder = v5.Constants.OverlayDisplayOrder
v9.Name = v5.Constants.OverlayName
v9.ResetOnSpawn = false
v9.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
v9.Parent = v1
local v10 = Instance.new("ScreenGui")
v10.DisplayOrder = v5.Constants.CreationFlowDisplayOrder
v10.Name = "MomentsCreationFlow"
v10.ResetOnSpawn = false
v10.ScreenInsets = Enum.ScreenInsets.None
v10.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
v10.Parent = v1
v6.mountCaptureManager(v8)
v6.mountCarousel(v7)
v6.mountCoreUI(v3, v4())
v6.mountCaptureOverlay(v9)
v6.mountMomentsCreationFlow(v10)
return v6