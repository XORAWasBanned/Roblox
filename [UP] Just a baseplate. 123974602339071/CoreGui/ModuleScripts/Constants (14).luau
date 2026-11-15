-- Path: CoreGui.RobloxGui.Modules.TopBar.Constants
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Signals)
local v_u_3 = require(v1.Packages.SignalsReact)
local v_u_4 = require(v1.Workspace.Packages.Display)
local v_u_5 = v_u_4.GetDisplayStore(false).getUIScale
local v6 = script.Parent.Parent
local v7 = require(v6.TenFootInterface)
local v8 = require(v1.Workspace.Packages.Chrome).Enabled
local v9 = v6.Chrome.ChromeShared
local v10 = require(v6.isNewTiltIconEnabled)
local v11 = require(v1.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarRefactor
local v12 = require(v1.Workspace.Packages.SharedFlags).FFlagResponsiveUnitsDeprecateTenFoot
local v13 = require(v1.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local v14
if v8() then
	v14 = require(v9.Utility.GetStyleTokens)()
else
	v14 = nil
end
local v15 = not v8() and 36 or v14.Size.Size_900
local v16 = v15 - 4
local v17
if v8() and not v12 then
	local v18 = v7:IsEnabled() and 1.5 or 1
	v17 = not v8() and 58 or v18 * 58
else
	v17 = 58
end
local v19 = not v8() and 44 or v14.Size.Size_1100
if v10() then
	if v8() then
		v15 = v17
	end
end
if v8() then
	v16 = v19
end
local v20 = not v8() and 2 or v14.Padding.XXSmall
local v21 = not v8() and 16 or v14.Gap.Large
local v22 = not v8() and 12 or v14.Padding.Small
local v23 = {
	Enum.UserInputType.Gamepad1,
	Enum.UserInputType.Gamepad2,
	Enum.UserInputType.Gamepad3,
	Enum.UserInputType.Gamepad4,
	Enum.UserInputType.Gamepad5,
	Enum.UserInputType.Gamepad6,
	Enum.UserInputType.Gamepad7,
	Enum.UserInputType.Gamepad8
}
local v27 = {
	["ApplyDisplayScale"] = nil,
	["useDisplayScaleState"] = nil,
	["TopBarHeight"] = nil,
	["TopBarHeightTenFoot"] = nil,
	["TopBarButtonHeight"] = nil,
	["TopBarButtonPadding"] = nil,
	["TopBarTopMargin"] = nil,
	["LegacyCloseMenuIconSize"] = nil,
	["MENU_ICON_SIZE"] = nil,
	["MenuIconOpenScale"] = 1.25,
	["UnibarFrame"] = nil,
	["MenuIconKeepOutAreaId"] = "roblox-menu-icon",
	["HealthBarKeepOutAreaId"] = "health-bar",
	["MoreMenuKeepOutAreaId"] = "more-menu",
	["ChatIconKeepOutAreaId"] = "chat-icon",
	["BackIconKeepOutAreaId"] = "back-icon",
	["TopBarKeepOutAreaId"] = "roblox-topbar",
	["ScreenSideOffset"] = nil,
	["ScreenSideOffsetTenFoot"] = nil,
	["TopBarPadding"] = nil,
	["InitialHealth"] = 100,
	["HealthPercentForOverlay"] = 0.05,
	["HealthRedColor"] = nil,
	["HealthYellowColor"] = nil,
	["HealthGreenColor"] = nil,
	["InputType"] = nil,
	["GamepadInputTypes"] = nil,
	["Analytics"] = nil,
	["LocalizedKeys"] = nil,
	["ApplyDisplayScale"] = function(p24) -- name: ApplyDisplayScale
		-- upvalues: (copy) v_u_5
		return v_u_5(false) * p24
	end,
	["useDisplayScaleState"] = function(p_u_25) -- name: useDisplayScaleState
		-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_4
		return v_u_3.useSignalState(v_u_2.createComputed(function(p26)
			-- upvalues: (ref) v_u_4, (copy) p_u_25
			return p_u_25 * v_u_4.GetDisplayStore(p26).getUIScale(p26)
		end))
	end,
	["TopBarHeight"] = v15,
	["TopBarHeightTenFoot"] = not v8() and 72 or nil,
	["TopBarButtonHeight"] = v16,
	["TopBarButtonPadding"] = v20
}
local v28
if v11 then
	v28 = v14.Gap.Medium
else
	v28 = v15 - v16 - 2 * v20
end
v27.TopBarTopMargin = v28
v27.LegacyCloseMenuIconSize = not v10() and 30 or v15 - v14.Size.Size_100
v27.MENU_ICON_SIZE = not v8() and 24 or v14.Size.Size_600
v27.UnibarFrame = {
	["PaddingTop"] = not v8() and 2 or v14.Padding.XXSmall,
	["PaddingBottom"] = not v8() and 2 or v14.Padding.XXSmall,
	["PaddingLeft"] = v21 + v22 + (v13 and 0 or v15) + (not v8() and 2 or v14.Padding.XXSmall),
	["ExtendedSize"] = v15 - (not v8() and 4 or v14.Size.Size_100)
}
v27.ScreenSideOffset = v21
v27.ScreenSideOffsetTenFoot = not v8() and 48 or nil
v27.TopBarPadding = v22
v27.HealthRedColor = Color3.fromRGB(255, 28, 0)
v27.HealthYellowColor = Color3.fromRGB(250, 235, 0)
v27.HealthGreenColor = Color3.fromRGB(27, 252, 107)
v27.InputType = {
	["MouseAndKeyBoard"] = "MouseAndKeyboard",
	["Touch"] = "Touch",
	["Gamepad"] = "Gamepad"
}
v27.GamepadInputTypes = v23
v27.Analytics = {
	["ShowGamepadNavigationDialog"] = "show-gamepad-navigation-dialog",
	["DismissGamepadNavigationDialog"] = "dismiss-gamepad-navigation-dialog",
	["EventNameTopBarButtonActivated"] = "topbar-button-activated",
	["ChatButtonName"] = "chat",
	["MoreMenuButtonName"] = "more-menu",
	["InventoryButtonName"] = "inventory",
	["LeaderboardButtonName"] = "leaderboard",
	["EmotesButtonName"] = "emotes",
	["StatusActive"] = "active",
	["StatusInactive"] = "inactive"
}
v27.LocalizedKeys = {
	["UILessTooltipTitle"] = "CoreScripts.TopBar.Label.UILessHintTitle",
	["UILessTooltipDescription"] = "CoreScripts.TopBar.Label.UILessHintDescription"
}
return v27