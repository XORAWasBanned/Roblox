-- Path: CoreGui.RobloxGui.Modules.Chrome.Flags.EnrolledConsoleExperienceControls
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.SharedFlags).FFlagEnableInExperienceHandheldControls
local v3 = script.Parent.Parent.Parent.Chrome
return require(v3.Flags.FFlagUnibarMenuOpenHamburger) or require(v3.Flags.FFlagUnibarMenuOpenSubmenu) or v2