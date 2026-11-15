-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.TopBarApp
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("ContextActionService")
local v_u_4 = v2:WaitForChild("RobloxGui")
game:GetService("Players")
local v_u_5 = game:GetService("VRService")
local v_u_6 = game:GetService("TextChatService")
local v_u_7 = game:GetService("TweenService")
local v8 = require(v1.Workspace.Packages.SharedFlags)
local v_u_9 = require(v1.Packages.Signals)
local v_u_10 = require(v1.Workspace.Packages.Display)
local v11 = require(v1.Packages.Foundation)
local v_u_12 = v11.Image
local v_u_13 = v11.View
local v_u_14 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v_u_15 = require(v1.Packages.Roact)
local v_u_16 = require(v1.Packages.React)
local v17 = require(v1.Packages.RoactRodux)
local v18 = require(v1.Packages.t)
local v19 = require(v1.Packages.UIBlox)
local v_u_20 = v19.Core.Control.Interactable
local v_u_21 = v19.Core.Control.Enum.ControlState
local v_u_22 = v19.Core.ImageSet.ImageSetButton
local v23 = require(v1.Workspace.Packages.UniversalAppPolicy)
local v_u_24 = v8.FFlagCoreUiMigrateUIBloxToFoundation
local v_u_25 = v8.FFlagEnableTeamTestLua
local v_u_26 = v_u_24 and "icons/controls/close-ingame" or v19.App.ImageSet.Images["icons/controls/close-ingame"]
local v_u_27 = v19.App.SelectionImage.SelectionCursorProvider
local v28 = require(v1.Workspace.Packages.BuildExperience)
local v_u_29 = require(v1.Workspace.Packages.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local v_u_30 = require(v1.Workspace.Packages.Songbird)
local v31 = require(v1.Workspace.Packages.CoreScriptsRoactCommon).Traversal
local v_u_32 = require(v1.Workspace.Packages.CoreGuiCommon)
local v_u_33 = v_u_32.Stores
local v_u_34 = require(v1.Workspace.Packages.Localization).withLocalization
local v_u_35 = require(v_u_4.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local v_u_36 = require(v_u_4.Modules.Settings.SettingsHub)
local v_u_37 = require(v1.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local v38 = script.Parent.Presentation
local v_u_39 = v28.BuildPillMenuPortalHost
local v_u_40 = require(v38.MenuIcon)
local v_u_41 = require(v38.ChatIcon)
local v_u_42 = require(v38.MoreMenu)
local v_u_43 = require(v38.HealthBar)
local v_u_44 = require(v38.HurtOverlay)
local v_u_45 = require(v38.GamepadNavigationDialog)
local v_u_46 = require(v38.HeadsetMenu)
local v_u_47 = v_u_32.Components.HeadsetDisconnectDialog
local v_u_48 = require(v38.PlaytestModeTooltip)
local v_u_49 = v28.UnpublishedPlaytestModeTooltip
local v_u_50 = require(script.Parent.TraversalBackButton)
local v_u_51 = script.Parent.Parent.Parent.Chrome
local v_u_52 = require(v1.Workspace.Packages.Chrome).Enabled
local v_u_53 = require(v_u_51.ChromeShared.Unibar.PlaytestModeThemeProvider)
local v_u_54 = v8.FFlagEnablePlaytestModeUnibar
local v_u_55 = v_u_32.Flags.FFlagEnableUISelector
local v_u_56 = v8.FFlagAppNavMyStatsTab
local v_u_57 = v8.FFlagEnableConsoleExpControls
local v_u_58 = v_u_32.Flags.FFlagTopBarSignalizeKeepOutAreas
local v_u_59 = v8.FFlagAddUILessMode
local v_u_60 = v8.FIntAddUILessModeVariant
local v_u_61 = game:DefineFastInt("UILessTooltipDuration", 10)
local v_u_62 = v_u_32.Flags.FFlagTopBarSignalizeMenuOpen
local v_u_63 = v_u_32.Flags.FFlagTopBarSignalizeScreenSize
local v_u_64 = v31.Flags.FFlagAddTraversalBackButton
local v_u_65 = game:DefineFastFlag("UseNewHeadsetDisconnectDialog", false)
local v_u_66 = require(v1.Workspace.Packages.InExperienceShop)
local v67 = v8.FFlagEnableInExperienceShop
local v_u_68 = v_u_66.FFlagEnableExperienceShopGlobalIcon and v67
local v_u_69 = v_u_66.FFlagCenterInExperienceShopWindow
local v_u_70 = v_u_66.FFlagExperienceShopNewIconography
local v_u_71 = v_u_66.ShopGlobalIcon
local v_u_72 = require(script.Parent.Parent.Flags.FFlagTopBarShopIconV2)
local v_u_73
if v_u_72 then
	v_u_73 = require(v38.ShopIcon)
else
	v_u_73 = nil
end
local v_u_74 = require(v1.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local v75 = v8.FFlagShowGameAgeRating
local v_u_76 = require(v1.Workspace.Packages.InExperienceTopBar).Flags.FFlagExperienceAgeRatingBadge
local v_u_77 = v_u_76 and v75
local v_u_78 = require(v1.Workspace.Packages.InExperienceTopBar.ExperienceAgeRatingBadge)
local v_u_79 = require(script.Parent.Parent.ExperienceAgeRatingPolicy)
local v_u_80 = require(v1.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v_u_81 = require(v1.Workspace.Packages.AppCommonLib).isSpatial
local v82 = v8.FFlagShowSwitchServerButton
local v83 = require(v1.Workspace.Packages.PioneerUtils).isPioneerLaunch
local v_u_84
if v_u_74 then
	v_u_84 = v82 or v83()
else
	v_u_84 = v_u_74
end
local v85 = require(v1.Workspace.Packages.SwitchServer)
local v_u_86 = v85.SwitchServerConfirmation
local v_u_87 = v85.GetSwitchServerStore
local v_u_88 = nil
local v_u_89 = nil
local v_u_90
if v_u_52() then
	v_u_90 = require(v_u_51.ChromeShared.Unibar)
else
	v_u_90 = nil
end
if game:GetEngineFeature("InGameChromeSignalAPI") then
	v_u_88 = require(v_u_51.ChromeShared.Service.KeepOutAreasHandler)
	if v_u_52() then
		v_u_89 = require(v_u_51.ChromeShared.Analytics)
	end
end
local v_u_91 = nil
local v_u_92, v_u_93
if v_u_52() then
	v_u_92 = require(v_u_51.ChromeShared.Service.LocalStore)
	v_u_93 = require(v_u_51.ChromeShared.Unibar.Constants)
	if v_u_68 then
		v_u_91 = require(v_u_51.Integrations.CommonIcon)
	end
else
	v_u_93 = nil
	v_u_92 = nil
end
if v_u_72 then
	if v_u_64 then
		v_u_72 = v_u_52()
	else
		v_u_72 = v_u_64
	end
end
local v_u_94 = require(script.Parent.Connection)
local v95 = v38.Parent.Parent
local v_u_96 = require(v95.Constants)
local v_u_97 = require(v95.Actions.SetScreenSize)
local v_u_98 = require(v95.Actions.SetKeepOutArea)
local v_u_99 = require(v95.Actions.RemoveKeepOutArea)
local v_u_100
if v_u_52() and (v_u_57 or v_u_76) then
	v_u_100 = require(script.Parent.MenuIconContext)
else
	v_u_100 = nil
end
local v_u_101 = nil
local v_u_102 = nil
local v_u_103 = nil
local v_u_104 = nil
if v_u_52() and v_u_57 then
	v_u_102 = require(script.Parent.GamepadConnector)
	v_u_103 = v8.FFlagAddMenuNavigationToggleDialog
	v_u_104 = require(v38.GamepadMenu.MenuNavigationToggleDialog)
else
	v_u_101 = require(v38.GamepadMenu)
end
local v_u_105 = v8.FFlagResponsiveUnitsDeprecateTenFoot
local v_u_106 = require(v_u_4.Modules.TenFootInterface)
local v_u_107 = require(v_u_4.Modules.isNewInGameMenuEnabled)
local v_u_108 = require(v_u_4.Modules.isNewTiltIconEnabled)
local v_u_109 = require(v95.Flags.FFlagGamepadNavigationDialogABTest)
local v_u_110 = v8.GetFFlagEnableCrossExpVoice
local v_u_111 = require(script.Parent.Parent.Parent.Chrome.Integrations.Party.PartyMicBinder)
local v112 = v8.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local v_u_113
if game:GetEngineFeature("VoiceChatSupported") and (v112() and v_u_52()) then
	v_u_113 = require(script.Parent.Parent.Parent.Chrome.Integrations.JoinVoiceBinder)
else
	v_u_113 = nil
end
local v_u_114 = require(v_u_4.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_115 = require(v_u_4.Modules.VoiceChat.VoiceStateContext)
local v116 = require(script.Parent.Parent.TopBarAppPolicy)
local v_u_117 = v_u_52()
local v_u_118
if v_u_80 and v_u_52() then
	v_u_118 = require(script.Parent.VRBottomUnibar)
else
	v_u_118 = require(v_u_4.Modules.VR.VRBottomBar.VRBottomBar)
end
local v119 = v_u_15.PureComponent:extend("TopBarApp")
local v120 = v18.strictInterface
local v121 = {}
local v122
if v_u_62 then
	v122 = nil
else
	v122 = v18.optional(v18.boolean)
end
v121.menuOpen = v122
local v123
if v_u_62 then
	v123 = nil
else
	v123 = v18.optional(v18.boolean)
end
v121.inspectMenuOpen = v123
local v124
if v_u_63 then
	v124 = nil
else
	v124 = v18.callback
end
v121.setScreenSize = v124
local v125
if v_u_58 then
	v125 = nil
else
	v125 = v18.callback
end
v121.setKeepOutArea = v125
local v126
if v_u_58 then
	v126 = nil
else
	v126 = v18.callback
end
v121.removeKeepOutArea = v126
v121.showGameAgeRating = v18.optional(v18.boolean)
v119.validateProps = v120(v121)
function v119.init(p_u_127) -- name: init
	-- upvalues: (copy) v_u_15, (copy) v_u_9, (copy) v_u_10, (copy) v_u_59, (copy) v_u_33, (copy) v_u_60, (copy) v_u_7, (ref) v_u_92, (ref) v_u_93, (copy) v_u_61, (copy) v_u_36, (copy) v_u_35, (copy) v_u_3, (copy) v_u_62, (copy) v_u_37, (copy) v_u_58, (copy) v_u_32, (copy) v_u_76, (copy) v_u_81, (copy) v_u_16, (copy) v_u_79, (copy) v_u_52, (copy) v_u_51, (copy) v_u_57, (ref) v_u_102, (copy) v_u_68, (copy) v_u_72, (copy) v_u_66, (copy) v_u_69, (copy) v_u_6, (copy) v_u_84, (copy) v_u_87
	local v128, v129 = v_u_15.createBinding(UDim2.new())
	p_u_127.unibarRightSidePosition = v128
	p_u_127.setUnibarRightSidePosition = v129
	local v130, v131 = v_u_15.createBinding(false)
	p_u_127.closeButtonState = v130
	p_u_127.setCloseButtonState = v131
	p_u_127.disposeUiScaleEffect = v_u_9.createEffect(function(p132)
		-- upvalues: (ref) v_u_10, (copy) p_u_127
		p_u_127:setState({
			["UiScale"] = v_u_10.GetDisplayStore(p132).getUIScale(p132)
		})
	end)
	if v_u_59 then
		p_u_127.uiLessStore = v_u_33.GetUILessStore(false)
		if v_u_60 ~= 0 then
			local v133, v134 = v_u_15.createBinding(false)
			p_u_127.uiLessTooltipVisible = v133
			p_u_127.setUILessTooltipVisible = v134
			local v135, v136 = v_u_15.createBinding(0)
			p_u_127.uiLessTooltipTransparency = v135
			p_u_127.setUILessTooltipTransparency = v136
			function p_u_127.fadeOutUILessTooltip()
				-- upvalues: (copy) p_u_127, (ref) v_u_7
				local v_u_137 = Instance.new("NumberValue")
				v_u_137.Value = 0
				v_u_137:GetPropertyChangedSignal("Value"):Connect(function()
					-- upvalues: (ref) p_u_127, (copy) v_u_137
					p_u_127.setUILessTooltipTransparency(v_u_137.Value)
				end)
				p_u_127.uiLessTooltipTween = v_u_7:Create(v_u_137, TweenInfo.new(0.5), {
					["Value"] = 1
				})
				p_u_127.uiLessTooltipTween.Completed:Connect(function()
					-- upvalues: (ref) p_u_127
					p_u_127.setUILessTooltipVisible(false)
					p_u_127.uiLessTooltipTween = nil
				end)
				p_u_127.uiLessTooltipTween:Play()
			end
			function p_u_127.cleanupUILessTooltip()
				-- upvalues: (copy) p_u_127
				if p_u_127.uiLessTooltipTween then
					p_u_127.uiLessTooltipTween:Cancel()
					p_u_127.uiLessTooltipTween = nil
				end
				if p_u_127.uiLessTooltipTimer then
					task.cancel(p_u_127.uiLessTooltipTimer)
					p_u_127.uiLessTooltipTimer = nil
				end
			end
			if p_u_127.uiLessStore.getUILessModeEnabled(false) then
				local v138
				if v_u_92 then
					local v139 = v_u_92.loadForLocalPlayer("NumExperiencesUserSeenUILessTooltipKey2") or 0
					v138 = v139 < v_u_93.MAX_NUM_UNIVERSES_SHOWN
					if v138 then
						v_u_92.storeForLocalPlayer("NumExperiencesUserSeenUILessTooltipKey2", v139 + 1)
					end
				else
					v138 = true
				end
				if v138 then
					p_u_127.setUILessTooltipVisible(true)
					p_u_127.uiLessTooltipTimer = task.delay(v_u_61, function()
						-- upvalues: (copy) p_u_127
						p_u_127.fadeOutUILessTooltip()
						p_u_127.uiLessTooltipTimer = nil
					end)
				end
			end
			v_u_3:BindCoreAction("ToggleUILess", function(_, p140)
				-- upvalues: (copy) p_u_127, (ref) v_u_60, (ref) v_u_36, (ref) v_u_35
				if p140 == Enum.UserInputState.Begin then
					if p_u_127.uiLessStore.getUILessModeEnabled(false) then
						if v_u_60 == 1 then
							p_u_127.uiLessStore.setUIVisible(function(p141)
								-- upvalues: (ref) v_u_36, (ref) v_u_35
								if p141 == v_u_36:GetVisibility() then
									v_u_36:PopMenu(false, true, v_u_35.AnalyticsMenuOpenTypes.Keyboard)
								end
								return not p141
							end)
							p_u_127.cleanupUILessTooltip()
							p_u_127.setUILessTooltipVisible(false)
							return
						end
						if v_u_60 == 2 then
							p_u_127.uiLessStore.setUIVisible(function(p142)
								return not p142
							end)
							if v_u_36:GetVisibility() then
								v_u_36:PopMenu(false, true, v_u_35.AnalyticsMenuOpenTypes.Keyboard)
							end
							p_u_127.cleanupUILessTooltip()
							p_u_127.setUILessTooltipVisible(false)
							return
						end
					else
						v_u_36:PopMenu(false, true, v_u_35.AnalyticsMenuOpenTypes.Keyboard)
					end
				end
			end, false, Enum.KeyCode.Escape)
		end
	end
	if v_u_62 then
		local v143, v144 = v_u_15.createBinding(false)
		p_u_127.tiltMenuOpen = v143
		p_u_127.setTiltMenuOpen = v144
		local v145, v146 = v_u_15.createBinding(false)
		p_u_127.inspectMenuOpen = v145
		p_u_127.setInspectMenuOpen = v146
		p_u_127.inspectMenuDisposeEffect = v_u_9.createEffect(function(p147)
			-- upvalues: (ref) v_u_33, (copy) p_u_127
			local v148 = v_u_33.GetInspectAndBuyStore(p147).getInspectAndBuyOpen(p147)
			p_u_127.setInspectMenuOpen(v148)
		end)
		v_u_37:connect(function(p149)
			-- upvalues: (copy) p_u_127
			p_u_127.setTiltMenuOpen(p149)
		end)
	end
	if v_u_58 then
		p_u_127.keepOutAreasStore = v_u_32.Stores.GetKeepOutAreasStore(false)
	end
	if v_u_76 then
		p_u_127:setState({
			["ageRatingSpatial"] = v_u_81()
		})
		local v150, v151 = v_u_16.createBinding(true)
		p_u_127.ageRatingControlsVisible = v150
		p_u_127.setAgeRatingControlsVisible = v151
		local v152, v153 = v_u_16.createBinding(0)
		p_u_127.ageRatingControlsWidth = v152
		p_u_127.setAgeRatingControlsWidth = v153
		function p_u_127.onAgeRatingControlsSizeChanged(p154)
			-- upvalues: (copy) p_u_127
			p_u_127.setAgeRatingControlsWidth(p154.AbsoluteSize.X)
		end
		function p_u_127.onAgeRatingUnibarAreaChanged(p155, p156, p157)
			-- upvalues: (copy) p_u_127, (ref) v_u_58
			p_u_127.setAgeRatingControlsWidth(p157.X)
			local v158
			if v_u_58 then
				v158 = p_u_127.keepOutAreasStore.setKeepOutArea
			else
				v158 = p_u_127.props.setKeepOutArea
			end
			v158(p155, p156, p157)
		end
		function p_u_127.onAgeRatingAreaChanged(p159)
			-- upvalues: (ref) v_u_58, (copy) p_u_127, (ref) v_u_79
			local v160
			if v_u_58 then
				v160 = p_u_127.keepOutAreasStore.setKeepOutArea
			else
				v160 = p_u_127.props.setKeepOutArea
			end
			local v161 = v_u_79.keepOutAreaId
			local v162
			if p159 then
				v162 = p159.AbsolutePosition
			else
				v162 = Vector2.zero
			end
			local v163
			if p159 then
				v163 = p159.AbsoluteSize
			else
				v163 = Vector2.zero
			end
			v160(v161, v162, v163)
		end
	end
	function p_u_127.onCloseBtnStateChange(_, p164)
		-- upvalues: (copy) p_u_127
		p_u_127.setCloseButtonState(p164)
	end
	if v_u_52() then
		local v_u_165 = require(v_u_51.Service)
		p_u_127:setState({
			["unibarAlignment"] = v_u_165:orderAlignment():get()
		})
		if v_u_57 then
			p_u_127.GamepadConnector = v_u_102
		end
		if v_u_57 then
			p_u_127.unibarMenuRef = v_u_16.createRef()
			p_u_127.menuIconRef = v_u_15.createRef()
		end
		if v_u_68 and not v_u_72 then
			p_u_127.shopGlobalIconDisposeEffect = v_u_9.createEffect(function(p166)
				-- upvalues: (ref) v_u_66, (copy) p_u_127
				local v167 = v_u_66.GetShopGlobalIconStore
				if v167 then
					local v168 = v167(p166)
					p_u_127:setState({
						["shopGlobalIconEnabled"] = v168.getEnabled(p166),
						["shopGlobalStatusIndicatorEnabled"] = v168.getStatusIndicatorEnabled(p166)
					})
				end
			end)
			function p_u_127.onShopGlobalIconActivated()
				-- upvalues: (ref) v_u_69, (ref) v_u_51, (copy) v_u_165, (ref) v_u_93
				if v_u_69 then
					require(v_u_51.Integrations.InExperienceShop.ShopWindowLayout).toggleInExperienceShopWindow()
				else
					v_u_165:toggleWindow(v_u_93.IN_EXPERIENCE_SHOP_ID)
				end
			end
			local v169 = v_u_66.initShopGlobalIcon
			if v169 then
				v169 = v_u_66.initShopGlobalIcon()
			end
			p_u_127.shopGlobalIconCleanup = v169
			p_u_127.shopIsActiveMappedSignal = require(v_u_51.ChromeShared.Service.ChromeUtils).MappedSignal.new(v_u_165:onIntegrationStatusChanged(), function()
				-- upvalues: (copy) v_u_165, (ref) v_u_93
				return v_u_165:isWindowOpen(v_u_93.IN_EXPERIENCE_SHOP_ID)
			end)
		end
	end
	p_u_127:setState({
		["chatVersion"] = v_u_6.ChatVersion
	})
	if not game:IsLoaded() then
		game.Loaded:Connect(function()
			-- upvalues: (copy) p_u_127, (ref) v_u_6
			p_u_127:setState({
				["chatVersion"] = v_u_6.ChatVersion
			})
		end)
	end
	if v_u_84 then
		p_u_127.disposeSwitchServerEffect = v_u_9.createEffect(function(p170)
			-- upvalues: (ref) v_u_87, (copy) p_u_127
			local v171 = v_u_87(false)
			p_u_127:setState({
				["shouldEnableSwitchServer"] = v171.shouldEnableSwitchServer(p170),
				["isConfirmationOpen"] = v171.isConfirmationOpen(p170)
			})
		end)
		p_u_127.setConfirmationOpen = v_u_87(false).setConfirmationOpen
	end
end
function v119.didMount(p_u_172) -- name: didMount
	-- upvalues: (copy) v_u_76, (ref) v_u_102, (copy) v_u_59, (copy) v_u_60, (copy) v_u_9, (copy) v_u_5, (copy) v_u_81, (copy) v_u_52, (copy) v_u_51, (copy) v_u_68, (copy) v_u_72, (ref) v_u_93, (copy) v_u_57
	if v_u_76 then
		if v_u_102 then
			local v_u_173 = v_u_102:getShowTopBar()
			p_u_172.ageRatingVisibilityConnection = v_u_173:connect(function()
				-- upvalues: (copy) p_u_172, (copy) v_u_173
				p_u_172.setAgeRatingControlsVisible(v_u_173:get())
			end, true)
		end
		if v_u_59 and (v_u_60 ~= 0 and p_u_172.uiLessStore) then
			p_u_172.ageRatingVisibilityEffect = v_u_9.createEffect(function(p174)
				-- upvalues: (copy) p_u_172
				if p_u_172.uiLessStore.getUILessModeEnabled(p174) then
					p_u_172.setAgeRatingControlsVisible(p_u_172.uiLessStore.getUIVisible(p174))
				end
			end)
		end
		p_u_172.ageRatingSpatialConnection = v_u_5:GetPropertyChangedSignal("VREnabled"):Connect(function()
			-- upvalues: (copy) p_u_172, (ref) v_u_81
			p_u_172:setState({
				["ageRatingSpatial"] = v_u_81()
			})
		end)
	end
	if v_u_52() then
		local v_u_175 = require(v_u_51.Service)
		p_u_172.orderAlignmentConnection = v_u_175:orderAlignment():connect(function()
			-- upvalues: (copy) p_u_172, (copy) v_u_175
			p_u_172:setState({
				["unibarAlignment"] = v_u_175:orderAlignment():get()
			})
		end)
		if v_u_68 and not v_u_72 then
			p_u_172.shopIsActiveConnection = v_u_175:onIntegrationStatusChanged():connect(function()
				-- upvalues: (copy) p_u_172, (copy) v_u_175, (ref) v_u_93
				p_u_172:setState({
					["shopGlobalIconIsActive"] = v_u_175:isWindowOpen(v_u_93.IN_EXPERIENCE_SHOP_ID)
				})
			end)
		end
		if v_u_57 then
			if not v_u_81() then
				p_u_172.GamepadConnector:connectToTopbar()
			end
			p_u_172.vrEnabledConnection = v_u_5:GetPropertyChangedSignal("VREnabled"):Connect(function()
				-- upvalues: (ref) v_u_81, (copy) p_u_172
				if v_u_81() then
					p_u_172.GamepadConnector:disconnectFromTopbar()
				else
					p_u_172.GamepadConnector:connectToTopbar()
				end
			end)
		end
	end
end
function v119.willUnmount(p176) -- name: willUnmount
	-- upvalues: (copy) v_u_52, (copy) v_u_57, (copy) v_u_68, (copy) v_u_72, (copy) v_u_59, (copy) v_u_60, (copy) v_u_3, (copy) v_u_62, (copy) v_u_58, (copy) v_u_84
	if p176.ageRatingVisibilityConnection then
		p176.ageRatingVisibilityConnection:disconnect()
	end
	if p176.ageRatingVisibilityEffect then
		p176.ageRatingVisibilityEffect()
	end
	if p176.ageRatingSpatialConnection then
		p176.ageRatingSpatialConnection:Disconnect()
	end
	if v_u_52() then
		if p176.orderAlignmentConnection then
			p176.orderAlignmentConnection:disconnect()
			p176.orderAlignmentConnection = nil
		end
		if v_u_57 then
			if p176.vrEnabledConnection then
				p176.vrEnabledConnection:Disconnect()
				p176.vrEnabledConnection = nil
			end
			p176.GamepadConnector:disconnectFromTopbar()
		end
	end
	if p176.disposeUiScaleEffect then
		p176.disposeUiScaleEffect()
	end
	if v_u_68 and not v_u_72 then
		if v_u_52() and p176.shopGlobalIconDisposeEffect then
			p176.shopGlobalIconDisposeEffect()
		end
		if p176.shopIsActiveConnection then
			p176.shopIsActiveConnection:disconnect()
			p176.shopIsActiveConnection = nil
		end
		if p176.shopGlobalIconCleanup then
			p176.shopGlobalIconCleanup()
			p176.shopGlobalIconCleanup = nil
		end
	end
	if v_u_59 then
		if p176.uiLessStore then
			p176.uiLessStore.cleanup()
		end
		if v_u_60 ~= 0 then
			p176.cleanupUILessTooltip()
			v_u_3:UnbindCoreAction("ToggleUILess")
		end
	end
	if v_u_62 then
		if p176.tiltMenuDisposeEffect then
			p176.tiltMenuDisposeEffect()
		end
		if p176.inspectMenuDisposeEffect then
			p176.inspectMenuDisposeEffect()
		end
	end
	if v_u_58 and p176.keepOutAreasStore then
		p176.keepOutAreasStore.cleanup()
	end
	if v_u_84 and p176.disposeSwitchServerEffect then
		p176.disposeSwitchServerEffect()
	end
end
function v119.render(p_u_177) -- name: render
	-- upvalues: (copy) v_u_14
	return v_u_14(function(p178)
		local v179 = {}
		local v180 = {
			["Overlay"] = {
				["Color"] = p178.Color.Common.Scrim.Color3,
				["Transparency"] = p178.Color.Common.Scrim.Transparency
			},
			["BackgroundOnHover"] = {
				["Color"] = p178.Color.State.Hover.Color3,
				["Transparency"] = p178.Color.State.Hover.Transparency
			},
			["BackgroundOnPress"] = {
				["Color"] = p178.Color.State.Press.Color3,
				["Transparency"] = p178.Color.State.Press.Transparency
			}
		}
		v179.Theme = v180
		local v181 = {}
		local v182 = {}
		local v183 = {
			["White"] = {
				["White_100"] = p178.Color.Extended.White.White_100
			}
		}
		v182.Extended = v183
		v181.Color = v182
		v181.Size = {
			["Size_100"] = p178.Size.Size_100,
			["Size_200"] = p178.Size.Size_200,
			["Size_300"] = p178.Size.Size_300
		}
		v181.Radius = {
			["Small"] = p178.Radius.Small
		}
		v181.FontSize = {
			["FontSize_300"] = p178.FontSize.FontSize_300
		}
		local v184 = {
			["Color"] = {
				["White"] = p178.Color.Extended.White.White_100
			},
			["Space_50"] = p178.Size.Size_100,
			["Space_100"] = p178.Size.Size_200,
			["Space_150"] = p178.Size.Size_300,
			["FontSize_50"] = p178.FontSize.FontSize_300
		}
		v181.Global = v184
		local v185 = {
			["Radius"] = {
				["Small"] = p178.Radius.Small
			}
		}
		v181.Semantic = v185
		v179.Tokens = v181
		return v179
	end, function(p186)
		-- upvalues: (copy) p_u_177
		return p_u_177:renderWithStyle(p186)
	end)
end
function v119.renderUnibarFrame(p_u_187, p188, p189) -- name: renderUnibarFrame
	-- upvalues: (copy) v_u_80, (copy) v_u_81, (copy) v_u_57, (copy) v_u_77, (copy) v_u_16, (copy) v_u_100, (ref) v_u_90, (copy) v_u_64, (copy) v_u_58, (copy) v_u_72, (copy) v_u_15
	if v_u_80 and v_u_81() then
		return nil
	end
	if not (v_u_57 or v_u_77) then
		local v190 = v_u_15.createElement
		local v191 = v_u_90
		local v192 = {
			["layoutOrder"] = 1,
			["onAreaChanged"] = nil,
			["onMinWidthChanged"] = nil
		}
		local v193
		if v_u_58 then
			v193 = p_u_187.keepOutAreasStore.setKeepOutArea
		else
			v193 = p_u_187.props.setKeepOutArea
		end
		v192.onAreaChanged = v193
		v192.onMinWidthChanged = not v_u_72 and function(p194)
			-- upvalues: (copy) p_u_187
			p_u_187.setUnibarRightSidePosition(UDim2.new(0, p194, 0, 0))
		end or nil
		return v190(v191, v192)
	end
	local v195 = v_u_16.createElement
	local v196 = v_u_100.Provider
	local v197 = {
		["value"] = {
			["menuIconRef"] = p_u_187.menuIconRef,
			["replacesAgeRating"] = p189
		}
	}
	local v198 = {}
	local v199 = v_u_16.createElement
	local v200 = v_u_90
	local v201 = {
		["layoutOrder"] = 1,
		["onAreaChanged"] = nil,
		["onMinWidthChanged"] = nil,
		["menuRef"] = nil
	}
	local v202
	if v_u_77 and not v_u_64 then
		v202 = p_u_187.onAgeRatingUnibarAreaChanged
	elseif v_u_58 then
		v202 = p_u_187.keepOutAreasStore.setKeepOutArea
	else
		v202 = p_u_187.props.setKeepOutArea
	end
	v201.onAreaChanged = v202
	v201.onMinWidthChanged = not v_u_72 and function(p203)
		-- upvalues: (copy) p_u_187
		p_u_187.setUnibarRightSidePosition(UDim2.new(0, p203, 0, 0))
	end or nil
	local v204
	if p188 then
		v204 = p_u_187.unibarMenuRef
	else
		v204 = nil
	end
	v201.menuRef = v204
	__set_list(v198, 1, {v199(v200, v201)})
	return v195(v196, v197, v198)
end
function v119.renderWithStyle(p_u_205, p_u_206) -- name: renderWithStyle
	-- upvalues: (copy) v_u_52, (copy) v_u_79, (copy) v_u_76, (copy) v_u_81, (copy) v_u_96, (copy) v_u_72, (copy) v_u_68, (copy) v_u_56, (copy) v_u_29, (copy) v_u_5, (ref) v_u_93, (copy) v_u_62, (copy) v_u_106, (copy) v_u_15, (copy) v_u_115, (copy) v_u_118, (copy) v_u_114, (copy) v_u_80, (copy) v_u_40, (copy) v_u_57, (copy) v_u_58, (copy) v_u_27, (copy) v_u_54, (copy) v_u_53, (copy) v_u_16, (copy) v_u_13, (copy) v_u_78, (copy) v_u_63, (copy) v_u_94, (copy) v_u_48, (copy) v_u_25, (copy) v_u_49, (copy) v_u_55, (copy) v_u_32, (ref) v_u_101, (ref) v_u_103, (ref) v_u_104, (copy) v_u_109, (copy) v_u_45, (copy) v_u_84, (copy) v_u_86, (copy) v_u_65, (copy) v_u_47, (copy) v_u_46, (ref) v_u_88, (copy) v_u_44, (copy) v_u_74, (copy) v_u_108, (copy) v_u_59, (copy) v_u_60, (copy) v_u_34, (ref) v_u_90, (copy) v_u_107, (copy) v_u_20, (copy) v_u_4, (copy) v_u_21, (copy) v_u_24, (copy) v_u_12, (copy) v_u_26, (copy) v_u_22, (copy) v_u_30, (ref) v_u_113, (copy) v_u_110, (copy) v_u_111, (ref) v_u_89, (copy) v_u_64, (copy) v_u_50, (ref) v_u_73, (copy) v_u_77, (copy) v_u_117, (copy) v_u_43, (copy) v_u_39, (copy) v_u_71, (copy) v_u_70, (ref) v_u_91, (copy) v_u_105, (copy) v_u_41, (copy) v_u_42
	local v207 = v_u_52()
	local v208 = Enum.HorizontalAlignment.Right
	if p_u_205.state.unibarAlignment ~= nil then
		v208 = p_u_205.state.unibarAlignment
	end
	local v209 = v_u_79.isEligible
	local v210 = p_u_205.props.showGameAgeRating
	local v211 = v208 == Enum.HorizontalAlignment.Left
	local v212
	if v_u_76 then
		v212 = p_u_205.state.ageRatingSpatial
	else
		v212 = v_u_81()
	end
	local v213 = v209(v210, v207, v211, v212)
	local v_u_214 = v_u_96.ScreenSideOffset * p_u_205.state.UiScale
	local v215 = v_u_96.TopBarHeight * p_u_205.state.UiScale
	local v_u_216 = v_u_96.TopBarTopMargin * p_u_205.state.UiScale
	local v_u_217 = v_u_96.TopBarPadding * p_u_205.state.UiScale
	local v_u_218
	if v213 and not v_u_72 then
		v_u_218 = v_u_68 and p_u_205.state.shopGlobalIconEnabled and 0 or v_u_217
	elseif v_u_56 then
		local v219 = v_u_29:hasBuildMode()
		if v219 then
			v219 = not v_u_5.VREnabled
		end
		if v219 then
			v_u_218 = v_u_214
		elseif v_u_72 or not (v_u_68 and p_u_205.state.shopGlobalIconEnabled) then
			v_u_218 = v_u_217
		else
			v_u_218 = 2 * v_u_93.UNIBAR_END_PADDING * p_u_205.state.UiScale
		end
	elseif v_u_72 or not (v_u_68 and p_u_205.state.shopGlobalIconEnabled) then
		v_u_218 = v_u_217
	else
		v_u_218 = 2 * v_u_93.UNIBAR_END_PADDING * p_u_205.state.UiScale
	end
	local v220 = v_u_96.LegacyCloseMenuIconSize * p_u_205.state.UiScale
	local v221 = v_u_96.UnibarFrame.PaddingTop * p_u_205.state.UiScale
	local v222 = v_u_96.UnibarFrame.PaddingBottom * p_u_205.state.UiScale
	local v_u_223 = v_u_96.UnibarFrame.PaddingLeft * p_u_205.state.UiScale
	local v224 = v_u_96.UnibarFrame.ExtendedSize * p_u_205.state.UiScale
	local v225
	if v_u_62 then
		v225 = p_u_205.tiltMenuOpen
	else
		v225 = p_u_205.props.menuOpen
	end
	if v_u_106:IsEnabled() and not v_u_52() then
		v_u_214 = v_u_96.ScreenSideOffsetTenFoot
		v215 = v_u_96.TopBarHeightTenFoot
	end
	local v226
	if v_u_62 then
		v226 = v_u_15.joinBindings({ p_u_205.tiltMenuOpen, p_u_205.inspectMenuOpen }):map(function(p227)
			return not (p227[0] or p227[1])
		end)
	else
		local v228 = p_u_205.props.menuOpen or p_u_205.props.inspectMenuOpen
		v226 = not v228
	end
	local v229 = UDim2.new(0, 0, 0, v_u_216)
	local v230 = v215 - v_u_216
	local v231 = UDim2.new(0, v_u_214, 0, 0)
	local v232 = UDim2.new(1, -v_u_214, 0, 0)
	local v233 = UDim2.new(1, -v_u_214, 0, v_u_216)
	local v234 = UDim2.new(0, 0, 0.5, 0)
	local v240 = v_u_15.createElement(v_u_115.Provider, {}, {
		["VRBottomBar"] = v_u_115.withVoiceState(function(p235)
			-- upvalues: (ref) v_u_15, (ref) v_u_118, (ref) v_u_114, (ref) v_u_80, (copy) p_u_205
			local v236 = v_u_15.createElement
			local v237 = v_u_118
			local v238 = {
				["voiceChatServiceManager"] = v_u_114,
				["voiceEnabled"] = p235.voiceEnabled,
				["voiceState"] = p235.voiceState
			}
			local v239
			if v_u_80 then
				v239 = p_u_205.props.showGameAgeRating
			else
				v239 = nil
			end
			v238.showBadgeOver12 = v239
			return v236(v237, v238)
		end)
	})
	local v241 = v_u_15.createElement
	local v242 = v_u_40
	local v243 = {
		["iconScale"] = nil,
		["layoutOrder"] = 1,
		["showBadgeOver12"] = nil,
		["menuIconRef"] = nil,
		["unibarMenuRef"] = nil,
		["onAreaChanged"] = nil
	}
	local v244
	if v_u_62 then
		v244 = nil
	else
		v244 = not p_u_205.props.menuOpen and 1 or v_u_96.MenuIconOpenScale
	end
	v243.iconScale = v244
	local v245 = p_u_205.props.showGameAgeRating
	if v245 then
		v245 = not v213
	end
	v243.showBadgeOver12 = v245
	local v246
	if v207 and v_u_57 then
		v246 = p_u_205.menuIconRef
	else
		v246 = nil
	end
	v243.menuIconRef = v246
	local v247
	if v207 and v_u_57 then
		v247 = p_u_205.unibarMenuRef
	else
		v247 = nil
	end
	v243.unibarMenuRef = v247
	local v248
	if v_u_58 then
		v248 = p_u_205.keepOutAreasStore.setKeepOutArea
	else
		v248 = nil
	end
	v243.onAreaChanged = v248
	local v249 = {
		["Icon"] = v241(v242, v243)
	}
	local v250 = v_u_15.createElement(v_u_27, {}, v249)
	if v_u_54 then
		v250 = v_u_15.createElement(v_u_53, nil, {
			["MenuIcon"] = v250
		})
	end
	local v251 = not v_u_80 and true or not v_u_81()
	local v252
	if v213 then
		local v253 = v_u_16.createElement
		local v254 = v_u_13
		local v256 = {
			["tag"] = "row align-y-center auto-x",
			["Size"] = nil,
			["LayoutOrder"] = 3,
			["padding"] = nil,
			["ref"] = nil,
			["onAbsoluteSizeChanged"] = nil,
			["onAbsolutePositionChanged"] = nil,
			["Size"] = UDim2.fromOffset(0, v_u_96.TopBarButtonHeight * p_u_205.state.UiScale),
			["padding"] = v_u_72 and {
				["left"] = p_u_205.ageRatingControlsVisible:map(function(p255)
					-- upvalues: (copy) v_u_217
					return UDim.new(0, not p255 and 0 or v_u_217)
				end)
			} or nil,
			["ref"] = p_u_205.onAgeRatingAreaChanged,
			["onAbsoluteSizeChanged"] = p_u_205.onAgeRatingAreaChanged,
			["onAbsolutePositionChanged"] = p_u_205.onAgeRatingAreaChanged
		}
		local v257 = {}
		local v258 = v_u_16.createElement
		local v259 = v_u_78
		local v260 = {}
		local v261 = game.GameId
		v260.universeId = tostring(v261)
		v257.Badge = v258(v259, v260)
		v252 = v253(v254, v256, v257)
	else
		v252 = nil
	end
	local v262 = v_u_15.createElement
	local v263 = "ScreenGui"
	local v265 = {
		["IgnoreGuiInset"] = true,
		["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling,
		["AutoLocalize"] = false,
		["DisplayOrder"] = 6,
		[v_u_15.Change.AbsoluteSize] = not v_u_63 and function(p264)
			-- upvalues: (copy) p_u_205
			p_u_205.props.setScreenSize(p264.AbsoluteSize)
		end or nil
	}
	local v266 = {
		["Connection"] = v_u_15.createElement(v_u_94)
	}
	local v267
	if v_u_54 then
		v267 = v_u_15.createElement(v_u_48, {
			["anchorRef"] = p_u_205.unibarMenuRef
		})
	else
		v267 = nil
	end
	v266.PlaytestTooltip = v267
	local v268
	if v_u_25 then
		v268 = v_u_15.createElement(v_u_49, {
			["anchorRef"] = p_u_205.unibarMenuRef,
			["isVisible"] = v226
		})
	else
		v268 = nil
	end
	v266.UnpublishedPlaytestTooltip = v268
	local v269
	if v_u_55 then
		v269 = v_u_16.createElement(v_u_32.Components.InExperienceUiSelector)
	else
		v269 = nil
	end
	v266.InExperienceUiSelector = v269
	local v270
	if v_u_57 then
		v270 = nil
	else
		v270 = v_u_15.createElement(v_u_101, {
			["chatVersion"] = p_u_205.state.chatVersion
		})
	end
	v266.GamepadMenu = v270
	local v271
	if v207 and (v_u_103 and v_u_57) then
		local v272 = v_u_15.createElement
		local v273 = v_u_104
		local v274 = {
			["Position"] = UDim2.fromScale(0.5, 0.1)
		}
		local v275
		if v_u_57 then
			v275 = p_u_205.GamepadConnector
		else
			v275 = nil
		end
		v274.GamepadConnector = v275
		v271 = v272(v273, v274)
	else
		v271 = nil
	end
	v266.MenuNavigationToggleDialog = v271
	local v276
	if v_u_109 then
		v276 = v_u_15.createElement(v_u_45)
	else
		v276 = nil
	end
	v266.GamepadNavigationDialog = v276
	local v277
	if v_u_84 and (p_u_205.state.shouldEnableSwitchServer and p_u_205.state.isConfirmationOpen) then
		v277 = v_u_16.createElement(v_u_86, {
			["setSwitchServerConfirmationOpen"] = p_u_205.setConfirmationOpen
		})
	else
		v277 = nil
	end
	v266.SwitchServerConfirmation = v277
	local v278
	if v_u_65 then
		v278 = v_u_15.createElement(v_u_47)
	else
		v278 = v_u_15.createElement(v_u_46)
	end
	v266.HeadsetMenu = v278
	v266.VRBottomBar = v_u_5.VREnabled and v240 and v240 or nil
	local v279
	if v_u_58 or not v_u_88 then
		v279 = nil
	else
		v279 = v_u_15.createElement(v_u_88)
	end
	v266.KeepOutAreasHandler = v279
	v266.FullScreenFrame = v_u_15.createElement("Frame", {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Visible"] = nil,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Visible"] = v226
	}, {
		["HurtOverlay"] = v_u_15.createElement(v_u_44)
	})
	local v280
	if v_u_74 or not (v251 and v_u_108()) then
		v280 = nil
	else
		v280 = v_u_15.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["Position"] = nil,
			["Size"] = nil,
			["Position"] = UDim2.new(0, v_u_214, 0, v_u_216),
			["Size"] = UDim2.new(1, 0, 0, v230)
		}, {
			["MenuIcon"] = v250
		})
	end
	v266.MenuIconHolder = v280
	local v281
	if v_u_59 and v_u_60 ~= 0 then
		v281 = v_u_34({
			["uiLessTooltipTitle"] = v_u_96.LocalizedKeys.UILessTooltipTitle,
			["uiLessTooltipDescription"] = v_u_96.LocalizedKeys.UILessTooltipDescription
		})(function(p282)
			-- upvalues: (ref) v_u_15, (copy) p_u_206, (ref) v_u_214, (copy) v_u_216, (copy) p_u_205
			local v283 = v_u_15.createElement
			local v284 = {
				["BackgroundColor3"] = p_u_206.Tokens.Color.Extended.White.White_100.Color3,
				["BorderSizePixel"] = 0,
				["Position"] = UDim2.new(0, v_u_214, 0, v_u_216),
				["AutomaticSize"] = Enum.AutomaticSize.XY,
				["BackgroundTransparency"] = p_u_205.uiLessTooltipTransparency,
				["Visible"] = p_u_205.uiLessTooltipVisible,
				["ZIndex"] = 10000,
				[v_u_15.Ref] = p_u_205.uiLessTooltip
			}
			local v285 = {
				["Padding"] = v_u_15.createElement("UIPadding", {
					["PaddingTop"] = UDim.new(0, p_u_206.Tokens.Size.Size_200),
					["PaddingBottom"] = UDim.new(0, p_u_206.Tokens.Size.Size_200),
					["PaddingLeft"] = UDim.new(0, p_u_206.Tokens.Size.Size_300),
					["PaddingRight"] = UDim.new(0, p_u_206.Tokens.Size.Size_300)
				}),
				["Corner"] = v_u_15.createElement("UICorner", {
					["CornerRadius"] = UDim.new(0, p_u_206.Tokens.Radius.Small)
				}),
				["VerticalLayout"] = v_u_15.createElement("UIListLayout", {
					["SortOrder"] = Enum.SortOrder.LayoutOrder,
					["FillDirection"] = Enum.FillDirection.Vertical,
					["Padding"] = UDim.new(0, p_u_206.Tokens.Size.Size_100)
				}),
				["Title"] = v_u_15.createElement("TextLabel", {
					["Text"] = nil,
					["TextSize"] = nil,
					["TextTransparency"] = nil,
					["Font"] = nil,
					["AutomaticSize"] = nil,
					["BackgroundTransparency"] = 1,
					["BorderSizePixel"] = 0,
					["LayoutOrder"] = 1,
					["Text"] = p282.uiLessTooltipTitle,
					["TextSize"] = p_u_206.Tokens.FontSize.FontSize_300,
					["TextTransparency"] = p_u_205.uiLessTooltipTransparency,
					["Font"] = Enum.Font.BuilderSansBold,
					["AutomaticSize"] = Enum.AutomaticSize.XY
				}),
				["Description"] = v_u_15.createElement("TextLabel", {
					["Text"] = nil,
					["TextSize"] = nil,
					["TextTransparency"] = nil,
					["Font"] = nil,
					["AutomaticSize"] = nil,
					["BackgroundTransparency"] = 1,
					["BorderSizePixel"] = 0,
					["LayoutOrder"] = 2,
					["Text"] = p282.uiLessTooltipDescription,
					["TextSize"] = p_u_206.Tokens.FontSize.FontSize_300,
					["TextTransparency"] = p_u_205.uiLessTooltipTransparency,
					["Font"] = Enum.Font.BuilderSans,
					["AutomaticSize"] = Enum.AutomaticSize.XY
				})
			}
			return v283("Frame", v284, v285)
		end)
	else
		v281 = nil
	end
	v266.UILessTooltip = v281
	local v286 = not (v_u_90 or v_u_107())
	if v286 then
		local v287 = v_u_15.createElement
		local v288 = "Frame"
		local v289 = {
			["BackgroundTransparency"] = 1,
			["Position"] = nil,
			["Size"] = nil,
			["Visible"] = nil,
			["Position"] = UDim2.new(0, v_u_214, 0, 0),
			["Size"] = UDim2.new(1, 0, 0, v215),
			["Visible"] = v225
		}
		local v290 = {}
		local v291
		if v_u_90 then
			local v292 = v_u_15.createElement
			local v293 = v_u_20
			local v294 = {
				["onStateChanged"] = p_u_205.onCloseBtnStateChange,
				["Visible"] = not v_u_106:IsEnabled(),
				["BackgroundTransparency"] = p_u_206.Theme.Overlay.Transparency,
				["Position"] = v234,
				["AnchorPoint"] = Vector2.new(0, 0.5),
				["Size"] = UDim2.new(0, v220, 0, v220),
				["BackgroundColor3"] = p_u_206.Theme.Overlay.Color,
				[v_u_15.Event.Activated] = function()
					-- upvalues: (ref) v_u_4
					require(v_u_4.Modules.Settings.SettingsHub):ToggleVisibility()
				end
			}
			local v295 = {}
			local v296
			if v207 then
				v296 = v_u_15.createElement("UICorner", {
					["CornerRadius"] = UDim.new(1, 0)
				}) or nil
			else
				v296 = nil
			end
			v295.UICorner = v296
			v295.Line1 = v_u_15.createElement("Frame", {
				["Name"] = "TopLine",
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["Size"] = nil,
				["BorderSizePixel"] = 0,
				["BackgroundColor3"] = nil,
				["Rotation"] = 45,
				["Position"] = UDim2.new(0.5, 0, 0.5, 0),
				["AnchorPoint"] = Vector2.new(0.5, 0),
				["Size"] = UDim2.new(0, 16, 0, 2),
				["BackgroundColor3"] = Color3.new(1, 1, 1)
			})
			v295.Line2 = v_u_15.createElement("Frame", {
				["Name"] = "BottomLine",
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["Size"] = nil,
				["BorderSizePixel"] = 0,
				["BackgroundColor3"] = nil,
				["Rotation"] = -45,
				["Position"] = UDim2.new(0.5, 0, 0.5, 0),
				["AnchorPoint"] = Vector2.new(0.5, 0),
				["Size"] = UDim2.new(0, 16, 0, 2),
				["BackgroundColor3"] = Color3.new(1, 1, 1)
			})
			local v297
			if v207 then
				v297 = nil
			else
				local v298 = v_u_15.createElement
				local v299 = "Frame"
				local v302 = {
					["BackgroundTransparency"] = nil,
					["BackgroundColor3"] = nil,
					["Size"] = nil,
					["ZIndex"] = 2,
					["BackgroundTransparency"] = p_u_205.closeButtonState:map(function(p300)
						-- upvalues: (ref) v_u_21, (copy) p_u_206
						if p300 == v_u_21.Pressed then
							return p_u_206.Theme.BackgroundOnPress.Transparency
						else
							return p300 ~= v_u_21.Hover and 1 or p_u_206.Theme.BackgroundOnHover.Transparency
						end
					end),
					["BackgroundColor3"] = p_u_205.closeButtonState:map(function(p301)
						-- upvalues: (ref) v_u_21, (copy) p_u_206
						if p301 == v_u_21.Pressed then
							return p_u_206.Theme.BackgroundOnPress.Color
						elseif p301 == v_u_21.Hover then
							return p_u_206.Theme.BackgroundOnHover.Color
						else
							return Color3.new(1, 1, 1)
						end
					end),
					["Size"] = UDim2.fromScale(1, 1)
				}
				local v303 = {}
				local v304
				if v207 then
					v304 = v_u_15.createElement("UICorner", {
						["CornerRadius"] = UDim.new(1, 0)
					}) or nil
				else
					v304 = nil
				end
				v303.UICorner = v304
				v297 = v298(v299, v302, v303) or nil
			end
			v295.StateOverlayRound = v297
			v291 = v292(v293, v294, v295) or nil
		else
			v291 = nil
		end
		v290.CloseMenuButtonRound = v291
		local v305
		if v_u_90 then
			v305 = nil
		else
			local v306
			if v_u_24 then
				v306 = v_u_15.createElement(v_u_12, {
					["Visible"] = not v_u_106:IsEnabled(),
					["Position"] = v234,
					["AnchorPoint"] = Vector2.new(0, 0.5),
					["Size"] = UDim2.new(0, v220, 0, v220),
					["Image"] = v_u_26,
					["onActivated"] = function() -- name: onActivated
						-- upvalues: (ref) v_u_4
						require(v_u_4.Modules.Settings.SettingsHub):ToggleVisibility()
					end
				})
			else
				v306 = v_u_15.createElement(v_u_22, {
					["Visible"] = not v_u_106:IsEnabled(),
					["BackgroundTransparency"] = 1,
					["Position"] = v234,
					["AnchorPoint"] = Vector2.new(0, 0.5),
					["Size"] = UDim2.new(0, v220, 0, v220),
					["Image"] = v_u_26,
					[v_u_15.Event.Activated] = function()
						-- upvalues: (ref) v_u_4
						require(v_u_4.Modules.Settings.SettingsHub):ToggleVisibility()
					end
				})
			end
			v305 = v306 or nil
		end
		v290.CloseMenuButton = v305
		v286 = v287(v288, v289, v290)
	end
	v266.LegacyCloseMenu = v286
	v266.SongbirdDebugAudio = v_u_15.createElement(v_u_30.DebugAudioEmitters)
	local v307
	if v_u_90 and v208 == Enum.HorizontalAlignment.Left then
		local v308 = v_u_15.createElement
		local v309 = "Frame"
		local v310 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v230),
			["Position"] = v233,
			["AnchorPoint"] = Vector2.new(1, 0)
		}
		local v311 = {}
		local v312
		if v207 and v_u_113 then
			v312 = v_u_15.createElement(v_u_113)
		else
			v312 = nil
		end
		v311.JoinVoiceBinder = v312
		local v313
		if v207 and v_u_110() then
			v313 = v_u_15.createElement(v_u_111)
		else
			v313 = nil
		end
		v311.PartyMicBinder = v313
		local v314
		if v_u_89 then
			v314 = v_u_15.createElement(v_u_89)
		else
			v314 = nil
		end
		v311.ChromeAnalytics = v314
		local v315 = v_u_15.createElement
		local v316 = "UIPadding"
		local v317 = {
			["PaddingTop"] = UDim.new(0, v221),
			["PaddingBottom"] = UDim.new(0, v222)
		}
		local v318
		if v213 then
			v318 = p_u_205.ageRatingControlsVisible:map(function(p319)
				-- upvalues: (copy) v_u_223, (ref) v_u_214
				local v320 = UDim.new
				local v321 = 0
				local v322
				if p319 then
					v322 = v_u_223
				else
					v322 = 2 * v_u_214
				end
				return v320(v321, v322)
			end)
		else
			v318 = UDim.new(0, v_u_223)
		end
		v317.PaddingLeft = v318
		v311.Padding = v315(v316, v317)
		local v323 = v_u_64
		if v323 then
			if v_u_72 then
				local v324 = v_u_16.createElement
				local v325 = v_u_13
				local v326 = {
					["tag"] = "row auto-xy"
				}
				local v327 = {}
				local v328 = v_u_16.createElement
				local v329 = v_u_13
				local v330 = {
					["tag"] = "row gap-xsmall auto-xy",
					["LayoutOrder"] = 1
				}
				local v331 = {}
				local v332
				if v_u_64 and not (v_u_80 and v_u_81()) then
					v332 = v_u_16.createElement(v_u_50)
				else
					v332 = nil
				end
				v331.TraversalBackButton = v332
				v331.UnibarFrame = p_u_205:renderUnibarFrame(v207, v213)
				v327.PaddedControlRow = v328(v329, v330, v331)
				local v333 = v_u_16.createElement
				local v334 = v_u_73
				local v335 = {
					["layoutOrder"] = 2,
					["buttonSize"] = nil,
					["leftGap"] = nil,
					["onAreaChanged"] = nil,
					["buttonSize"] = v_u_96.TopBarButtonHeight * p_u_205.state.UiScale,
					["leftGap"] = v_u_217
				}
				local v336
				if v_u_58 then
					v336 = p_u_205.keepOutAreasStore.setKeepOutArea
				else
					v336 = p_u_205.props.setKeepOutArea
				end
				v335.onAreaChanged = v336
				v327.ShopIcon = v333(v334, v335)
				v327.AgeRating = v252
				v323 = v324(v325, v326, v327)
			else
				local v337 = v_u_16.createElement
				local v338 = v_u_13
				local v339 = {
					["tag"] = "row gap-xsmall auto-xy",
					["onAbsoluteSizeChanged"] = nil
				}
				local v340
				if v_u_77 then
					v340 = p_u_205.onAgeRatingControlsSizeChanged
				else
					v340 = nil
				end
				v339.onAbsoluteSizeChanged = v340
				local v341 = {}
				local v342
				if v_u_64 and not (v_u_80 and v_u_81()) then
					v342 = v_u_16.createElement(v_u_50)
				else
					v342 = nil
				end
				v341.TraversalBackButton = v342
				v341.UnibarFrame = p_u_205:renderUnibarFrame(v207, v213)
				v323 = v337(v338, v339, v341)
			end
		end
		v311.TopBarLeftContainer = v323
		local v343
		if v_u_64 then
			v343 = nil
		else
			v343 = p_u_205:renderUnibarFrame(v207, v213)
		end
		v311.Unibar = v343
		local v344
		if v_u_117 then
			v344 = v_u_15.createElement(v_u_43, {})
		else
			v344 = nil
		end
		v311.HealthBar = v344
		local v345
		if v_u_56 then
			local v346 = v_u_29:hasBuildMode()
			if v346 then
				v346 = not v_u_5.VREnabled
			end
			if v346 then
				v345 = v_u_16.createElement(v_u_39, {
					["position"] = UDim2.new(1, 0, 0, 0),
					["anchorPoint"] = Vector2.new(1, 0)
				})
			else
				v345 = nil
			end
		else
			v345 = nil
		end
		v311.AssistantBuildPillMenu = v345
		local v347 = v_u_15.createElement
		local v348 = "Frame"
		local v349 = {
			["BackgroundTransparency"] = 1,
			["Position"] = nil,
			["Size"] = nil
		}
		local v350
		if v213 and not v_u_72 then
			v350 = v_u_15.joinBindings({
				["width"] = p_u_205.ageRatingControlsWidth,
				["visible"] = p_u_205.ageRatingControlsVisible
			}):map(function(p351)
				-- upvalues: (ref) v_u_64
				return UDim2.fromOffset(not (v_u_64 or p351.visible) and 0 or p351.width, 0)
			end)
		else
			v350 = p_u_205.unibarRightSidePosition
		end
		v349.Position = v350
		v349.Size = UDim2.new(1, 0, 1, 0)
		local v352 = {}
		local v353 = v_u_15.createElement
		local v354 = "UIPadding"
		local v355 = {}
		local v356
		if v213 and not v_u_72 then
			v356 = v_u_15.joinBindings({
				["visible"] = p_u_205.ageRatingControlsVisible,
				["width"] = p_u_205.ageRatingControlsWidth
			}):map(function(p357)
				-- upvalues: (ref) v_u_64, (copy) v_u_218
				local v358 = not p357.visible and v_u_64
				if v358 then
					v358 = p357.width > 0
				end
				return UDim.new(0, not v358 and 0 or v_u_218)
			end)
		else
			v356 = UDim.new(0, v_u_218)
		end
		v355.PaddingLeft = v356
		v352.Padding = v353(v354, v355)
		v352.Layout = v_u_15.createElement("UIListLayout", {
			["Padding"] = UDim.new(0, v_u_217),
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
		local v359
		if v_u_72 or not (v_u_68 and p_u_205.state.shopGlobalIconEnabled) then
			v359 = nil
		else
			local v360 = v_u_15.createElement
			local v361 = v_u_71
			local v362 = {
				["buttonSize"] = nil,
				["layoutOrder"] = 1,
				["leftGap"] = nil,
				["showStatusIndicator"] = nil,
				["onActivated"] = nil,
				["onAreaChanged"] = nil,
				["isActive"] = nil,
				["icon"] = nil,
				["buttonSize"] = v_u_96.TopBarButtonHeight * p_u_205.state.UiScale,
				["leftGap"] = v_u_217,
				["showStatusIndicator"] = p_u_205.state.shopGlobalStatusIndicatorEnabled,
				["onActivated"] = p_u_205.onShopGlobalIconActivated
			}
			local v363
			if v_u_58 then
				v363 = p_u_205.keepOutAreasStore.setKeepOutArea
			else
				v363 = p_u_205.props.setKeepOutArea
			end
			v362.onAreaChanged = v363
			v362.isActive = p_u_205.state.shopGlobalIconIsActive
			local v364
			if v_u_70 or not (v_u_91 and p_u_205.shopIsActiveMappedSignal) then
				v364 = nil
			else
				v364 = v_u_91("BuildingStore", nil, p_u_205.shopIsActiveMappedSignal)
			end
			v362.icon = v364
			v359 = v360(v361, v362)
		end
		v352.ShopGlobalIcon = v359
		if v_u_72 then
			v252 = nil
		end
		v352.AgeRating = v252
		local v365
		if v_u_117 then
			v365 = nil
		else
			v365 = v_u_15.createElement(v_u_43, {
				["layoutOrder"] = 10
			})
		end
		v352.HealthBar = v365
		v311.StackedElements = v347(v348, v349, v352)
		v307 = v308(v309, v310, v311) or nil
	else
		v307 = nil
	end
	v266.UnibarLeftFrame = v307
	local v366
	if v_u_90 and v208 == Enum.HorizontalAlignment.Right then
		local v367 = v_u_15.createElement
		local v368 = "Frame"
		local v369 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v230),
			["Position"] = v233,
			["AnchorPoint"] = Vector2.new(1, 0)
		}
		local v370 = {}
		local v371
		if v_u_89 then
			v371 = v_u_15.createElement(v_u_89)
		else
			v371 = nil
		end
		v370.ChromeAnalytics = v371
		v370.Padding = v_u_15.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, v221),
			["PaddingBottom"] = UDim.new(0, v222)
		})
		v370.Layout = v_u_15.createElement("UIListLayout", {
			["Padding"] = UDim.new(0, v_u_217),
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
		v370.HealthBar = v_u_15.createElement(v_u_43, {
			["layoutOrder"] = 1
		})
		local v372 = v_u_15.createElement
		local v373 = v_u_90
		local v374 = {
			["onAreaChanged"] = nil,
			["layoutOrder"] = 2
		}
		local v375
		if v_u_58 then
			v375 = p_u_205.keepOutAreasStore.setKeepOutArea
		else
			v375 = p_u_205.props.setKeepOutArea
		end
		v374.onAreaChanged = v375
		v370.Unibar = v372(v373, v374)
		v366 = v367(v368, v369, v370) or nil
	else
		v366 = nil
	end
	v266.UnibarRightFrame = v366
	local v376 = v_u_15.createElement
	local v377 = "Frame"
	local v378 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Visible"] = nil,
		["Position"] = nil,
		["Size"] = UDim2.new(1, 0, 0, v230),
		["Visible"] = v226,
		["Position"] = v229
	}
	local v379 = {}
	local v380 = v207 or not v_u_106:IsEnabled() or v_u_105
	if v380 then
		local v381 = v_u_15.createElement
		local v382 = "Frame"
		local v383 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["Size"] = UDim2.new(0.5, -v_u_214, 1, 0),
			["Position"] = v231
		}
		local v384 = {
			["Layout"] = v_u_15.createElement("UIListLayout", {
				["Padding"] = UDim.new(0, v_u_217),
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
				["VerticalAlignment"] = Enum.VerticalAlignment.Top,
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			})
		}
		local v385
		if v207 then
			v385 = v_u_15.createElement("Frame", {
				["LayoutOrder"] = 1,
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(0, v224, 0, 1)
			})
		else
			v385 = v207
		end
		v384.Blank = v385
		local v386 = not v_u_108()
		if v386 then
			local v387 = v_u_15.createElement
			local v388 = v_u_40
			local v389 = {
				["layoutOrder"] = 1,
				["showBadgeOver12"] = nil,
				["onAreaChanged"] = nil
			}
			local v390 = p_u_205.props.showGameAgeRating
			if v390 then
				v390 = not v213
			end
			v389.showBadgeOver12 = v390
			local v391
			if v_u_58 then
				v391 = p_u_205.keepOutAreasStore.setKeepOutArea
			else
				v391 = nil
			end
			v389.onAreaChanged = v391
			v386 = v387(v388, v389)
		end
		v384.MenuIcon = v386
		local v392
		if v207 then
			v392 = nil
		else
			v392 = v_u_15.createElement(v_u_41, {
				["layoutOrder"] = 3
			}) or nil
		end
		v384.ChatIcon = v392
		v380 = v381(v382, v383, v384)
	end
	v379.LeftFrame = v380
	local v393
	if v_u_90 then
		v393 = nil
	else
		local v394 = v_u_15.createElement
		local v395 = "Frame"
		local v396 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["Size"] = UDim2.new(0.5, -v_u_214, 1, 0),
			["Position"] = v232,
			["AnchorPoint"] = Vector2.new(1, 0)
		}
		local v397 = {
			["Layout"] = v_u_15.createElement("UIListLayout", {
				["Padding"] = UDim.new(0, v_u_217),
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			}),
			["HealthBar"] = v_u_15.createElement(v_u_43, {
				["layoutOrder"] = 1
			})
		}
		local v398 = not v_u_106:IsEnabled()
		if v398 then
			v398 = v_u_15.createElement(v_u_42, {
				["layoutOrder"] = 2
			})
		end
		v397.MoreMenu = v398
		v393 = v394(v395, v396, v397) or nil
	end
	v379.RightFrame = v393
	v266.TopBarFrame = v376(v377, v378, v379)
	return v262(v263, v265, v266)
