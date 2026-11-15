-- Path: CoreGui.RobloxGui.Modules.Settings.SettingsHub
local v_u_1 = game:GetService("RbxAnalyticsService")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("CorePackages")
local v_u_4 = require(v_u_3.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local v_u_5
if v_u_4 then
	v_u_5 = require(v_u_3.Workspace.Packages.System).Features
else
	v_u_5 = nil
end
local v6 = require(v_u_3.Workspace.Packages.AppCommonLib).Symbol
local v_u_7 = game:GetService("Players")
local v_u_8 = game:GetService("TweenService")
local v_u_9 = game:GetService("IXPService")
local v_u_10 = game:GetService("LocalizationService")
local v_u_11 = game:GetService("TelemetryService")
local v_u_12 = v2:WaitForChild("RobloxGui")
local v13 = require(v_u_3.Workspace.Packages.SharedFlags).FFlagResponsiveUnitsDeprecateTenFoot
local v_u_14 = require(v_u_12.Modules.TenFootInterface):IsEnabled()
local v_u_15
if v_u_14 then
	v_u_15 = not v13
else
	v_u_15 = v_u_14
end
local v_u_16 = require(v_u_3.Packages.Roact)
local v_u_17 = require(v_u_3.Packages.Cryo)
local v_u_18 = require(v_u_3.Packages.Otter)
local v_u_19 = require(v_u_3.Packages.React)
local v_u_20 = require(v_u_3.Packages.ReactRoblox)
local v_u_21 = require(v_u_3.Packages.Foundation)
local v_u_22 = v_u_21.FoundationProvider
local v23 = require(v_u_3.Workspace.Packages.CoreScriptsRoactCommon).Traversal
local v_u_24 = require(script.Parent.Components.PortalWithFoundationStylelink)
local v_u_25 = require(script.Parent.InExperienceMenuReact)
local v_u_26 = require(script.Parent.Pages.InExperienceMenuReactPage)
local v_u_27 = require(script.Parent.ReactPageSignal)
local v_u_28 = require(script.Parent.Integrations.Utils)
local v_u_29 = require(v_u_12.Modules.Settings.Utility)
local v_u_30 = require(v_u_3.Workspace.Packages.VrCommon).VRHub
local v_u_31 = require(v_u_3.Workspace.Packages.CachedPolicyService)
local v_u_32 = require(v_u_12.Modules.Common.PerfUtils)
local v_u_33 = require(v_u_3.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local v_u_34 = require(v_u_3.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies
local v_u_35 = require(v_u_12.Modules.Settings.Components.TabHeader).SwitchTabHint
local v_u_36 = require(v_u_12.Modules.Settings.Components.Traversal).TraversalHistoryMenu
local v_u_37 = require(v_u_12.Modules.Settings.Components.MenuBackButton)
local v_u_38 = require(v_u_12.Modules.Settings.Components.MenuFrontButton)
local v_u_39 = require(v_u_12.Modules.Settings.Components.MenuButtons.MenuButtonsContainer)
local v_u_40 = require(v_u_3.Packages.RoactAppExperiment)
local v_u_41 = require(v_u_3.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local v_u_42 = require(v_u_3.Workspace.Packages.Style).AppFonts
local v_u_43 = require(v_u_3.Workspace.Packages.CapturesInExperience).CapturesPolicy
local v_u_44 = require(v_u_3.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities
local v_u_45 = require(v2.RobloxGui.Modules.Settings.getCamMicPermissions)
local v_u_46 = require(v_u_3.Workspace.Packages.AppCommonLib).Create
local v_u_47 = require(v_u_3.Workspace.Packages.CoreGuiCommon).Stores
local v_u_48 = require(v_u_3.Packages.Signals)
local v_u_49 = v_u_48.createSignal
local v_u_50 = require(v_u_3.Packages.UIBlox).App.Style.AppStyleProvider
local v_u_51 = require(v_u_3.Packages.Foundation).Enums.ColorMode.Dark
local v52 = require(v_u_3.Workspace.Packages.PlayerList)
local v_u_53 = require(v_u_3.Workspace.Packages.AppCommonLib).isSpatial
local v54 = require(v_u_3.Workspace.Packages.HelpPage)
local v_u_55 = require(v_u_12.Modules.Settings.leaveGame)
local v_u_56 = require(script.Parent.Theme)
local v_u_57 = v_u_56.color("SETTINGS_SHIELD", Color3.new(0.1607843137254902, 0.1607843137254902, 0.1607843137254902))
local v_u_58 = v_u_56.transparency("SETTINGS_SHIELD_TRANSPARENCY", 0.2)
local v_u_59 = v_u_56.SHIELD_INACTIVE_POSITION
local v_u_60 = v6.named("SettingsHubCursorOverride")
local v_u_61 = v_u_15 and 32 or (v_u_29:IsSmallTouchScreen() and 24 or 26)
local v_u_62 = game:DefineFastInt("CheckLeaveGameUpsellCooldown", 300)
local v_u_63 = game:DefineFastInt("GetServerChannelRetries", 10)
local v64 = require(v_u_3.Workspace.Packages.SharedFlags)
local v_u_65 = require(script.Parent.Flags)
local v_u_66 = {
	["EngineFeatureRbxAnalyticsServiceExposePlaySessionId"] = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId"),
	["EngineFeatureTeleportHistoryButtons"] = game:GetEngineFeature("TeleportHistoryButtons"),
	["EngineFeaturePlayerScriptStatusProperty"] = game:GetEngineFeature("PlayerScriptStatusProperty"),
	["FFlagPreventHiddenSwitchPage"] = game:DefineFastFlag("PreventHiddenSwitchPage", false),
	["FFlagFixDisableTopPaddingError"] = game:DefineFastFlag("FixDisableTopPaddingError", false),
	["FFlagWaitPlayerModuleStatus"] = game:DefineFastFlag("WaitPlayerModuleStatus", false),
	["FFlagEnableInGameMenuDurationLogger"] = require(v_u_12.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger)(),
	["isNewInGameMenuEnabled"] = require(v_u_12.Modules.isNewInGameMenuEnabled),
	["GetFFlagRemoveAssetVersionEndpoint"] = require(v_u_12.Modules.Flags.GetFFlagRemoveAssetVersionEndpoint),
	["GetFFlagNewEventIngestPlayerScriptsDimensions"] = require(v_u_12.Modules.Flags.GetFFlagNewEventIngestPlayerScriptsDimensions),
	["GetFFlagReportAbuseMenuEntrypointAnalytics"] = require(v_u_12.Modules.Settings.Flags.GetFFlagReportAbuseMenuEntrypointAnalytics),
	["GetFFlagEnableLeaveGameUpsellEntrypoint"] = require(v_u_12.Modules.Settings.Flags.GetFFlagEnableLeaveGameUpsellEntrypoint),
	["GetFStringInExperienceMenuIXPLayer"] = require(v_u_12.Modules.Settings.Flags.GetFStringInExperienceMenuIXPLayer),
	["GetFStringExitModalIXPLayer"] = require(v_u_12.Modules.Settings.Flags.GetFStringExitModalIXPLayer),
	["GetFStringInExperienceMenuIXPVar"] = require(v_u_12.Modules.Settings.Flags.GetFStringInExperienceMenuIXPVar),
	["FFlagRelocateMobileMenuButtons"] = require(v_u_12.Modules.Settings.Flags.FFlagRelocateMobileMenuButtons),
	["FIntRelocateMobileMenuButtonsVariant"] = require(v_u_12.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant),
	["FFlagMenuButtonsMountWithIEM"] = require(v_u_12.Modules.Settings.Flags.FFlagMenuButtonsMountWithIEM),
	["FFlagSpatialUIFixMenuPanelChatExclusive"] = require(v_u_12.Modules.Settings.Flags.FFlagSpatialUIFixMenuPanelChatExclusive),
	["FFlagRemoveLoadingTimeout"] = require(v_u_12.Modules.Flags.FFlagRemoveLoadingTimeout),
	["FFlagAddNewPlayerListMobileFocusNav"] = v52.Flags.FFlagAddNewPlayerListMobileFocusNav,
	["ChromeEnabled"] = require(v_u_3.Workspace.Packages.Chrome).Enabled(),
	["FFlagRespawnChromeShortcutTelemetry"] = require(v_u_12.Modules.Chrome.Flags.FFlagRespawnChromeShortcutTelemetry),
	["FFlagLocalizeVersionLabels"] = settings():GetFFlag("LocalizeVersionLabels"),
	["isInExperienceUIVREnabled"] = require(v_u_3.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled,
	["InExperienceUIVRIXP"] = require(v_u_3.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP,
	["FFlagAddSwitchTabHintsToIEM"] = v64.FFlagAddSwitchTabHintsToIEM,
	["GetFFlagEnableAppChatInExperience"] = v64.GetFFlagEnableAppChatInExperience,
	["GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints"] = v64.GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints,
	["GetFFlagDisplayServerChannel"] = v64.GetFFlagDisplayServerChannel,
	["FFlagSettingsHubIndependentBackgroundVisibility"] = v64.getFFlagSettingsHubIndependentBackgroundVisibility(),
	["GetFFlagPackagifySettingsShowSignal"] = v64.GetFFlagPackagifySettingsShowSignal,
	["FFlagEnableConsoleExpControls"] = v64.FFlagEnableConsoleExpControls,
	["FFlagIEMTabFocusNav"] = v64.FFlagIEMTabFocusNav,
	["FFlagIEMFocusNavSupportNewButtons"] = v_u_65.FFlagIEMFocusNavSupportNewButtons,
	["FFlagAddUILessMode"] = v64.FFlagAddUILessMode,
	["FIntAddUILessModeVariant"] = v64.FIntAddUILessModeVariant,
	["FFlagInExperienceReportClosingBugfix"] = v64.FFlagInExperienceReportClosingBugfix,
	["FFlagEnableSettingsHubUIDelegateRollout"] = v64.FFlagEnableSettingsHubUIDelegateRollout,
	["FFlagAddIEMProfilePage"] = v64.FFlagAddIEMProfilePage,
	["FFlagFixSpatialUICaptures"] = v64.FFlagFixSpatialUICaptures,
	["FFlagVoiceRewarmTelemetry"] = v64.FFlagVoiceRewarmTelemetry,
	["FFlagAddTraversalBackButton"] = v23.Flags.FFlagAddTraversalBackButton,
	["FFlagAddTraversalHistory"] = v23.Flags.FFlagAddTraversalHistory,
	["FFlagEnableSystemScrimInSettingsHub"] = game:DefineFastFlag("EnableSystemScrimInSettingsHub", false),
	["FFlagHelpPageIXPExposure"] = v54.Flags.FFlagHelpPageIXPExposure,
	["FStringHelpPageIXPLayer"] = v54.Flags.FStringHelpPageIXPLayer,
	["FFlagFixDisabledScrollOnIos"] = game:DefineFastFlag("FixDisabledScrollOnIos", false),
	["FFlagSideSheetAndroidBack"] = game:DefineFastFlag("SideSheetAndroidBack", false),
	["FFlagAddInviteFriendsIntegration"] = v64.FFlagAddInviteFriendsIntegration,
	["FFlagIntegrateTraversalHistoryInSideSheet"] = v64.FFlagIntegrateTraversalHistoryInSideSheet,
	["FFlagShowSwitchServerButton"] = v64.FFlagShowSwitchServerButton,
	["isExitModalRemoved"] = require(v_u_12.Modules.Settings.Flags.isExitModalRemoved),
	["FFlagEnableExitModalExposure"] = game:DefineFastFlag("EnableExitModalExposure", false)
}
local v_u_67 = game:GetService("RobloxReplicatedStorage")
local v68 = game:GetService("ContentProvider")
local v_u_69 = game:GetService("StarterGui")
local v_u_70 = game:GetService("StarterPlayer")
local v_u_71 = game:GetService("ContextActionService")
local v_u_72 = game:GetService("GuiService")
local v_u_73 = game:GetService("UserInputService")
local v_u_74 = game:GetService("RunService")
local v_u_75 = game:GetService("VRService")
local v_u_76 = game:GetService("HttpRbxApiService")
local v_u_77 = game:GetService("HttpService")
local v_u_78 = UserSettings().GameSettings
local v_u_79 = require(v_u_3.Workspace.Packages.InExperienceSessionization).ExperienceMenuSessionManagerInstance
local v_u_80 = nil
local function v81()
	-- upvalues: (ref) v_u_80
	v_u_80 = game:GetService("PlatformService")
end
pcall(v81)
local v_u_82 = nil
local function v83()
	-- upvalues: (ref) v_u_82
	v_u_82 = game:GetService("PlatformFriendsService")
end
pcall(v83)
local v_u_84 = nil
spawn(function()
	-- upvalues: (ref) v_u_84, (copy) v_u_67
	v_u_84 = v_u_67:WaitForChild("GetServerVersion", (1 / 0))
end)
local v_u_85 = nil
if v_u_66.GetFFlagDisplayServerChannel() then
	spawn(function()
		-- upvalues: (ref) v_u_85, (copy) v_u_67
		v_u_85 = v_u_67:WaitForChild("GetServerChannel", (1 / 0))
	end)
end
local v_u_86 = v_u_73.PreferredInput == Enum.PreferredInput.Touch
v_u_12:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local v_u_87 = v_u_73:GetPlatform()
local v_u_88 = v68.BaseUrl
local v_u_89 = not string.find(v_u_88, "www.roblox.com")
local v_u_90 = require(v_u_12.Modules.DevConsoleMaster)
local v_u_91 = nil
local v_u_92 = false
local v_u_93 = nil
local v_u_94 = nil
local v_u_95 = require(v_u_12.Modules.Settings.Components.SettingsFullScreenTitleBar)
local v_u_96 = require(v_u_12.Modules.Settings.Analytics.MenuLeaveGameTelemetryConfig)
local v_u_97 = require(v_u_12.Modules.Settings.Analytics.MenuResetCharacterTelemetryConfig)
local v_u_98 = require(v_u_12.Modules.Settings.Analytics.MenuResumeTelemetryConfig)
local v_u_99 = require(v_u_12.Modules.Settings.Analytics.ReactPageAnalytics)
local v100 = require(v_u_3.Workspace.Packages.GameInvite)
local v_u_101 = v100.GameInviteModalManager
local v_u_102 = v100.GameInviteConstants
local v_u_103 = require(v_u_12.Modules.Captures.CapturesApp)
local v_u_104 = require(v_u_12.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local v105 = v_u_31:IsSubjectToChinaPolicies()
local v_u_106 = require(v_u_12.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_107 = require(v_u_12.Modules.VoiceChat.Constants)
local v_u_108 = game:DefineFastFlag("SettingsHubRaceConditionFix", false)
local v_u_109 = game:DefineFastFlag("FixReportButtonCutOff", false)
local v_u_110 = require(v_u_3.Workspace.Packages.AppChat.InExperienceAppChatModal)
local v_u_111
if v_u_66.GetFFlagPackagifySettingsShowSignal() then
	v_u_111 = require(v_u_3.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
else
	v_u_111 = nil
end
local v_u_112
if v_u_66.GetFFlagPackagifySettingsShowSignal() then
	v_u_112 = require(v_u_3.Workspace.Packages.CoreScriptsCommon).SettingsUtility
else
	v_u_112 = nil
end
local v_u_113 = {
	["frequency"] = 4,
	["dampingRatio"] = 1
}
local v_u_114 = require(v_u_3.Workspace.Packages.InExperienceSideSheet)
local v_u_115 = v_u_114.getDidSideSheetOpenWithPeoplePage
local v_u_116 = v_u_114.getHasRoomForPeoplePage
local v_u_117 = v_u_114.getIsPeoplePageOpen
local v_u_118 = v_u_114.getSideSheetAnimationDuration
local v_u_119 = v_u_114.getSideSheetDrawerWidth
local v_u_120 = v_u_114.getSideSheetMenuPageHeight
local v_u_121 = v_u_114.getSideSheetMenuPageWidth
local v_u_122 = v_u_114.toggleSideSheet
local v_u_123 = v_u_114.getSideSheetVisibility
local v124 = v_u_114.setupInGameMenuPeoplePageActions
local v125 = v_u_114.setupPeoplePageOpenTracking
local v_u_126 = v_u_114.closePeoplePageWhenNoRoomBesideSideSheet
local v_u_127 = v_u_114.Flags.FFlagSideSheetOpenPeoplePage
local v_u_128 = v_u_114.Flags.FFlagClosePeoplePageWhenNoRoomBesideSideSheet
local v_u_129 = require(v_u_3.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local v_u_130 = require(v_u_3.Workspace.Packages.SwitchServer).GetSwitchServerStore
local v_u_131 = require(v_u_3.Workspace.Packages.PioneerUtils).isPioneerLaunch
require(v_u_12.Modules.Settings.ReactPageFactory)
local v_u_132 = require(v_u_3.Workspace.Packages.InExperienceLocales).Localization
local v_u_133 = v_u_66.FFlagLocalizeVersionLabels or v105
local v_u_134 = require(v_u_3.Workspace.Packages.RobloxTranslator)
local v_u_135 = require(v_u_12.Modules.ChatSelector)
local v136, _ = v_u_72:GetGuiInset()
local v_u_137 = UDim2.new(0, 0, 0, -v136.Y)
local v_u_138 = UDim2.new(1, 0, 1, v136.Y)
local function v_u_140() -- name: GetServerChannelBlocking
	-- upvalues: (ref) v_u_94, (copy) v_u_63, (ref) v_u_85
	if v_u_94 then
		return v_u_94
	end
	local v139 = v_u_63
	if not v_u_85 then
		repeat
			task.wait()
			v139 = v139 - 1
		until v_u_85 or v139 == 0
	end
	if v_u_85 then
		v_u_94 = v_u_85:InvokeServer()
	else
		warn("GetServerChannelRemote not available")
		v_u_94 = "Unknown"
	end
	return v_u_94
end
local function v_u_142(p141) -- name: createReactPage
	-- upvalues: (copy) v_u_46
	return v_u_46("Frame")({
		["Name"] = "InExperienceMenuPage",
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Visible"] = false,
		["Parent"] = nil,
		["Size"] = UDim2.fromScale(0, 0),
		["Parent"] = p141
	})
end
local function v795() -- name: CreateSettingsHub
	-- upvalues: (copy) v_u_66, (copy) v_u_12, (copy) v_u_111, (copy) v_u_29, (copy) v_u_112, (copy) v_u_49, (copy) v_u_107, (copy) v_u_47, (copy) v_u_1, (copy) v_u_99, (copy) v_u_142, (copy) v_u_129, (copy) v_u_56, (copy) v_u_71, (copy) v_u_10, (copy) v_u_132, (copy) v_u_15, (copy) v_u_46, (copy) v_u_86, (copy) v_u_73, (copy) v_u_87, (copy) v_u_106, (copy) v_u_45, (copy) v_u_18, (copy) v_u_134, (copy) v_u_108, (copy) v_u_69, (copy) v_u_114, (copy) v_u_11, (copy) v_u_96, (copy) v_u_97, (copy) v_u_104, (copy) v_u_98, (copy) v_u_20, (copy) v_u_19, (copy) v_u_39, (copy) v_u_65, (copy) v_u_72, (copy) v_u_138, (copy) v_u_137, (copy) v_u_59, (copy) v_u_58, (copy) v_u_57, (copy) v_u_61, (copy) v_u_133, (copy) v_u_140, (ref) v_u_93, (ref) v_u_84, (copy) v_u_74, (copy) v_u_76, (copy) v_u_77, (copy) v_u_31, (copy) v_u_88, (copy) v_u_89, (copy) v_u_70, (copy) v_u_7, (copy) v_u_16, (copy) v_u_40, (copy) v_u_9, (copy) v_u_50, (copy) v_u_51, (copy) v_u_37, (copy) v_u_38, (copy) v_u_42, (copy) v_u_113, (copy) v_u_3, (copy) v_u_110, (copy) v_u_44, (copy) v_u_22, (copy) v_u_21, (copy) v_u_28, (copy) v_u_35, (copy) v_u_34, (copy) v_u_95, (copy) v_u_127, (copy) v_u_115, (copy) v_u_123, (copy) v_u_116, (copy) v_u_117, (copy) v_u_118, (copy) v_u_119, (copy) v_u_121, (copy) v_u_128, (copy) v_u_126, (copy) v_u_75, (copy) v_u_120, (copy) v_u_48, (copy) v_u_78, (copy) v_u_90, (copy) v_u_14, (copy) v_u_109, (copy) v_u_17, (copy) v_u_41, (copy) v_u_79, (copy) v_u_27, (copy) v_u_33, (copy) v_u_60, (copy) v_u_62, (copy) v_u_8, (copy) v_u_122, (copy) v_u_32, (ref) v_u_91, (copy) v_u_135, (copy) v_u_4, (copy) v_u_5, (ref) v_u_92, (ref) v_u_82, (ref) v_u_80, (copy) v_u_101, (copy) v_u_102, (copy) v_u_43, (copy) v_u_53, (copy) v_u_103, (copy) v_u_131, (copy) v_u_130, (copy) v_u_55, (copy) v_u_24, (copy) v_u_36, (copy) v_u_25, (copy) v_u_26
	local v_u_143 = {
		["Visible"] = false,
		["Active"] = true,
		["Pages"] = {
			["CurrentPage"] = nil,
			["PageTable"] = nil,
			["PageTable"] = {}
		},
		["MenuStack"] = {},
		["TabHeaders"] = {},
		["BottomBarButtons"] = {},
		["BottomBarButtonsComponents"] = {},
		["ResizedConnection"] = nil,
		["BackBarVisibleConnection"] = nil
	}
	if v_u_66.EngineFeatureTeleportHistoryButtons then
		v_u_143.FrontBarVisibleConnection = nil
	end
	v_u_143.PreferredTransparencyChangedConnection = nil
	v_u_143.TabConnection = nil
	v_u_143.LeaveGamePage = require(v_u_12.Modules.Settings.Pages.LeaveGame)
	local v144
	if v_u_66.GetFFlagEnableLeaveGameUpsellEntrypoint() then
		v144 = require(v_u_12.Modules.Settings.Pages.LeaveGameUpsell.LeaveGameUpsell)
	else
		v144 = nil
	end
	v_u_143.LeaveGameUpsellPage = v144
	v_u_143.ResetCharacterPage = require(v_u_12.Modules.Settings.Pages.ResetCharacter)
	local v145
	if v_u_66.GetFFlagPackagifySettingsShowSignal() then
		v145 = v_u_111
	else
		v145 = v_u_29:CreateSignal()
	end
	v_u_143.SettingsShowSignal = v145
	local v146
	if v_u_66.GetFFlagPackagifySettingsShowSignal() then
		v146 = v_u_112.CreateSignal()
	else
		v146 = v_u_29:CreateSignal()
	end
	v_u_143.CurrentPageSignal = v146
	local v147, v148 = v_u_49(false)
	v_u_143.showBottomBarSignal = v147
	v_u_143.setShowBottomBarSignal = v148
	v_u_143.OpenStateChangedCount = 0
	v_u_143.BottomButtonFrame = nil
	if v_u_66.FFlagRelocateMobileMenuButtons then
		v_u_143.addMenuKeyBindings = nil
		v_u_143.removeMenuKeyBindings = nil
	end
	if v_u_66.FFlagIEMFocusNavSupportNewButtons then
		v_u_143.ResumeMenuButton = nil
	end
	v_u_143.hasMicPermissions = false
	if v_u_66.GetFFlagEnableLeaveGameUpsellEntrypoint() then
		v_u_143.checkedUpsell = false
		v_u_143.leaveGameUpsellProp = v_u_107.PHONE_UPSELL_VALUE_PROP.None
		v_u_143.sessionStartTime = os.time()
	end
	v_u_143.isFetchingMicPermissions = true
	if v_u_66.FFlagAddUILessMode and v_u_66.FIntAddUILessModeVariant ~= 0 then
		v_u_143.uiLessStore = v_u_47.GetUILessStore(false)
	end
	v_u_143.PageTitleLabel = nil
	v_u_143.PageTitleCloseButton = nil
	v_u_143.PageTitleHeader = nil
	v_u_143.isMuted = nil
	v_u_143.lastVoiceRecordingIndicatorTextUpdated = nil
	v_u_143.playSessionId = ""
	if v_u_66.EngineFeatureRbxAnalyticsServiceExposePlaySessionId then
		v_u_143.playSessionId = v_u_1:GetPlaySessionId()
	end
	v_u_143.reactPageAnalytics = v_u_99.new()
	local v_u_149 = nil
	local v_u_150 = nil
	local v_u_151 = Instance.new("BindableEvent")
	v_u_151.Name = "PoppedMenu"
	v_u_143.PoppedMenu = v_u_151.Event
	v_u_143.ReactPage = nil
	v_u_143.ReactPage = v_u_142()
	local function v_u_164(p152) -- name: setBottomBarSelection
		-- upvalues: (copy) v_u_143, (ref) v_u_66
		if v_u_143.BottomButtonFrame or (p152 or v_u_66.FFlagRelocateMobileMenuButtons and (v_u_66.FIntRelocateMobileMenuButtonsVariant ~= 0 and v_u_66.FIntRelocateMobileMenuButtonsVariant ~= 2)) then
			if v_u_143.ResumeButton then
				p152.PageNextSelectionDown = v_u_143.ResumeButton
			elseif v_u_66.FFlagIEMFocusNavSupportNewButtons and (v_u_66.FIntRelocateMobileMenuButtonsVariant == 2 and v_u_143.ResumeMenuButton) then
				p152.PageNextSelectionDown = v_u_143.ResumeMenuButton
			end
			if v_u_66.FFlagIEMTabFocusNav and v_u_143.BottomButtonFrame then
				local v153 = p152:GetTabHeader()
				local v154 = v_u_143.ResumeButton or v_u_143.ResumeMenuButton
				if v154 then
					for v155, _ in pairs(v_u_143.Pages.PageTable) do
						local v156 = v155:GetTabHeader()
						if not v156 then
							continue
						end
						v156.NextSelectionUp = v154
					end
				end
				for _, v157 in v_u_143.BottomButtonFrame:GetDescendants() do
					if not (v157:IsA("GuiObject") and v157.Selectable) then
						continue
					end
					v157.NextSelectionDown = v153
				end
			end
			for _, v158 in p152.LastSelectableObjects do
				v_u_143.BottomButtonFrame.SelectionBehaviorUp = Enum.SelectionBehavior.Escape
				v_u_143.BottomButtonFrame.NextSelectionUp = v158
				v158.NextSelectionDown = p152.PageNextSelectionDown
				local v159 = v_u_143.LeaveGameButton
				if v159 then
					v159.NextSelectionUp = v158
				end
				if not v_u_66.FFlagIEMFocusNavSupportNewButtons or v_u_66.FIntRelocateMobileMenuButtonsVariant ~= 2 then
					continue
				end
				for _, v160 in v_u_143.BottomButtonFrame:GetDescendants() do
					if not (v160:IsA("GuiObject") and v160.Selectable) then
						continue
					end
					v160.NextSelectionUp = v158
				end
			end
			if #p152.LastSelectableObjects < 1 then
				v_u_143.BottomButtonFrame.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
				v_u_143.BottomButtonFrame.NextSelectionUp = nil
				local v161 = v_u_143.LeaveGameButton
				if v161 then
					v161.NextSelectionUp = nil
				end
				if v_u_66.FFlagIEMFocusNavSupportNewButtons and v_u_66.FIntRelocateMobileMenuButtonsVariant == 2 then
					for _, v162 in v_u_143.BottomButtonFrame:GetDescendants() do
						if not (v162:IsA("GuiObject") and v162.Selectable) then
							continue
						end
						local v163
						if v_u_66.FFlagIEMTabFocusNav then
							v163 = p152:GetTabHeader()
						else
							v163 = nil
						end
						v162.NextSelectionUp = v163
					end
				end
			end
		end
	end
	local function v_u_168(p165) -- name: shouldShowBottomBar
		-- upvalues: (copy) v_u_143, (ref) v_u_66, (ref) v_u_29, (ref) v_u_56
		local v166 = p165 or v_u_143.Pages.CurrentPage
		if (not v_u_66.FFlagRelocateMobileMenuButtons or (v_u_66.FIntRelocateMobileMenuButtonsVariant == 0 or v_u_66.FIntRelocateMobileMenuButtonsVariant == 2)) and ((v_u_29:IsPortrait() or v_u_29:IsSmallTouchScreen()) and not v_u_56.AlwaysShowBottomBar()) then
			return false
		end
		local v167
		if v166 == nil then
			v167 = false
		else
			v167 = v166.ShouldShowBottomBar == true
		end
		return v167
	end
	local function v_u_176() -- name: setBottomBarBindings
		-- upvalues: (copy) v_u_143, (ref) v_u_66, (ref) v_u_71
		if v_u_143.Visible then
			if v_u_66.FFlagRelocateMobileMenuButtons and v_u_66.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				if v_u_143.addMenuKeyBindings then
					v_u_143.addMenuKeyBindings()
				end
			else
				for v169 = 1, #v_u_143.BottomBarButtons do
					local v170 = v_u_143.BottomBarButtons[v169]
					local v171 = v170[1]
					local v172 = v170[2]
					local v173 = v_u_71
					local v174 = v172[1]
					local v175 = v172[2]
					v173:BindCoreAction(v171, v174, false, unpack(v175))
				end
			end
			if v_u_143.BottomButtonFrame then
				v_u_143.BottomButtonFrame.Visible = true
			end
		end
	end
	local function v_u_181(p177) -- name: removeBottomBarBindings
		-- upvalues: (ref) v_u_66, (copy) v_u_143, (ref) v_u_71
		if v_u_66.FFlagRelocateMobileMenuButtons and v_u_66.FIntRelocateMobileMenuButtonsVariant ~= 0 then
			if v_u_143.removeMenuKeyBindings then
				v_u_143.removeMenuKeyBindings()
			end
		else
			for _, v178 in pairs(v_u_143.BottomBarButtons) do
				v_u_71:UnbindCoreAction(v178[1])
			end
		end
		local v_u_179 = v_u_143.OpenStateChangedCount
		local function v180()
			-- upvalues: (ref) v_u_143, (copy) v_u_179
			if v_u_143.OpenStateChangedCount == v_u_179 and v_u_143.BottomButtonFrame then
				v_u_143.BottomButtonFrame.Visible = false
			end
		end
		if p177 then
			delay(p177, v180)
		elseif v_u_143.OpenStateChangedCount == v_u_179 and v_u_143.BottomButtonFrame then
			v_u_143.BottomButtonFrame.Visible = false
		end
	end
	local v182 = v_u_10.RobloxLocaleId
	local v_u_183 = v_u_132.new(v182)
	local function v_u_192() -- name: hideVoiceUx
		-- upvalues: (copy) v_u_143, (ref) v_u_15, (ref) v_u_56, (ref) v_u_66
		local v184 = v_u_143.MuteButtonButton
		if v184 then
			v184.Visible = false
			v184:Destroy()
		end
		local v185
		if v_u_15 then
			v185 = UDim2.new(0, 320, 0, 72)
		else
			v185 = UDim2.new(0, 260, 0, v_u_56.LargeButtonHeight)
		end
		if not v_u_66.FFlagRelocateMobileMenuButtons or v_u_66.FIntRelocateMobileMenuButtonsVariant == 0 then
			local v186 = UDim2.new(0.5, v_u_15 and -160 or -130, 0.5, -25)
			local v187 = ((not v_u_66.FFlagRelocateMobileMenuButtons or v_u_66.FIntRelocateMobileMenuButtonsVariant == 0) and true or false) and v_u_143.BottomButtonFrame:FindFirstChild("LeaveGameButtonButton", true)
			if v187 then
				v187.Position = v186
				v187.Size = v185
			end
			local v188 = UDim2.new(0.5, v_u_15 and -550 or -400, 0.5, -25)
			local v189 = ((not v_u_66.FFlagRelocateMobileMenuButtons or v_u_66.FIntRelocateMobileMenuButtonsVariant == 0) and true or false) and v_u_143.BottomButtonFrame:FindFirstChild("ResetCharacterButtonButton", true)
			if v189 then
				v189.Position = v188
				v189.Size = v185
			end
			local v190 = UDim2.new(0.5, v_u_15 and 200 or 140, 0.5, -25)
			if not v_u_66.FFlagRelocateMobileMenuButtons or v_u_66.FIntRelocateMobileMenuButtonsVariant == 0 then
				local v191 = v_u_143.BottomButtonFrame:FindFirstChild("ResumeButtonButton", true)
				if not v191 then
					return
				end
				v191.Position = v190
				v191.Size = v185
			end
		end
	end
	local function v_u_213(p193, p194, p_u_195, p_u_196, p197, p198, p199, p_u_200) -- name: addBottomBarButtonOld
		-- upvalues: (ref) v_u_66, (ref) v_u_56, (ref) v_u_15, (copy) v_u_143, (ref) v_u_29, (ref) v_u_46, (ref) v_u_86, (ref) v_u_73, (ref) v_u_87
		if not v_u_66.FFlagRelocateMobileMenuButtons or v_u_66.FIntRelocateMobileMenuButtonsVariant == 0 then
			local v201 = p193 .. "Button"
			local v202 = p193 .. "Text"
			local v203 = UDim2.new(0, 260, 0, v_u_56.LargeButtonHeight)
			if v_u_15 then
				v203 = UDim2.new(0, 320, 0, 72)
			end
			local v204 = v_u_143
			local v205 = v_u_143
			local v206, v207 = v_u_29:MakeStyledButton(p193 .. "Button", p194, v203, p198, nil, v_u_143)
			v204[v201] = v206
			v205[v202] = v207
			v_u_46("UIListLayout")({
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["Parent"] = v_u_143[v201]
			})
			v_u_46("UIPadding")({
				["PaddingLeft"] = UDim.new(0.025, 0),
				["Parent"] = v_u_143[v201]
			})
			v_u_143[v202].Size = UDim2.new(0, 0, 1, 0)
			v_u_46("UIFlexItem")({
				["FlexMode"] = Enum.UIFlexMode.Grow,
				["Parent"] = v_u_143[v202]
			})
			v_u_143[v201].Position = p197
			v_u_143[v201].Parent = v_u_143.BottomButtonFrame
			if v_u_15 then
				v_u_143[v201].ImageTransparency = 1
			end
			v_u_143[v202].FontSize = Enum.FontSize.Size24
			local v_u_208
			if v_u_86 then
				v_u_208 = nil
			else
				local v209 = p193 .. "Hint"
				local v210
				if v_u_73:GetGamepadConnected(Enum.UserInputType.Gamepad1) or v_u_87 == Enum.Platform.XBoxOne then
					v210 = p_u_195
				else
					v210 = p_u_196
				end
				v_u_208 = v_u_46("ImageLabel")({
					["Name"] = nil,
					["ZIndex"] = nil,
					["BackgroundTransparency"] = 1,
					["Image"] = nil,
					["LayoutOrder"] = -1,
					["Parent"] = nil,
					["Name"] = v209,
					["ZIndex"] = v_u_143.Shield.ZIndex + 2,
					["Image"] = v210,
					["Parent"] = v_u_143[v201]
				})
				if v210 == p_u_196 then
					v_u_208.ImageColor3 = v_u_56.color("WhiteButtonText", Color3.new(1, 1, 1))
					v_u_208.ImageTransparency = v_u_56.transparency("WhiteButtonText", 1)
				end
				v_u_208.Position = UDim2.new(0, 9, 0.5, 0)
				v_u_208.Size = UDim2.new(0, 33, 0, 33)
				v_u_208.AnchorPoint = Vector2.new(0, 0.5)
			end
			if v_u_15 then
				v_u_143[v202].FontSize = Enum.FontSize.Size36
			end
			v_u_73.InputBegan:connect(function(p211)
				-- upvalues: (ref) v_u_208, (copy) p_u_195, (copy) p_u_196
				if p211.UserInputType == Enum.UserInputType.Gamepad1 or (p211.UserInputType == Enum.UserInputType.Gamepad2 or (p211.UserInputType == Enum.UserInputType.Gamepad3 or p211.UserInputType == Enum.UserInputType.Gamepad4)) then
					if v_u_208 then
						v_u_208.Image = p_u_195
						return
					end
				elseif p211.UserInputType == Enum.UserInputType.Keyboard and v_u_208 then
					v_u_208.Image = p_u_196
				end
			end)
			v_u_143.BottomBarButtons[#v_u_143.BottomBarButtons + 1] = {
				v201,
				{ function(_, p212, _)
						-- upvalues: (copy) p_u_200
						if p212 == Enum.UserInputState.Begin then
							p_u_200()
						end
					end, p199 }
			}
		end
	end
	local v214 = v_u_15 and "@2x" or ""
	local v_u_215, v_u_216, v_u_217
	if v_u_66.FFlagEnableConsoleExpControls then
		v_u_215 = v_u_73:GetImageForKeyCode(Enum.KeyCode.ButtonB)
		v_u_216 = v_u_73:GetImageForKeyCode(Enum.KeyCode.ButtonX)
		v_u_217 = v_u_73:GetImageForKeyCode(Enum.KeyCode.ButtonY)
	else
		v_u_215 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB" .. v214 .. ".png"
		v_u_216 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonX" .. v214 .. ".png"
		v_u_217 = "rbxasset://textures/ui/Controls/DesignSystem/ButtonY" .. v214 .. ".png"
	end
	local v_u_218 = v_u_73:GetImageForKeyCode(Enum.KeyCode.ButtonStart)
	local v_u_219 = false
	local v_u_220 = nil
	local function v238() -- name: setupVoiceListeners
		-- upvalues: (ref) v_u_219, (copy) v_u_143, (ref) v_u_106, (ref) v_u_45, (ref) v_u_220, (ref) v_u_18, (ref) v_u_134, (copy) v_u_192
		if game:GetEngineFeature("VoiceChatSupported") and not v_u_219 then
			v_u_219 = true
			local function v236() -- name: showUI
				-- upvalues: (ref) v_u_143, (ref) v_u_106, (ref) v_u_45, (ref) v_u_220, (ref) v_u_18, (ref) v_u_134
				v_u_143.VoiceRecordingText.Visible = true
				v_u_106:getService().StateChanged:Connect(function(_, p221)
					-- upvalues: (ref) v_u_143
					if p221 == Enum.VoiceChatState.Joined then
						v_u_143.VoiceRecordingText.Visible = true
					end
				end)
				v_u_106:SetupParticipantListeners()
				v_u_45(function(p222)
					-- upvalues: (ref) v_u_143
					v_u_143.hasMicPermissions = p222.hasMicPermissions
				end, nil, true, "PermissionsButtons.getPermissions")
				v_u_220 = v_u_106.muteChanged.Event:Connect(function(p223)
					-- upvalues: (ref) v_u_143, (ref) v_u_18, (ref) v_u_134
					v_u_143.isMuted = p223
					v_u_143.lastVoiceRecordingIndicatorTextUpdated = tick()
					v_u_143.voiceRecordingIndicatorTextMotor:setGoal(v_u_18.instant(0))
					if v_u_143.isMuted then
						local v224 = v_u_143.VoiceRecordingText
						local v225
						if v_u_134 then
							local v226 = v_u_134.FormatByKey
							local v227 = v_u_134
							local v228, v229 = pcall(v226, v227, "InGame.CommonUI.Label.MicOff")
							v225 = not v228 and "Mic Off" or v229
						else
							v225 = "Mic Off"
						end
						v224.Text = v225
					else
						local v230 = v_u_143.VoiceRecordingText
						local v231
						if v_u_134 then
							local v232 = v_u_134.FormatByKey
							local v233 = v_u_134
							local v234, v235 = pcall(v232, v233, "InGame.CommonUI.Label.MicOnRecording")
							v231 = not v234 and "Mic On (recording audio)" or v235
						else
							v231 = "Mic On (recording audio)"
						end
						v230.Text = v231
					end
				end)
			end
			local function v237() -- name: hideUI
				-- upvalues: (ref) v_u_143, (ref) v_u_192, (ref) v_u_220
				v_u_143.VoiceRecordingText.Visible = false
				v_u_192()
				if v_u_220 then
					v_u_220:Disconnect()
				end
			end
			if v_u_106.voiceUIVisible then
				v236()
			end
			v_u_106.showVoiceUI.Event:Connect(v236)
			v_u_106.hideVoiceUI.Event:Connect(v237)
		end
	end
	if not v_u_108 then
		v238()
	end
	local v_u_239 = true
	local function v_u_243(p240) -- name: setResetEnabled
		-- upvalues: (ref) v_u_239, (copy) v_u_143
		v_u_239 = p240
		if v_u_143.ResetCharacterButton then
			v_u_143.ResetCharacterButton.Selectable = p240
			v_u_143.ResetCharacterButton.Active = p240
			v_u_143.ResetCharacterButton.Enabled.Value = p240
			local v241 = v_u_143.ResetCharacterButton:FindFirstChild("ResetCharacterHint")
			if v241 then
				v241.ImageColor3 = p240 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100)
			end
			local v242 = v_u_143.ResetCharacterButton:FindFirstChild("ResetCharacterButtonTextLabel")
			if v242 then
				v242.TextColor3 = p240 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100)
			end
		end
	end
	local v_u_244 = nil
	function v_u_143.GetRespawnBehaviour(_) -- name: GetRespawnBehaviour
		-- upvalues: (ref) v_u_66, (copy) v_u_143, (ref) v_u_239, (ref) v_u_244
		if v_u_66.FFlagRelocateMobileMenuButtons and v_u_66.FIntRelocateMobileMenuButtonsVariant ~= 0 then
			return v_u_143:GetExperienceControlStore().getCanRespawn(false), v_u_143:GetExperienceControlStore().getCustomRespawnCallback(false)
		else
			return v_u_239, v_u_244
		end
	end
	v_u_143.RespawnBehaviourChangedEvent = Instance.new("BindableEvent")
	v_u_69:RegisterSetCore("ResetButtonCallback", function(p245)
		-- upvalues: (copy) v_u_143, (ref) v_u_66, (ref) v_u_239, (copy) v_u_243, (ref) v_u_129, (ref) v_u_114, (ref) v_u_244
		local v246
		if typeof(p245) == "Instance" then
			v246 = p245:IsA("BindableEvent")
		else
			v246 = false
		end
		if v246 or type(p245) == "boolean" then
			v_u_143.ResetCharacterPage:SetResetCallback(p245)
		else
			warn("ResetButtonCallback must be set to a BindableEvent or a boolean")
		end
		local v247
		if v_u_66.FFlagRelocateMobileMenuButtons and v_u_66.FIntRelocateMobileMenuButtonsVariant ~= 0 then
			v247 = v_u_143:GetExperienceControlStore().getCanRespawn(false)
		else
			v247 = v_u_239
		end
		if p245 == false then
			if v_u_66.FFlagRelocateMobileMenuButtons and v_u_66.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				v_u_143:GetExperienceControlStore().setCanRespawn(false)
			else
				v_u_243(false)
			end
			if v_u_129 then
				v_u_114.setIsRespawnEnabled(false)
			end
		elseif not v247 and (v246 or p245 == true) then
			if v_u_66.FFlagRelocateMobileMenuButtons and v_u_66.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				v_u_143:GetExperienceControlStore().setCanRespawn(true)
			else
				v_u_243(true)
			end
			if v_u_129 then
				v_u_114.setIsRespawnEnabled(true)
			end
		end
		if v246 then
			if v_u_66.FFlagRelocateMobileMenuButtons and v_u_66.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				v_u_143:GetExperienceControlStore().setCustomRespawnCallback(p245)
			else
				v_u_244 = p245
			end
		end
		if v_u_66.FFlagRelocateMobileMenuButtons and v_u_66.FIntRelocateMobileMenuButtonsVariant ~= 0 then
			v_u_143.RespawnBehaviourChangedEvent:Fire(v_u_143:GetExperienceControlStore().getCanRespawn(false), v_u_143:GetExperienceControlStore().getCustomRespawnCallback(false))
		else
			v_u_143.RespawnBehaviourChangedEvent:Fire(v_u_239, v_u_244)
		end
	end)
	v_u_69:RegisterGetCore("ResetButtonCallback", function()
		-- upvalues: (copy) v_u_143
		local v248, _ = v_u_143:GetRespawnBehaviour()
		return v248
	end)
	local v_u_249 = nil
	local v_u_250, v_u_251 = v_u_49(true)
	local v_u_252, v_u_253 = v_u_49(nil)
	function v_u_143.GetExperienceControlStore(_) -- name: GetExperienceControlStore
		-- upvalues: (copy) v_u_251, (copy) v_u_143, (copy) v_u_250, (copy) v_u_252, (copy) v_u_253, (ref) v_u_66, (ref) v_u_107, (ref) v_u_11, (ref) v_u_96, (ref) v_u_97, (ref) v_u_1, (ref) v_u_104, (ref) v_u_98
		return {
			["getCanRespawn"] = v_u_250,
			["getCustomRespawnCallback"] = v_u_252,
			["setCanRespawn"] = function(p254)
				-- upvalues: (ref) v_u_251, (ref) v_u_143
				v_u_251(p254)
				if v_u_143.ResetCharacterButton then
					v_u_143.ResetCharacterButton.Selectable = p254
					v_u_143.ResetCharacterButton.Active = p254
					v_u_143.ResetCharacterButton.Enabled.Value = p254
					local v255 = v_u_143.ResetCharacterButton:FindFirstChild("ResetCharacterHint")
					if v255 then
						v255.ImageColor3 = p254 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100)
					end
					local v256 = v_u_143.ResetCharacterButton:FindFirstChild("ResetCharacterButtonTextLabel")
					if v256 then
						v256.TextColor3 = p254 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100)
					end
				end
			end,
			["setCustomRespawnCallback"] = v_u_253,
			["onLeaveGame"] = function(p257) -- name: onLeaveGame
				-- upvalues: (ref) v_u_143, (ref) v_u_66, (ref) v_u_107, (ref) v_u_11, (ref) v_u_96
				if v_u_143:GetVisibility() then
					v_u_143:AddToMenuStack(v_u_143.Pages.CurrentPage)
					v_u_143.HubBar.Visible = false
					if v_u_66.GetFFlagEnableLeaveGameUpsellEntrypoint() and v_u_143.leaveGameUpsellProp ~= v_u_107.PHONE_UPSELL_VALUE_PROP.None then
						v_u_143:SwitchToPage(v_u_143.LeaveGameUpsellPage, false)
					else
						v_u_143:SwitchToPage(v_u_143.LeaveGamePage, false, nil, true)
					end
					local v258 = {
						["customFields"] = {
							["source"] = p257
						}
					}
					v_u_11:LogCounter(v_u_96, v258)
				end
			end,
			["onRespawn"] = function(p259) -- name: onRespawn
				-- upvalues: (ref) v_u_250, (ref) v_u_143, (ref) v_u_11, (ref) v_u_97
				if v_u_250(false) then
					v_u_143:AddToMenuStack(v_u_143.Pages.CurrentPage)
					v_u_143.HubBar.Visible = false
					v_u_143:SwitchToPage(v_u_143.ResetCharacterPage, false, nil, true)
					local v260 = {
						["customFields"] = {
							["source"] = p259
						}
					}
					v_u_11:LogCounter(v_u_97, v260)
				end
			end,
			["onResume"] = function(p261) -- name: onResume
				-- upvalues: (ref) v_u_66, (ref) v_u_143, (ref) v_u_1, (ref) v_u_104, (ref) v_u_11, (ref) v_u_98
				if v_u_66.FFlagAddUILessMode then
					v_u_143:SetVisibility(false, nil, nil, nil, p261)
				else
					v_u_143:SetVisibility(false)
				end
				if v_u_66.FFlagAddUILessMode and (v_u_66.FIntAddUILessModeVariant ~= 0 and v_u_143.uiLessStore.getUILessModeEnabled(false)) then
					v_u_143.uiLessStore.setUIVisible(false)
				end
				local v262 = v_u_1
				local v263 = v_u_104.AnalyticsTargetName
				local v264 = v_u_104.AnalyticsResumeGameName
				local v265 = v_u_104.AnalyticsMenuActionName
				local v266 = {
					["source"] = p261,
					["playsessionid"] = v_u_143.playSessionId
				}
				local v267 = game.GameId
				v266.universeid = tostring(v267)
				v262:SetRBXEventStream(v263, v264, v265, v266)
				local v268 = {
					["customFields"] = {
						["source"] = p261
					}
				}
				v_u_11:LogCounter(v_u_98, v268)
			end
		}
	end
	local v_u_278 = v_u_66.FFlagRelocateMobileMenuButtons and v_u_66.FIntRelocateMobileMenuButtonsVariant ~= 0 and function()
		-- upvalues: (copy) v_u_143, (ref) v_u_20, (ref) v_u_19, (ref) v_u_39, (ref) v_u_65, (ref) v_u_66, (ref) v_u_72
		if not v_u_143.BottomButtonFrameRoot then
			local v269 = v_u_143:GetExperienceControlStore()
			v_u_143.BottomButtonFrameRoot = v_u_20.createRoot(v_u_143.BottomButtonFrame)
			local v270 = v_u_143.BottomButtonFrameRoot
			local v271 = v_u_19.createElement
			local v272 = v_u_39
			local v275 = {
				["onLeaveGame"] = v269.onLeaveGame,
				["onRespawn"] = v269.onRespawn,
				["onResume"] = v269.onResume,
				["setAddMenuKeyBindings"] = function(p273) -- name: setAddMenuKeyBindings
					-- upvalues: (ref) v_u_143
					v_u_143.addMenuKeyBindings = p273
				end,
				["setRemoveMenuKeyBindings"] = function(p274) -- name: setRemoveMenuKeyBindings
					-- upvalues: (ref) v_u_143
					v_u_143.removeMenuKeyBindings = p274
				end,
				["getVisibility"] = function() -- name: getVisibility
					-- upvalues: (ref) v_u_143
					return v_u_143.GetVisibility()
				end,
				["getCanRespawn"] = v269.getCanRespawn
			}
			local v276
			if v_u_65.FFlagAddTraversalHistoryReactMenuButtons then
				v276 = v_u_143.CurrentPageSignal
			else
				v276 = nil
			end
			v275.currentPageChangeSignal = v276
			v275.setResumeMenuButton = v_u_66.FFlagIEMFocusNavSupportNewButtons and function(p277)
				-- upvalues: (ref) v_u_143, (ref) v_u_66, (ref) v_u_72
				v_u_143.ResumeMenuButton = p277
				if v_u_66.FFlagIEMFocusNavSupportNewButtons and not (v_u_72.SelectedCoreObject and v_u_72.SelectedCoreObject:IsDescendantOf(v_u_143.Shield)) then
					v_u_72.SelectedCoreObject = p277
				end
			end or nil
			v270:render(v271(v272, v275))
		end
	end or nil
	local v_u_279 = v_u_66.FFlagRelocateMobileMenuButtons and v_u_66.FIntRelocateMobileMenuButtonsVariant ~= 0 and function()
		-- upvalues: (copy) v_u_143
		if v_u_143.BottomButtonFrameRoot then
			v_u_143.BottomButtonFrameRoot:unmount()
			v_u_143.BottomButtonFrameRoot = nil
		end
	end or nil
	local function v455() -- name: createGui
		-- upvalues: (ref) v_u_29, (copy) v_u_143, (ref) v_u_46, (ref) v_u_138, (ref) v_u_137, (ref) v_u_12, (ref) v_u_59, (ref) v_u_58, (ref) v_u_57, (ref) v_u_61, (ref) v_u_66, (ref) v_u_56, (ref) v_u_15, (ref) v_u_133, (ref) v_u_134, (ref) v_u_140, (ref) v_u_93, (ref) v_u_84, (ref) v_u_74, (ref) v_u_76, (ref) v_u_77, (ref) v_u_31, (ref) v_u_88, (ref) v_u_89, (ref) v_u_70, (ref) v_u_7, (ref) v_u_1, (ref) v_u_104, (ref) v_u_72, (ref) v_u_45, (ref) v_u_106, (ref) v_u_129, (ref) v_u_16, (ref) v_u_40, (ref) v_u_9, (ref) v_u_50, (ref) v_u_51, (ref) v_u_37, (ref) v_u_38, (ref) v_u_42, (ref) v_u_18, (ref) v_u_113, (ref) v_u_73, (ref) v_u_249, (copy) v_u_278, (ref) v_u_3, (ref) v_u_110, (copy) v_u_181, (ref) v_u_107, (ref) v_u_44, (copy) v_u_213, (ref) v_u_216, (ref) v_u_239, (copy) v_u_183, (ref) v_u_217, (copy) v_u_218, (ref) v_u_215, (ref) v_u_20, (ref) v_u_19, (ref) v_u_22, (ref) v_u_21, (ref) v_u_28, (ref) v_u_35, (ref) v_u_34, (ref) v_u_95
		local v280 = v_u_29:IsSmallTouchScreen() and 5 or 0
		local v281 = {
			["Name"] = "SettingsClippingShield",
			["Size"] = nil,
			["Position"] = nil,
			["BorderSizePixel"] = 0,
			["ClipsDescendants"] = true,
			["BackgroundTransparency"] = 1,
			["Visible"] = true,
			["ZIndex"] = 2,
			["Parent"] = nil,
			["Size"] = v_u_138,
			["Position"] = v_u_137,
			["Parent"] = v_u_12
		}
		v_u_143.ClippingShield = v_u_46("Frame")(v281)
		v_u_143.CanvasGroup = v_u_46("CanvasGroup")({
			["Name"] = "CanvasGroup",
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["GroupTransparency"] = 0,
			["Visible"] = false,
			["Parent"] = nil,
			["Size"] = UDim2.fromScale(1, 1),
			["Parent"] = v_u_143.ClippingShield
		})
		v_u_143.Shield = v_u_46("ImageButton")({
			["Name"] = "SettingsShield",
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Visible"] = false,
			["Active"] = true,
			["ZIndex"] = 2,
			["Parent"] = nil,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["Position"] = v_u_59,
			["BackgroundTransparency"] = v_u_58,
			["BackgroundColor3"] = v_u_57,
			["Parent"] = v_u_143.ClippingShield
		})
		v_u_143.VRShield = v_u_46("Frame")({
			["Name"] = "VRBackground",
			["Parent"] = nil,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BorderSizePixel"] = 0,
			["Visible"] = false,
			["Parent"] = v_u_143.Shield,
			["BackgroundColor3"] = v_u_57,
			["BackgroundTransparency"] = v_u_58,
			["Position"] = UDim2.new(0, -4, 0, 24),
			["Size"] = UDim2.new(1, 8, 1, -40)
		})
		local v_u_282 = game:GetEngineFeature("CoreScriptVersionEnabled")
		if v_u_282 then
			v_u_143.VersionContainer = v_u_46("ScrollingFrame")({
				["Name"] = "VersionContainer",
				["Parent"] = nil,
				["CanvasSize"] = nil,
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = nil,
				["Position"] = nil,
				["Size"] = nil,
				["AnchorPoint"] = nil,
				["BorderSizePixel"] = 0,
				["AutoLocalize"] = false,
				["ScrollingDirection"] = nil,
				["ScrollBarThickness"] = 0,
				["ZIndex"] = 5,
				["Visible"] = false,
				["Parent"] = v_u_143.Shield,
				["CanvasSize"] = UDim2.new(0, 0, 0, v_u_61),
				["BackgroundColor3"] = v_u_57,
				["BackgroundTransparency"] = v_u_58,
				["Position"] = UDim2.new(0, 0, 1, 0),
				["Size"] = UDim2.new(1, 0, 0, v_u_61),
				["AnchorPoint"] = Vector2.new(0, 1),
				["ScrollingDirection"] = Enum.ScrollingDirection.X
			})
		else
			v_u_143.VersionContainer = v_u_46("Frame")({
				["Name"] = "VersionContainer",
				["Parent"] = nil,
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = nil,
				["Position"] = nil,
				["Size"] = nil,
				["AnchorPoint"] = nil,
				["BorderSizePixel"] = 0,
				["AutoLocalize"] = false,
				["ZIndex"] = 5,
				["Visible"] = false,
				["Parent"] = v_u_143.Shield,
				["BackgroundColor3"] = v_u_57,
				["BackgroundTransparency"] = v_u_58,
				["Position"] = UDim2.new(0, 0, 1, 0),
				["Size"] = UDim2.new(1, 0, 0, v_u_61),
				["AnchorPoint"] = Vector2.new(0, 1)
			})
		end
		local v_u_283 = v_u_46("UIListLayout")({
			["Name"] = "VersionContainer",
			["Parent"] = nil,
			["Padding"] = nil,
			["FillDirection"] = nil,
			["HorizontalAlignment"] = nil,
			["VerticalAlignment"] = nil,
			["SortOrder"] = nil,
			["Parent"] = v_u_143.VersionContainer,
			["Padding"] = UDim.new(0, 6),
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
		if v_u_66.GetFFlagDisplayServerChannel() then
			v_u_143.ServerChannelLabel = v_u_46("TextLabel")({
				["Name"] = "ServerChannelLabel",
				["Parent"] = nil,
				["LayoutOrder"] = 3,
				["BackgroundTransparency"] = 1,
				["TextColor3"] = nil,
				["TextSize"] = nil,
				["Text"] = "Server Channel: ...",
				["Font"] = nil,
				["TextXAlignment"] = nil,
				["TextYAlignment"] = nil,
				["ZIndex"] = 5,
				["Parent"] = v_u_143.VersionContainer,
				["TextColor3"] = Color3.new(1, 1, 1),
				["TextSize"] = v_u_56.textSize(v_u_15 and 28 or (v_u_29:IsSmallTouchScreen() and 14 or 20)),
				["Font"] = v_u_56.font(Enum.Font.SourceSans, "SettingsHub"),
				["TextXAlignment"] = Enum.TextXAlignment.Center,
				["TextYAlignment"] = Enum.TextYAlignment.Center
			})
			spawn(function()
				-- upvalues: (ref) v_u_133, (ref) v_u_134, (ref) v_u_143, (ref) v_u_140, (copy) v_u_282, (ref) v_u_61
				local v284
				if v_u_133 and v_u_134 then
					local v285 = v_u_134.FormatByKey
					local v286 = v_u_134
					local v287, v288 = pcall(v285, v286, "InGame.HelpMenu.Label.ServerChannel")
					v284 = not v287 and "Server Channel: " or v288
				else
					v284 = "Server Channel: "
				end
				v_u_143.ServerChannelLabel.Text = v284 .. v_u_140()
				local v289 = v_u_143.ServerChannelLabel
				local v290 = UDim2.new(0.2, -6, 1, 0)
				if v_u_282 then
					v290 = UDim2.new(0, v289.TextBounds.X + 6, 0, v_u_61) or v290
				end
				v289.Size = v290
				v_u_143.ServerChannelLabel.TextScaled = not (v_u_282 or v_u_143.ServerChannelLabel.TextFits)
			end)
		end
		v_u_143.ServerVersionLabel = v_u_46("TextLabel")({
			["Name"] = "ServerVersionLabel",
			["Parent"] = nil,
			["LayoutOrder"] = 2,
			["BackgroundTransparency"] = 1,
			["TextColor3"] = nil,
			["TextSize"] = nil,
			["Text"] = "Server Version: ...",
			["Font"] = nil,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["ZIndex"] = 5,
			["Parent"] = v_u_143.VersionContainer,
			["TextColor3"] = Color3.new(1, 1, 1),
			["TextSize"] = v_u_56.textSize(v_u_15 and 28 or (v_u_29:IsSmallTouchScreen() and 14 or 20)),
			["Font"] = v_u_56.font(Enum.Font.SourceSans, "SettingsHub"),
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["TextYAlignment"] = Enum.TextYAlignment.Center
		})
		spawn(function()
			-- upvalues: (ref) v_u_133, (ref) v_u_134, (ref) v_u_143, (ref) v_u_93, (ref) v_u_84, (copy) v_u_282, (ref) v_u_61
			local v291
			if v_u_133 and v_u_134 then
				local v292 = v_u_134.FormatByKey
				local v293 = v_u_134
				local v294, v295 = pcall(v292, v293, "InGame.HelpMenu.Label.ServerVersion")
				v291 = not v294 and "Server Version: " or v295
			else
				v291 = "Server Version: "
			end
			local v296 = v_u_143.ServerVersionLabel
			local v297
			if v_u_93 then
				v297 = v_u_93
			else
				if not v_u_84 then
					repeat
						wait()
					until v_u_84
				end
				v_u_93 = v_u_84:InvokeServer()
				v297 = v_u_93
			end
			v296.Text = v291 .. v297
			local v298 = v_u_143.ServerVersionLabel
			local v299 = UDim2.new(0.2, -6, 1, 0)
			if v_u_282 then
				v299 = UDim2.new(0, v298.TextBounds.X + 6, 0, v_u_61) or v299
			end
			v298.Size = v299
			v_u_143.ServerVersionLabel.TextScaled = not (v_u_282 or v_u_143.ServerVersionLabel.TextFits)
		end)
		local v300
		if v_u_133 and v_u_134 then
			local v301 = v_u_134.FormatByKey
			local v302 = v_u_134
			local v303, v304 = pcall(v301, v302, "InGame.HelpMenu.Label.ClientVersion")
			v300 = not v303 and "Client Version: " or v304
		else
			v300 = "Client Version: "
		end
		local v305 = v_u_74:GetRobloxVersion()
		local function v306()
			-- upvalues: (ref) v_u_74
			return v_u_74.ClientGitHash
		end
		local v307, v308 = pcall(v306)
		if v307 then
			v305 = string.format("%s (%.6s)", v305, v308)
		end
		v_u_143.ClientVersionLabel = v_u_46("TextLabel")({
			["Name"] = "ClientVersionLabel",
			["Parent"] = nil,
			["LayoutOrder"] = 1,
			["BackgroundTransparency"] = 1,
			["TextColor3"] = nil,
			["TextSize"] = nil,
			["Text"] = nil,
			["Font"] = nil,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["ZIndex"] = 5,
			["Parent"] = v_u_143.VersionContainer,
			["TextColor3"] = Color3.new(1, 1, 1),
			["TextSize"] = v_u_56.textSize(v_u_15 and 28 or (v_u_29:IsSmallTouchScreen() and 14 or 20)),
			["Text"] = v300 .. v305,
			["Font"] = v_u_56.font(Enum.Font.SourceSans, "SettingsHub"),
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["TextYAlignment"] = Enum.TextYAlignment.Center
		})
		local v309 = v_u_143.ClientVersionLabel
		local v310 = UDim2.new(0.2, -6, 1, 0)
		if v_u_282 then
			v310 = UDim2.new(0, v309.TextBounds.X + 6, 0, v_u_61) or v310
		end
		v309.Size = v310
		v_u_143.ClientVersionLabel.TextScaled = not (v_u_282 or v_u_143.ClientVersionLabel.TextFits)
		v_u_143.PlaceVersionLabel = v_u_46("TextLabel")({
			["Name"] = "PlaceVersionLabel",
			["Parent"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 3,
			["TextColor3"] = nil,
			["TextSize"] = nil,
			["Text"] = "Place Version: ...",
			["Font"] = nil,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["ZIndex"] = 5,
			["Parent"] = v_u_143.VersionContainer,
			["TextColor3"] = Color3.new(1, 1, 1),
			["TextSize"] = v_u_56.textSize(v_u_15 and 28 or (v_u_29:IsSmallTouchScreen() and 14 or 20)),
			["Font"] = v_u_56.font(Enum.Font.SourceSans, "SettingsHub"),
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["TextYAlignment"] = Enum.TextYAlignment.Center
		})
		local function v323() -- name: setPlaceVersionText
			-- upvalues: (ref) v_u_133, (ref) v_u_134, (ref) v_u_143, (ref) v_u_66, (ref) v_u_76, (ref) v_u_77, (copy) v_u_282, (ref) v_u_61
			local v311
			if v_u_133 and v_u_134 then
				local v312 = v_u_134.FormatByKey
				local v313 = v_u_134
				local v314, v315 = pcall(v312, v313, "InGame.HelpMenu.Label.PlaceVersion")
				v311 = not v314 and "Place Version: " or v315
			else
				v311 = "Place Version: "
			end
			local v316 = v_u_143.PlaceVersionLabel
			local v317
			if v_u_66.GetFFlagRemoveAssetVersionEndpoint() then
				v317 = game.PlaceVersion
			else
				local v_u_318 = game.PlaceVersion
				local function v320()
					-- upvalues: (ref) v_u_76, (ref) v_u_77, (ref) v_u_318
					local v319 = v_u_77:JSONDecode((v_u_76:GetAsync(string.format("assets/%d/versions", game.PlaceId))))[1].VersionNumber
					v_u_318 = string.format("%s (Latest: %d)", v_u_318, v319)
				end
				pcall(v320)
				v317 = v_u_318
			end
			v316.Text = v311 .. v317
			local v321 = v_u_143.PlaceVersionLabel
			local v322 = UDim2.new(0.2, -6, 1, 0)
			if v_u_282 then
				v322 = UDim2.new(0, v321.TextBounds.X + 6, 0, v_u_61) or v322
			end
			v321.Size = v322
			v_u_143.PlaceVersionLabel.TextScaled = not (v_u_282 or v_u_143.PlaceVersionLabel.TextFits)
		end
		game:GetPropertyChangedSignal("PlaceVersion"):Connect(v323)
		spawn(v323)
		if not v_u_31:IsSubjectToChinaPolicies() then
			v_u_143.EnvironmentLabel = v_u_46("TextLabel")({
				["Name"] = "EnvironmentLabel",
				["Parent"] = nil,
				["AnchorPoint"] = nil,
				["BackgroundTransparency"] = 1,
				["TextColor3"] = nil,
				["LayoutOrder"] = 4,
				["TextSize"] = nil,
				["Text"] = nil,
				["Font"] = nil,
				["TextXAlignment"] = nil,
				["TextYAlignment"] = nil,
				["ZIndex"] = 5,
				["Visible"] = nil,
				["Parent"] = v_u_143.VersionContainer,
				["AnchorPoint"] = Vector2.new(0.5, 0),
				["TextColor3"] = Color3.new(1, 1, 1),
				["TextSize"] = v_u_56.textSize(v_u_15 and 28 or (v_u_29:IsSmallTouchScreen() and 14 or 20)),
				["Text"] = v_u_88,
				["Font"] = v_u_56.font(Enum.Font.SourceSans, "SettingsHub"),
				["TextXAlignment"] = Enum.TextXAlignment.Center,
				["TextYAlignment"] = Enum.TextYAlignment.Center,
				["Visible"] = v_u_89
			})
			local v324 = v_u_143.EnvironmentLabel
			local v325 = UDim2.new(0.2, -6, 1, 0)
			if v_u_282 then
				v325 = UDim2.new(0, v324.TextBounds.X + 6, 0, v_u_61) or v325
			end
			v324.Size = v325
			v_u_143.EnvironmentLabel.TextScaled = not (v_u_282 or v_u_143.EnvironmentLabel.TextFits)
		end
		if game:GetEngineFeature("GetPlaySessionIdEnabled") then
			local v326 = game:GetPlaySessionId()
			if v326 ~= "" then
				local v327 = "PlaySessionId: " .. v326
				if v_u_134 then
					v327 = v_u_134:FormatByKey("InGame.HelpMenu.Label.PlaySessionId", {
						["RBX_STR"] = v326
					})
				end
				v_u_143.PlaySessionIdLabel = v_u_46("TextLabel")({
					["Name"] = "PlaySessionIdLabel",
					["Parent"] = nil,
					["BackgroundTransparency"] = 1,
					["LayoutOrder"] = 5,
					["TextColor3"] = nil,
					["TextSize"] = nil,
					["Text"] = nil,
					["Font"] = nil,
					["TextXAlignment"] = nil,
					["TextYAlignment"] = nil,
					["ZIndex"] = 5,
					["Parent"] = v_u_143.VersionContainer,
					["TextColor3"] = Color3.new(1, 1, 1),
					["TextSize"] = v_u_56.textSize(v_u_15 and 28 or (v_u_29:IsSmallTouchScreen() and 14 or 20)),
					["Text"] = v327,
					["Font"] = v_u_56.font(Enum.Font.SourceSans, "SettingsHub"),
					["TextXAlignment"] = Enum.TextXAlignment.Center,
					["TextYAlignment"] = Enum.TextYAlignment.Center
				})
				local v328 = v_u_143.PlaySessionIdLabel
				local v329 = UDim2.new(0.2, -6, 1, 0)
				if v_u_282 then
					v329 = UDim2.new(0, v328.TextBounds.X + 6, 0, v_u_61) or v329
				end
				v328.Size = v329
				v_u_143.PlaySessionIdLabel.TextScaled = not v_u_143.PlaySessionIdLabel.TextFits
			end
		end
		local function v_u_349() -- name: getOverridesPlayerScripts
			-- upvalues: (ref) v_u_66, (ref) v_u_70, (ref) v_u_133, (ref) v_u_134
			if v_u_66.EngineFeaturePlayerScriptStatusProperty then
				return ({
					[0] = "Unknown",
					[1] = "v3 Custom",
					[2] = "v3 Default",
					[3] = "v1 Custom",
					[4] = "v2 Default",
					[5] = "v2 Custom"
				})[v_u_70.PlayerModuleStatus]
			else
				local v330 = v_u_70:WaitForChild("StarterPlayerScripts", v_u_66.FFlagRemoveLoadingTimeout and (1 / 0) or nil)
				local v331 = v330:FindFirstChild("PlayerScriptsLoader")
				local v332 = v330:FindFirstChild("PlayerModule")
				if v332 and (v331 and not v332.Archivable) then
					if v331.Archivable then
						if not v_u_133 then
							return "Possibly Custom"
						end
						if not v_u_134 then
							return "Possibly Custom"
						end
						local v333 = v_u_134.FormatByKey
						local v334 = v_u_134
						local v335, v336 = pcall(v333, v334, "InGame.CommonUI.Label.PossiblyCustom")
						return not v335 and "Possibly Custom" or v336
					else
						if not v_u_133 then
							return "Default"
						end
						if not v_u_134 then
							return "Default"
						end
						local v337 = v_u_134.FormatByKey
						local v338 = v_u_134
						local v339, v340 = pcall(v337, v338, "InGame.CommonUI.Label.Default")
						return not v339 and "Default" or v340
					end
				elseif v330:FindFirstChild("CameraScript") or v330:FindFirstChild("ControlScript") then
					if not v_u_133 then
						return "Custom Old"
					end
					if not v_u_134 then
						return "Custom Old"
					end
					local v341 = v_u_134.FormatByKey
					local v342 = v_u_134
					local v343, v344 = pcall(v341, v342, "InGame.CommonUI.Label.CustomOld")
					return not v343 and "Custom Old" or v344
				else
					if not v_u_133 then
						return "Custom"
					end
					if not v_u_134 then
						return "Custom"
					end
					local v345 = v_u_134.FormatByKey
					local v346 = v_u_134
					local v347, v348 = pcall(v345, v346, "InGame.CommonUI.Label.Custom")
					return not v347 and "Custom" or v348
				end
			end
		end
		v_u_143.OverridesPlayerScriptsLabel = v_u_46("TextLabel")({
			["Name"] = "OverridesPlayerScriptsLabel",
			["Parent"] = nil,
			["AnchorPoint"] = nil,
			["BackgroundTransparency"] = 1,
			["TextColor3"] = nil,
			["LayoutOrder"] = 5,
			["TextSize"] = nil,
			["Text"] = "PlayerScripts: ",
			["Font"] = nil,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["ZIndex"] = 5,
			["Visible"] = false,
			["Parent"] = v_u_143.VersionContainer,
			["AnchorPoint"] = Vector2.new(0.5, 0),
			["TextColor3"] = Color3.new(1, 1, 1),
			["TextSize"] = v_u_56.textSize(v_u_15 and 28 or (v_u_29:IsSmallTouchScreen() and 14 or 20)),
			["Font"] = v_u_56.font(Enum.Font.SourceSans, "SettingsHub"),
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["TextYAlignment"] = Enum.TextYAlignment.Center
		})
		spawn(function()
			-- upvalues: (ref) v_u_12, (ref) v_u_7, (ref) v_u_66, (ref) v_u_70, (ref) v_u_133, (ref) v_u_134, (copy) v_u_349, (ref) v_u_1, (ref) v_u_104, (ref) v_u_143, (ref) v_u_89, (copy) v_u_282, (ref) v_u_61
			local v350 = require(v_u_12.Modules.PlayerPermissionsModule)
			if not v_u_7.LocalPlayer then
				v_u_7:GetPropertyChangedSignal("LocalPlayer"):Wait()
			end
			if v_u_66.FFlagWaitPlayerModuleStatus and v_u_70.PlayerModuleStatus == 0 then
				v_u_70:GetPropertyChangedSignal("PlayerModuleStatus"):Wait()
			end
			local v351
			if v_u_133 and v_u_134 then
				local v352 = v_u_134.FormatByKey
				local v353 = v_u_134
				local v354, v355 = pcall(v352, v353, "InGame.HelpMenu.Label.PlayerScripts")
				v351 = not v354 and "PlayerScripts: " or v355
			else
				v351 = "PlayerScripts: "
			end
			local v356 = v_u_349()
			local v357
			if v_u_66.EngineFeaturePlayerScriptStatusProperty then
				v357 = v356 == "v3 Default"
			else
				v357 = v356 == "Default"
			end
			local v358 = v_u_1
			local v359 = v_u_104.AnalyticsTargetName
			local v360 = "player_scripts_status"
			local v361 = "player_scripts_status_action"
			local v362 = {
				["defaultPlayerScripts"] = v357
			}
			local v363 = game.PlaceId
			v362.placeID = tostring(v363)
			local v364
			if v_u_66.GetFFlagNewEventIngestPlayerScriptsDimensions() then
				v364 = v356
			else
				v364 = nil
			end
			v362.rawValue = v364
			v362.context = v_u_66.GetFFlagNewEventIngestPlayerScriptsDimensions() and "IGMv1" or nil
			v358:setRBXEventStream(v359, v360, v361, v362)
			v_u_143.OverridesPlayerScriptsLabel.Text = v351 .. v356
			v_u_143.OverridesPlayerScriptsLabel.Visible = v_u_89 or v350.IsPlayerAdminAsync(v_u_7.LocalPlayer)
			local v365 = v_u_143.OverridesPlayerScriptsLabel
			local v366 = UDim2.new(0.2, -6, 1, 0)
			if v_u_282 then
				v366 = UDim2.new(0, v365.TextBounds.X + 6, 0, v_u_61) or v366
			end
			v365.Size = v366
			v_u_143.OverridesPlayerScriptsLabel.TextScaled = not (v_u_282 or v_u_143.OverridesPlayerScriptsLabel.TextFits)
		end)
		if v_u_282 then
			local v367
			if v_u_133 and v_u_134 then
				local v368 = v_u_134.FormatByKey
				local v369 = v_u_134
				local v370, v371 = pcall(v368, v369, "InGame.HelpMenu.Label.ClientCoreScriptVersion")
				v367 = not v370 and "Client CoreScript Version: " or v371
			else
				v367 = "Client CoreScript Version: "
			end
			v_u_143.CoreScriptVersionLabel = v_u_46("TextLabel")({
				["Name"] = "CoreScriptVersionLabel",
				["Parent"] = nil,
				["LayoutOrder"] = 6,
				["BackgroundTransparency"] = 1,
				["TextColor3"] = nil,
				["TextSize"] = nil,
				["Text"] = nil,
				["Font"] = nil,
				["TextXAlignment"] = nil,
				["TextYAlignment"] = nil,
				["ZIndex"] = 5,
				["Parent"] = v_u_143.VersionContainer,
				["TextColor3"] = Color3.new(1, 1, 1),
				["TextSize"] = v_u_56.textSize(v_u_15 and 28 or (v_u_29:IsSmallTouchScreen() and 14 or 20)),
				["Text"] = v367 .. v_u_74:GetCoreScriptVersion(),
				["Font"] = v_u_56.font(Enum.Font.SourceSans, "SettingsHub"),
				["TextXAlignment"] = Enum.TextXAlignment.Center,
				["TextYAlignment"] = Enum.TextYAlignment.Center
			})
			local v372 = v_u_143.CoreScriptVersionLabel
			local v373 = UDim2.new(0.2, -6, 1, 0)
			if v_u_282 then
				v373 = UDim2.new(0, v372.TextBounds.X + 6, 0, v_u_61) or v373
			end
			v372.Size = v373
			local v_u_374 = v_u_143.VersionContainer
			v_u_283:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				-- upvalues: (copy) v_u_374, (copy) v_u_283, (ref) v_u_61
				v_u_374.CanvasSize = UDim2.new(0, v_u_283.AbsoluteContentSize.X, 0, v_u_61)
			end)
		end
		v_u_143.Modal = v_u_46("TextButton")({
			["Name"] = "Modal",
			["BackgroundTransparency"] = 1,
			["Position"] = nil,
			["Size"] = nil,
			["Modal"] = true,
			["Text"] = "",
			["Parent"] = nil,
			["Selectable"] = false,
			["Position"] = UDim2.new(0, 0, 1, -1),
			["Size"] = UDim2.new(1, 0, 1, 0),
			["Parent"] = v_u_143.Shield
		})
		if v_u_66.FFlagSettingsHubIndependentBackgroundVisibility then
			local v375 = v_u_143
			local v376 = v_u_46("ImageButton")
			local v377 = {
				["Name"] = "DarkenBackground",
				["ZIndex"] = nil,
				["BackgroundTransparency"] = 1,
				["BackgroundColor3"] = nil,
				["Size"] = nil,
				["Parent"] = nil,
				["AutoButtonColor"] = false,
				["Visible"] = false,
				["ZIndex"] = v_u_143.Shield.ZIndex - 1
			}
			local v378
			if v_u_66.isInExperienceUIVREnabled then
				v378 = v_u_143.SettingsUIDelegate:getDarkBackgroundTheme().Color
			else
				v378 = v_u_56.color("DarkenBackground")
			end
			v377.BackgroundColor3 = v378
			v377.Size = UDim2.new(1, 0, 1, 0)
			v377.Parent = v_u_143.ClippingShield
			v375.DarkenBackground = v376(v377)
		else
			v_u_143.DarkenBackground = v_u_46("Frame")({
				["Name"] = "DarkenBackground",
				["ZIndex"] = nil,
				["BackgroundTransparency"] = 1,
				["BackgroundColor3"] = nil,
				["Size"] = nil,
				["Parent"] = nil,
				["ZIndex"] = v_u_143.Shield.ZIndex - 1,
				["BackgroundColor3"] = v_u_56.color("DarkenBackground"),
				["Size"] = UDim2.new(1, 0, 1, 0),
				["Parent"] = v_u_143.ClippingShield
			})
		end
		local v379 = v_u_56.MenuContainerPosition(v_u_143.SettingsUIDelegate)
		v_u_143.MenuContainer = v_u_46("ImageButton")({
			["Name"] = "MenuContainer",
			["ZIndex"] = nil,
			["BackgroundTransparency"] = nil,
			["BackgroundColor3"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["AnchorPoint"] = nil,
			["AutomaticSize"] = nil,
			["Parent"] = nil,
			["ZIndex"] = v_u_143.Shield.ZIndex,
			["BackgroundTransparency"] = v_u_56.transparency("MenuContainer", 1),
			["BackgroundColor3"] = v_u_56.color("MenuContainer"),
			["Position"] = v379.Position,
			["Size"] = v379.Size,
			["AnchorPoint"] = v379.AnchorPoint,
			["AutomaticSize"] = v379.AutomaticSize,
			["Parent"] = v_u_143.Shield
		})
		v_u_143.ReactPage.Parent = v_u_143.MenuContainer
		v_u_143.Page = v_u_46("Frame")({
			["Name"] = "Page",
			["BackgroundTransparency"] = 1,
			["AutomaticSize"] = nil,
			["Parent"] = nil,
			["AutomaticSize"] = Enum.AutomaticSize.XY,
			["Parent"] = v_u_143.MenuContainer
		})
		v_u_143.Page.SelectionGroup = true
		v_u_143.Page.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
		v_u_143.Page.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
		v_u_143.Page.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
		v_u_143.Page.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		local v380 = v_u_143.Page
		v_u_143.MenuContainerPadding = v_u_46("UIPadding")({
			["Parent"] = v380
		})
		if not v_u_15 then
			local _ = v_u_72:GetGuiInset().Y
			v_u_143.MenuContainerPadding.PaddingTop = UDim.new(0, 0)
		end
		local v381 = v_u_56.HubPadding()
		v_u_143.MenuContainer.AutoButtonColor = false
		v_u_143.MenuContainerPadding.PaddingLeft = v381.PaddingLeft
		v_u_143.MenuContainerPadding.PaddingRight = v381.PaddingRight
		v_u_143.MenuContainerPadding.PaddingBottom = v381.PaddingBottom
		v_u_143.MenuContainerPadding.PaddingTop = v381.PaddingTop
		v_u_46("UICorner")({
			["CornerRadius"] = v_u_56.MenuContainerCornerRadius,
			["Parent"] = v_u_143.MenuContainer
		})
		v_u_45(function(p382)
			-- upvalues: (ref) v_u_143
			v_u_143.hasMicPermissions = p382.hasMicPermissions
			v_u_143.isFetchingMicPermissions = false
		end, nil, true)
		v_u_143.SettingsShowSignal:connect(function(p383)
			-- upvalues: (ref) v_u_106, (ref) v_u_66, (ref) v_u_143
			if p383 then
				if v_u_106:IsSeamlessVoice() and not v_u_106.voiceUIVisible then
					if v_u_66.FFlagVoiceRewarmTelemetry then
						local v384, v385, v386, v387 = v_u_106:GetConnectDisconnectButtonAnalyticsData(true)
						v_u_106.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("shown", v384, v385, v386, v387, v_u_106.joinVoiceButtonContext)
					else
						v_u_106.Analytics:reportJoinVoiceButtonEventWithVoiceSessionId("shown", v_u_106:GetConnectDisconnectButtonAnalyticsData(true))
					end
				elseif v_u_106:IsSeamlessVoice() and v_u_106.voiceUIVisible then
					v_u_106.Analytics:reportLeaveVoiceButtonEvent("shown", v_u_106:GetConnectDisconnectButtonAnalyticsData(true))
				end
				if v_u_106:UserVoiceEnabled() and v_u_143.isFetchingMicPermissions then
					return
				end
				local v388 = not v_u_106:UserOnlyEligibleForVoice() and v_u_106:UserVoiceEnabled()
				if v388 then
					v388 = not v_u_143.hasMicPermissions
				end
				if not v388 then
					return
				end
			end
		end)
		v_u_143.MenuListLayout = v_u_46("UIListLayout")({
			["Name"] = "MenuListLayout",
			["FillDirection"] = nil,
			["VerticalAlignment"] = nil,
			["HorizontalAlignment"] = nil,
			["SortOrder"] = nil,
			["Parent"] = nil,
			["FillDirection"] = Enum.FillDirection.Vertical,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Parent"] = v380
		})
		v_u_143.HubBar = v_u_46("ImageLabel")({
			["Name"] = "HubBar",
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["ZIndex"] = nil,
			["BorderSizePixel"] = 0,
			["AnchorPoint"] = nil,
			["LayoutOrder"] = 0,
			["Parent"] = nil,
			["BackgroundColor3"] = v_u_56.color("HubBarContainer"),
			["BackgroundTransparency"] = v_u_56.transparency("HubBarContainerTransparency"),
			["ZIndex"] = v_u_143.Shield.ZIndex + 1,
			["AnchorPoint"] = Vector2.new(0.5, 0),
			["Parent"] = v380
		})
		if not v_u_129 then
			v_u_46("Frame")({
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["Parent"] = nil,
				["BackgroundColor3"] = v_u_56.color("Divider"),
				["BackgroundTransparency"] = v_u_56.transparency("Divider"),
				["Size"] = UDim2.new(1, 0, 0, 1),
				["Position"] = UDim2.new(0, 0, 1, 0),
				["AnchorPoint"] = Vector2.new(0, 1),
				["Parent"] = v_u_143.HubBar
			})
		end
		if v_u_129 then
			v_u_143.PageTitleHeader = v_u_46("Frame")({
				["Name"] = "PageTitleHeader",
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["LayoutOrder"] = 0,
				["Parent"] = nil,
				["ZIndex"] = nil,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["Parent"] = v_u_143.HubBar,
				["ZIndex"] = v_u_143.Shield.ZIndex + 1
			})
			v_u_46("UIPadding")({
				["PaddingLeft"] = UDim.new(0, 12),
				["PaddingRight"] = UDim.new(0, 12),
				["Parent"] = v_u_143.PageTitleHeader
			})
			v_u_143.PageTitleLabel = v_u_46("TextLabel")({
				["Name"] = "Title",
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["AutomaticSize"] = nil,
				["Text"] = "",
				["TextXAlignment"] = nil,
				["TextColor3"] = nil,
				["Font"] = nil,
				["FontSize"] = nil,
				["Parent"] = nil,
				["Size"] = UDim2.new(1, -36, 0, 0),
				["Position"] = UDim2.new(0, 0, 0.5, 0),
				["AnchorPoint"] = Vector2.new(0, 0.5),
				["AutomaticSize"] = Enum.AutomaticSize.Y,
				["TextXAlignment"] = Enum.TextXAlignment.Left,
				["TextColor3"] = Color3.new(1, 1, 1),
				["Font"] = v_u_56.font(Enum.Font.SourceSansBold, "Confirmation"),
				["FontSize"] = v_u_56.fontSize(Enum.FontSize.Size36, "Confirmation"),
				["Parent"] = v_u_143.PageTitleHeader
			})
		end
		v_u_143.HubBarListLayout = v_u_46("UIListLayout")({
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Parent"] = v_u_143.HubBar
		})
		if not v_u_66.FFlagAddTraversalBackButton then
			if v_u_66.EngineFeatureTeleportHistoryButtons then
				v_u_143.BackBarRef = v_u_16.createRef()
				v_u_143.FrontBarRef = v_u_16.createRef()
				v_u_143.BackBar = v_u_16.createElement(v_u_40.Provider, {
					["value"] = v_u_9
				}, {
					["AppStyleProvider"] = v_u_16.createElement(v_u_50, {
						["style"] = {
							["themeName"] = v_u_51
						}
					}, {
						["ButtonsFrame"] = v_u_16.createElement("Frame", {
							["BackgroundTransparency"] = 1,
							["LayoutOrder"] = -1,
							["AutomaticSize"] = nil,
							["Size"] = nil,
							["AutomaticSize"] = Enum.AutomaticSize.Y,
							["Size"] = UDim2.new(1, 0, 0, 0)
						}, {
							["BackButton"] = v_u_16.createElement(v_u_37, {
								["BackBarRef"] = nil,
								["HubBar"] = nil,
								["LayoutOrder"] = 1,
								["BackBarRef"] = v_u_143.BackBarRef,
								["HubBar"] = v_u_143.HubBar
							}),
							["FrontButton"] = v_u_16.createElement(v_u_38, {
								["FrontBarRef"] = nil,
								["HubBar"] = nil,
								["LayoutOrder"] = 2,
								["FrontBarRef"] = v_u_143.FrontBarRef,
								["HubBar"] = v_u_143.HubBar
							})
						})
					})
				})
				v_u_16.mount(v_u_143.BackBar, v380, "BackBar")
			else
				v_u_143.BackBarRef = v_u_16.createRef()
				v_u_143.BackBar = v_u_16.createElement(v_u_40.Provider, {
					["value"] = v_u_9
				}, {
					["AppStyleProvider"] = v_u_16.createElement(v_u_50, {
						["style"] = {
							["themeName"] = v_u_51
						}
					}, {
						["BackButton"] = v_u_16.createElement(v_u_37, {
							["BackBarRef"] = v_u_143.BackBarRef,
							["HubBar"] = v_u_143.HubBar
						})
					})
				})
				v_u_16.mount(v_u_143.BackBar, v380, "BackBar")
			end
		end
		if v_u_29:IsSmallTouchScreen() then
			v_u_143.HubBar.Size = UDim2.new(0, v_u_12.AbsoluteSize.X - 100, 0, 50)
			v_u_143.HubBar.Position = UDim2.new(0.5, 0, 0, 6)
		elseif v_u_15 then
			v_u_143.HubBar.Size = UDim2.new(0, 1200, 0, 100)
			v_u_143.HubBar.Position = UDim2.new(0.5, 0, 0.1, 0)
		else
			v_u_143.HubBar.Size = UDim2.new(0, 800, 0, 60)
			v_u_143.HubBar.Position = UDim2.new(0.5, 0, 0.1, 0)
		end
		local v389 = v_u_143
		local v390 = v_u_46("Frame")
		local v391 = {
			["Size"] = nil,
			["Position"] = nil,
			["Parent"] = nil,
			["BackgroundTransparency"] = 1
		}
		local v392
		if v_u_66.ChromeEnabled then
			v392 = UDim2.new(1, 0, 0, 100)
		else
			v392 = UDim2.fromOffset(0, 100)
		end
		v391.Size = v392
		v391.Position = UDim2.new(0, 0, 0, 0)
		v391.Parent = v_u_143.HubBar
		v389.VoiceRecordingIndicatorFrame = v390(v391)
		v_u_143.VoiceRecordingText = v_u_46("TextLabel")({
			["Parent"] = nil,
			["Text"] = "",
			["Visible"] = false,
			["Position"] = nil,
			["TextSize"] = 12,
			["Font"] = nil,
			["Size"] = nil,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["Parent"] = v_u_143.VoiceRecordingIndicatorFrame,
			["Position"] = UDim2.new(0, 60, 0, 0),
			["Font"] = v_u_42.default:getMedium(),
			["Size"] = UDim2.fromScale(1, 1),
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["TextColor3"] = Color3.fromRGB(255, 255, 255)
		})
		if v_u_29:IsSmallTouchScreen() then
			v_u_143.VoiceRecordingText.Size = UDim2.fromScale(1, 1)
			v_u_143.VoiceRecordingText.AnchorPoint = Vector2.new(0, 0)
			if v_u_66.ChromeEnabled then
				v_u_143.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right
				v_u_143.VoiceRecordingText.Position = UDim2.new(0, 0, 0, -60)
			else
				v_u_143.VoiceRecordingText.Position = UDim2.new(0, 60, 0, -60)
			end
		elseif v_u_15 then
			v_u_143.VoiceRecordingText.AnchorPoint = Vector2.new(0, 1)
			if v_u_66.ChromeEnabled then
				v_u_143.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right
				v_u_143.VoiceRecordingText.Size = UDim2.new(1, 0, 0, 100)
				v_u_143.VoiceRecordingText.Position = UDim2.new(0, 0, 0.1, 0)
			else
				v_u_143.VoiceRecordingText.Size = UDim2.new(0, 1200, 0, 100)
				v_u_143.VoiceRecordingText.Position = UDim2.new(0.5, 0, 0.1, 0)
			end
		else
			v_u_143.VoiceRecordingText.AnchorPoint = Vector2.new(0, 1)
			if v_u_66.ChromeEnabled then
				v_u_143.VoiceRecordingText.TextXAlignment = Enum.TextXAlignment.Right
				v_u_143.VoiceRecordingText.Size = UDim2.new(1, 0, 0, 60)
				v_u_143.VoiceRecordingText.Position = UDim2.new(0, 0, 0.1, 0)
			else
				v_u_143.VoiceRecordingText.Size = UDim2.new(0, 800, 0, 60)
				v_u_143.VoiceRecordingText.Position = UDim2.new(0.5, 0, 0.1, 0)
			end
		end
		v_u_143.voiceRecordingIndicatorTextMotor = v_u_18.createSingleMotor(0)
		v_u_143.voiceRecordingIndicatorTextMotor:onStep(function(p393)
			-- upvalues: (ref) v_u_143
			v_u_143.VoiceRecordingText.TextTransparency = p393
		end)
		spawn(function()
			-- upvalues: (ref) v_u_74, (ref) v_u_143, (ref) v_u_18, (ref) v_u_113
			v_u_74:BindToRenderStep("VoiceRecordingIndicator", 1, function()
				-- upvalues: (ref) v_u_143, (ref) v_u_18, (ref) v_u_113
				if v_u_143.isMuted ~= nil and (v_u_143.lastVoiceRecordingIndicatorTextUpdated ~= nil and (tick() - v_u_143.lastVoiceRecordingIndicatorTextUpdated >= 5 and v_u_143.isMuted)) then
					v_u_143.voiceRecordingIndicatorTextMotor:setGoal(v_u_18.spring(1, v_u_113))
					v_u_143.voiceRecordingIndicatorTextMotor:start()
				end
			end)
		end)
		v_u_143.PageViewClipper = v_u_46("Frame")({
			["Name"] = "PageViewClipper",
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["ClipsDescendants"] = true,
			["LayoutOrder"] = 1,
			["Parent"] = nil,
			["SelectionGroup"] = true,
			["SelectionBehaviorLeft"] = nil,
			["SelectionBehaviorRight"] = nil,
			["SelectionBehaviorDown"] = nil,
			["SelectionBehaviorUp"] = nil,
			["Size"] = UDim2.new(v_u_143.HubBar.Size.X.Scale, v_u_143.HubBar.Size.X.Offset, 1, -v_u_143.HubBar.Size.Y.Offset - v_u_143.HubBar.Position.Y.Offset - v280),
			["Position"] = UDim2.new(v_u_143.HubBar.Position.X.Scale, v_u_143.HubBar.Position.X.Offset, v_u_143.HubBar.Position.Y.Scale, v_u_143.HubBar.Position.Y.Offset + v_u_143.HubBar.Size.Y.Offset + 1),
			["AnchorPoint"] = Vector2.new(0.5, 0),
			["Parent"] = v380,
			["SelectionBehaviorLeft"] = Enum.SelectionBehavior.Stop,
			["SelectionBehaviorRight"] = Enum.SelectionBehavior.Stop,
			["SelectionBehaviorDown"] = Enum.SelectionBehavior.Escape,
			["SelectionBehaviorUp"] = Enum.SelectionBehavior.Escape
		})
		if v_u_66.FFlagEnableConsoleExpControls and v_u_66.ChromeEnabled then
			v_u_143.PageViewPadding = v_u_46("UIPadding")({
				["Parent"] = v_u_143.PageViewClipper
			})
			local v_u_394 = require(v_u_12.Modules.Chrome.Service)
			v_u_394:onShortcutBarChanged():connect(function()
				-- upvalues: (ref) v_u_29, (copy) v_u_394, (ref) v_u_143, (ref) v_u_56
				if v_u_29:IsSmallTouchScreen() and v_u_394:getCurrentShortcutBar():get() ~= nil then
					v_u_143.PageViewPadding.PaddingBottom = UDim.new(0, v_u_56.ExtraPageBottomPaddingMobile)
				else
					v_u_143.PageViewPadding.PaddingBottom = UDim.new(0, 0)
				end
			end)
		end
		v_u_143.PageView = v_u_46("ScrollingFrame")({
			["Name"] = "PageView",
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["CanvasSize"] = nil,
			["ZIndex"] = nil,
			["ScrollingDirection"] = nil,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["Selectable"] = false,
			["ScrollBarThickness"] = nil,
			["Parent"] = nil,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.new(0.5, 0, 0.5, 2),
			["Size"] = UDim2.new(1, 0, 1, -20),
			["CanvasSize"] = UDim2.new(1, 0, 1, 0),
			["ZIndex"] = v_u_143.Shield.ZIndex,
			["ScrollingDirection"] = Enum.ScrollingDirection.Y,
			["ScrollBarThickness"] = v_u_56.DefaultScrollBarThickness,
			["Parent"] = v_u_143.PageViewClipper
		})
		v_u_143.PageView.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
		v_u_143.PageViewInnerFrame = v_u_46("Frame")({
			["Name"] = "PageViewInnerFrame",
			["Position"] = nil,
			["Size"] = nil,
			["ZIndex"] = nil,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["Selectable"] = false,
			["Parent"] = nil,
			["LayoutOrder"] = 1,
			["Position"] = UDim2.new(0, 0, 0, 0),
			["Size"] = UDim2.new(1, 0, 1, 0),
			["ZIndex"] = v_u_143.Shield.ZIndex,
			["Parent"] = v_u_143.PageView
		})
		v_u_46("UIPadding")({
			["PaddingTop"] = UDim.new(0, 5),
			["Parent"] = v_u_143.PageViewInnerFrame
		})
		v_u_143.InnerCanvasGroupShow = v_u_46("CanvasGroup")({
			["Name"] = "InnerCanvasGroupShow",
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["GroupTransparency"] = 0,
			["Visible"] = false,
			["Parent"] = nil,
			["Size"] = UDim2.fromScale(1, 1),
			["Parent"] = v_u_143.PageViewInnerFrame
		})
		v_u_143.InnerCanvasGroupHide = v_u_46("CanvasGroup")({
			["Name"] = "InnerCanvasGroupHide",
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["GroupTransparency"] = 0,
			["Visible"] = false,
			["Parent"] = nil,
			["Size"] = UDim2.fromScale(1, 1),
			["Parent"] = v_u_143.PageViewInnerFrame
		})
		if v_u_73.MouseEnabled then
			v_u_143.PageViewClipper.Size = UDim2.new(v_u_143.HubBar.Size.X.Scale, v_u_143.HubBar.Size.X.Offset, 0.5, -(v_u_143.HubBar.Position.Y.Offset - v_u_143.HubBar.Size.Y.Offset))
		end
		v_u_143.BottomButtonFrame = v_u_46("Frame")({
			["Name"] = "BottomButtonFrame",
			["Size"] = nil,
			["Position"] = nil,
			["ZIndex"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 2,
			["Parent"] = nil,
			["Selectable"] = false,
			["SelectionGroup"] = true,
			["SelectionBehaviorLeft"] = nil,
			["SelectionBehaviorRight"] = nil,
			["SelectionBehaviorDown"] = nil,
			["Size"] = v_u_143.HubBar.Size,
			["Position"] = UDim2.new(0.5, -v_u_143.HubBar.Size.X.Offset / 2, 1 - v_u_143.HubBar.Position.Y.Scale - v_u_143.HubBar.Size.Y.Scale, -v_u_143.HubBar.Position.Y.Offset - v_u_143.HubBar.Size.Y.Offset),
			["ZIndex"] = v_u_143.Shield.ZIndex + 1,
			["Parent"] = v380,
			["SelectionBehaviorLeft"] = Enum.SelectionBehavior.Stop,
			["SelectionBehaviorRight"] = Enum.SelectionBehavior.Stop,
			["SelectionBehaviorDown"] = Enum.SelectionBehavior.Stop
		})
		v_u_143.BottomButtonFrame:GetPropertyChangedSignal("Visible"):Connect(function()
			-- upvalues: (ref) v_u_143
			v_u_143.setShowBottomBarSignal(v_u_143.BottomButtonFrame.Visible)
		end)
		local function v_u_402(p395)
			-- upvalues: (ref) v_u_66, (ref) v_u_249, (ref) v_u_143, (ref) v_u_1, (ref) v_u_104, (ref) v_u_72
			if v_u_66.FFlagAddUILessMode then
				v_u_249(false, nil, nil, nil, p395)
			else
				v_u_249(false)
			end
			if v_u_66.FFlagAddUILessMode and (v_u_66.FIntAddUILessModeVariant ~= 0 and v_u_143.uiLessStore.getUILessModeEnabled(false)) then
				v_u_143.uiLessStore.setUIVisible(false)
			end
			local v396 = v_u_1
			local v397 = v_u_104.AnalyticsTargetName
			local v398 = v_u_104.AnalyticsResumeGameName
			local v399 = v_u_104.AnalyticsMenuActionName
			local v400 = {
				["source"] = p395,
				["playsessionid"] = v_u_143.playSessionId
			}
			local v401 = game.GameId
			v400.universeid = tostring(v401)
			v396:SetRBXEventStream(v397, v398, v399, v400)
			v_u_72.SelectedCoreObject = nil
		end
		if v_u_129 then
			v_u_143.PageTitleCloseButton = v_u_29:MakeStyledImageButton("PageTitleClose", "rbxasset://textures/ui/InspectMenu/x.png", UDim2.new(0, 40, 0, 40), UDim2.new(0, 16, 0, 16), function()
				-- upvalues: (copy) v_u_402, (ref) v_u_104
				v_u_402(v_u_104.AnalyticsResumeXButtonSource)
			end, nil, v_u_143, "DefaultButton")
			v_u_143.PageTitleCloseButton.AnchorPoint = Vector2.new(1, 0.5)
			v_u_143.PageTitleCloseButton.Position = UDim2.new(1, 0, 0.5, 0)
			local v403 = v_u_143.PageTitleCloseButton:FindFirstChild("Border")
			if v403 then
				v403.Parent = nil
			end
			v_u_143.PageTitleCloseButton.Parent = v_u_143.PageTitleHeader
		end
		if not v_u_66.FFlagMenuButtonsMountWithIEM and (v_u_66.FFlagRelocateMobileMenuButtons and (v_u_66.FIntRelocateMobileMenuButtonsVariant == 1 or (v_u_66.FIntRelocateMobileMenuButtonsVariant == 3 or v_u_66.FIntRelocateMobileMenuButtonsVariant == 2 and not v_u_29:IsSmallTouchScreen()))) then
			v_u_278()
		end
		if not v_u_66.FFlagRelocateMobileMenuButtons or (v_u_66.FIntRelocateMobileMenuButtonsVariant == 0 or v_u_66.FIntRelocateMobileMenuButtonsVariant == 2 and v_u_29:IsSmallTouchScreen()) then
			v_u_143.BottomButtonFrame.Size = UDim2.new(1, 0, 0, 80)
		end
		v_u_143.MenuListLayout = v_u_46("UIListLayout")({
			["Padding"] = UDim.new(0, 12),
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Parent"] = v_u_143.BottomButtonFrame
		})
		if v_u_66.FFlagEnableSystemScrimInSettingsHub then
			local v_u_404 = require(v_u_3.Workspace.Packages.SystemScrim).SystemScrimSignalStore(false)
			v_u_404.backgroundScrimActivated.Event:Connect(function()
				-- upvalues: (ref) v_u_66, (ref) v_u_143, (ref) v_u_104, (copy) v_u_402
				if v_u_66.FFlagRelocateMobileMenuButtons and v_u_66.FIntRelocateMobileMenuButtonsVariant ~= 0 then
					v_u_143:GetExperienceControlStore().onResume(v_u_104.AnalyticsResumeShieldSource)
				else
					v_u_402(v_u_104.AnalyticsResumeShieldSource)
				end
			end)
			v_u_143.Shield:GetPropertyChangedSignal("Visible"):Connect(function()
				-- upvalues: (copy) v_u_404, (ref) v_u_143
				v_u_404.setTransparency(1)
				v_u_404.setAutoDismiss(true)
				v_u_404.setVisibility(v_u_143.Shield.Visible)
			end)
		end
		v_u_143.Shield.Activated:Connect(function()
			-- upvalues: (ref) v_u_66, (ref) v_u_143, (ref) v_u_104, (copy) v_u_402
			if v_u_66.FFlagRelocateMobileMenuButtons and v_u_66.FIntRelocateMobileMenuButtonsVariant ~= 0 then
				v_u_143:GetExperienceControlStore().onResume(v_u_104.AnalyticsResumeShieldSource)
			else
				v_u_402(v_u_104.AnalyticsResumeShieldSource)
			end
		end)
		if v_u_66.FFlagSettingsHubIndependentBackgroundVisibility then
			v_u_143.DarkenBackground.Activated:Connect(function()
				-- upvalues: (ref) v_u_66, (ref) v_u_143, (ref) v_u_104, (copy) v_u_402, (ref) v_u_110
				if v_u_66.FFlagRelocateMobileMenuButtons and v_u_66.FIntRelocateMobileMenuButtonsVariant ~= 0 then
					v_u_143:GetExperienceControlStore().onResume(v_u_104.AnalyticsResumeShieldSource)
				else
					v_u_402(v_u_104.AnalyticsResumeShieldSource)
				end
				v_u_110.default:setVisible(false)
			end)
		end
		if not v_u_66.FFlagRelocateMobileMenuButtons or v_u_66.FIntRelocateMobileMenuButtonsVariant == 0 then
			local function v405()
				-- upvalues: (ref) v_u_66, (ref) v_u_143, (ref) v_u_181, (ref) v_u_107
				if v_u_66.FFlagPreventHiddenSwitchPage and v_u_143:GetVisibility() == false then
					return
				else
					v_u_143:AddToMenuStack(v_u_143.Pages.CurrentPage)
					v_u_143.HubBar.Visible = false
					v_u_181()
					if v_u_66.GetFFlagEnableLeaveGameUpsellEntrypoint() and v_u_143.leaveGameUpsellProp ~= v_u_107.PHONE_UPSELL_VALUE_PROP.None then
						v_u_143:SwitchToPage(v_u_143.LeaveGameUpsellPage, nil, 1, true)
					else
						v_u_143:SwitchToPage(v_u_143.LeaveGamePage, nil, 1, true)
					end
				end
			end
			if v_u_44.canNavigateHome then
				local v406 = v_u_213
				local v407 = "LeaveGame"
				local v408 = "Leave"
				local v409 = v_u_216
				local v410 = "rbxasset://textures/ui/Settings/Help/LeaveIcon.png"
				local v411 = UDim2.new(0.5, v_u_15 and -160 or -130, 0.5, -25)
				local v412 = {}
				local v413 = Enum.KeyCode.L
				local v414
				if v_u_66.FFlagEnableConsoleExpControls and v_u_66.ChromeEnabled then
					v414 = nil
				else
					v414 = Enum.KeyCode.ButtonX
				end
				__set_list(v412, 1, {v413, v414})
				v406(v407, v408, v409, v410, v411, v405, v412, v405)
			end
			local function v415()
				-- upvalues: (ref) v_u_239, (ref) v_u_143, (ref) v_u_181
				if v_u_239 then
					v_u_143:AddToMenuStack(v_u_143.Pages.CurrentPage)
					v_u_143.HubBar.Visible = false
					v_u_181()
					v_u_143:SwitchToPage(v_u_143.ResetCharacterPage, nil, 1, true)
				end
			end
			local v416 = v_u_183:Format(v_u_104.RespawnLocalizedKey)
			local v417 = v_u_213
			local v418 = "ResetCharacter"
			local v419 = v_u_217
			local v420 = "rbxasset://textures/ui/Settings/Help/ResetIcon.png"
			local v421 = UDim2.new(0.5, v_u_15 and -550 or -400, 0.5, -25)
			local v422 = v415
			local v423 = {}
			local v424 = Enum.KeyCode.R
			local v425
			if v_u_66.FFlagEnableConsoleExpControls and v_u_66.ChromeEnabled then
				v425 = nil
			else
				v425 = Enum.KeyCode.ButtonY
			end
			__set_list(v423, 1, {v424, v425})
			v417(v418, v416, v419, v420, v421, v422, v423, v415)
			local function v426()
				-- upvalues: (copy) v_u_402, (ref) v_u_104
				v_u_402(v_u_104.AnalyticsResumeButtonSource)
			end
			local function v427()
				-- upvalues: (copy) v_u_402, (ref) v_u_104
				v_u_402(v_u_104.AnalyticsResumeGamepadSource)
			end
			local v428 = v_u_213
			local v429 = "Resume"
			local v430 = "Resume"
			local v431
			if v_u_66.FFlagEnableConsoleExpControls then
				v431 = v_u_218
			else
				v431 = v_u_215
			end
			v428(v429, v430, v431, "rbxasset://textures/ui/Settings/Help/EscapeIcon.png", UDim2.new(0.5, v_u_15 and 200 or 140, 0.5, -25), v426, v_u_66.FFlagEnableConsoleExpControls and v_u_66.ChromeEnabled and {} or { Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart }, v427)
		end
		if v_u_66.FFlagAddSwitchTabHintsToIEM then
			local function v442(p432) -- name: MountSwitchTabHint
				-- upvalues: (ref) v_u_46, (ref) v_u_20, (ref) v_u_19, (ref) v_u_22, (ref) v_u_21, (ref) v_u_28, (ref) v_u_35
				local v433 = v_u_46("Frame")({
					["Name"] = "SwitchTabHintContainer",
					["Size"] = nil,
					["BackgroundTransparency"] = 1,
					["AutomaticSize"] = nil,
					["LayoutOrder"] = nil,
					["Parent"] = nil,
					["Size"] = UDim2.fromScale(0, 1),
					["AutomaticSize"] = Enum.AutomaticSize.X,
					["LayoutOrder"] = p432.layoutOrder,
					["Parent"] = p432.parent
				})
				local v434 = v_u_20.createRoot(v433)
				local v435 = v_u_19.createElement
				local v436 = v_u_19.Fragment
				local v437 = v_u_19.createElement("UIListLayout", {
					["Name"] = "SwitchTabHintCenterAlign",
					["FillDirection"] = nil,
					["HorizontalAlignment"] = nil,
					["VerticalAlignment"] = nil,
					["FillDirection"] = Enum.FillDirection.Vertical,
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
					["VerticalAlignment"] = Enum.VerticalAlignment.Center
				})
				local v438 = v_u_19.createElement
				local v439 = v_u_22
				local v440 = {
					["colorMode"] = v_u_21.Enums.ColorMode.Dark,
					["device"] = v_u_28.getDeviceType()
				}
				local v441 = {
					["SwitchTabHint" .. p432.keycode.Name] = v_u_19.createElement(v_u_35, {
						["keycode"] = p432.keycode
					})
				}
				v434:render(v435(v436, nil, v437, v438(v439, v440, v441)))
			end
			v_u_143.TabHeaderContainer = v_u_46("Frame")({
				["Name"] = "TabHeaderContainer",
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Parent"] = nil,
				["Visible"] = nil,
				["Size"] = UDim2.fromScale(1, 1),
				["Parent"] = v_u_143.HubBar,
				["Visible"] = not v_u_129
			})
			v_u_143.TabHeaderContainerListLayout = v_u_46("UIListLayout")({
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["HorizontalFlex"] = Enum.UIFlexAlignment.Fill,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["Parent"] = v_u_143.TabHeaderContainer
			})
			v442({
				["keycode"] = nil,
				["parent"] = nil,
				["layoutOrder"] = -999,
				["keycode"] = Enum.KeyCode.ButtonL1,
				["parent"] = v_u_143.TabHeaderContainer
			})
			v442({
				["keycode"] = nil,
				["parent"] = nil,
				["layoutOrder"] = 999,
				["keycode"] = Enum.KeyCode.ButtonR1,
				["parent"] = v_u_143.TabHeaderContainer
			})
		end
		local v443 = v_u_143
		local v444 = v_u_46("ImageLabel")
		local v445 = {
			["Name"] = "HubBarContainer",
			["ZIndex"] = nil,
			["BorderSizePixel"] = 0,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["Parent"] = nil,
			["Selectable"] = nil,
			["SelectionGroup"] = nil,
			["SelectionBehaviorUp"] = nil,
			["SelectionBehaviorLeft"] = nil,
			["SelectionBehaviorRight"] = nil,
			["ZIndex"] = v_u_143.Shield.ZIndex + 2,
			["BackgroundColor3"] = v_u_56.color("HubBarContainer"),
			["BackgroundTransparency"] = v_u_56.transparency("HubBarContainerTransparency"),
			["Size"] = UDim2.new(1, 0, 1, 0),
			["Position"] = UDim2.new(0, 0, 0, 0)
		}
		local v446
		if v_u_66.FFlagAddSwitchTabHintsToIEM then
			v446 = v_u_143.TabHeaderContainer
		else
			v446 = v_u_143.HubBar
		end
		v445.Parent = v446
		local v447
		if v_u_66.FFlagIEMTabFocusNav then
			v447 = false
		else
			v447 = nil
		end
		v445.Selectable = v447
		v445.SelectionGroup = v_u_66.FFlagIEMTabFocusNav and true or nil
		local v448
		if v_u_66.FFlagIEMTabFocusNav then
			v448 = Enum.SelectionBehavior.Stop
		else
			v448 = nil
		end
		v445.SelectionBehaviorUp = v448
		local v449
		if v_u_66.FFlagIEMTabFocusNav then
			v449 = Enum.SelectionBehavior.Stop
		else
			v449 = nil
		end
		v445.SelectionBehaviorLeft = v449
		local v450
		if v_u_66.FFlagIEMTabFocusNav then
			v450 = Enum.SelectionBehavior.Stop
		else
			v450 = nil
		end
		v445.SelectionBehaviorRight = v450
		v443.HubBarContainer = v444(v445)
		v_u_143.HubBar.ImageTransparency = 1
		v_u_143.HubBarListLayout.Parent = v_u_143.HubBarContainer
		if v_u_34() then
			v_u_143.FullScreenTitleBar = v_u_95.mount({}, v_u_143.Shield, "FullScreenTitleBar")
		end
		local function v_u_451() -- name: cameraViewportChanged
			-- upvalues: (ref) v_u_56, (ref) v_u_29
			v_u_56.viewportResized()
			v_u_29:FireOnResized()
		end
		local v_u_452 = nil
		local function v454(p453) -- name: onWorkspaceChanged
			-- upvalues: (ref) v_u_56, (ref) v_u_29, (ref) v_u_452, (copy) v_u_451
			if p453 == "CurrentCamera" then
				v_u_56.viewportResized()
				v_u_29:FireOnResized()
				if v_u_452 then
					v_u_452:disconnect()
				end
				v_u_452 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v_u_451)
			end
		end
		v_u_56.viewportResized()
		v_u_29:FireOnResized()
		if v_u_452 then
			v_u_452:disconnect()
		end
		v_u_452 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v_u_451)
		workspace.Changed:Connect(v454)
	end
	local function v_u_462() -- name: resizeBottomBarButtons
		-- upvalues: (copy) v_u_143, (ref) v_u_66
		local v456 = v_u_143.BottomButtonFrame.AbsoluteSize.X
		local v457 = #v_u_143.BottomBarButtons
		if v457 == 4 then
			v456 = v456 - 48 - 12
			v457 = v457 - 1
		end
		local v458 = (v456 - (v457 - 1) * 12 - 12) / v457
		if v_u_66.isInExperienceUIVREnabled then
			v458 = v_u_143.SettingsUIDelegate:getBottomButtonSize(v458)
		end
		for v459 = 1, #v_u_143.BottomBarButtons do
			local v460 = v_u_143.BottomBarButtons[v459]
			local v461 = v460[1]
			if v461 == "MuteButtonButton" then
				continue
			end
			v_u_143[v461].Size = UDim2.fromOffset(v458, v_u_143[v460[1]].Size.Y.Offset)
		end
	end
	local function v_u_541() -- name: onScreenSizeChanged
		-- upvalues: (ref) v_u_128, (ref) v_u_127, (ref) v_u_115, (ref) v_u_123, (ref) v_u_117, (ref) v_u_126, (ref) v_u_12, (copy) v_u_143, (ref) v_u_66, (ref) v_u_29, (ref) v_u_56, (copy) v_u_278, (copy) v_u_279, (ref) v_u_15, (ref) v_u_75, (ref) v_u_119, (ref) v_u_121, (ref) v_u_129, (ref) v_u_74, (copy) v_u_168, (copy) v_u_176, (copy) v_u_164, (copy) v_u_181, (ref) v_u_120
		if v_u_128 then
			local v463 = v_u_127
			if v463 then
				v463 = v_u_115()
			end
			local v464 = v463 and v_u_123()
			if v464 then
				v464 = v_u_117()
			end
			if v464 and v_u_126(v_u_12.AbsoluteSize.X) then
				return
			end
		end
		if v_u_66.FFlagRelocateMobileMenuButtons and (v_u_66.FIntRelocateMobileMenuButtonsVariant == 2 and v_u_143.Visible) then
			if (v_u_29:IsPortrait() or v_u_29:IsSmallTouchScreen()) and not v_u_56.AlwaysShowBottomBar() then
				if v_u_143.BottomButtonFrameRoot then
					v_u_279()
				end
				if v_u_143.PlayersPage then
					v_u_143.PlayersPage:CreateMenuButtonsContainer()
				end
			else
				if not v_u_143.BottomButtonFrameRoot then
					v_u_278()
				end
				if v_u_143.PlayersPage then
					v_u_143.PlayersPage:UnmountMenuButtonsContainer()
				end
			end
		end
		local v465 = v_u_56.MenuContainerPosition(v_u_143.SettingsUIDelegate)
		local v466 = 600
		local v467
		if v_u_66.isInExperienceUIVREnabled then
			v467 = v_u_143.SettingsUIDelegate:getFullScreenSize()
		else
			v467 = v_u_12.AbsoluteSize.y
		end
		local v468 = 0.050000000000000044 * v467
		local v469 = v_u_29:IsPortrait()
		if v_u_15 then
			v468 = 0.07 * v467
			v466 = 800
		elseif v_u_29:IsSmallTouchScreen() then
			local v470 = 0.010000000000000009 * v467
			v468 = math.min(10, v470)
		elseif v_u_66.isInExperienceUIVREnabled and v_u_75.VREnabled then
			v468 = 0
		end
		local v471 = v465.Position
		local v472 = v465.AnchorPoint
		local v473 = v_u_127
		if v473 then
			v473 = v_u_115()
		end
		local v474 = v473 and v_u_123()
		if v474 then
			v474 = v_u_117()
		end
		local v475 = not v474 and 0 or v_u_119()
		if v475 > 0 then
			local v476 = v475 / 2
			v471 = UDim2.new(v471.X.Scale, v471.X.Offset + v476, 0.5, 0)
			v472 = Vector2.new(v472.X, 0.5)
		end
		v_u_143.MenuContainer.Size = v465.Size
		v_u_143.MenuContainer.Position = v471
		v_u_143.MenuContainer.AnchorPoint = v472
		local v477 = v_u_143.HubBar.Size.Y.Offset
		local _ = v468 * 2 + v477 * 2
		local v478 = 0
		if not v_u_66.FFlagAddTraversalBackButton then
			local v479
			if v_u_143.BackBarRef:getValue() then
				v479 = v_u_143.BackBarRef:getValue().Visible
			else
				v479 = false
			end
			if v479 and v_u_143.BackBarRef:getValue() then
				v478 = v_u_143.BackBarRef:getValue().Size.Y.Offset
			end
			if v_u_66.EngineFeatureTeleportHistoryButtons then
				local v480
				if v_u_143.FrontBarRef:getValue() then
					v480 = v_u_143.FrontBarRef:getValue().Visible
				else
					v480 = false
				end
				if v480 and v_u_143.FrontBarRef:getValue() then
					v478 = v478 + v_u_143.FrontBarRef:getValue().Size.Y.Offset
				end
			end
		end
		if v469 then
			v_u_143.HubBar.Position = UDim2.new(0.5, 0, 0, 10)
			local v481 = v_u_143.HubBar
			local v482 = UDim2.new
			local v483 = 0
			local v484 = v_u_12.AbsoluteSize.X - 40
			local v485 = v_u_127
			if v485 then
				v485 = v_u_115()
			end
			local v486 = v485 and v_u_123()
			if v486 then
				v486 = v_u_117()
			end
			local v487 = not v486 and 0 or v_u_119()
			if v487 > 0 then
				local v488 = v_u_56.HubPadding()
				local v489 = v_u_121(v_u_12.AbsoluteSize.X, v487, v488.PaddingLeft.Offset + v488.PaddingRight.Offset)
				local v490 = math.min(v484, v489)
				v484 = math.max(150, v490)
			end
			v481.Size = v482(v483, v484, 0, 54)
		elseif v_u_15 then
			v_u_143.HubBar.Size = UDim2.new(0, 1200, 0, 100)
		elseif v_u_29:IsSmallTouchScreen() then
			local v491 = v_u_143.HubBar
			local v492 = UDim2.new
			local v493 = 0
			local v494 = v_u_12.AbsoluteSize.X - 60
			local v495 = v_u_127
			if v495 then
				v495 = v_u_115()
			end
			local v496 = v495 and v_u_123()
			if v496 then
				v496 = v_u_117()
			end
			local v497 = not v496 and 0 or v_u_119()
			if v497 > 0 then
				local v498 = v_u_56.HubPadding()
				local v499 = v_u_121(v_u_12.AbsoluteSize.X, v497, v498.PaddingLeft.Offset + v498.PaddingRight.Offset)
				local v500 = math.min(v494, v499)
				v494 = math.max(150, v500)
			end
			v491.Size = v492(v493, v494, 0, 52)
		elseif v_u_66.isInExperienceUIVREnabled then
			local v501 = v_u_143.HubBar
			local v502 = UDim2.new
			local v503 = 0
			local v504 = v_u_143.SettingsUIDelegate:getHubBarSize()
			local v505 = v_u_127
			if v505 then
				v505 = v_u_115()
			end
			local v506 = v505 and v_u_123()
			if v506 then
				v506 = v_u_117()
			end
			local v507 = not v506 and 0 or v_u_119()
			if v507 > 0 then
				local v508 = v_u_56.HubPadding()
				local v509 = v_u_121(v_u_12.AbsoluteSize.X, v507, v508.PaddingLeft.Offset + v508.PaddingRight.Offset)
				local v510 = math.min(v504, v509)
				v504 = math.max(150, v510)
			end
			v501.Size = v502(v503, v504, 0, 60)
		else
			local v511 = v_u_143.HubBar
			local v512 = UDim2.new
			local v513 = 0
			local v514 = v_u_127
			if v514 then
				v514 = v_u_115()
			end
			local v515 = v514 and v_u_123()
			if v515 then
				v515 = v_u_117()
			end
			local v516 = not v515 and 0 or v_u_119()
			local v517
			if v516 <= 0 then
				v517 = 800
			else
				local v518 = v_u_56.HubPadding()
				local v519 = v_u_121(v_u_12.AbsoluteSize.X, v516, v518.PaddingLeft.Offset + v518.PaddingRight.Offset)
				local v520 = math.min(800, v519)
				v517 = math.max(150, v520)
			end
			v511.Size = v512(v513, v517, 0, 60)
		end
		local v521
		if v_u_129 or not v_u_56.AlwaysShowBottomBar() then
			v521 = v_u_143.HubBar.Size.Y.Offset
		else
			v521 = v_u_143.HubBar.Size.Y.Offset + v_u_143.BottomButtonFrame.Size.Y.Offset
		end
		local v522 = v468 * 2
		local v523
		if v_u_66.FFlagFixDisableTopPaddingError and v_u_143.Pages.CurrentPage == nil then
			v523 = v521
		else
			v523 = v_u_143.Pages.CurrentPage.DisableTopPadding and 0 or v521
		end
		local v524 = v522 + v523
		if not v_u_66.FFlagAddTraversalBackButton then
			local v525
			if v_u_143.BackBarRef:getValue() then
				v525 = v_u_143.BackBarRef:getValue().Visible
			else
				v525 = false
			end
			v478 = not (v525 and v_u_143.BackBarRef:getValue()) and 0 or v_u_143.BackBarRef:getValue().Size.Y.Offset
			if v_u_66.EngineFeatureTeleportHistoryButtons then
				local v526
				if v_u_143.FrontBarRef:getValue() then
					v526 = v_u_143.FrontBarRef:getValue().Visible
				else
					v526 = false
				end
				if v526 and v_u_143.FrontBarRef:getValue() then
					v478 = v478 + v_u_143.FrontBarRef:getValue().Size.Y.Offset
				end
			end
		end
		v_u_74.Heartbeat:wait()
		if v_u_168() then
			v_u_176()
			v_u_164(v_u_143.Pages.CurrentPage)
		else
			v_u_181()
		end
		if v_u_66.isInExperienceUIVREnabled then
			v524 = v524 + v_u_143.SettingsUIDelegate:getMenuContainerExtraSpace()
		end
		local v527 = v467 - v524 - v478
		if v_u_66.FFlagRelocateMobileMenuButtons and (v_u_66.FIntRelocateMobileMenuButtonsVariant == 1 or v_u_66.FIntRelocateMobileMenuButtonsVariant == 3) and v_u_29:IsSmallTouchScreen() then
			v527 = v527 - v_u_56.ExtraHubBottomPaddingMobile
		end
		local v528 = v_u_127
		if v528 then
			v528 = v_u_115()
		end
		local v529 = v528 and v_u_123()
		if v529 then
			v529 = v_u_117()
		end
		if v529 then
			local v530 = v_u_120
			local v531 = v_u_143.Shield.AbsoluteSize.Y
			local v532 = v_u_56.HubPadding()
			v527 = v530(v531, v521 + v532.PaddingTop.Offset + v532.PaddingBottom.Offset + v478)
		end
		if v_u_127 then
			local v533 = v_u_143.PageView
			local v534 = v_u_127
			if v534 then
				v534 = v_u_115()
			end
			local v535 = v534 and v_u_123()
			if v535 then
				v535 = v_u_117()
			end
			local v536
			if v535 then
				v536 = Enum.ScrollBarInset.Always
			else
				v536 = Enum.ScrollBarInset.ScrollBar
			end
			v533.VerticalScrollBarInset = v536
		end
		if v469 then
			v466 = v527
		elseif v466 < v527 then
			v_u_143.HubBar.Position = UDim2.new(v_u_143.HubBar.Position.X.Scale, v_u_143.HubBar.Position.X.Offset, 0.5, -v466 / 2 - v_u_143.HubBar.Size.Y.Offset)
			if v_u_143.BottomButtonFrame then
				v_u_143.BottomButtonFrame.Position = UDim2.new(v_u_143.BottomButtonFrame.Position.X.Scale, v_u_143.BottomButtonFrame.Position.X.Offset, 0.5, v466 / 2)
			end
		elseif v527 < 150 then
			v466 = 150
			v_u_143.HubBar.Position = UDim2.new(v_u_143.HubBar.Position.X.Scale, v_u_143.HubBar.Position.X.Offset, 0.5, -75 - v_u_143.HubBar.Size.Y.Offset)
			if v_u_143.BottomButtonFrame then
				v_u_143.BottomButtonFrame.Position = UDim2.new(v_u_143.BottomButtonFrame.Position.X.Scale, v_u_143.BottomButtonFrame.Position.X.Offset, 0.5, 75)
			end
		else
			v_u_143.HubBar.Position = UDim2.new(v_u_143.HubBar.Position.X.Scale, v_u_143.HubBar.Position.X.Offset, 0, v468)
			if v_u_143.BottomButtonFrame then
				v_u_143.BottomButtonFrame.Position = UDim2.new(v_u_143.BottomButtonFrame.Position.X.Scale, v_u_143.BottomButtonFrame.Position.X.Offset, 1, -(v468 + v521))
				v466 = v527
			else
				v466 = v527
			end
		end
		local v537
		if v_u_15 then
			v537 = UDim2.new(0, v_u_143.HubBar.AbsoluteSize.X, 0, v466)
		elseif v_u_29:IsSmallTouchScreen() then
			if v_u_66.FFlagRelocateMobileMenuButtons and (v_u_66.FIntRelocateMobileMenuButtonsVariant == 1 or v_u_66.FIntRelocateMobileMenuButtonsVariant == 3) then
				v537 = UDim2.new(0, v_u_143.HubBar.AbsoluteSize.X, 0, v466 + 0 + 0 - v_u_143.BottomButtonFrame.Size.Y.Offset)
			else
				v537 = UDim2.new(0, v_u_143.HubBar.AbsoluteSize.X, 0, v466 + 0 + 0)
			end
		else
			v537 = UDim2.new(0, v_u_143.HubBar.AbsoluteSize.X, 0, v466)
		end
		if v_u_66.FFlagRelocateMobileMenuButtons and (v_u_66.FIntRelocateMobileMenuButtonsVariant ~= 0 and v_u_143.BottomButtonFrame) then
			v_u_143.BottomButtonFrame.Size = UDim2.new(0, v_u_143.HubBar.Size.X.Offset, 0, v_u_143.HubBar.Size.Y.Offset)
		end
		local v538 = v_u_56.HubPadding()
		local v539 = v538.PaddingLeft.Offset + v538.PaddingRight.Offset
		local v540 = v538.PaddingTop.Offset + v538.PaddingBottom.Offset
		v_u_143.ReactPage.Size = UDim2.new(0, v_u_143.HubBar.AbsoluteSize.X + v539, 0, v466 + v521 + v540)
		v_u_143.PageViewClipper.Size = v537
		if v469 then
			v_u_143.PageViewClipper.Position = UDim2.new(0.5, 0, 0, v_u_143.HubBar.Position.Y.Offset + v_u_143.HubBar.AbsoluteSize.Y)
		else
			v_u_143.PageViewClipper.Position = UDim2.new(v_u_143.PageViewClipper.Position.X.Scale, v_u_143.PageViewClipper.Position.X.Offset, 0.5, -v466 / 2)
		end
	end
	if v_u_127 then
		local function v_u_550() -- name: scheduleSideSheetPeoplePageLayoutRefresh
			-- upvalues: (ref) v_u_127, (ref) v_u_115, (ref) v_u_123, (ref) v_u_117, (copy) v_u_143, (copy) v_u_541
			local v542 = v_u_127
			if v542 then
				v542 = v_u_115()
			end
			if v542 and (not v_u_123() and v_u_117()) then
				return
			else
				local v543 = v_u_127
				if v543 then
					v543 = v_u_115()
				end
				local v544 = v543 and v_u_123()
				if v544 then
					v544 = v_u_117()
				end
				local v545
				if v544 then
					v545 = Enum.SelectionBehavior.Escape
				else
					v545 = Enum.SelectionBehavior.Stop
				end
				if v_u_143.Modal then
					local v546 = v_u_143.Modal
					local v547 = v_u_143.Visible
					if v547 then
						local v548 = v_u_127
						if v548 then
							v548 = v_u_115()
						end
						local v549 = v548 and v_u_123()
						if v549 then
							v549 = v_u_117()
						end
						v547 = not v549
					end
					v546.Visible = v547
				end
				if v_u_143.Page then
					v_u_143.Page.SelectionBehaviorLeft = v545
				end
				if v_u_143.PageViewClipper then
					v_u_143.PageViewClipper.SelectionBehaviorLeft = v545
				end
				if not v_u_143._sideSheetLayoutRefreshScheduled then
					v_u_143._sideSheetLayoutRefreshScheduled = true
					task.defer(function()
						-- upvalues: (ref) v_u_143, (ref) v_u_541
						v_u_143._sideSheetLayoutRefreshScheduled = false
						if v_u_143.Visible and v_u_143.MenuContainer then
							v_u_541()
						end
					end)
				end
			end
		end
		v_u_143._sideSheetLayoutEffectDispose = v_u_48.createEffect(function(p551)
			-- upvalues: (ref) v_u_123, (ref) v_u_119, (ref) v_u_117, (ref) v_u_115, (copy) v_u_550
			v_u_123(p551)
			v_u_119(p551)
			v_u_117(p551)
			v_u_115(p551)
			v_u_550()
		end)
	end
	local function v554(p552, p553, _) -- name: toggleQuickProfilerFromHotkey
		-- upvalues: (ref) v_u_73, (ref) v_u_78
		if v_u_73:IsKeyDown(Enum.KeyCode.LeftControl) or v_u_73:IsKeyDown(Enum.KeyCode.RightControl) then
			if p552 == "Show Quick Profiler" and (p553 and p553 == Enum.UserInputState.Begin) then
				v_u_78.PerformanceStatsVisible = not v_u_78.PerformanceStatsVisible
			end
		end
	end
	local function v557(p555, p556, _) -- name: toggleDevConsole
		-- upvalues: (ref) v_u_90
		if p555 == "Open Dev Console" and (p556 and p556 == Enum.UserInputState.Begin) then
			v_u_90:ToggleVisibility()
		end
	end
	local v_u_558 = v_u_14
	local v_u_559 = {
		[Enum.UserInputType.Gamepad1] = true,
		[Enum.UserInputType.Gamepad2] = true,
		[Enum.UserInputType.Gamepad3] = true,
		[Enum.UserInputType.Gamepad4] = true,
		[Enum.KeyCode.Left] = true,
		[Enum.KeyCode.Right] = true,
		[Enum.KeyCode.Up] = true,
		[Enum.KeyCode.Down] = true,
		[Enum.KeyCode.Tab] = true,
		[Enum.UserInputType.Touch] = false,
		[Enum.UserInputType.MouseButton1] = false,
		[Enum.UserInputType.MouseButton2] = false
	}
	v_u_73.InputBegan:connect(function(p560)
		-- upvalues: (copy) v_u_559, (ref) v_u_558
		if p560.UserInputType and v_u_559[p560.UserInputType] ~= nil then
			v_u_558 = v_u_559[p560.UserInputType]
		elseif p560.KeyCode and v_u_559[p560.KeyCode] then
			v_u_558 = v_u_559[p560.KeyCode]
		end
	end)
	v_u_73.InputChanged:connect(function(p561)
		-- upvalues: (ref) v_u_558
		if p561.KeyCode == Enum.KeyCode.Thumbstick1 or p561.KeyCode == Enum.KeyCode.Thumbstick2 then
			if p561.Position.magnitude >= 0.25 then
				v_u_558 = true
				return
			end
		elseif p561.UserInputType == Enum.UserInputType.Touch or p561.UserInputType == Enum.UserInputType.MouseMovement then
			v_u_558 = false
		end
	end)
	local v_u_562 = nil
	local function v_u_569(p563, p564)
		-- upvalues: (ref) v_u_66, (copy) v_u_143, (ref) v_u_562
		if v_u_66.FFlagInExperienceReportClosingBugfix and not v_u_143.HubBar.Visible then
			return
		else
			local v565 = v_u_562(v_u_143.Pages.CurrentPage)
			if v565 >= 0 then
				local v566 = v565 + p563
				if p564 then
					v566 = #v_u_143.TabHeaders < v566 and 1 or (v566 < 1 and #v_u_143.TabHeaders or v566)
				end
				local v567 = v_u_143.TabHeaders[v566]
				if v567 then
					for v568, _ in pairs(v_u_143.Pages.PageTable) do
						if v568:GetTabHeader() ~= v567 then
							continue
						end
						v_u_143:SwitchToPage(v568, true, p563)
						return
					end
				end
			end
		end
	end
	local function v_u_572(_, p570, p571)
		-- upvalues: (copy) v_u_569
		if p570 == Enum.UserInputState.Begin then
			v_u_569(p571.KeyCode == Enum.KeyCode.ButtonR1 and 1 or (p571.KeyCode == Enum.KeyCode.ButtonL1 and -1 or 0), true)
		end
	end
	local function v_u_574(p573)
		-- upvalues: (ref) v_u_73, (copy) v_u_569
		if p573.KeyCode == Enum.KeyCode.Tab then
			v_u_569((v_u_73:IsKeyDown(Enum.KeyCode.LeftShift) or v_u_73:IsKeyDown(Enum.KeyCode.RightShift)) and -1 or 1, true)
		end
	end
	local function v_u_577(_, p575, p576)
		-- upvalues: (copy) v_u_143
		if p575 == Enum.UserInputState.Begin then
			v_u_143:ScrollPixels(p576.KeyCode == Enum.KeyCode.PageUp and -100 or (p576.KeyCode == Enum.KeyCode.PageDown and 100 or 0))
		end
	end
	if v_u_66.isInExperienceUIVREnabled or v_u_66.FFlagEnableSettingsHubUIDelegateRollout then
		v_u_143.SettingsUIDelegate = require(v_u_12.Modules.Settings.SettingsUIDelegate).new(v_u_143)
	end
	v455()
	if v_u_108 then
		v238()
	end
	v_u_562 = function(p578) -- name: GetHeaderPosition
		-- upvalues: (copy) v_u_143
		local v579 = p578:GetTabHeader()
		if not v579 then
			return -1
		end
		for v580, v581 in pairs(v_u_143.TabHeaders) do
			if v581 ~= v579 then
				continue
			end
			return v580
		end
		return -1
	end
	local function v_u_586(p582, p583)
		-- upvalues: (ref) v_u_586
		if p583:IsA("GuiObject") then
			p583.ZIndex = p582
			local v584 = p583:GetChildren()
			for v585 = 1, #v584 do
				v_u_586(p582, v584[v585])
			end
		end
	end
	local function v_u_592(p587, p588) -- name: AddHeader
		-- upvalues: (copy) v_u_143, (ref) v_u_586
		if p587 then
			local v589 = v_u_143.TabHeaders
			table.insert(v589, p587)
			p588.TabPosition = #v_u_143.TabHeaders
			local v590 = 1 / #v_u_143.TabHeaders
			for v591 = 1, #v_u_143.TabHeaders do
				v_u_143.TabHeaders[v591].Size = UDim2.new(v590, 0, 1, 0)
			end
			v_u_586(3, p587)
			p587.Parent = v_u_143.HubBarContainer
		end
	end
	local function v_u_598(p593) -- name: RemoveHeader
		-- upvalues: (copy) v_u_143
		local v594 = nil
		for v595 = 1, #v_u_143.TabHeaders do
			if v_u_143.TabHeaders[v595] ~= p593 then
				continue
			end
			table.remove(v_u_143.TabHeaders, v595)
			v594 = v595
		end
		if v594 then
			for v596 = v594, #v_u_143.TabHeaders do
				local v597 = v_u_143.TabHeaders[v596]
				v597.Position = UDim2.new(v597.Position.X.Scale, v597.Position.X.Offset - p593.AbsoluteSize.X, v597.Position.Y.Scale, v597.Position.Y.Offset)
			end
		end
		p593.Parent = nil
	end
	function v_u_143.AddPage(_, p_u_599) -- name: AddPage
		-- upvalues: (copy) v_u_143, (copy) v_u_592, (copy) v_u_164, (ref) v_u_66
		v_u_143.Pages.PageTable[p_u_599] = true
		v_u_592(p_u_599:GetTabHeader(), p_u_599)
		p_u_599.Page.Position = UDim2.new(p_u_599.TabPosition - 1, 0, 0, 0)
		p_u_599.LastSelectableObjectsUpdated:connect(function()
			-- upvalues: (ref) v_u_164, (copy) p_u_599
			v_u_164(p_u_599)
		end)
		if v_u_66.FFlagIEMTabFocusNav then
			if v_u_66.FFlagIEMTabFocusNav then
				local v600 = p_u_599:GetTabHeader()
				if v600 then
					for _, v601 in p_u_599.FirstSelectableObjects do
						v601.NextSelectionUp = v600
						v600.NextSelectionDown = v601
					end
				end
			end
			if v_u_66.FFlagIEMTabFocusNav then
				for _, v602 in v_u_143.TabHeaders do
					v602.NextSelectionLeft = nil
					v602.NextSelectionRight = nil
				end
				local v603 = #v_u_143.TabHeaders
				if v603 >= 2 then
					v_u_143.TabHeaders[1].NextSelectionLeft = v_u_143.TabHeaders[v603]
					v_u_143.TabHeaders[v603].NextSelectionRight = v_u_143.TabHeaders[1]
				end
			end
			p_u_599.FirstSelectableObjectsUpdated:connect(function()
				-- upvalues: (copy) p_u_599, (ref) v_u_66
				local v604 = p_u_599
				if v_u_66.FFlagIEMTabFocusNav then
					local v605 = v604:GetTabHeader()
					if v605 then
						for _, v606 in v604.FirstSelectableObjects do
							v606.NextSelectionUp = v605
							v605.NextSelectionDown = v606
						end
					end
				else
					return
				end
			end)
		end
	end
	function v_u_143.RemovePage(_, p607) -- name: RemovePage
		-- upvalues: (copy) v_u_143, (copy) v_u_598, (ref) v_u_66
		v_u_143.Pages.PageTable[p607] = nil
		v_u_598(p607:GetTabHeader())
		p607.LastSelectableObjectsUpdated:disconnect()
		if v_u_66.FFlagIEMTabFocusNav then
			p607.FirstSelectableObjectsUpdated:disconnect()
			if not v_u_66.FFlagIEMTabFocusNav then
				return
			end
			for _, v608 in v_u_143.TabHeaders do
				v608.NextSelectionLeft = nil
				v608.NextSelectionRight = nil
			end
			local v609 = #v_u_143.TabHeaders
			if v609 < 2 then
				return
			end
			v_u_143.TabHeaders[1].NextSelectionLeft = v_u_143.TabHeaders[v609]
			v_u_143.TabHeaders[v609].NextSelectionRight = v_u_143.TabHeaders[1]
		end
	end
	function v_u_143.HideBar(_) -- name: HideBar
		-- upvalues: (copy) v_u_143, (copy) v_u_181
		v_u_143.HubBar.Visible = false
		v_u_143.PageViewClipper.Visible = false
		if v_u_143.BottomButtonFrame then
			v_u_181()
		end
	end
	function v_u_143.ShowBar(_) -- name: ShowBar
		-- upvalues: (copy) v_u_143, (copy) v_u_168, (copy) v_u_176, (copy) v_u_164
		v_u_143.HubBar.Visible = true
		v_u_143.PageViewClipper.Visible = true
		if v_u_143.BottomButtonFrame and v_u_168() then
			v_u_176()
			v_u_164(v_u_143.Pages.CurrentPage)
		end
	end
	function v_u_143.ScrollPixels(_, p610) -- name: ScrollPixels
		-- upvalues: (copy) v_u_143
		local v611 = v_u_143.PageView.CanvasPosition.Y
		local v612 = v_u_143.PageView.CanvasSize.Y.Offset - v_u_143.PageViewClipper.AbsoluteSize.y
		local v613 = v611 + p610
		local v614 = math.min(v613, v612)
		local v615 = math.max(0, v614)
		v_u_143.PageView.CanvasPosition = Vector2.new(0, v615)
	end
	function v_u_143.ScrollToFrame(_, p616, p617) -- name: ScrollToFrame
		-- upvalues: (ref) v_u_558, (copy) v_u_143, (ref) v_u_104
		if v_u_558 or p617 then
			local v618 = p616.AbsolutePosition.y - v_u_143.Pages.CurrentPage.Page.AbsolutePosition.y
			local v619 = v618 + p616.AbsoluteSize.y
			if v618 < v_u_143.PageView.CanvasPosition.y then
				v_u_143.PageView.CanvasPosition = Vector2.new(0, v618)
				return
			end
			if v_u_143.Pages.CurrentPage.Page.Name == v_u_104.PeoplePageKey and v619 - v_u_143.PageView.CanvasPosition.y > v_u_143.PageView.AbsoluteSize.Y - v_u_104.PeoplePageScrollBuffer then
				v_u_143.PageView.CanvasPosition = Vector2.new(0, v619 - v_u_143.PageView.AbsoluteSize.Y + v_u_104.PeoplePageScrollBuffer)
				return
			end
			if v619 - v_u_143.PageView.CanvasPosition.y > v_u_143.PageViewClipper.Size.Y.Offset then
				v_u_143.PageView.CanvasPosition = Vector2.new(0, v619 - v_u_143.PageViewClipper.Size.Y.Offset)
			end
		end
	end
	function v_u_143.GetFirstPageWithTabHeader(_) -- name: GetFirstPageWithTabHeader
		-- upvalues: (copy) v_u_143
		local v620 = nil
		for v621, _ in pairs(v_u_143.Pages.PageTable) do
			if v621:GetTabHeader() == nil or v621.TabPosition ~= 1 then
				continue
			end
			v620 = v621
		end
		if v620 ~= nil then
			return v620
		end
		error("No page with tab header found")
		return nil
	end
	function v_u_143.InitInPage(_, p622) -- name: InitInPage
		-- upvalues: (copy) v_u_143, (ref) v_u_66, (ref) v_u_29, (copy) v_u_168, (copy) v_u_176, (copy) v_u_164, (ref) v_u_129, (ref) v_u_149
		local v623 = p622.TabPosition
		for v624, _ in pairs(v_u_143.Pages.PageTable) do
			if v624 == p622 then
				continue
			end
			v624:Hide(-1, v623, true, nil, v_u_143.PageViewInnerFrame)
		end
		if (not v_u_66.FFlagRelocateMobileMenuButtons or (v_u_66.FIntRelocateMobileMenuButtonsVariant == 0 or v_u_66.FIntRelocateMobileMenuButtonsVariant == 2 and v_u_29:IsSmallTouchScreen())) and v_u_143.BottomButtonFrame then
			if v_u_168(p622) then
				v_u_176()
				v_u_164(p622)
			else
				v_u_143.BottomButtonFrame.Visible = false
			end
			local v625 = v_u_143.HubBar
			local v626 = p622 or v_u_143.Pages.CurrentPage
			local v627
			if v_u_129 then
				v627 = v626.ShouldShowHubBar == true
			else
				v627 = v626.ShouldShowBottomBar == true
			end
			v625.Visible = v627
		end
		local v628 = p622.IsPageClipped == true
		v_u_143.PageViewClipper.ClipsDescendants = v628
		v_u_143.PageView.ClipsDescendants = v628
		v_u_143.PageViewInnerFrame.ClipsDescendants = v628
		v_u_143.Pages.CurrentPage = p622
		v_u_143.Pages.CurrentPage.Active = true
		v_u_143.CurrentPageSignal:fire(v_u_143.Pages.CurrentPage and v_u_143.Pages.CurrentPage.Page.Name or nil)
		if v_u_129 then
			local v629 = v_u_143.Pages.CurrentPage
			local v630 = v629 or v_u_143.Pages.CurrentPage
			local v631
			if v_u_129 then
				v631 = v630.ShouldShowHubBar == true
			else
				v631 = v630.ShouldShowBottomBar == true
			end
			if v631 and v629.TabHeader then
				v_u_143.PageTitleLabel.Text = v629.TabHeader.TabLabel.Title.Text
			else
				v_u_143.PageTitleLabel.Text = ""
			end
		end
		local v632 = v_u_143.Pages.CurrentPage:GetSize()
		v_u_143.PageView.CanvasSize = UDim2.new(0, 0, 0, v632.Y)
		v_u_149 = v_u_143.Pages.CurrentPage.Page.Changed:connect(function(p633)
			-- upvalues: (ref) v_u_143
			if p633 == "AbsoluteSize" then
				local v634 = v_u_143.Pages.CurrentPage:GetSize()
				v_u_143.PageView.CanvasSize = UDim2.new(0, 0, 0, v634.Y)
			end
		end)
	end
	function v_u_143.SwitchToPage(_, p635, p636, p637, p638, _, p639) -- name: SwitchToPage
		-- upvalues: (copy) v_u_143, (ref) v_u_66, (ref) v_u_109, (ref) v_u_29, (ref) v_u_56, (ref) v_u_129, (copy) v_u_168, (ref) v_u_127, (ref) v_u_115, (ref) v_u_123, (ref) v_u_117, (ref) v_u_119, (ref) v_u_149, (ref) v_u_150, (copy) v_u_176, (copy) v_u_164, (copy) v_u_541, (ref) v_u_17, (ref) v_u_41, (ref) v_u_1, (ref) v_u_104, (ref) v_u_65, (ref) v_u_79, (ref) v_u_27
		if v_u_143.Pages.PageTable[p635] == nil then
			return
		elseif not v_u_66.FFlagPreventHiddenSwitchPage or v_u_143:GetVisibility() ~= false then
			if v_u_109 then
				if p635.Page.Name == "ReportAbuseMenuNewContainerPage" then
					v_u_143.PageViewInnerFrame.UIPadding.PaddingTop = UDim.new(0, 0)
				else
					v_u_143.PageViewInnerFrame.UIPadding.PaddingTop = UDim.new(0, 5)
				end
			end
			local v640 = UDim.new(0, 0)
			local v641 = UDim.new(0, 0)
			local v642 = not (v_u_29:IsPortrait() or v_u_29:IsSmallTouchScreen()) or v_u_56.AlwaysShowBottomBar()
			local v643 = v_u_66.FFlagRelocateMobileMenuButtons and (v_u_66.FIntRelocateMobileMenuButtonsVariant == 1 or (v_u_66.FIntRelocateMobileMenuButtonsVariant == 3 or v_u_66.FIntRelocateMobileMenuButtonsVariant == 2 and not v_u_29:IsSmallTouchScreen())) and true or v642
			if v_u_143.HubBar then
				local v644 = p635 or v_u_143.Pages.CurrentPage
				local v645
				if v_u_129 then
					v645 = v644.ShouldShowHubBar == true
				else
					v645 = v644.ShouldShowBottomBar == true
				end
				if not (v645 or p635.DisableTopPadding) then
					v640 = UDim.new(0, v_u_143.HubBar.AbsoluteSize.Y)
				end
			end
			if not v_u_129 and (v_u_143.BottomButtonFrame and (v643 and not v_u_168(p635))) then
				v641 = UDim.new(0, v_u_143.BottomButtonFrame.AbsoluteSize.Y)
			end
			local v646 = v_u_56.HubPadding()
			v_u_143.MenuContainerPadding.PaddingLeft = v646.PaddingLeft
			v_u_143.MenuContainerPadding.PaddingRight = v646.PaddingRight
			v_u_143.MenuContainerPadding.PaddingBottom = v646.PaddingBottom + v641
			v_u_143.MenuContainerPadding.PaddingTop = v646.PaddingTop + v640
			local v647 = v_u_56.MenuContainerPosition(v_u_143.SettingsUIDelegate)
			local v648 = v647.Position
			local v649 = v647.AnchorPoint
			local v650 = v_u_127
			if v650 then
				v650 = v_u_115()
			end
			local v651 = v650 and v_u_123()
			if v651 then
				v651 = v_u_117()
			end
			local v652 = not v651 and 0 or v_u_119()
			if v652 > 0 then
				local v653 = v652 / 2
				v648 = UDim2.new(v648.X.Scale, v648.X.Offset + v653, 0.5, 0)
				v649 = Vector2.new(v649.X, 0.5)
			end
			v_u_143.MenuContainer.Position = v648
			v_u_143.MenuContainer.Size = v647.Size
			v_u_143.MenuContainer.AnchorPoint = v649
			local v654 = p637 == nil and (v_u_143.Pages.CurrentPage and (v_u_143.Pages.CurrentPage.TabHeader and (p635 and p635.TabHeader))) and (v_u_143.Pages.CurrentPage.TabHeader.AbsolutePosition.x < p635.TabHeader.AbsolutePosition.x and 1 or -1) or p637
			local v655 = v654 == nil and 1 or v654
			if v_u_143.Pages.CurrentPage and v_u_149 ~= nil then
				v_u_149:disconnect()
				v_u_143.Pages.CurrentPage.Active = false
			end
			if v_u_66.FFlagFixDisabledScrollOnIos and v_u_150 ~= nil then
				v_u_150:Disconnect()
				v_u_150 = nil
			end
			local v656 = p635.TabPosition
			for v657, _ in pairs(v_u_143.Pages.PageTable) do
				if v657 == p635 then
					continue
				end
				v657:Hide(-v655, v656, p638, nil, v_u_143.PageViewInnerFrame, v657 == v_u_143.Pages.CurrentPage)
			end
			if v_u_143.BottomButtonFrame then
				if v_u_168(p635) then
					v_u_176()
					v_u_164(p635)
				else
					v_u_143.BottomButtonFrame.Visible = false
				end
				local v658 = v_u_143.HubBar
				local v659 = p635 or v_u_143.Pages.CurrentPage
				local v660
				if v_u_129 then
					v660 = v659.ShouldShowHubBar == true
				else
					v660 = v659.ShouldShowBottomBar == true
				end
				v658.Visible = v660
			end
			if v_u_66.FFlagIEMTabFocusNav and v_u_66.FFlagIEMTabFocusNav then
				local v661 = p635:GetTabHeader()
				if v661 then
					for _, v662 in p635.FirstSelectableObjects do
						v662.NextSelectionUp = v661
						v661.NextSelectionDown = v662
					end
				end
			end
			local v663 = p635.IsPageClipped == true
			v_u_143.PageViewClipper.ClipsDescendants = v663
			v_u_143.PageView.ClipsDescendants = v663
			v_u_143.PageViewInnerFrame.ClipsDescendants = v663
			v_u_143.Pages.CurrentPage = p635
			v_u_143.Pages.CurrentPage:Display(v_u_143.PageViewInnerFrame, p638)
			v_u_143.Pages.CurrentPage.Active = true
			v_u_143.CurrentPageSignal:fire(v_u_143.Pages.CurrentPage and v_u_143.Pages.CurrentPage.Page.Name or nil)
			if v_u_129 then
				local v664 = v_u_143.Pages.CurrentPage
				local v665 = v664 or v_u_143.Pages.CurrentPage
				local v666
				if v_u_129 then
					v666 = v665.ShouldShowHubBar == true
				else
					v666 = v665.ShouldShowBottomBar == true
				end
				if v666 and v664.TabHeader then
					v_u_143.PageTitleLabel.Text = v664.TabHeader.TabLabel.Title.Text
				else
					v_u_143.PageTitleLabel.Text = ""
				end
			end
			local v667 = nil or v_u_143.Pages.CurrentPage
			local v668
			if v667 == nil then
				v668 = false
			else
				v668 = v667.ShouldDisableDefaultScroll == true
			end
			if v668 then
				v_u_143.PageView.ScrollBarThickness = 0
				v_u_143.PageView.ScrollingEnabled = false
				v_u_143.PageView.CanvasPosition = Vector2.new(0, 0)
				v_u_143.PageView.CanvasSize = UDim2.new(1, 0, 1, 0)
				if v_u_66.FFlagFixDisabledScrollOnIos then
					v_u_150 = v_u_143.PageView:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
						-- upvalues: (ref) v_u_143
						if v_u_143.PageView.CanvasPosition.Magnitude > 0 then
							v_u_143.PageView.CanvasPosition = Vector2.new(0, 0)
						end
					end)
				end
			else
				v_u_143.PageView.ScrollBarThickness = v_u_56.DefaultScrollBarThickness
				v_u_143.PageView.ScrollingEnabled = true
				local v669 = v_u_143.Pages.CurrentPage:GetSize()
				v_u_143.PageView.CanvasSize = UDim2.new(0, 0, 0, v669.Y)
			end
			v_u_149 = v_u_143.Pages.CurrentPage.Page.Changed:connect(function(p670)
				-- upvalues: (ref) v_u_143
				if p670 == "AbsoluteSize" then
					local v671 = nil or v_u_143.Pages.CurrentPage
					local v672
					if v671 == nil then
						v672 = false
					else
						v672 = v671.ShouldDisableDefaultScroll == true
					end
					if not v672 then
						local v673 = v_u_143.Pages.CurrentPage:GetSize()
						v_u_143.PageView.CanvasSize = UDim2.new(0, 0, 0, v673.Y)
					end
				end
			end)
			if v_u_143.MenuStack[#v_u_143.MenuStack] ~= v_u_143.Pages.CurrentPage and not p636 then
				v_u_143.MenuStack[#v_u_143.MenuStack + 1] = v_u_143.Pages.CurrentPage
			end
			if p635.DisableTopPadding then
				v_u_541()
			end
			local v674 = {}
			local v675 = game.GameId
			v674.universeid = tostring(v675)
			if v_u_66.GetFFlagReportAbuseMenuEntrypointAnalytics() and p639 then
				v674 = v_u_17.Dictionary.join(v674, p639)
			end
			if v_u_66.FFlagRespawnChromeShortcutTelemetry and v674.used_shortcut == nil then
				v674.used_shortcut = false
			end
			if v674.playsessionid == nil then
				v674.playsessionid = v_u_143.playSessionId
			end
			if p635 then
				if v_u_66.FFlagHelpPageIXPExposure and (v_u_143.HelpPage == p635 and not v_u_143.HelpPageIXPFetched) then
					v_u_41:LogUserLayerExposure(v_u_66.FStringHelpPageIXPLayer)
					v_u_143.HelpPageIXPFetched = true
				end
				if v_u_143.GameSettingsPage == p635 then
					v_u_1:SetRBXEventStream(v_u_104.AnalyticsTargetName, "open_GameSettings_tab", v_u_104.AnalyticsMenuActionName, v674)
					if v_u_65.FFlagIEMSettingsLogExposureIXPFlags and not v_u_143.GameSettingsPageReorderIXPFetched then
						v_u_41:LogFlagLinkedUserLayerExposure(v_u_66.GetFStringInExperienceMenuIXPLayer())
						v_u_143.GameSettingsPageReorderIXPFetched = true
					end
				else
					v_u_1:SetRBXEventStream(v_u_104.AnalyticsTargetName, "open_" .. p635.Page.Name .. "_tab", v_u_104.AnalyticsMenuActionName, v674)
				end
				v_u_79:MenuSwitchToPage(p635.Page)
			else
				v_u_1:SetRBXEventStream(v_u_104.AnalyticsTargetName, "open_unknown_tab", v_u_104.AnalyticsMenuActionName, v674)
				v_u_79:CloseOpenedMenuTab()
			end
			if v_u_66.FFlagAddTraversalHistory and v_u_66.FFlagIntegrateTraversalHistoryInSideSheet then
				v_u_27(false).setCurrentReactPage(nil)
			end
		end
	end
	function v_u_143.SetActive(_, p676) -- name: SetActive
		-- upvalues: (copy) v_u_143
		v_u_143.Active = p676
		if v_u_143.Pages.CurrentPage then
			v_u_143.Pages.CurrentPage.Active = p676
		end
	end
	function clearMenuStack() -- name: clearMenuStack
		-- upvalues: (copy) v_u_143
		while v_u_143.MenuStack and #v_u_143.MenuStack > 0 do
			v_u_143:PopMenu()
		end
	end
	function setOverrideMouseIconBehavior() -- name: setOverrideMouseIconBehavior
		-- upvalues: (copy) v_u_143, (ref) v_u_73, (ref) v_u_75, (ref) v_u_33, (ref) v_u_60
		if v_u_143.Visible then
			if v_u_73:GetLastInputType() == Enum.UserInputType.Gamepad1 or v_u_75.VREnabled then
				v_u_33.push(v_u_60, Enum.OverrideMouseIconBehavior.ForceHide)
			else
				v_u_33.push(v_u_60, Enum.OverrideMouseIconBehavior.ForceShow)
			end
		else
			return
		end
	end
	function checkLeaveGameUpsell() -- name: checkLeaveGameUpsell
		-- upvalues: (ref) v_u_66, (copy) v_u_143, (ref) v_u_107, (ref) v_u_106, (ref) v_u_62
		if v_u_66.GetFFlagEnableLeaveGameUpsellEntrypoint() then
			if not v_u_143.sessionStartTime then
				v_u_143.sessionStartTime = os.time()
			end
			if v_u_143.sessionStartTime then
				if v_u_143.checkedUpsell or v_u_143.leaveGameUpsellProp ~= v_u_107.PHONE_UPSELL_VALUE_PROP.None then
					if v_u_143.checkedUpsell then
						local v677 = v_u_106:FetchPhoneVerificationUpsell(v_u_107.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, v_u_143.sessionStartTime, false)
						if v_u_143.leaveGameUpsellProp ~= v677 then
							v_u_143.leaveGameUpsellProp = v677
							v_u_143.LeaveGameUpsellPage:SetUpsellProp(v_u_143.leaveGameUpsellProp)
						end
					end
				else
					v_u_143.checkedUpsell = true
					v_u_143.leaveGameUpsellProp = v_u_106:FetchPhoneVerificationUpsell(v_u_107.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, v_u_143.sessionStartTime, true)
					v_u_143.LeaveGameUpsellPage:SetUpsellProp(v_u_143.leaveGameUpsellProp)
					task.delay(v_u_62, function()
						-- upvalues: (ref) v_u_143
						v_u_143.checkedUpsell = false
					end)
				end
			else
				return
			end
		else
			return
		end
	end
	local v_u_687 = v_u_66.FFlagSettingsHubIndependentBackgroundVisibility and function(p678, p679, p680)
		-- upvalues: (copy) v_u_143, (ref) v_u_110, (ref) v_u_104, (ref) v_u_127, (ref) v_u_115, (ref) v_u_123, (ref) v_u_117, (ref) v_u_118, (ref) v_u_66, (ref) v_u_56, (ref) v_u_8
		if v_u_143.DarkenBackground then
			if p678 or not (v_u_143.DarkenBackground.Visible and (v_u_110:getVisible() or v_u_143.Visible)) then
				local v681 = 1
				local v682 = Enum.EasingStyle.Quart
				local v683 = not v_u_104 and 0.4 or v_u_104.ShieldCloseAnimationTweenTime
				if p680 == nil then
					local v684 = v_u_127
					if v684 then
						v684 = v_u_115()
					end
					p680 = v684 and v_u_123()
					if p680 then
						p680 = v_u_117()
					end
				end
				if p680 then
					v683 = v_u_118()
				end
				if p678 then
					if v_u_66.isInExperienceUIVREnabled then
						v681 = v_u_143.SettingsUIDelegate:getDarkBackgroundTheme().Transparency
					else
						v681 = v_u_56.transparency("DarkenBackground")
					end
					v682 = Enum.EasingStyle.Quad
					v683 = not v_u_104 and 0.5 or v_u_104.ShieldOpenAnimationTweenTime
					local v685 = v_u_127
					if v685 then
						v685 = v_u_115()
					end
					if v685 and v_u_123() then
						v683 = v_u_118()
					end
				end
				if p679 then
					if v_u_143.DarkenBackgroundTween then
						v_u_143.DarkenBackgroundTween:Cancel()
						v_u_143.DarkenBackgroundTween = nil
					end
					v_u_143.DarkenBackground.BackgroundTransparency = v681
				else
					local v686 = TweenInfo.new(v683, v682, Enum.EasingDirection.Out)
					if v_u_143.DarkenBackgroundTween then
						v_u_143.DarkenBackgroundTween:Cancel()
					end
					v_u_143.DarkenBackgroundTween = v_u_8:Create(v_u_143.DarkenBackground, v686, {
						["BackgroundTransparency"] = v681
					})
					v_u_143.DarkenBackgroundTween:Play()
				end
				v_u_143.DarkenBackground.Visible = p678
			end
		else
			return
		end
	end or nil
	local function v_u_724(p688, p689, p690, _, p691) -- name: setVisibilityInternal
		-- upvalues: (ref) v_u_127, (ref) v_u_115, (ref) v_u_123, (ref) v_u_117, (copy) v_u_143, (ref) v_u_122, (ref) v_u_66, (ref) v_u_32, (ref) v_u_12, (ref) v_u_687, (copy) v_u_541, (ref) v_u_29, (copy) v_u_278, (ref) v_u_72, (ref) v_u_56, (ref) v_u_79, (ref) v_u_104, (ref) v_u_118, (ref) v_u_78, (ref) v_u_8, (ref) v_u_71, (ref) v_u_129, (copy) v_u_572, (copy) v_u_577, (copy) v_u_168, (copy) v_u_176, (copy) v_u_164, (ref) v_u_73, (copy) v_u_574, (ref) v_u_91, (ref) v_u_75, (ref) v_u_33, (ref) v_u_60, (copy) v_u_181, (ref) v_u_135, (ref) v_u_4, (ref) v_u_5, (ref) v_u_110, (ref) v_u_92, (copy) v_u_279, (ref) v_u_59, (ref) v_u_1
		local v692 = v_u_127
		if v692 then
			v692 = v_u_115()
		end
		local v693 = v692 and v_u_123()
		if v693 then
			v693 = v_u_117()
		end
		local v694 = v_u_127
		if v694 then
			v694 = v_u_115()
		end
		if v694 and (not p688 and v_u_143.Visible) then
			v_u_122(false)
		end
		if v_u_66.isInExperienceUIVREnabled then
			p689 = p689 or not v_u_143.SettingsUIDelegate:isOpenCloseAnimationAllowed()
		end
		v_u_143.OpenStateChangedCount = v_u_143.OpenStateChangedCount + 1
		local v695 = p688 ~= v_u_143.Visible
		v_u_143.Visible = p688
		if v_u_66.FFlagEnableInGameMenuDurationLogger and (v695 and not p688) then
			v_u_32.menuClose()
		end
		if v_u_143.ResizedConnection then
			v_u_143.ResizedConnection:disconnect()
			v_u_143.ResizedConnection = nil
		end
		if v_u_143.BackBarVisibleConnection then
			v_u_143.BackBarVisibleConnection:disconnect()
			v_u_143.BackBarVisibleConnection = nil
		end
		if v_u_66.EngineFeatureTeleportHistoryButtons and v_u_143.FrontBarVisibleConnection then
			v_u_143.FrontBarVisibleConnection:disconnect()
			v_u_143.FrontBarVisibleConnection = nil
		end
		if v_u_143.PreferredTransparencyChangedConnection then
			v_u_143.PreferredTransparencyChangedConnection:disconnect()
			v_u_143.PreferredTransparencyChangedConnection = nil
		end
		local v696 = v_u_143.Modal
		local v697
		if v_u_127 then
			v697 = v_u_143.Visible
			if v697 then
				local v698 = v_u_127
				if v698 then
					v698 = v_u_115()
				end
				local v699 = v698 and v_u_123()
				if v699 then
					v699 = v_u_117()
				end
				v697 = not v699
			end
		else
			v697 = v_u_143.Visible
		end
		v696.Visible = v697
		if v_u_143.TabConnection then
			v_u_143.TabConnection:disconnect()
			v_u_143.TabConnection = nil
		end
		local v700 = require(v_u_12.Modules.PlayerList.PlayerListManager)
		if v_u_66.FFlagSettingsHubIndependentBackgroundVisibility then
			v_u_687(v_u_143.Visible, p689, v693)
		end
		if v_u_143.Visible then
			v_u_143.ResizedConnection = v_u_12.Changed:connect(function(p701)
				-- upvalues: (ref) v_u_541
				if p701 == "AbsoluteSize" then
					v_u_541()
				end
			end)
			if v_u_66.FFlagMenuButtonsMountWithIEM then
				if v_u_66.FFlagRelocateMobileMenuButtons and (v_u_66.FIntRelocateMobileMenuButtonsVariant == 1 or (v_u_66.FIntRelocateMobileMenuButtonsVariant == 3 or v_u_66.FIntRelocateMobileMenuButtonsVariant == 2 and not v_u_29:IsSmallTouchScreen())) then
					v_u_278()
				end
				if v_u_66.FFlagRelocateMobileMenuButtons and (v_u_66.FIntRelocateMobileMenuButtonsVariant == 2 and (v_u_29:IsSmallTouchScreen() and v_u_143.PlayersPage)) then
					v_u_143.PlayersPage:CreateMenuButtonsContainer()
				end
			end
			if not v_u_66.FFlagAddTraversalBackButton then
				if v_u_143.BackBarRef:getValue() then
					v_u_143.BackBarVisibleConnection = v_u_143.BackBarRef:getValue():GetPropertyChangedSignal("Visible"):connect(function()
						-- upvalues: (ref) v_u_541
						v_u_541()
					end)
				end
				if v_u_66.EngineFeatureTeleportHistoryButtons and v_u_143.FrontBarRef:getValue() then
					v_u_143.FrontBarVisibleConnection = v_u_143.FrontBarRef:getValue():GetPropertyChangedSignal("Visible"):connect(function()
						-- upvalues: (ref) v_u_541
						v_u_541()
					end)
				end
			end
			v_u_541()
			v_u_143.PreferredTransparencyChangedConnection = v_u_72:GetPropertyChangedSignal("PreferredTransparency"):connect(function()
				-- upvalues: (ref) v_u_143, (ref) v_u_56, (ref) v_u_72
				v_u_143.MenuContainer.BackgroundTransparency = v_u_56.transparency("MenuContainer", 1) * v_u_72.PreferredTransparency
			end)
			v_u_143.MenuContainer.BackgroundTransparency = v_u_56.transparency("MenuContainer", 1) * v_u_72.PreferredTransparency
			v_u_143.SettingsShowSignal:fire(v_u_143.Visible)
			v_u_72:SetMenuIsOpen(true, "SettingsHub")
			v_u_79:OpenExperienceMenu()
			v_u_143.Shield.Visible = v_u_143.Visible
			v_u_72:CloseInspectMenu()
			if p689 or not v_u_143.Shield:IsDescendantOf(game) then
				v_u_143.Shield.Position = UDim2.new(0, 0, 0, 0)
				if not v_u_66.FFlagSettingsHubIndependentBackgroundVisibility and v_u_143.DarkenBackground then
					if v_u_143.DarkenBackgroundTween then
						v_u_143.DarkenBackgroundTween:Cancel()
						v_u_143.DarkenBackgroundTween = nil
					end
					v_u_143.DarkenBackground.BackgroundTransparency = v_u_56.transparency("DarkenBackground")
				end
			else
				local v702 = not v_u_104 and 0.5 or v_u_104.ShieldOpenAnimationTweenTime
				local v703 = v_u_127
				if v703 then
					v703 = v_u_115()
				end
				if v703 and v_u_123() then
					v702 = v_u_118()
				end
				if v_u_78.ReducedMotion then
					if v_u_143.ReducedMotionOpenTween then
						v_u_143.ReducedMotionOpenTween:Cancel()
						v_u_143.ReducedMotionOpenTween = nil
					end
					if v_u_143.ReducedMotionCloseTween then
						v_u_143.ReducedMotionCloseTween:Cancel()
						v_u_143.ReducedMotionCloseTween = nil
					end
					v_u_143.Shield.Parent = v_u_143.CanvasGroup
					v_u_143.CanvasGroup.GroupTransparency = 1
					v_u_143.CanvasGroup.Visible = true
					v_u_143.Shield.Position = UDim2.new(0, 0, 0, 0)
					local v704 = TweenInfo.new(0.25)
					v_u_143.ReducedMotionOpenTween = v_u_8:Create(v_u_143.CanvasGroup, v704, {
						["GroupTransparency"] = 0
					})
					v_u_143.ReducedMotionOpenTween:Play()
					v_u_143.ReducedMotionOpenTween.Completed:Connect(function(p705)
						-- upvalues: (ref) v_u_143
						if p705 == Enum.PlaybackState.Completed then
							v_u_143.Shield.Parent = v_u_143.ClippingShield
							v_u_143.ReducedMotionOpenTween = nil
						end
						v_u_143.CanvasGroup.Visible = false
					end)
					if v_u_66.FFlagEnableInGameMenuDurationLogger then
						v_u_32.menuOpenComplete()
					end
				else
					v_u_143.Shield:TweenPositionInternal(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, v702, true, function()
						-- upvalues: (ref) v_u_66, (ref) v_u_32
						if v_u_66.FFlagEnableInGameMenuDurationLogger then
							v_u_32.menuOpenComplete()
						end
					end)
				end
				if not v_u_66.FFlagSettingsHubIndependentBackgroundVisibility and v_u_143.DarkenBackground then
					local v706 = TweenInfo.new(v702, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
					if v_u_143.DarkenBackgroundTween then
						v_u_143.DarkenBackgroundTween:Cancel()
					end
					v_u_143.DarkenBackgroundTween = v_u_8:Create(v_u_143.DarkenBackground, v706, {
						["BackgroundTransparency"] = v_u_56.transparency("DarkenBackground")
					})
					v_u_143.DarkenBackgroundTween:Play()
				end
			end
			v_u_71:BindCoreAction("RbxSettingsHubStopCharacter", v_u_66.isInExperienceUIVREnabled and function(p707, p708, p709)
				-- upvalues: (ref) v_u_143
				if v_u_143.SettingsUIDelegate:isInputEventNeededBySettings(p707, p708, p709) then
					return Enum.ContextActionResult.Pass
				else
					return nil
				end
			end or function() end, false, Enum.PlayerActions.CharacterForward, Enum.PlayerActions.CharacterBackward, Enum.PlayerActions.CharacterLeft, Enum.PlayerActions.CharacterRight, Enum.PlayerActions.CharacterJump, Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift, Enum.KeyCode.Tab, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)
			if not v_u_129 then
				v_u_71:BindCoreAction("RbxSettingsHubSwitchTab", v_u_572, false, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL1)
			end
			v_u_71:BindCoreAction("RbxSettingsScrollHotkey", v_u_577, false, Enum.KeyCode.PageUp, Enum.KeyCode.PageDown)
			if v_u_168() then
				v_u_176()
				v_u_164(v_u_143.Pages.CurrentPage)
			end
			if v_u_66.ChromeEnabled and v_u_66.FFlagEnableConsoleExpControls then
				require(v_u_12.Modules.Chrome.Service):setShortcutBar(require(v_u_12.Modules.Chrome.ChromeShared.Unibar.Constants).TILTMENU_SHORTCUTBAR_ID)
			end
			if not v_u_129 then
				v_u_143.TabConnection = v_u_73.InputBegan:connect(v_u_574)
			end
			setOverrideMouseIconBehavior()
			v_u_91 = v_u_73.LastInputTypeChanged:connect(setOverrideMouseIconBehavior)
			if v_u_73.MouseEnabled and not v_u_75.VREnabled then
				v_u_33.push(v_u_60, Enum.OverrideMouseIconBehavior.ForceShow)
			end
			v_u_143:CloseReactPage()
			if p690 then
				v_u_181()
				v_u_143:SwitchToPage(p690, nil, 1, true)
			else
				v_u_143:SwitchToPage(v_u_143:GetFirstPageWithTabHeader(), nil, 1, true)
			end
			if (not v_u_66.isInExperienceUIVREnabled or v_u_66.InExperienceUIVRIXP:isMovePanelToCenter()) and true or not v_u_75.VREnabled then
				if v_u_66.FFlagAddNewPlayerListMobileFocusNav then
					if v700:GetIsModal() then
						v700:SetVisibility(false)
					else
						v700:HideTemp("SettingsMenu", true)
					end
				else
					v700:HideTemp("SettingsMenu", true)
				end
				if not (v_u_66.isInExperienceUIVREnabled and (v_u_66.InExperienceUIVRIXP:isMovePanelToCenter() and (v_u_66.FFlagSpatialUIFixMenuPanelChatExclusive and v_u_75.VREnabled))) then
					v_u_135:HideTemp("SettingsMenu", true)
				end
				if v_u_4 then
					v_u_5.setVisibility(v_u_5.FeatureName.Backpack, false)
				else
					local v710 = require(v_u_12.Modules.BackpackScript)
					if v710.IsOpen then
						v710:OpenClose()
					end
				end
			end
			if v_u_66.GetFFlagEnableAppChatInExperience() and v_u_110:getVisible() then
				v_u_92 = true
				v_u_110.default:setVisible(false)
			end
			if not v_u_66.isInExperienceUIVREnabled then
				if v_u_4 then
					v_u_5.setVisibility(v_u_5.FeatureName.Backpack, false)
				else
					local v711 = require(v_u_12.Modules.BackpackScript)
					if v711.IsOpen then
						v711:OpenClose()
					end
				end
			end
			v_u_143.GameSettingsPage:OpenSettingsPage()
		else
			v_u_143.CurrentPageSignal:fire("")
			if v_u_66.FFlagMenuButtonsMountWithIEM and v_u_66.FFlagRelocateMobileMenuButtons then
				if v_u_66.FIntRelocateMobileMenuButtonsVariant ~= 0 then
					v_u_279()
				end
				if v_u_66.FIntRelocateMobileMenuButtonsVariant == 2 and v_u_143.PlayersPage then
					v_u_143.PlayersPage:UnmountMenuButtonsContainer()
				end
			end
			if v_u_66.ChromeEnabled and v_u_66.FFlagEnableConsoleExpControls then
				require(v_u_12.Modules.Chrome.Service):setShortcutBar(nil)
			end
			if v_u_66.GetFFlagEnableAppChatInExperience() and v_u_92 then
				v_u_92 = false
			end
			if v_u_66.isInExperienceUIVREnabled and v_u_66.InExperienceUIVRIXP:isMovePanelToCenter() then
				v700:HideTemp("SettingsMenu", false)
				if not (v_u_66.FFlagSpatialUIFixMenuPanelChatExclusive and v_u_75.VREnabled) then
					v_u_135:HideTemp("SettingsMenu", false)
				end
			end
			if p689 then
				v_u_143.Shield.Position = v_u_59
				v_u_143.Shield.Visible = v_u_143.Visible
				v_u_143.SettingsShowSignal:fire(v_u_143.Visible)
				v_u_72:SetMenuIsOpen(false, "SettingsHub")
				v_u_79:CloseExperienceMenu()
				if v_u_66.FFlagEnableInGameMenuDurationLogger then
					v_u_32.menuCloseComplete()
				end
				if not v_u_66.FFlagSettingsHubIndependentBackgroundVisibility and v_u_143.DarkenBackground then
					if v_u_143.DarkenBackgroundTween then
						v_u_143.DarkenBackgroundTween:Cancel()
						v_u_143.DarkenBackgroundTween = nil
					end
					v_u_143.DarkenBackground.BackgroundTransparency = 1
				end
			else
				local v712 = not v_u_104 and 0.4 or v_u_104.ShieldCloseAnimationTweenTime
				local v713
				if v693 == nil then
					local v714 = v_u_127
					if v714 then
						v714 = v_u_115()
					end
					v713 = v714 and v_u_123()
					if v713 then
						v713 = v_u_117()
					end
				else
					v713 = v693
				end
				if v713 then
					v712 = v_u_118()
				end
				local function v_u_715() -- name: handleShieldClose
					-- upvalues: (ref) v_u_66, (ref) v_u_143, (ref) v_u_72, (ref) v_u_79, (ref) v_u_32
					if not v_u_66.FFlagAddTraversalBackButton then
						v_u_143.SettingsShowSignal:fire(v_u_143.Visible)
					end
					if not v_u_143.Visible then
						v_u_72:SetMenuIsOpen(false, "SettingsHub")
						v_u_79:CloseExperienceMenu()
					end
					if v_u_66.FFlagEnableInGameMenuDurationLogger then
						v_u_32.menuCloseComplete()
					end
				end
				if v_u_66.FFlagAddTraversalBackButton then
					v_u_143.SettingsShowSignal:fire(v_u_143.Visible)
				end
				if v_u_78.ReducedMotion then
					if v_u_143.ReducedMotionOpenTween then
						v_u_143.ReducedMotionOpenTween:Cancel()
						v_u_143.ReducedMotionOpenTween = nil
					end
					if v_u_143.ReducedMotionCloseTween then
						v_u_143.ReducedMotionCloseTween:Cancel()
						v_u_143.ReducedMotionCloseTween = nil
					end
					v_u_143.Shield.Parent = v_u_143.CanvasGroup
					v_u_143.CanvasGroup.Visible = true
					local v716 = TweenInfo.new(0.25)
					v_u_143.ReducedMotionCloseTween = v_u_8:Create(v_u_143.CanvasGroup, v716, {
						["GroupTransparency"] = 1
					})
					v_u_143.ReducedMotionCloseTween:Play()
					v_u_143.ReducedMotionCloseTween.Completed:Connect(function(p717)
						-- upvalues: (ref) v_u_143, (ref) v_u_59
						if p717 == Enum.PlaybackState.Completed then
							v_u_143.Shield.Position = v_u_59
							v_u_143.Shield.Visible = v_u_143.Visible
							v_u_143.Shield.Parent = v_u_143.ClippingShield
							v_u_143.ReducedMotionCloseTween = nil
						end
						v_u_143.CanvasGroup.Visible = false
					end)
					v_u_715()
				else
					if v_u_66.ChromeEnabled and v_u_66.FFlagEnableConsoleExpControls then
						require(v_u_12.Modules.Chrome.Service):setShortcutBar(nil)
					end
					local v718 = Enum.EasingDirection.In
					local v719 = Enum.EasingStyle.Quad
					if v693 == nil then
						local v720 = v_u_127
						if v720 then
							v720 = v_u_115()
						end
						v693 = v720 and v_u_123()
						if v693 then
							v693 = v_u_117()
						end
					end
					if v693 then
						v718 = Enum.EasingDirection.Out
						v719 = Enum.EasingStyle.Quart
					end
					v_u_143.Shield:TweenPositionInternal(v_u_59, v718, v719, v712, true, function()
						-- upvalues: (ref) v_u_143, (copy) v_u_715
						v_u_143.Shield.Visible = v_u_143.Visible
						v_u_715()
					end)
				end
				if not v_u_66.FFlagSettingsHubIndependentBackgroundVisibility and v_u_143.DarkenBackground then
					local v721 = TweenInfo.new(v712, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					if v_u_143.DarkenBackgroundTween then
						v_u_143.DarkenBackgroundTween:Cancel()
					end
					v_u_143.DarkenBackgroundTween = v_u_8:Create(v_u_143.DarkenBackground, v721, {
						["BackgroundTransparency"] = 1
					})
					v_u_143.DarkenBackgroundTween:Play()
				end
			end
			if v_u_91 then
				v_u_91:disconnect()
			end
			if v_u_66.isInExperienceUIVREnabled then
				if not (v_u_66.InExperienceUIVRIXP:isMovePanelToCenter() or v_u_75.VREnabled) then
					v700:HideTemp("SettingsMenu", false)
					v_u_135:HideTemp("SettingsMenu", false)
				end
			else
				v700:HideTemp("SettingsMenu", false)
				v_u_135:HideTemp("SettingsMenu", false)
			end
			if not v_u_75.VREnabled then
				v_u_33.pop(v_u_60)
			end
			v_u_143:CloseReactPage()
			clearMenuStack()
			if not v_u_129 then
				v_u_71:UnbindCoreAction("RbxSettingsHubSwitchTab")
			end
			v_u_71:UnbindCoreAction("RbxSettingsHubStopCharacter")
			v_u_71:UnbindCoreAction("RbxSettingsScrollHotkey")
			v_u_181(0.4)
			v_u_72.SelectedCoreObject = nil
			v_u_143.GameSettingsPage:CloseSettingsPage()
		end
		local v722 = {
			["source"] = p691,
			["playsessionid"] = v_u_143.playSessionId
		}
		local v723 = game.GameId
		v722.universeid = tostring(v723)
		if v695 then
			if p688 then
				v_u_1:SetRBXEventStream(v_u_104.AnalyticsTargetName, v_u_104.AnalyticsMenuOpenName, v_u_104.AnalyticsMenuActionName, v722)
				if v_u_66.GetFFlagEnableLeaveGameUpsellEntrypoint() then
					task.spawn(checkLeaveGameUpsell)
					return
				end
			else
				v_u_1:SetRBXEventStream(v_u_104.AnalyticsTargetName, v_u_104.AnalyticsMenuCloseName, v_u_104.AnalyticsMenuActionName, v722)
			end
		end
	end
	function v_u_143.SetVisibility(_, p725, p726, p727, p728, p729) -- name: SetVisibility
		-- upvalues: (copy) v_u_143, (ref) v_u_724
		if v_u_143.Visible ~= p725 then
			v_u_724(p725, p726, p727, p728, p729)
		end
	end
	function v_u_143.SetBackgroundVisibility(_, p730, p731) -- name: SetBackgroundVisibility
		-- upvalues: (copy) v_u_143, (ref) v_u_687
		if v_u_143.DarkenBackground.Visible ~= p730 then
			v_u_687(p730, p731)
		end
	end
	function v_u_143.GetVisibility(_) -- name: GetVisibility
		-- upvalues: (copy) v_u_143
		return v_u_143.Visible
	end
	function v_u_143.ToggleVisibility(_, p732, p733) -- name: ToggleVisibility
		-- upvalues: (ref) v_u_724, (copy) v_u_143
		v_u_724(not v_u_143.Visible, nil, nil, p732, p733)
	end
	function v_u_143.AddToMenuStack(_, p734) -- name: AddToMenuStack
		-- upvalues: (copy) v_u_143
		if v_u_143.MenuStack[#v_u_143.MenuStack] ~= p734 then
			v_u_143.MenuStack[#v_u_143.MenuStack + 1] = p734
		end
	end
	function v_u_143.InviteToGame(_) -- name: InviteToGame
		-- upvalues: (ref) v_u_82, (ref) v_u_73, (ref) v_u_80, (ref) v_u_66, (copy) v_u_143, (ref) v_u_101, (ref) v_u_102, (ref) v_u_12, (ref) v_u_127, (ref) v_u_115, (ref) v_u_122
		if game:GetEngineFeature("PlatformFriendsService") and (v_u_82 and v_u_82:IsInviteFriendsEnabled()) then
			v_u_82:ShowInviteFriendsUI()
		elseif v_u_73:GetPlatform() == Enum.Platform.XBoxOne then
			if v_u_80 then
				v_u_80:PopupGameInviteUI()
			end
		else
			if not v_u_66.FFlagAddInviteFriendsIntegration or v_u_143.Visible then
				v_u_143:ToggleVisibility()
			end
			v_u_101:openModal({
				["trigger"] = v_u_102.Triggers.GameMenu
			})
			if v_u_66.FFlagEnableConsoleExpControls and v_u_66.ChromeEnabled then
				require(v_u_12.Modules.Chrome.Service):setShortcutBar(nil)
			end
		end
		local v735 = v_u_127
		if v735 then
			v735 = v_u_115()
		end
		if v735 then
			v_u_122(false)
		end
	end
	function v_u_143.PopMenu(_, _, p736, p737) -- name: PopMenu
		-- upvalues: (copy) v_u_143, (copy) v_u_151, (ref) v_u_66, (ref) v_u_12
		if v_u_143.MenuStack and #v_u_143.MenuStack > 0 then
			local v738 = v_u_143.MenuStack[#v_u_143.MenuStack]
			if type(v738) ~= "table" then
				v_u_151:Fire(v738)
			end
			table.remove(v_u_143.MenuStack, #v_u_143.MenuStack)
			v_u_143:SwitchToPage(v_u_143.MenuStack[#v_u_143.MenuStack], true, 1, p736)
			if #v_u_143.MenuStack == 0 then
				if v_u_66.FFlagAddUILessMode then
					v_u_143:SetVisibility(false, nil, nil, nil, p737)
				else
					v_u_143:SetVisibility(false)
				end
				v_u_143.Pages.CurrentPage:Hide(0, 0, nil, nil, v_u_143.PageViewInnerFrame)
				return
			end
			if v_u_66.ChromeEnabled and v_u_66.FFlagEnableConsoleExpControls then
				require(v_u_12.Modules.Chrome.Service):setShortcutBar(require(v_u_12.Modules.Chrome.ChromeShared.Unibar.Constants).TILTMENU_SHORTCUTBAR_ID)
				return
			end
		else
			v_u_143.MenuStack = {}
			v_u_151:Fire()
			if v_u_66.FFlagAddUILessMode then
				v_u_143:ToggleVisibility(nil, p737)
				return
			end
			v_u_143:ToggleVisibility(p737)
		end
	end
	function v_u_143.ShowShield(_) -- name: ShowShield
		-- upvalues: (ref) v_u_73, (ref) v_u_58, (copy) v_u_143
		local v739 = v_u_73.VREnabled and 1 or v_u_58
		v_u_143.Shield.BackgroundTransparency = v739
	end
	function v_u_143.HideShield(_) -- name: HideShield
		-- upvalues: (copy) v_u_143
		v_u_143.Shield.BackgroundTransparency = 1
	end
	function v_u_143.ShowReactPage(_) -- name: ShowReactPage
		-- upvalues: (copy) v_u_143
		if v_u_143.reactPage then
			v_u_143.reactPageAnalytics:openPage(v_u_143.reactPage.name)
		end
		v_u_143.ReactPage.Visible = true
		v_u_143.Page.Visible = false
	end
	function v_u_143.HideReactPage(_) -- name: HideReactPage
		-- upvalues: (copy) v_u_143
		if v_u_143.reactPage then
			v_u_143.reactPageAnalytics:closePage(v_u_143.reactPage.name)
		end
		local v740 = v_u_143.ReactPage.Visible
		v_u_143.ReactPage.Visible = false
		v_u_143.Page.Visible = true
		if v_u_143.Pages.CurrentPage and (v740 and v_u_143.Visible) then
			v_u_143.Pages.CurrentPage:SelectARow(true)
		end
	end
	function v_u_143.MountReactPage(_) -- name: MountReactPage
		-- upvalues: (ref) v_u_27, (copy) v_u_143, (ref) v_u_20
		v_u_27(false).setCurrentReactPage(nil)
		if v_u_143.reactPageRoot then
			v_u_143:UnmountReactPage()
		end
		v_u_143.reactPageRoot = v_u_20.createRoot(v_u_143.ReactPage)
	end
	function v_u_143.UnmountReactPage(_) -- name: UnmountReactPage
		-- upvalues: (copy) v_u_143
		if v_u_143.reactPageRoot then
			v_u_143.reactPageRoot:unmount()
			v_u_143.reactPageRoot = nil
		end
	end
	function v_u_143.CloseReactPage(_) -- name: CloseReactPage
		-- upvalues: (copy) v_u_143
		v_u_143:HideReactPage()
		v_u_143:UnmountReactPage()
	end
	function v_u_143.SwitchToReactPage(_, p741, p742, p743) -- name: SwitchToReactPage
		-- upvalues: (copy) v_u_143
		if p743 then
			v_u_143:UnmountReactPage()
		elseif p741 then
			v_u_143.reactPage = p741
			if not v_u_143.reactPageRoot then
				v_u_143:MountReactPage()
			end
			v_u_143.reactPageRoot:render(p741:createPage(p742))
		end
		v_u_143:ShowReactPage()
	end
	v_u_143.GameSettingsPageReorderIXPFetched = false
	local v_u_744 = nil
	local v_u_745 = nil
	local function v_u_751() -- name: enableVR
		-- upvalues: (ref) v_u_3, (copy) v_u_143, (ref) v_u_744
		local v_u_746 = require(v_u_3.Workspace.Packages.VrCommon).VRHub
		local v747 = require(v_u_3.Workspace.Packages.VrCommon).Panel3D
		local v_u_748 = v747.Get("SettingsMenu")
		v_u_748:ResizeStuds(4, 4, 250)
		v_u_748:SetType(v747.Type.Standard)
		v_u_748:SetVisible(false)
		v_u_748:SetCanFade(false)
		v_u_143.ClippingShield.Parent = v_u_748:GetGUI()
		v_u_143.Shield.Parent.ClipsDescendants = false
		v_u_143.VRShield.Visible = true
		v_u_143:HideShield()
		v_u_744 = v_u_143.SettingsShowSignal:connect(function(p749)
			-- upvalues: (copy) v_u_748, (copy) v_u_746
			if p749 then
				v_u_748:SetVisible(true)
				v_u_746:FireModuleOpened("SettingsMenu")
			else
				v_u_748:SetVisible(false)
				v_u_746:FireModuleClosed("SettingsMenu")
			end
		end)
		v_u_746.ModuleOpened.Event:connect(function(p750)
			-- upvalues: (ref) v_u_143
			if p750 ~= "SettingsMenu" then
				v_u_143:SetVisibility(false)
			end
		end)
	end
	local function v_u_752() -- name: disableVR
		-- upvalues: (copy) v_u_143, (ref) v_u_12, (ref) v_u_744, (ref) v_u_745, (ref) v_u_3
		v_u_143.ClippingShield.Parent = v_u_12
		v_u_143.Shield.Parent.ClipsDescendants = true
		v_u_143.VRShield.Visible = false
		v_u_143:ShowShield()
		if v_u_744 then
			v_u_744:disconnect()
			v_u_744 = nil
		end
		if v_u_745 then
			v_u_745:disconnect()
			v_u_745 = nil
		end
		require(v_u_3.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetVisible(false)
	end
	local function v754(p753) -- name: OnVREnabled
		-- upvalues: (ref) v_u_73, (ref) v_u_66, (copy) v_u_143, (copy) v_u_541, (ref) v_u_56, (ref) v_u_72, (copy) v_u_462, (copy) v_u_751, (copy) v_u_752
		if p753 == "VREnabled" then
			if v_u_73.VREnabled then
				if v_u_66.isInExperienceUIVREnabled then
					v_u_143.SettingsUIDelegate:enableVR()
					v_u_541()
					v_u_143.MenuContainer.BackgroundTransparency = v_u_56.transparency("MenuContainer", 1) * v_u_72.PreferredTransparency
					v_u_462()
				else
					v_u_751()
				end
			end
			if v_u_66.isInExperienceUIVREnabled then
				v_u_143.SettingsUIDelegate:disableVR()
				v_u_541()
				v_u_143.MenuContainer.BackgroundTransparency = v_u_56.transparency("MenuContainer", 1) * v_u_72.PreferredTransparency
				v_u_462()
				return
			end
			v_u_752()
		end
	end
	v_u_73.Changed:connect(v754)
	v754("VREnabled")
	v_u_143.ResetCharacterPage:SetHub(v_u_143)
	if v_u_44.canNavigateHome then
		v_u_143.LeaveGamePage:SetHub(v_u_143)
	end
	if v_u_66.GetFFlagEnableLeaveGameUpsellEntrypoint() then
		v_u_143.LeaveGameUpsellPage:SetHub(v_u_143)
	end
	v_u_143.GameSettingsPage = require(v_u_12.Modules.Settings.Pages.GameSettingsWrapper)
	v_u_143.GameSettingsPage:SetHub(v_u_143)
	v_u_143.ReportAbusePage = require(v_u_12.Modules.Settings.Pages.ReportAbuseMenuContainerPage)
	v_u_143.ReportAbusePage:SetHub(v_u_143)
	v_u_143.ReportSentPage = require(v_u_12.Modules.Settings.Pages.ReportSentPage)
	v_u_143.ReportSentPage:SetHub(v_u_143)
	v_u_143.ReportSentPageV2 = require(v_u_12.Modules.Settings.Pages.ReportSentPageV2)
	v_u_143.ReportSentPageV2:SetHub(v_u_143)
	v_u_143.HelpPage = require(v_u_12.Modules.Settings.Pages.HelpWrapper)
	v_u_143.HelpPage:SetHub(v_u_143)
	if v_u_66.FFlagHelpPageIXPExposure then
		v_u_143.HelpPageIXPFetched = false
	end
	if v_u_44.canListPeopleInSameServer then
		v_u_143.PlayersPage = require(v_u_12.Modules.Settings.Pages.PeopleWrapper)
		v_u_143.PlayersPage:SetHub(v_u_143)
		if not v_u_66.FFlagMenuButtonsMountWithIEM and (v_u_66.FFlagRelocateMobileMenuButtons and (v_u_66.FIntRelocateMobileMenuButtonsVariant == 2 and v_u_29:IsSmallTouchScreen())) then
			v_u_143.PlayersPage:CreateMenuButtonsContainer()
		end
	end
	if v_u_66.FFlagAddIEMProfilePage then
		v_u_143.PlayerProfilePage = require(v_u_12.Modules.Settings.Pages.PlayerProfile)
	end
	if not v_u_66.isExitModalRemoved and v_u_34() then
		v_u_143.ExitModalPage = require(v_u_12.Modules.Settings.Pages.ExitModal)
		v_u_143.ExitModalPage:SetHub(v_u_143)
	end
	if v_u_34() and v_u_44.canNavigateHome then
		v_u_143.LeaveGameToHomePage = require(v_u_12.Modules.Settings.Pages.LeaveGameToHome)
		v_u_143.LeaveGameToHomePage:SetHub(v_u_143)
	end
	local v755 = v_u_43.PolicyImplementation.read()
	local v756
	if v755 then
		v756 = v_u_43.Mapper(v755).eligibleForCapturesFeature()
	else
		v756 = false
	end
	local v757 = v_u_66.isInExperienceUIVREnabled
	if v757 then
		v757 = v_u_66.FFlagFixSpatialUICaptures
	end
	if v756 and not (v757 and v_u_53()) then
		local v758 = require(v_u_12.Modules.Settings.Pages.CapturesPageWrapper)
		v_u_143.CapturesApp = v_u_103
		v_u_143.CapturesApp.mountMenuPage(v758.Page, function() -- name: closeSettingsMenu
			-- upvalues: (copy) v_u_143
			v_u_143:SetVisibility(false, true)
		end, v_u_66.ChromeEnabled)
		v_u_143.CapturesPage = v758
		v_u_143.CapturesPage:ConnectHubToApp(v_u_143, v_u_143.PageViewClipper, v_u_143.CapturesApp)
	end
	if v_u_66.FFlagIntegrateTraversalHistoryInSideSheet then
		v_u_143.TraversalHistoryPage = require(v_u_12.Modules.Settings.Pages.TraversalHistoryWrapper)()
		v_u_143.TraversalHistoryPage:SetHub(v_u_143)
	end
	if v_u_143.PlayersPage then
		v_u_143:AddPage(v_u_143.PlayersPage)
	end
	v_u_143:AddPage(v_u_143.ResetCharacterPage)
	if v_u_143.LeaveGamePage then
		v_u_143:AddPage(v_u_143.LeaveGamePage)
	end
	if v_u_66.GetFFlagEnableLeaveGameUpsellEntrypoint() and v_u_143.LeaveGameUpsellPage then
		v_u_143:AddPage(v_u_143.LeaveGameUpsellPage)
	end
	v_u_143:AddPage(v_u_143.GameSettingsPage)
	if v_u_143.CapturesPage then
		v_u_143:AddPage(v_u_143.CapturesPage)
	end
	if v_u_143.ReportAbusePage then
		v_u_143:AddPage(v_u_143.ReportAbusePage)
	end
	if v_u_143.ReportSentPage then
		v_u_143:AddPage(v_u_143.ReportSentPage)
	end
	if v_u_143.ReportSentPageV2 then
		v_u_143:AddPage(v_u_143.ReportSentPageV2)
	end
	v_u_143:AddPage(v_u_143.HelpPage)
	if not v_u_66.isExitModalRemoved and v_u_143.ExitModalPage then
		v_u_143:AddPage(v_u_143.ExitModalPage)
	end
	if v_u_143.LeaveGameToHomePage then
		v_u_143:AddPage(v_u_143.LeaveGameToHomePage)
	end
	if v_u_143.TraversalHistoryPage then
		v_u_143:AddPage(v_u_143.TraversalHistoryPage)
	end
	v_u_143:InitInPage(v_u_143:GetFirstPageWithTabHeader())
	if not v_u_66.isNewInGameMenuEnabled() and (not v_u_66.FFlagAddUILessMode or v_u_66.FIntAddUILessModeVariant == 0) then
		v_u_71:BindCoreAction("RBXEscapeMainMenu", function(_, p759, _)
			-- upvalues: (ref) v_u_66, (ref) v_u_131, (ref) v_u_130, (ref) v_u_129, (ref) v_u_123, (ref) v_u_127, (ref) v_u_115, (ref) v_u_117, (copy) v_u_143, (ref) v_u_122, (ref) v_u_104
			if p759 == Enum.UserInputState.Begin then
				if (v_u_66.FFlagShowSwitchServerButton or v_u_131()) and v_u_130(false).isConfirmationOpen(false) then
					return
				elseif v_u_129 then
					if v_u_123() then
						local v760 = v_u_127
						if v760 then
							v760 = v_u_115()
						end
						if v760 and v_u_117() then
							v_u_143:SetVisibility(false)
						else
							v_u_122(false)
						end
					elseif v_u_143.MenuStack and #v_u_143.MenuStack > 0 then
						if v_u_66.FFlagAddUILessMode then
							v_u_143:PopMenu(false, true, v_u_104.AnalyticsMenuOpenTypes.Keyboard)
						else
							v_u_143:PopMenu(false, true)
						end
					else
						v_u_122(true)
						return
					end
				elseif v_u_66.FFlagAddUILessMode then
					v_u_143:PopMenu(false, true, v_u_104.AnalyticsMenuOpenTypes.Keyboard)
				else
					v_u_143:PopMenu(false, true)
				end
			else
				return
			end
		end, false, Enum.KeyCode.Escape)
	end
	local v_u_761 = require(v_u_3.Workspace.Packages.BuildExperiencePlaytestLaunch.teamCreateUtils).isViewer()
	v_u_72.ShowLeaveConfirmation:connect(function()
		-- upvalues: (copy) v_u_761, (ref) v_u_129, (ref) v_u_66, (ref) v_u_127, (ref) v_u_123, (ref) v_u_116, (ref) v_u_115, (ref) v_u_117, (copy) v_u_143, (ref) v_u_122, (ref) v_u_104
		if v_u_761 then
			return
		end
		if v_u_129 then
			local v762
			if v_u_66.FFlagSideSheetAndroidBack then
				if v_u_123() then
					v762 = v_u_127
					if v762 then
						v762 = v_u_115()
					end
					if v762 and v_u_117() then
						v_u_143:SetVisibility(false)
					else
						v_u_122(false)
					end
				elseif #v_u_143.MenuStack > 0 then
					v_u_143:PopMenu(false, true)
				else
					v_u_122(true)
				end
			else
				local v763 = v_u_127
				if v763 then
					v763 = v_u_123() or v_u_116()
				end
				if v763 then
					if v_u_123() then
						v762 = v_u_127
						if v762 then
							v762 = v_u_115()
						end
						if v762 and v_u_117() then
							v_u_143:SetVisibility(false)
						else
							v_u_122(false)
						end
					elseif #v_u_143.MenuStack > 0 then
						v_u_143:PopMenu(false, true)
					else
						v_u_122(true)
					end
				elseif #v_u_143.MenuStack == 0 then
					v_u_143:SetVisibility(true, nil, nil, nil, v_u_104.AnalyticsMenuOpenTypes.GamepadLeaveGame)
					v_u_143:SwitchToPage(v_u_143:GetFirstPageWithTabHeader(), nil, 1)
				else
					v_u_143:PopMenu(false, true)
				end
			end
		elseif #v_u_143.MenuStack == 0 then
			v_u_143:SetVisibility(true, nil, nil, nil, v_u_104.AnalyticsMenuOpenTypes.GamepadLeaveGame)
			v_u_143:SwitchToPage(v_u_143:GetFirstPageWithTabHeader(), nil, 1)
		else
			v_u_143:PopMenu(false, true)
		end
	end)
	v_u_71:BindCoreAction("Open Dev Console", v557, false, Enum.KeyCode.F9)
	v_u_71:BindCoreAction("Show Quick Profiler", v554, false, Enum.KeyCode.F7)
	v_u_73.InputBegan:connect(function(p764)
		-- upvalues: (copy) v_u_143, (ref) v_u_72
		if (p764.KeyCode == Enum.KeyCode.Left or (p764.KeyCode == Enum.KeyCode.Right or (p764.KeyCode == Enum.KeyCode.Up or p764.KeyCode == Enum.KeyCode.Down))) and (v_u_143.Visible and (v_u_143.Active and (v_u_143.Pages.CurrentPage and v_u_72.SelectedCoreObject == nil))) then
			v_u_143.Pages.CurrentPage:SelectARow()
		end
	end)
	local v_u_765 = false
	if v_u_66.isExitModalRemoved and v_u_34() then
		game:GetService("GuiService").NativeClose:Connect(function()
			-- upvalues: (ref) v_u_66, (ref) v_u_765, (ref) v_u_41, (ref) v_u_55
			if v_u_66.FFlagEnableExitModalExposure and not v_u_765 then
				v_u_765 = true
				v_u_41:LogFlagLinkedUserLayerExposure(v_u_66.GetFStringExitModalIXPLayer())
			end
			v_u_55(false, {
				["shouldNativeExit"] = true
			})
		end)
		if v_u_143.FullScreenTitleBar then
			local v766 = {
				["onClose"] = function() -- name: onClose
					-- upvalues: (ref) v_u_66, (ref) v_u_765, (ref) v_u_41, (ref) v_u_55
					if v_u_66.FFlagEnableExitModalExposure and not v_u_765 then
						v_u_765 = true
						v_u_41:LogFlagLinkedUserLayerExposure(v_u_66.GetFStringExitModalIXPLayer())
					end
					v_u_55(false, {
						["shouldNativeExit"] = true
					})
				end
			}
			v_u_143.FullScreenTitleBar = v_u_95.update(v_u_143.FullScreenTitleBar, v766)
		end
	elseif v_u_143.ExitModalPage then
		local function v_u_767() -- name: showExitModal
			-- upvalues: (ref) v_u_66, (ref) v_u_765, (ref) v_u_41, (copy) v_u_143, (copy) v_u_181
			if v_u_66.FFlagEnableExitModalExposure and not v_u_765 then
				v_u_765 = true
				v_u_41:LogFlagLinkedUserLayerExposure(v_u_66.GetFStringExitModalIXPLayer())
			end
			v_u_143.HubBar.Visible = false
			v_u_181()
			if v_u_143:GetVisibility() then
				v_u_143:AddToMenuStack(v_u_143.Pages.CurrentPage)
				v_u_143:SwitchToPage(v_u_143.ExitModalPage, nil, 1, true)
			else
				v_u_143:SetVisibility(true, nil, v_u_143.ExitModalPage, false)
			end
		end
		local function v768() -- name: handleNativeExit
			-- upvalues: (copy) v_u_143, (ref) v_u_66, (ref) v_u_32, (copy) v_u_279, (copy) v_u_767
			if v_u_143:GetVisibility() and v_u_143.Pages.CurrentPage == v_u_143.ExitModalPage then
				if v_u_66.FFlagEnableInGameMenuDurationLogger then
					v_u_32.leavingGame()
				end
				if v_u_66.FFlagRelocateMobileMenuButtons and v_u_66.FIntRelocateMobileMenuButtonsVariant ~= 0 then
					v_u_279()
					if v_u_66.FFlagMenuButtonsMountWithIEM and (v_u_66.FIntRelocateMobileMenuButtonsVariant == 2 and v_u_143.PlayersPage) then
						v_u_143.PlayersPage:UnmountMenuButtonsContainer()
					end
				end
				v_u_143.ExitModalPage.LeaveAppFunc(true)
			else
				v_u_767()
			end
		end
		game:GetService("GuiService").NativeClose:Connect(v768)
		if v_u_143.FullScreenTitleBar then
			v_u_143.FullScreenTitleBar = v_u_95.update(v_u_143.FullScreenTitleBar, {
				["onClose"] = v768
			})
		end
	end
	if v_u_66.GetFFlagEnableAppChatInExperience() then
		local v_u_769 = nil
		v_u_143.SettingsShowSignal:connect(function(p770)
			-- upvalues: (ref) v_u_769, (ref) v_u_110, (copy) v_u_143
			if p770 then
				v_u_769 = v_u_110.default.visibilitySignal.Event:Connect(function(p771)
					-- upvalues: (ref) v_u_143
					if p771 and v_u_143.Visible then
						v_u_143:SetVisibility(false, true)
					end
				end)
			elseif v_u_769 then
				v_u_769:Disconnect()
				v_u_769 = nil
			end
		end)
	end
	v_u_143.InExperienceMenuReact = v_u_46("Folder")({
		["Name"] = "InExperienceMenuReact",
		["Parent"] = nil,
		["Parent"] = v_u_143.ClippingShield
	})
	local v772 = v_u_143.PlayersPage.ButtonsContainer
	local v773
	if v772 then
		v773 = v772:FindFirstChild("LeaveButtonButton", true)
	else
		v773 = nil
	end
	local v774
	if v_u_66.FFlagAddTraversalHistory then
		v774 = v_u_143.LeaveGameButton
	else
		v774 = nil
	end
	local function v793(p_u_775)
		-- upvalues: (ref) v_u_19, (copy) v_u_143, (ref) v_u_48, (ref) v_u_66, (ref) v_u_53, (ref) v_u_24, (ref) v_u_36
		local v776 = v_u_19.useState
		local v777 = p_u_775.showSignal(false)
		if v777 then
			v777 = v_u_143.Visible
		end
		local v778, v_u_779 = v776(v777)
		v_u_19.useEffect(function()
			-- upvalues: (ref) v_u_48, (copy) v_u_779, (copy) p_u_775, (ref) v_u_143
			local v_u_783 = v_u_48.createEffect(function(p780)
				-- upvalues: (ref) v_u_779, (ref) p_u_775, (ref) v_u_143
				local v781 = v_u_779
				local v782 = p_u_775.showSignal(p780)
				if v782 then
					v782 = v_u_143.Visible
				end
				v781(v782)
			end)
			local v_u_785 = v_u_143.SettingsShowSignal:connect(function(p784)
				-- upvalues: (ref) v_u_779, (ref) p_u_775
				v_u_779(p_u_775.showSignal(false) and p784)
			end)
			return function()
				-- upvalues: (copy) v_u_783, (copy) v_u_785
				v_u_783()
				v_u_785:Disconnect()
			end
		end, {})
		local v786 = v_u_66.FFlagAddTraversalHistory
		if v786 then
			local v787 = v_u_66.isInExperienceUIVREnabled
			if v787 then
				v787 = v_u_53()
			end
			local v788 = not v787 and p_u_775.parent
			if v788 then
				if v778 then
					local v789 = v_u_19.createElement
					local v790 = v_u_24
					local v791 = {
						["parent"] = p_u_775.parent
					}
					local v792 = {
						["TraversalHistoryMenu"] = v_u_19.createElement(v_u_36, {
							["anchorParent"] = p_u_775.parent,
							["currentPageChangeSignal"] = p_u_775.currentPageChangeSignal,
							["menuSide"] = p_u_775.menuSide
						})
					}
					v778 = v789(v790, v791, v792)
				end
			else
				v778 = v788
			end
		else
			v778 = v786
		end
		return v778
	end
	v_u_20.createRoot(v_u_143.InExperienceMenuReact):render(v_u_19.createElement(v_u_25, nil, {
		["InExperienceMenuReactPage"] = v_u_19.createElement(v_u_26, {
			["onMount"] = function() -- name: onMount
				-- upvalues: (copy) v_u_143
				v_u_143:SwitchToReactPage(nil, nil, true)
			end,
			["onUnmount"] = function() -- name: onUnmount
				-- upvalues: (copy) v_u_143, (ref) v_u_27
				v_u_143:CloseReactPage()
				v_u_27(false).setCurrentReactPage(nil)
			end,
			["mountTo"] = v_u_143.ReactPage
		}),
		["TraversalHistoryMenuBottomBar"] = v_u_19.createElement(v793, {
			["showSignal"] = v_u_143.showBottomBarSignal,
			["parent"] = v774,
			["menuSide"] = v_u_21.Enums.PopoverSide.Top,
			["currentPageChangeSignal"] = v_u_143.CurrentPageSignal
		}),
		["TraversalHistoryMenuMobileButton"] = v_u_19.createElement(v793, {
			["showSignal"] = v_u_48.createComputed(function(p794)
				-- upvalues: (copy) v_u_143
				return not v_u_143.showBottomBarSignal(p794)
			end),
			["parent"] = v773,
			["menuSide"] = v_u_21.Enums.PopoverSide.Bottom,
			["currentPageChangeSignal"] = v_u_143.CurrentPageSignal
		})
	}))
	return v_u_143
end
local v_u_796 = {
	["ModuleName"] = "SettingsMenu",
	["KeepVRTopbarOpen"] = true,
	["VRIsExclusive"] = true,
	["VRClosesNonExclusive"] = true,
	["SetVisibility"] = nil
}
v_u_30:RegisterModule(v_u_796)
v_u_30.ModuleOpened.Event:connect(function(p797)
	-- upvalues: (copy) v_u_796, (copy) v_u_30
	if p797 ~= v_u_796.ModuleName and v_u_30:GetModule(p797).VRIsExclusive then
		v_u_796:SetVisibility(false)
	end
end)
local v_u_798 = v795()
if v_u_127 then
	v125(v_u_798)
	v124(v_u_798)
end
function v_u_796.GetExperienceControlStore(_) -- name: GetExperienceControlStore
	-- upvalues: (copy) v_u_798
	return v_u_798:GetExperienceControlStore()
end
function v_u_796.SetVisibility(_, p799, p800, p801, p802, p803) -- name: SetVisibility
	-- upvalues: (copy) v_u_798
	v_u_798:SetVisibility(p799, p800, p801, p802, p803)
end
function v_u_796.SetBackgroundVisibility(_, p804, p805) -- name: SetBackgroundVisibility
	-- upvalues: (copy) v_u_798
	v_u_798:SetBackgroundVisibility(p804, p805)
end
function v_u_796.ToggleVisibility(_, p806, p807) -- name: ToggleVisibility
	-- upvalues: (copy) v_u_798
	v_u_798:ToggleVisibility(p806, p807)
end
function v_u_796.SwitchToPage(_, p808, p809) -- name: SwitchToPage
	-- upvalues: (copy) v_u_798
	v_u_798:SwitchToPage(p808, p809, 1)
end
if v_u_66.FFlagAddUILessMode and v_u_66.FIntAddUILessModeVariant ~= 0 then
	function v_u_796.PopMenu(_, p810, p811, p812) -- name: PopMenu
		-- upvalues: (copy) v_u_798
		return v_u_798:PopMenu(p810, p811, p812)
	end
end
function v_u_796.GetVisibility(_) -- name: GetVisibility
	-- upvalues: (copy) v_u_798
	return v_u_798.Visible
end
function v_u_796.ShowShield(_) -- name: ShowShield
	-- upvalues: (copy) v_u_798
	v_u_798:ShowShield()
end
function v_u_796.HideShield(_) -- name: HideShield
	-- upvalues: (copy) v_u_798
	v_u_798:HideShield()
end
function v_u_796.GetRespawnBehaviour(_) -- name: GetRespawnBehaviour
	-- upvalues: (copy) v_u_798
	return v_u_798:GetRespawnBehaviour()
end
function v_u_796.CloseReactPage(_) -- name: CloseReactPage
	-- upvalues: (copy) v_u_798
	v_u_798:CloseReactPage()
end
function v_u_796.SwitchToReactPage(_, p813, p814, p815) -- name: SwitchToReactPage
	-- upvalues: (copy) v_u_798
	v_u_798:SwitchToReactPage(p813, p814, p815)
end
if v_u_66.FFlagAddInviteFriendsIntegration then
	function v_u_796.InviteToGame(_) -- name: InviteToGame
		-- upvalues: (copy) v_u_798
		v_u_798:InviteToGame()
	end
end
v_u_796.RespawnBehaviourChangedEvent = v_u_798.RespawnBehaviourChangedEvent
v_u_796.SettingsShowSignal = v_u_798.SettingsShowSignal
v_u_796.CurrentPageSignal = v_u_798.CurrentPageSignal
v_u_796.SettingsShowEvent = Instance.new("BindableEvent")
v_u_798.SettingsShowSignal:connect(function(p816)
	-- upvalues: (copy) v_u_796
	v_u_796.SettingsShowEvent:Fire(p816)
end)
v_u_796.Instance = v_u_798
return v_u_796