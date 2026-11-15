-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v3 = require(v1.Workspace.Packages.AppCommonLib).isSpatial
local v4 = require(v1.Workspace.Packages.SharedFlags)
local v5 = v4.FFlagEnableInExperienceAvatarSwitcher
local v6 = v4.FFlagAddInviteFriendsIntegration
local v7 = v4.FFlagAppNavMyStatsTab
local v8 = require(v1.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local v9 = v4.FFlagEnableInExperienceShop
local v10 = v4.FFlagEnableOffersPrefetch
local v11 = v4.FFlagIntegrateTraversalHistoryInSideSheet
local v12 = v4.FFlagRemoveFriendsChatUnibarEntrypoints
local v13 = v4.FFlagExpChatCanShowFriendsTab
local v14 = v4.FFlagShowSwitchServerButton
local v15 = require(v1.Workspace.Packages.PioneerUtils).isPioneerLaunch
local v16 = require(script.Parent.Flags.FFlagEnableSideSheetRobuxWidget)
local v17 = require(v1.Workspace.Packages.CoreScriptsRoactCommon).Traversal.Flags.FFlagAddTraversalHistory
local v18 = {
	["OverflowMenu"] = require(script.OverflowMenu)
}
local v19
if v7 then
	v19 = require(script.AssistantBuild)
else
	v19 = nil
end
v18.AssistantBuild = v19
v18.Chat = require(script.ExpChat.ChatChromeIntegration)
local v20
if v12 and v13 then
	v20 = nil
else
	v20 = require(script.Connect.ConnectIconDropdown)
end
v18.ConnectDropdown = v20
v18.TrustAndSafety = require(script.TrustAndSafety)
v18.DummyWindow = require(script.DummyWindow)
v18.DummyWindow2 = require(script.DummyWindow2)
v18.ToggleMic = require(script.ToggleMic)
v18.JoinVoice = require(script.JoinVoice)
v18.SelfieView = require(script.SelfieView)
v18.CapturesEntrypoint = require(script.Captures.CapturesEntrypoint)
local v21
if v5 then
	v21 = require(script.AvatarSwitcher.AvatarSwitcherEntrypoint)
else
	v21 = nil
end
v18.AvatarSwitcherEntryPoint = v21
v18.MusicEntrypoint = require(script.MusicUtility.MusicEntrypoint)
v18.PartyEntrypoint = require(script.Party.PartyEntrypoint)
v18.PartyMic = require(script.Party.PartyMic)
local v22
if v2 and v3() then
	v22 = require(script.VRToggleButton)
else
	v22 = nil
end
v18.VRToggleButton = v22
local v23
if v2 and v3() then
	v23 = require(script.VRSafeBubble)
else
	v23 = nil
end
v18.VRSafeBubble = v23
v18.People = require(script.Pages.People)
local v24
if v6 then
	v24 = require(script.Pages.InviteFriends)
else
	v24 = nil
end
v18.InviteFriends = v24
v18.Settings = require(script.Pages.Settings)
v18.Gallery = require(script.Pages.Gallery)
v18.Help = require(script.Pages.Help)
local v25
if v17 and v11 then
	v25 = require(script.Pages.TraversalHistory)
else
	v25 = nil
end
v18.TraversalHistory = v25
local v26
if v8 then
	v26 = require(script.Pages.LeaveConfirmation)
else
	v26 = nil
end
v18.LeaveConfirmation = v26
local v27
if v8 then
	v27 = require(script.Pages.RespawnConfirmation)
else
	v27 = nil
end
v18.RespawnConfirmation = v27
local v28
if v16 and v8 then
	v28 = require(script.RobuxWidget)
else
	v28 = nil
end
v18.RobuxWidget = v28
local v29
if v9 then
	v29 = require(script.InExperienceShop.ShopEntrypoint)
else
	v29 = nil
end
v18.ShopEntrypoint = v29
local v30
if v10 then
	v30 = require(script.InExperienceOffers.initOffersPrefetch)
else
	v30 = nil
end
v18.InitOffersPrefetch = v30
local v31
if v8 and (v15() or v14) then
	v31 = require(script.SwitchServer)
else
	v31 = nil
end
v18.SwitchServer = v31
local v32
if v15() then
	v32 = require(script.AccountUpsell)
else
	v32 = nil
end
v18.AccountUpsell = v32
return v18