end
local function v401(p399) -- name: mapStateToProps
	-- upvalues: (copy) v_u_62
	if v_u_62 then
		return nil
	end
	local v400 = p399.displayOptions.inspectMenuOpen
	return {
		["menuOpen"] = p399.displayOptions.menuOpen,
		["inspectMenuOpen"] = v400
	}
end
local v402
if v75 then
	v402 = v23.UniversalAppPolicy.connect(function(p403, _)
		return {
			["showGameAgeRating"] = p403.getShowGameAgeRating()
		}
	end)(v119)
else
	v402 = v116.connect(function(p404, _)
		return {
			["showGameAgeRating"] = p404.showBadgeOver12()
		}
	end)(v119)
end
local function v411(p_u_405) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_63, (copy) v_u_97, (copy) v_u_58, (copy) v_u_98, (copy) v_u_99
	return {
		["setScreenSize"] = not v_u_63 and function(p406)
			-- upvalues: (copy) p_u_405, (ref) v_u_97
			return p_u_405(v_u_97(p406))
		end or nil,
		["setKeepOutArea"] = not v_u_58 and function(p407, p408, p409)
			-- upvalues: (copy) p_u_405, (ref) v_u_98
			return p_u_405(v_u_98(p407, p408, p409))
		end or nil,
		["removeKeepOutArea"] = not v_u_58 and function(p410)
			-- upvalues: (copy) p_u_405, (ref) v_u_99
			return p_u_405(v_u_99(p410))
		end or nil
	}
end
local v412 = v17.UNSTABLE_connect2
if v_u_62 then
	v401 = nil
end
return v412(v401, v411)(v402)