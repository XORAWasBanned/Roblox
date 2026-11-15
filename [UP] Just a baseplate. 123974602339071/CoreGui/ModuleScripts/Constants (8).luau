-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Resources.Constants
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.t)
local v3 = require(v1.Workspace.Packages.MessageBus).MessageBus
local v4 = require(v1.Workspace.Packages.SharedFlags)
local v5 = v4.FFlagEnableGameLeftMessage
local v6 = v4.FFlagRenameRespawnConfirmationPage
local v7 = {
	["MouseAndKeyboard"] = "MouseAndKeyboard",
	["Touch"] = "Touch",
	["Gamepad"] = "Gamepad"
}
return {
	["InviteStatus"] = {
		["Success"] = "Success",
		["Moderated"] = "Moderated",
		["Failed"] = "Failed",
		["Pending"] = "Pending"
	},
	["InputType"] = v7,
	["FallbackLocaleId"] = "UNKNOWN_FALLBACK",
	["defaultPageKey"] = "InitalPage",
	["advancedSettingsPageKey"] = "AdvancedGameSettings",
	["vrComfortSettingsPageKey"] = "VRGameSettings",
	["LeaveToAppPromptPageKey"] = "LeaveToAppPrompt",
	["LeaveGamePromptPageKey"] = "LeaveGamePrompt",
	["MainPagePageKey"] = "MainPage",
	["InitalPageKey"] = "InitalPage",
	["ReportDialogKey"] = "ReportDialog",
	["PeoplePageKey"] = "peoplepage",
	["PeoplePageScrollBuffer"] = 5,
	["AnalyticsTargetName"] = "client",
	["AnalyticsInGameMenuName"] = "ingame_menu",
	["AnalyticsRespawnCharacterName"] = "respawn_character",
	["AnalyticsSettingsChangeName"] = "change_ingame_settings",
	["AnalyticsExplicitSettingsChangeName"] = "change_explicit_ingame_settings",
	["AnalyticsSettingsSafetyBubbleModeChangeName"] = "change_ingame_settings_safety_bubble_mode",
	["AnalyticsSettingsVRComfortSettingChangeName"] = "change_ingame_settings_vr_comfort_setting",
	["AnalyticsFullscreenModeName"] = "FullscreenMode",
	["AnalyticsMenuActionName"] = "ingame_menu_action",
	["AnalyticsMenuOpenName"] = "menu_open",
	["AnalyticsMenuOpenTypes"] = {
		["Keyboard"] = "KeyboardShortcut",
		["TopbarButton"] = "TopbarButton",
		["ReportAbuseTriggered"] = "ReportAbuse",
		["PlayersTriggered"] = "Players",
		["SettingsTriggered"] = "Settings",
		["EducationalMenuTriggered"] = "EducationalMenu",
		["GamepadLeaveGame"] = "GamepadLeaveGame",
		["GamepadResetCharacter"] = "GamepadResetCharacter",
		["ScreenshotUnhide"] = "ScreenshotUnhide"
	},
	["AnalyticsMenuCloseName"] = "menu_close",
	["AnalyticsMenuLeaveName"] = "menu_leave",
	["AnalyticsLeaveGameName"] = "leave_game",
	["AnalyticsLeaveToHomeName"] = "leave_to_home",
	["AnalyticsLeaveToHomeSource"] = "home",
	["AnalyticsLeaveGameSource"] = "leave",
	["AnalyticsMenuButtonSource"] = "menu_button",
	["AnalyticsMenuHotkeySource"] = "gamepad_or_hotkey",
	["AnalyticsMenuResetCharacterName"] = "menu_reset_character",
	["AnalyticsResumeGameName"] = "resume",
	["AnalyticsResumeShieldSource"] = "shield",
	["AnalyticsResumeButtonSource"] = "button",
	["AnalyticsResumeGamepadSource"] = "gamepad",
	["AnalyticsResumeXButtonSource"] = "x_button",
	["AnalyticsConfirmedName"] = "confirmed",
	["AnalyticsCancelledName"] = "cancelled",
	["AnalyticsReportLeft"] = "ingame_menu_report_left",
	["AnalyticsReportSubmittedName"] = "ingame_menu_report_submitted",
	["AnalyticsRequestFriendName"] = "RequestFriendship",
	["AnalyticsRequestFriendContext"] = "PlayersMenu",
	["AnalyticsExamineAvatarName"] = "examine_avatar",
	["PlayerScriptStatusStrings"] = {
		["Default"] = "PlayerScript Status: Default",
		["Custom"] = "PlayerScript Status: Custom",
		["PossiblyCustom"] = "PlayerScript Status: Possibly Custom",
		["CustomOld"] = "PlayerScript Status: Custom Old"
	},
	["ControllerBarHeight"] = 72,
	["DisplayOrder"] = {
		["RootMenu"] = 1,
		["BlurredModalPortal"] = 2,
		["FullscreenTitleBar"] = 7,
		["ConfirmationDialog"] = 8,
		["EducationalPopup"] = 9,
		["HeadsetDisconnectedDialog"] = 100,
		["ControllerBar"] = 9
	},
	["ShieldOpenAnimationTweenTime"] = 0.5,
	["ShieldCloseAnimationTweenTime"] = 0.4,
	["ShieldOpenFadeTime2"] = 0.25,
	["ShieldCloseFadeTime2"] = 0.15,
	["ShieldExtraFadeTime"] = 0.05,
	["Zone"] = {
		["PortalSize"] = 1,
		["ContentOffset"] = 2
	},
	["InputTypeMap"] = {
		[Enum.UserInputType.MouseButton1] = v7.MouseAndKeyboard,
		[Enum.UserInputType.MouseButton2] = v7.MouseAndKeyboard,
		[Enum.UserInputType.MouseButton3] = v7.MouseAndKeyboard,
		[Enum.UserInputType.MouseWheel] = v7.MouseAndKeyboard,
		[Enum.UserInputType.MouseMovement] = v7.MouseAndKeyboard,
		[Enum.UserInputType.Keyboard] = v7.MouseAndKeyboard,
		[Enum.UserInputType.Gamepad1] = v7.Gamepad,
		[Enum.UserInputType.Gamepad2] = v7.Gamepad,
		[Enum.UserInputType.Gamepad3] = v7.Gamepad,
		[Enum.UserInputType.Gamepad4] = v7.Gamepad,
		[Enum.UserInputType.Gamepad5] = v7.Gamepad,
		[Enum.UserInputType.Gamepad6] = v7.Gamepad,
		[Enum.UserInputType.Gamepad7] = v7.Gamepad,
		[Enum.UserInputType.Gamepad8] = v7.Gamepad,
		[Enum.UserInputType.Touch] = v7.Touch
	},
	["FramerateCaps"] = {
		60,
		120,
		144,
		160,
		165,
		180,
		200,
		240
	},
	["FramerateCapsIOS"] = { 60, 120 },
	["OnAppRatingPromptEventDescriptor"] = v5 and {
		["mid"] = v3.getMessageId("AppRatingPrompt", "leftGame"),
		["validateParams"] = v2.strictInterface({
			["gameTime"] = v2.number
		})
	} or nil,
	["OnSurveyEventDescriptor"] = {
		["mid"] = v3.getMessageId("Game", "openSurvey"),
		["validateParams"] = v2.strictInterface({
			["eventType"] = v2.string,
			["userId"] = v2.optional(v2.string),
			["customProps"] = v2.optional(v2.table)
		})
	},
	["SurveyEventType"] = "leaveButtonClick",
	["ChromeSeenCountKey"] = "ChromeSeenCount",
	["RespawnLocalizedKey"] = "CoreScripts.InGameMenu.QuickActions.Respawn",
	["LeaveGameLocalizedKey"] = "CoreScripts.InGameMenu.LeaveGame",
	["ResumeLocalizedKey"] = "CoreScripts.InGameMenu.Prompt.ResumeGame",
	["ResetCharacterLocalizedKey"] = not v6 and "CoreScripts.InGameMenu.Action.ResetCharacter" or nil,
	["ConfirmLeaveGameLocalizedKey"] = "CoreScripts.InGameMenu.Prompt.ConfirmLeaveGame",
	["ConfirmResetCharacterLocalizedKey"] = v6 and "CoreScripts.InGameMenu.Prompt.ConfirmRespawnCharacter" or "CoreScripts.InGameMenu.Prompt.ConfirmResetCharacter",
	["DontLeaveGameLocalizedKey"] = "CoreScripts.InGameMenu.Action.DontLeaveGame",
	["DontResetCharacterLocalizedKey"] = v6 and "CoreScripts.InGameMenu.Action.DontRespawnCharacter" or "CoreScripts.InGameMenu.Action.DontResetCharacter",
	["ConnectionLocalizedKey"] = "CommonUI.Features.Label.Connection",
	["FriendLocalizedKey"] = "Feature.Friends.Label.Friend",
	["AddConnectionLocalizedKey"] = "CommonUI.Features.Label.AddConnection",
	["AddFriendLocalizedKey"] = "Feature.Profile.Label.AddFriend",
	["InviteConnectionsLocalizedKey"] = "CommonUI.Features.Label.InviteConnections",
	["InviteFriendsLocalizedKey"] = "Feature.SettingsHub.Heading.InviteFriends",
	["MovementModeDynamicThumbstickKey"] = "Feature.SettingsHub.Default.DynamicThumbstick"
}