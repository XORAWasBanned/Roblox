-- Path: CoreGui.RobloxGui.Modules.TopBar
local v_u_1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = v_u_2:WaitForChild("RobloxGui")
local v_u_5 = game:GetService("IXPService")
local v_u_6 = game:GetService("LocalizationService")
local v7 = require(v_u_1.Workspace.Packages.SharedFlags)
local v8 = v7.FFlagBuildExperienceInGameShell
local v_u_9 = require(v_u_1.Workspace.Packages.ExpChat).shouldSkipHistoricalMessage
local v_u_10 = require(script.Flags.FFlagAddTopBarScrim)
local v_u_11 = require(v_u_1.Workspace.Packages.InExperienceLocales).Localization
local v_u_12 = require(v_u_1.Workspace.Packages.Localization).LocalizationProvider
local v_u_13 = require(v_u_1.Workspace.Packages.Style).DesignTokenProvider
local v14 = require(v_u_1.Workspace.Packages.CrossExperienceVoice)
local v_u_15 = require(v_u_1.Packages.ReactSceneUnderstanding)
local v_u_16 = require(v_u_1.Packages.React)
local v_u_17 = require(v_u_1.Packages.Roact)
local v_u_18 = require(v_u_1.Packages.Rodux)
local v_u_19 = require(v_u_1.Packages.RoactRodux)
local v20
if v8 then
	v20 = require(v_u_1.Packages.Signals)
else
	v20 = nil
end
local v21 = require(v_u_1.Packages.UIBlox)
local v_u_22 = require(v_u_1.Packages.Foundation).Enums.ColorMode
local v23 = require(v_u_1.Workspace.Packages.UniversalAppPolicy)
local v_u_24 = v23.RoactAppPolicy
local v_u_25 = v23.AppFeaturePolicies
local v_u_26 = v21.App.Style.Constants
local v_u_27 = require(v_u_1.Workspace.Packages.Display)
local v_u_28 = require(v_u_1.Workspace.Packages.Style).UiModeStyleProvider
local v_u_29 = require(v_u_4.Modules.VoiceChat.VoiceStateContext)
local v_u_30 = require(v_u_4.Modules.Settings.Utility)
local v_u_31 = require(v_u_4.Modules.TenFootInterface)
local v_u_32 = require(v_u_4.Modules.isNewInGameMenuEnabled)
local v_u_33 = require(v_u_1.Workspace.Packages.Chrome).Enabled()
local v_u_34, v_u_35
if v_u_33 then
	v_u_34 = require(v_u_4.Modules.Chrome.Service)
	v_u_35 = require(script.Components.TopBarScrim)
else
	v_u_34 = nil
	v_u_35 = nil
