-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.Pages
local v1 = game:GetService("CorePackages")
local v2 = script.Parent.Parent
local v3 = require(v1.Packages.InGameMenuDependencies).UIBlox.App.ImageSet.Images
local v4 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v5 = require(v2.Resources.Constants)
local v6 = {
	{
		["key"] = nil,
		["navigationDepth"] = 1,
		["component"] = nil,
		["parentPage"] = nil,
		["key"] = v5.InitalPageKey,
		["component"] = script.InitalPage
	},
	{
		["key"] = nil,
		["navigationDepth"] = 1,
		["component"] = nil,
		["parentPage"] = nil,
		["key"] = v5.MainPagePageKey,
		["component"] = script.Parent.MainPage
	},
	{
		["key"] = "Players",
		["title"] = "CoreScripts.InGameMenu.PageTitle.Players",
		["icon"] = nil,
		["component"] = nil,
		["navigationDepth"] = 2,
		["parentPage"] = nil,
		["icon"] = v4 and "icons/controls/players" or v3["icons/controls/players"],
		["component"] = script.PlayersPage,
		["parentPage"] = v5.MainPagePageKey
	},
	{
		["key"] = "InviteFriends",
		["title"] = "CoreScripts.InGameMenu.PageTitle.InviteFriends",
		["icon"] = nil,
		["component"] = nil,
		["navigationDepth"] = 2,
		["parentPage"] = nil,
		["icon"] = v4 and "icons/actions/friends/friendInvite" or v3["icons/actions/friends/friendInvite"],
		["component"] = script.Parent.InviteFriendsPage,
		["parentPage"] = v5.MainPagePageKey
	},
	{
		["key"] = "GameSettings",
		["title"] = "CoreScripts.InGameMenu.PageTitle.GameSettings",
		["icon"] = nil,
		["component"] = nil,
		["navigationDepth"] = 2,
		["parentPage"] = nil,
		["icon"] = v4 and "icons/common/settings" or v3["icons/common/settings"],
		["component"] = script.Parent.GameSettingsPage.BasicPage,
		["parentPage"] = v5.MainPagePageKey
	},
	{
		["key"] = "Report",
		["title"] = "CoreScripts.InGameMenu.PageTitle.Report",
		["icon"] = nil,
		["component"] = nil,
		["navigationDepth"] = 2,
		["parentPage"] = nil,
		["icon"] = v4 and "icons/actions/feedback" or v3["icons/actions/feedback"],
		["component"] = script.Parent.ReportPage,
		["parentPage"] = v5.MainPagePageKey
	},
	{
		["key"] = "Controls",
		["title"] = "CoreScripts.InGameMenu.PageTitle.Controls",
		["icon"] = nil,
		["component"] = nil,
		["isModal"] = true,
		["navigationDepth"] = 2,
		["parentPage"] = nil,
		["icon"] = v4 and "icons/controls/controls" or v3["icons/controls/controls"],
		["component"] = script.Parent.ControlsPage,
		["parentPage"] = v5.MainPagePageKey
	},
	{
		["key"] = "AdvancedGameSettings",
		["title"] = "CoreScripts.InGameMenu.PageTitle.GameSettings",
		["icon"] = nil,
		["component"] = nil,
		["isSecondaryPage"] = true,
		["navigationDepth"] = 3,
		["parentPage"] = "GameSettings",
		["icon"] = v3["icons/menu/settings_large"],
		["component"] = script.Parent.GameSettingsPage.AdvancedPage
	},
	{
		["key"] = "VRGameSettings",
		["title"] = "CoreScripts.InGameMenu.PageTitle.VRComfortSettings",
		["icon"] = nil,
		["component"] = nil,
		["isSecondaryPage"] = true,
		["navigationDepth"] = 3,
		["parentPage"] = "GameSettings",
		["icon"] = v3["icons/menu/settings_large"],
		["component"] = script.Parent.GameSettingsPage.VRComfortSettingsPage
	},
	{
		["key"] = nil,
		["navigationDepth"] = 1,
		["component"] = nil,
		["parentPage"] = nil,
		["key"] = v5.LeaveToAppPromptPageKey,
		["component"] = script.Dialog.LeaveToAppPrompt
	},
	{
		["key"] = nil,
		["navigationDepth"] = 1,
		["component"] = nil,
		["parentPage"] = nil,
		["key"] = v5.LeaveGamePromptPageKey,
		["component"] = script.Dialog.LeaveGamePrompt
	}
}
local v7 = {}
for v8, v9 in ipairs(v6) do
	v9.index = v8
	local v10 = v7[v9.key] == nil
	local v11 = v9.key
	assert(v10, ("page key %s is duplicated"):format(v11))
	v7[v9.key] = v9
end
return {
	["pagesByIndex"] = v6,
	["pagesByKey"] = v7
}