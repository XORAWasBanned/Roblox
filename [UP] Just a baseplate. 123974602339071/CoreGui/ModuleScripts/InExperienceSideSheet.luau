-- Path: CoreGui.RobloxGui.Modules.InExperienceSideSheet
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v3 = require(v1.Workspace.Packages.InExperienceSideSheet)
local v4 = require(v2.Modules.VoiceChat.VoiceStateContext)
local v5 = require(v2.Modules.ChatSelector)
local v6 = require(v2.Modules.TopBar)
return v3.SideSheet.createSideSheet({ v4.Provider }, {
	["ChatSelector"] = v5
}, v6.store)