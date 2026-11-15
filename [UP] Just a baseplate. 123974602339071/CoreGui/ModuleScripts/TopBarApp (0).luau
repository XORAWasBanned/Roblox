-- Path: CoreGui.RobloxGui.Modules.TopBar.ComponentsV2.TopBarApp
game:GetService("CoreGui")
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("VRService")
local v3 = script.Parent.Parent
local v4 = v3.Parent
local v5 = v3.Components
local v6 = v5.Presentation
local v7 = v3.Parent.Chrome
local v_u_8 = require(v3.Constants)
local v_u_9 = require(v3.ExperienceAgeRatingPolicy)
local v_u_10 = require(v1.Workspace.Packages.InExperienceTopBar.ExperienceAgeRatingBadge)
local v_u_11 = require(v1.Workspace.Packages.InExperienceTopBar).Flags.FFlagExperienceAgeRatingBadge
local v_u_12 = require(v1.Workspace.Packages.CoreGuiCommon)
local v13 = require(v1.Workspace.Packages.CoreScriptsRoactCommon)
local v14 = require(v1.Packages.Foundation)
local v_u_15 = require(v1.Workspace.Packages.Display)
local v_u_16 = require(v1.Packages.React)
local v17 = require(v1.Workspace.Packages.SharedFlags)
local v_u_18 = require(v1.Packages.SignalsReact)
require(v1.Workspace.Packages.Songbird)
local v19 = require(v1.Workspace.Packages.SwitchServer)
local v20 = v13.Traversal
local v21 = require(v1.Packages.UIBlox)
local v_u_22 = require(v1.Workspace.Packages.UniversalAppPolicy)
local v_u_23 = v17.FFlagAddMenuNavigationToggleDialog
local v_u_24 = require(v3.Flags.FFlagGamepadNavigationDialogABTest)
local v_u_25 = v17.FFlagEnablePlaytestModeUnibar
local v_u_26 = v17.FFlagEnableTeamTestLua
local v_u_27 = v20.Flags.FFlagAddTraversalBackButton
local v_u_28 = v17.GetFFlagEnableCrossExpVoice
local v29 = v17.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local v_u_30 = require(v1.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v_u_31 = require(v1.Workspace.Packages.AppCommonLib).isSpatial
local v_u_32 = require(v1.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local v_u_33 = v17.FFlagShowGameAgeRating
local v_u_34 = v_u_11 and v_u_33
local v_u_35 = v17.FFlagAppNavMyStatsTab
local v_u_36 = require(v1.Workspace.Packages.InExperienceShop)
local v37 = v17.FFlagEnableInExperienceShop
local v_u_38 = v_u_36.FFlagEnableExperienceShopGlobalIcon and v37
local v_u_39 = v_u_36.FFlagCenterInExperienceShopWindow
local v_u_40 = v_u_36.FFlagExperienceShopNewIconography
local v41 = v17.FFlagShowSwitchServerButton
local v42 = require(v1.Workspace.Packages.PioneerUtils).isPioneerLaunch
local v_u_43
if v_u_32 then
	v_u_43 = v41 or v42()
else
	v_u_43 = v_u_32
end
local v_u_44 = v_u_36.ShopGlobalIcon
local v_u_45 = require(v3.Flags.FFlagTopBarShopIconV2)
local v_u_46
if v_u_45 then
	v_u_46 = require(v5.Presentation.ShopIcon)
else
	v_u_46 = nil
end
local v_u_47 = v14.View
local v_u_48 = v21.App.SelectionImage.SelectionCursorProvider
local v_u_49 = require(v5.GamepadConnector)
local v_u_50 = require(v6.GamepadNavigationDialog)
local v_u_51 = v_u_12.Components.HealthBar
local v_u_52 = require(v3.ComponentsV2.MenuIcon)
local v_u_53 = require(v5.MenuIconContext)
local v_u_54 = require(v6.GamepadMenu.MenuNavigationToggleDialog)
local v_u_55 = require(v5.TraversalBackButton)
local v_u_56 = require(v6.PlaytestModeTooltip)
local v_u_57
if v_u_30 then
	v_u_57 = require(v5.VRBottomUnibar)
else
	v_u_57 = require(v4.VR.VRBottomBar.VRBottomBar)
end
local v58 = require(v1.Workspace.Packages.BuildExperience)
local v_u_59 = require(v1.Workspace.Packages.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local v_u_60 = v58.BuildPillMenuPortalHost
local v_u_61 = v58.UnpublishedPlaytestModeTooltip
local v_u_62
if game:GetEngineFeature("InGameChromeSignalAPI") then
	v_u_62 = require(v7.ChromeShared.Analytics)
else
	v_u_62 = nil
end
local v_u_63
if game:GetEngineFeature("VoiceChatSupported") and v29() then
	v_u_63 = require(v7.Integrations.JoinVoiceBinder)
else
	v_u_63 = nil
end
local v_u_64 = require(v7.Integrations.Party.PartyMicBinder)
local v_u_65 = require(v7.ChromeShared.Unibar)
local v_u_66 = require(v4.VoiceChat.VoiceChatServiceManager).default
local v_u_67 = require(v4.VoiceChat.VoiceStateContext)
local v_u_68
if v_u_38 then
	v_u_68 = require(v7.Service)
else
	v_u_68 = nil
end
local v_u_69
if v_u_38 then
	v_u_69 = require(v7.ChromeShared.Unibar.Constants)
else
	v_u_69 = nil
end
local v_u_70
if v_u_38 then
	v_u_70 = require(v7.Integrations.CommonIcon)
else
	v_u_70 = nil
end
local v_u_71
if v_u_38 then
	v_u_71 = require(v1.Workspace.Packages.Chrome).Hooks.useMappedSignal
else
	v_u_71 = nil
end
local v_u_72
if v_u_38 and (v_u_68 and v_u_69) then
	v_u_72 = require(v7.ChromeShared.Service.ChromeUtils).MappedSignal.new(v_u_68:onIntegrationStatusChanged(), function()
		-- upvalues: (copy) v_u_68, (copy) v_u_69
		return v_u_68:isWindowOpen(v_u_69.IN_EXPERIENCE_SHOP_ID)
	end)
else
	v_u_72 = nil
end
local v_u_73
if v_u_38 then
	v_u_73 = require(v7.Integrations.InExperienceShop.ShopWindowLayout).toggleInExperienceShopWindow
else
	v_u_73 = nil
end
local v_u_74 = v19.SwitchServerConfirmation
local v_u_75 = v19.GetSwitchServerStore
local function v_u_78(p76) -- name: getShopGlobalIconEnabled
	-- upvalues: (copy) v_u_38, (copy) v_u_36
	if v_u_38 then
		local v77 = v_u_36.GetShopGlobalIconStore
		if v77 then
			return v77(p76).getEnabled(p76)
		else
			return false
		end
	else
		return false
	end
end
local function v_u_81(p79) -- name: getShopGlobalStatusIndicatorEnabled
	-- upvalues: (copy) v_u_38, (copy) v_u_36
	if v_u_38 then
		local v80 = v_u_36.GetShopGlobalIconStore
		if v80 then
			return v80(p79).getStatusIndicatorEnabled(p79)
		else
			return false
		end
	else
		return false
	end
end
local function v_u_82() -- name: handleShopGlobalIconActivated
	-- upvalues: (copy) v_u_38, (copy) v_u_39, (copy) v_u_73, (copy) v_u_68, (copy) v_u_69
	if v_u_38 then
		if v_u_39 then
			if v_u_73 then
				v_u_73()
				return
			end
		elseif v_u_68 and v_u_69 then
			v_u_68:toggleWindow(v_u_69.IN_EXPERIENCE_SHOP_ID)
		end
	end
end
local function v_u_85(p83) -- name: getShouldEnableSwitchServer
	-- upvalues: (copy) v_u_43, (copy) v_u_75
	if v_u_43 then
		local v84 = v_u_75
		if v84 then
			return v84(p83).shouldEnableSwitchServer(p83)
		else
			return false
		end
	else
		return false
	end
end
local function v_u_88(p86) -- name: getIsConfirmationOpen
	-- upvalues: (copy) v_u_43, (copy) v_u_75
	if v_u_43 then
		local v87 = v_u_75
		if v87 then
			return v87(p86).isConfirmationOpen(p86)
		else
			return false
		end
	else
		return false
	end
end
return function(_) -- name: TopBarApp
	-- upvalues: (copy) v_u_33, (copy) v_u_22, (copy) v_u_18, (copy) v_u_12, (copy) v_u_15, (copy) v_u_38, (copy) v_u_45, (copy) v_u_78, (copy) v_u_81, (copy) v_u_82, (copy) v_u_16, (copy) v_u_36, (copy) v_u_71, (copy) v_u_72, (copy) v_u_31, (copy) v_u_11, (copy) v_u_9, (copy) v_u_49, (copy) v_u_2, (copy) v_u_8, (copy) v_u_43, (copy) v_u_85, (copy) v_u_88, (copy) v_u_75, (copy) v_u_47, (copy) v_u_34, (copy) v_u_32, (copy) v_u_48, (copy) v_u_52, (copy) v_u_27, (copy) v_u_55, (copy) v_u_53, (copy) v_u_65, (ref) v_u_46, (copy) v_u_44, (copy) v_u_40, (copy) v_u_70, (copy) v_u_23, (copy) v_u_54, (copy) v_u_24, (copy) v_u_50, (copy) v_u_74, (copy) v_u_63, (copy) v_u_28, (copy) v_u_64, (copy) v_u_62, (copy) v_u_25, (copy) v_u_56, (copy) v_u_26, (copy) v_u_61, (copy) v_u_10, (copy) v_u_35, (copy) v_u_59, (copy) v_u_60, (copy) v_u_51, (copy) v_u_67, (copy) v_u_57, (copy) v_u_66, (copy) v_u_30
	local v_u_89
	if v_u_33 then
		v_u_89 = v_u_22.useAppPolicy(function(p90)
			return p90.getShowGameAgeRating()
		end)
	else
		v_u_89 = v_u_22.useAppPolicy(function(p91)
			return p91.getShowBadgeOver12()
		end)
	end
	local v_u_93 = v_u_18.useSignalState(function(p92)
		-- upvalues: (ref) v_u_12
		return v_u_12.Stores.GetKeepOutAreasStore(p92)
	end)
	local v95 = v_u_18.useSignalState(function(p94)
		-- upvalues: (ref) v_u_15
		return v_u_15.GetDisplayStore(p94).getUIScale(p94)
	end)
	local v96, v97, v98, v99
	if v_u_38 and not v_u_45 then
		v96 = v_u_18.useSignalState(v_u_78)
		v97 = v_u_18.useSignalState(v_u_81)
		v98 = v_u_82
		v_u_16.useEffect(function()
			-- upvalues: (ref) v_u_36
			local v100 = v_u_36.initShopGlobalIcon
			if v100 then
				v100 = v_u_36.initShopGlobalIcon()
			end
			return v100 or function() end
		end, {})
		v99 = (v_u_71 or function() end)(v_u_72)
	else
		v98 = nil
		v99 = nil
		v96 = nil
		v97 = nil
	end
	local v101 = v_u_16.useRef(nil)
	local v102 = v_u_31()
	local v_u_103
	if v_u_11 then
		v102, v_u_103 = v_u_16.useState(v102)
	else
		v_u_103 = nil
	end
	local v104 = v_u_9.isEligible(v_u_89, true, true, v102)
	local v105 = v_u_16.useRef(nil)
	local v_u_106 = v_u_49:getShowTopBar()
	local v107, v_u_108 = v_u_16.useBinding(v_u_106:get())
	v_u_16.useEffect(function()
		-- upvalues: (ref) v_u_31, (ref) v_u_49, (ref) v_u_2, (ref) v_u_11, (ref) v_u_103, (copy) v_u_106, (copy) v_u_108, (copy) v_u_93
		if not v_u_31() then
			v_u_49:connectToTopbar()
		end
		local v_u_109 = v_u_2:GetPropertyChangedSignal("VREnabled"):Connect(function()
			-- upvalues: (ref) v_u_11, (ref) v_u_103, (ref) v_u_31, (ref) v_u_49
			if v_u_11 then
				v_u_103(v_u_31())
			end
			if v_u_31() then
				v_u_49:disconnectFromTopbar()
			else
				v_u_49:connectToTopbar()
			end
		end)
		local v_u_110 = v_u_106:connect(function()
			-- upvalues: (ref) v_u_108, (ref) v_u_106
			v_u_108(v_u_106:get())
		end)
		return function()
			-- upvalues: (copy) v_u_109, (ref) v_u_49, (ref) v_u_93, (copy) v_u_110
			if v_u_109 then
				v_u_109:Disconnect()
			end
			v_u_49:disconnectFromTopbar()
			if v_u_93 then
				v_u_93.cleanup()
			end
			v_u_110:disconnect()
		end
	end, {})
	local v112 = v_u_16.useCallback(function(p111)
		-- upvalues: (copy) v_u_93, (ref) v_u_8
		v_u_93.setKeepOutArea(v_u_8.TopBarKeepOutAreaId, p111.AbsolutePosition, p111.AbsoluteSize)
	end, { v_u_93 })
	local v113 = v_u_8.ScreenSideOffset * v95
	local v114 = v_u_8.TopBarHeight * v95
	local v115 = v_u_8.TopBarButtonHeight * v95
	local v116 = v_u_8.TopBarTopMargin * v95
	local v117, v118, v119
	if v_u_43 then
		v117 = v_u_18.useSignalState(v_u_85)
		v118 = v_u_18.useSignalState(v_u_88)
		v119 = v_u_75(false).setConfirmationOpen
	else
		v117 = nil
		v118 = nil
		v119 = nil
	end
	local v120 = v_u_16.createElement
	local v121 = v_u_47
	local v122 = {
		["tag"] = "anchor-top-left auto-x row gap-small",
		["Size"] = nil,
		["onAbsoluteSizeChanged"] = nil,
		["onAbsolutePositionChanged"] = nil,
		["Position"] = nil,
		["Visible"] = nil,
		["Size"] = UDim2.fromOffset(0, v115)
	}
	local v123
	if v_u_34 then
		v123 = nil
	else
		v123 = v112
	end
	v122.onAbsoluteSizeChanged = v123
	local v124
	if v_u_34 then
		v124 = nil
	else
		v124 = v112
	end
	v122.onAbsolutePositionChanged = v124
	local v125
	if v_u_34 then
		v125 = nil
	else
		v125 = UDim2.new(0, v113, 0, v116)
	end
	v122.Position = v125
	v122.Visible = v107
	local v126 = {}
	local v127
	if v_u_32 then
		v127 = nil
	else
		local v128 = v_u_16.createElement
		local v129 = v_u_48
		local v130 = {}
		local v131 = {}
		local v132 = v_u_16.createElement
		local v133 = v_u_52
		local v134 = {}
		local v135
		if v_u_34 then
			v135 = v115
		else
			v135 = nil
		end
		v134.buttonSize = v135
		local v136
		if v_u_89 then
			v136 = not v104
		else
			v136 = v_u_89
		end
		v134.showBadgeOver12 = v136
		v134.menuIconRef = v105
		v134.unibarMenuRef = v101
		v131.Icon = v132(v133, v134)
		v127 = v128(v129, v130, v131)
	end
	v126.MenuIcon = v127
	local v137
	if v_u_27 then
		v137 = v_u_16.createElement(v_u_55)
	else
		v137 = nil
	end
	v126.TraversalBackButton = v137
	v126.UnibarFrame = v_u_16.createElement(v_u_53.Provider, {
		["value"] = {
			["menuIconRef"] = v105,
			["replacesAgeRating"] = v104
		}
	}, { v_u_16.createElement(v_u_65, {
			["layoutOrder"] = 2,
			["onMinWidthChanged"] = nil,
			["onAreaChanged"] = nil,
			["menuRef"] = nil,
			["onMinWidthChanged"] = function() -- name: onMinWidthChanged end,
			["onAreaChanged"] = function() -- name: onAreaChanged end,
			["menuRef"] = v101
		}) })
	local v138
	if v_u_45 and v_u_38 then
		v138 = v_u_16.createElement(v_u_46, {
			["buttonSize"] = nil,
			["layoutOrder"] = 3,
			["buttonSize"] = v115
		})
	else
		v138 = nil
	end
	v126.ShopIcon = v138
	local v139
	if v_u_45 or (not v_u_38 or (not v96 or v_u_44 == nil)) then
		v139 = nil
	else
		local v140 = v_u_16.createElement
		local v141 = v_u_44
		local v142 = {
			["buttonSize"] = nil,
			["layoutOrder"] = 3,
			["showStatusIndicator"] = nil,
			["onActivated"] = nil,
			["isActive"] = nil,
			["icon"] = nil,
			["buttonSize"] = v115,
			["showStatusIndicator"] = v97,
			["onActivated"] = v98,
			["isActive"] = v99
		}
		local v143
		if v_u_40 or not (v_u_70 and v_u_72) then
			v143 = nil
		else
			v143 = v_u_70("BuildingStore", nil, v_u_72)
		end
		v142.icon = v143
		v139 = v140(v141, v142)
	end
	v126.ShopGlobalIcon = v139
	local v144 = v120(v121, v122, v126)
	local v145 = v_u_16.createElement
	local v146 = "ScreenGui"
	local v147 = {
		["IgnoreGuiInset"] = true,
		["ZIndexBehavior"] = nil,
		["DisplayOrder"] = 6,
		["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
	}
	local v148 = {}
	local v149 = v_u_16.createElement
	local v150 = v_u_47
	local v151 = {
		["tag"] = "size-full"
	}
	local v152 = {}
	local v153
	if v_u_23 then
		v153 = v_u_16.createElement(v_u_54, {
			["Position"] = UDim2.fromScale(0.5, 0.1),
			["GamepadConnector"] = v_u_49
		})
	else
		v153 = nil
	end
	v152.MenuNavigationToggleDialog = v153
	local v154
	if v_u_24 then
		v154 = v_u_16.createElement(v_u_50)
	else
		v154 = nil
	end
	v152.GamepadNavigationDialog = v154
	local v155
	if v117 and v118 then
		v155 = v_u_16.createElement(v_u_74, {
			["setSwitchServerConfirmationOpen"] = v119
		})
	else
		v155 = nil
	end
	v152.SwitchServerConfirmation = v155
	v148.Popups = v149(v150, v151, v152)
	local v156 = v_u_16.createElement
	local v157 = v_u_16.Fragment
	local v158 = {}
	local v159 = {}
	local v160
	if v_u_63 then
		v160 = v_u_16.createElement(v_u_63)
	else
		v160 = nil
	end
	v159.JoinVoiceBinder = v160
	local v161
	if v_u_28() then
		v161 = v_u_16.createElement(v_u_64)
	else
		v161 = nil
	end
	v159.PartyMicBinder = v161
	local v162
	if v_u_62 then
		v162 = v_u_16.createElement(v_u_62)
	else
		v162 = nil
	end
	v159.ChromeAnalytics = v162
	v148.Binders = v156(v157, v158, v159)
	local v163
	if v_u_25 then
		v163 = v_u_16.createElement(v_u_56, {
			["anchorRef"] = v101
		})
	else
		v163 = nil
	end
	v148.PlaytestTooltip = v163
	local v164
	if v_u_26 then
		v164 = v_u_16.createElement(v_u_61, {
			["anchorRef"] = v101,
			["isVisible"] = v107
		})
	else
		v164 = nil
	end
	v148.UnpublishedPlaytestTooltip = v164
	local v165 = v_u_16.createElement
	local v166 = v_u_47
	local v167 = {
		["Size"] = UDim2.new(1, 0, 0, v114)
	}
	local v168 = {}
	if v_u_34 then
		local v169 = v_u_16.createElement
		local v170 = v_u_47
		local v171 = {
			["tag"] = "row align-y-center gap-small auto-x",
			["Size"] = nil,
			["Position"] = nil,
			["onAbsoluteSizeChanged"] = nil,
			["onAbsolutePositionChanged"] = nil,
			["Size"] = UDim2.fromOffset(0, v115),
			["Position"] = UDim2.new(0, v113, 0, v116),
			["onAbsoluteSizeChanged"] = v112,
			["onAbsolutePositionChanged"] = v112
		}
		local v172 = {
			["Controls"] = v144
		}
		local v173
		if v104 then
			local v174 = v_u_16.createElement
			local v175 = v_u_10
			local v176 = {
				["universeId"] = nil,
				["layoutOrder"] = 1
			}
			local v177 = game.GameId
			v176.universeId = tostring(v177)
			v173 = v174(v175, v176)
		else
			v173 = nil
		end
		v172.AgeRating = v173
		v144 = v169(v170, v171, v172)
	end
	v168.TopLeftFrame = v144
	local v178 = v_u_16.createElement
	local v179 = v_u_47
	local v180 = {
		["tag"] = "anchor-top-right auto-x",
		["Size"] = nil,
		["Position"] = nil,
		["Size"] = UDim2.fromOffset(0, v115),
		["Position"] = UDim2.new(1, -v113, 0, v116)
	}
	local v181 = {}
	local v182
	if v_u_35 then
		local v183 = v_u_59:hasBuildMode()
		if v183 then
			v183 = not v_u_2.VREnabled
		end
		if v183 then
			v182 = v_u_16.createElement(v_u_60)
		else
			v182 = nil
		end
	else
		v182 = nil
	end
	v181.BuildPillMenu = v182
	v181.HealthBar = v_u_16.createElement(v_u_51)
	v168.TopRightFrame = v178(v179, v180, v181)
	v148.TopBarFrame = v165(v166, v167, v168)
	local v184
	if v_u_2.VREnabled then
		v184 = v_u_16.createElement(v_u_67.Provider, {}, {
			["VRBottomBar"] = v_u_67.withVoiceState(function(p185)
				-- upvalues: (ref) v_u_16, (ref) v_u_57, (ref) v_u_66, (ref) v_u_30, (copy) v_u_89
				local v186 = v_u_16.createElement
				local v187 = v_u_57
				local v188 = {
					["voiceChatServiceManager"] = v_u_66,
					["voiceEnabled"] = p185.voiceEnabled,
					["voiceState"] = p185.voiceState
				}
				local v189
				if v_u_30 then
					v189 = v_u_89
				else
					v189 = nil
				end
				v188.showBadgeOver12 = v189
				return v186(v187, v188)
			end)
		})
	else
		v184 = nil
	end
	v148.VRBottomBar = v184
	return v145(v146, v147, v148)
end