end
local v_u_36 = require(script.Constants)
local v_u_37 = require(script.TokenMappers.MenuNavigationPromptTokenMapper)
local v38 = require(v_u_1.Workspace.Packages.CoreGuiCommon)
local v_u_39 = require(v_u_1.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarSignalizeSetCores
local v_u_40 = v38.Flags.FFlagTopBarSignalizeMenuOpen
local v_u_41 = require(script.Flags.FFlagTopBarDeprecateGameInfoRodux)
local v_u_42 = require(script.Flags.FFlagTopBarDeprecateGamepadNavigationDialogRodux)
local v43 = require(v_u_1.Workspace.Packages.CoreScriptsErrorBoundary)
local v_u_44 = v43.CoreScriptsErrorBoundary
local v_u_45 = v43.Surfaces
local v_u_46 = v43.Flags.FFlagCoreScriptsReactTreeCrashCounter
local v_u_47 = require(script.Flags.FFlagTopBarDeprecateChatRodux)
local v_u_48 = require(script.Flags.FFlagTopBarDeprecateDisplayOptionsRodux)
local v_u_49 = require(v_u_1.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarRefactor
local v_u_50 = v7.FFlagEnablePlaytestModeUnibar
local v51 = nil
if v_u_33 then
	if v8 then
		local v_u_52 = v_u_27.GetDisplayStore(false)
		v_u_52.setGuiInset(function(p53)
			-- upvalues: (copy) v_u_36
			return {
				["left"] = p53.left,
				["top"] = v_u_36.ApplyDisplayScale(v_u_36.TopBarHeight),
				["right"] = p53.right,
				["bottom"] = p53.bottom
			}
		end)
		v51 = v20.createEffect(function(p54)
			-- upvalues: (copy) v_u_52, (copy) v_u_3
			local v55 = v_u_52.getGuiInset(p54)
			v_u_3:SetGlobalGuiInset(v55.left, v55.top, v55.right, v55.bottom)
		end)
	else
		(function() -- name: SetGlobalGuiInset
			-- upvalues: (copy) v_u_3, (copy) v_u_36, (copy) v_u_27
			local v56, v57 = v_u_3:GetGuiInset()
			v_u_3:SetGlobalGuiInset(v56.X, v_u_36.ApplyDisplayScale(v_u_36.TopBarHeight), v57.X, v57.Y)
			v_u_27.GetDisplayStore().setGuiInset({
				["left"] = v56.X,
				["top"] = v_u_36.ApplyDisplayScale(v_u_36.TopBarHeight),
				["right"] = v57.X,
				["bottom"] = v57.Y
			})
		end)()
	end
end
local v_u_58
if v_u_49 then
	v_u_58 = require(script.ComponentsV2.TopBarApp)
else
	v_u_58 = require(script.Components.TopBarApp)
end
local v_u_59 = require(script.Reducer)
local v_u_60 = require(script.TopBarAppPolicy)
local v_u_61 = require(script.Actions.SetSmallTouchDevice)
local v_u_62 = require(script.Actions.SetInspectMenuOpen)
local v_u_63 = require(script.Actions.SetGamepadMenuOpen)
local v_u_64 = require(script.Actions.SetGamepadNavigationDialogOpen)
local v_u_65 = require(script.Actions.UpdateUnreadMessagesBadge)
local v_u_66 = require(script.Thunks.GetCanChat)
local v_u_67 = require(script.Thunks.GetGameName)
local v_u_68 = require(script.registerSetCores)
local v_u_69 = require(script.GlobalConfig)
local v_u_70 = require(v_u_1.Packages.RoactAppExperiment)
local v_u_71 = v7.FFlagAddMenuNavigationToggleDialog
local v_u_72 = v7.FFlagShowGameAgeRating
local v_u_73 = require(script.Flags.FFlagGamepadNavigationDialogABTest)
local v_u_74 = v7.GetFFlagEnableCrossExpVoice
local v_u_75 = v14.Component
local v76 = v_u_4.Modules.FTUX
local v_u_77 = require(v76.Flags.GetFFlagEnableVRFTUXExperience)
local v_u_78 = require(v76.Flags.GetFFlagDebugEnableVRFTUXExperienceInStudio)
local v_u_79 = require(v76.Enums.PlatformEnum)
local v_u_80 = require(v76.Utility.IsFTUXExperience)
local v_u_81 = require(script.Parent.FTUX)
local v_u_82 = require(v_u_1.Workspace.Packages.AppCommonLib).isRunningInStudio
local v_u_83 = require(v_u_1.Workspace.Packages.AppCommonLib).isSpatial
local v_u_84 = require(v_u_1.Workspace.Packages.AppCommonLib).connectToIsSpatialChanged
local v_u_85 = v7.FFlagStudioDeviceSimVRSwitchFixes
local function v_u_89() -- name: SpatialRemountGate
	-- upvalues: (copy) v_u_16, (copy) v_u_83, (copy) v_u_84, (copy) v_u_58
	local v86, v_u_87 = v_u_16.useState(v_u_83())
	v_u_16.useEffect(function()
		-- upvalues: (ref) v_u_84, (copy) v_u_87
		local v_u_88 = v_u_84(v_u_87, true)
		return function()
			-- upvalues: (copy) v_u_88
			v_u_88:Disconnect()
		end
	end, {})
	return v_u_16.createElement(v_u_16.Fragment, {
		["key"] = v86 and "spatial" or "flat"
	}, {
		["TopBarApp"] = v_u_16.createElement(v_u_58)
	})
end
local v_u_90 = {}
v_u_90.__index = v_u_90
if v8 then
	v_u_90._disposeGlobalGuiInsetEffect = v51
end
function v_u_90.new() -- name: new
	-- upvalues: (copy) v_u_90, (copy) v_u_69, (copy) v_u_17, (copy) v_u_31, (copy) v_u_33, (copy) v_u_3, (copy) v_u_36, (copy) v_u_50, (copy) v_u_18, (copy) v_u_59, (copy) v_u_39, (copy) v_u_68, (copy) v_u_47, (copy) v_u_66, (copy) v_u_41, (copy) v_u_67, (copy) v_u_78, (copy) v_u_82, (copy) v_u_81, (copy) v_u_79, (copy) v_u_77, (copy) v_u_80, (copy) v_u_32, (copy) v_u_4, (copy) v_u_48, (copy) v_u_61, (copy) v_u_30, (copy) v_u_22, (copy) v_u_26, (copy) v_u_28, (copy) v_u_85, (copy) v_u_89, (copy) v_u_58, (copy) v_u_71, (copy) v_u_73, (copy) v_u_13, (copy) v_u_37, (ref) v_u_34, (copy) v_u_10, (copy) v_u_16, (ref) v_u_35, (copy) v_u_19, (copy) v_u_49, (copy) v_u_72, (copy) v_u_24, (copy) v_u_60, (copy) v_u_25, (copy) v_u_12, (copy) v_u_11, (copy) v_u_6, (copy) v_u_70, (copy) v_u_5, (copy) v_u_74, (copy) v_u_75, (copy) v_u_15, (copy) v_u_29, (copy) v_u_46, (copy) v_u_44, (copy) v_u_45, (copy) v_u_1, (copy) v_u_2, (copy) v_u_9, (copy) v_u_65, (copy) v_u_42
	local v91 = v_u_90
	local v_u_92 = setmetatable({}, v91)
	if v_u_69.propValidation then
		v_u_17.setGlobalConfig({
			["propValidation"] = true
		})
	end
	if v_u_69.elementTracing then
		v_u_17.setGlobalConfig({
			["elementTracing"] = true
		})
	end
	if not (v_u_31:IsEnabled() or v_u_33) then
		v_u_3:SetGlobalGuiInset(0, v_u_36.TopBarHeight, 0, 0)
	end
	if v_u_50 then
		require(script.initPlaytestMode)()
	end
	v_u_92.store = v_u_18.Store.new(v_u_59, nil, { v_u_18.thunkMiddleware })
	if not v_u_39 then
		v_u_68(v_u_92.store)
	end
	if not v_u_47 then
		v_u_92.store:dispatch(v_u_66)
	end
	if not v_u_41 then
		v_u_92.store:dispatch(v_u_67)
	end
	if v_u_78() and v_u_82() then
		v_u_81.mountFtuxMenu(v_u_79.QuestVR)
	end
	if v_u_77() and v_u_80(v_u_79.QuestVR) then
		v_u_81.mountFtuxMenu(v_u_79.QuestVR)
	end
	if v_u_32() then
		require(v_u_4.Modules.InGameMenuInit).mountInGameMenu()
	end
	if not v_u_48 then
		coroutine.wrap(function()
			-- upvalues: (copy) v_u_92, (ref) v_u_61, (ref) v_u_30
			v_u_92.store:dispatch(v_u_61(v_u_30:IsSmallTouchScreen()))
		end)()
	end
	local v_u_93 = {
		["themeName"] = v_u_22.Dark,
		["fontName"] = v_u_26.FontName.Gotham
	}
	local function v97(p94) -- name: wrapWithUiModeStyleProvider
		-- upvalues: (ref) v_u_17, (ref) v_u_28, (copy) v_u_93
		local v95 = {}
		local v96 = {
			["style"] = v_u_93
		}
		v95.UiModeStyleProvider = v_u_17.createElement(v_u_28, v96, p94)
		return v95
	end
	local v98
	if v_u_85 then
		v98 = v_u_17.createElement(v_u_89)
	else
		v98 = v_u_17.createElement(v_u_58)
	end
	if v_u_71 or v_u_73 then
		local v99 = v_u_17.createElement
		local v100 = v_u_13
		local v101 = {}
		local v102 = {}
		local v103
		if v_u_73 then
			v103 = v_u_37
		else
			v103 = nil
		end
		v102.MenuNavigationPrompt = v103
		v101.tokenMappers = v102
		v98 = v99(v100, v101, {
			["TopBarApp"] = v98
		})
	end
	local v104 = v_u_34 and v_u_10
	if v104 then
		v104 = v_u_16.createElement("ScreenGui", {
			["IgnoreGuiInset"] = true,
			["ZIndexBehavior"] = nil,
			["DisplayOrder"] = -2,
			["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
		}, {
			["TopBarScrim"] = v_u_16.createElement(v_u_35)
		})
	end
	local v105 = v_u_17.createElement
	local v106 = v_u_19.StoreProvider
	local v107 = {
		["store"] = v_u_92.store
	}
	local v108 = {}
	local v109 = v_u_17.createElement
	local v110
	if v_u_49 or v_u_72 then
		v110 = v_u_24.Provider
	else
		v110 = v_u_60.Provider
	end
	local v111 = {}
	local v112
	if v_u_49 or v_u_72 then
		v112 = { v_u_25 }
	else
		v112 = { v_u_60.Mapper }
	end
	v111.policy = v112
	local v113 = {}
	local v114 = v_u_17.createElement
	local v115 = v_u_12
	local v116 = {
		["localization"] = v_u_11.new(v_u_6.RobloxLocaleId)
	}
	local v117 = {}
	local v118 = v_u_17.createFragment
	local v119 = {}
	local v120 = {
		["value"] = v_u_5
	}
	v119.RoactAppExperimentProvider = v_u_17.createElement(v_u_70.Provider, v120, {
		["TopBarApp"] = v98,
		["TopBarScrim"] = v104
	})
	v119.CrossExperienceVoice = v_u_74() and v_u_17.createElement(v_u_75) or nil
	v117.ExperimentProvider = v118(v119)
	v113.LocalizationProvider = v114(v115, v116, v117)
	v108.PolicyProvider = v109(v110, v111, (v97(v113)))
	v_u_92.root = v105(v106, v107, v108)
	v_u_92.root = v_u_17.createElement(v_u_15.SceneAnalysisProvider, nil, v_u_92.root)
	v_u_92.root = v_u_17.createElement(v_u_29.Provider, nil, v_u_92.root)
	v_u_92.root = v_u_17.createElement("Folder", {
		["Name"] = "TopBarApp"
	}, v_u_92.root)
	if v_u_46 then
		v_u_92.root = v_u_17.createElement(v_u_44, {
			["surface"] = v_u_45.TopBar
		}, v_u_92.root)
	end
	if not require(v_u_1.Workspace.Packages.BuildExperiencePlaytestLaunch.teamCreateUtils).isViewer() then
		v_u_92.element = v_u_17.mount(v_u_92.root, v_u_2, "TopBar")
	end
	if not v_u_47 then
		game:GetService("TextChatService").MessageReceived:Connect(function(p121)
			-- upvalues: (ref) v_u_9, (copy) v_u_92, (ref) v_u_65
			if not v_u_9(p121) then
				v_u_92.store:dispatch(v_u_65(1))
			end
		end)
	end
	if v_u_73 and not v_u_42 then
		local v122 = game:GetService("UserInputService")
		local v_u_123 = nil
		local function v124() -- name: disconnectGamepadConnected
			-- upvalues: (ref) v_u_123
			if v_u_123 then
				v_u_123:Disconnect()
				v_u_123 = nil
			end
		end
		if v122:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
			v_u_92:setGamepadNavigationDialogOpen(true)
		else
			v_u_123 = v122.GamepadConnected:Connect(function()
				-- upvalues: (copy) v_u_92, (ref) v_u_123
				v_u_92:setGamepadNavigationDialogOpen(true)
				if v_u_123 then
					v_u_123:Disconnect()
					v_u_123 = nil
				end
			end)
		end
		v_u_3:GetPropertyChangedSignal("MenuIsOpen"):Connect(v124)
	end
	return v_u_92
end
function v_u_90.setInspectMenuOpen(p125, p126) -- name: setInspectMenuOpen
	-- upvalues: (copy) v_u_40, (copy) v_u_62
	if not v_u_40 then
		p125.store:dispatch(v_u_62(p126))
	end
end
function v_u_90.setGamepadMenuOpen(p127, p128) -- name: setGamepadMenuOpen
	-- upvalues: (copy) v_u_63
	p127.store:dispatch(v_u_63(p128))
end
function v_u_90.setGamepadNavigationDialogOpen(p129, p130) -- name: setGamepadNavigationDialogOpen
	-- upvalues: (copy) v_u_48, (copy) v_u_64
	if not v_u_48 then
		p129.store:dispatch(v_u_64(p130))
	end
end
return v_u_90.new()