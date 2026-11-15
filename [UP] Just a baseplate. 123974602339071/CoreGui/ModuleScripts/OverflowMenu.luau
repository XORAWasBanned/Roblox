-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.OverflowMenu
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v_u_4 = require(v1.Service)
local v5 = require(v1.ChromeShared.Service.ChromeUtils)
local v_u_6 = require(v1.Integrations.ChromeIntegrationUtils)
local v_u_7 = require(v1.Integrations.RespawnUtils)
local v8 = v5.MappedSignal
local v_u_9 = require(v2.Workspace.Packages.Chrome).UnibarStyle
local v10 = require(v2.Workspace.Packages.Chrome)
local v11 = v10.Enums.SideSheetPlacement
local v_u_12 = require(v1.Integrations.CommonIcon)
local v_u_13 = require(v1.Integrations.CommonFtuxTooltip)
local v_u_14 = require(v1.Integrations.AvatarSwitcher.AvatarSwitcherFtuxTooltip)
local v_u_15 = game:GetService("RunService")
local v_u_16 = game:GetService("VRService")
local v_u_17 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_18 = require(v_u_17.Modules.PlayerList.PlayerListManager)
local v_u_19 = require(v_u_17.Modules.EmotesMenu.EmotesMenuMaster)
local v_u_20 = require(v2.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local v21 = require(v2.Workspace.Packages.AppCommonLib).Signal
local v_u_22
if v_u_20 then
	v_u_22 = require(v2.Workspace.Packages.System).Features
else
	v_u_22 = nil
end
local v_u_23
if v_u_20 then
	v_u_23 = nil
else
	v_u_23 = require(v_u_17.Modules.BackpackScript)
end
local v_u_24 = v10.Hooks.useMappedSignal
local v_u_25 = require(v2.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
local v_u_26 = require(v2.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local v_u_27 = require(v_u_17.Modules.TopBar.ComponentsV2.MenuIcon)
local v28 = require(v2.Packages.UIBlox)
local v_u_29 = v28.App.ImageSet.Images
local v_u_30 = v28.Core.Style.useStyle
local v_u_31 = v28.Core.ImageSet.ImageSetLabel
local v_u_32 = v28.App.SelectionImage.SelectionCursorProvider
local v_u_33 = require(v1.ChromeShared.Unibar.Constants)
local v_u_34 = require(v2.Workspace.Packages.AppCommonLib).isSpatial
local v_u_35 = require(v_u_17.Modules.SelfieView)
local v_u_36 = require(v1.Flags.GetFStringConnectTooltipLocalStorageKey)
local v_u_37 = require(v1.Flags.GetFIntRobloxConnectFtuxShowDelayMs)
local v_u_38 = require(v1.Flags.GetFIntRobloxConnectFtuxDismissDelayMs)
local v39 = require(v2.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience
local v40 = require(v1.Flags.GetShouldShowPlatformChatBasedOnPolicy)
local v_u_41 = game:DefineFastFlag("FixInventoryFilledIcon", false)
local v42 = require(v1.ChromeShared.Flags)
local v_u_43 = v42.FFlagTokenizeUnibarConstantsWithStyleProvider
local v44 = require(v2.Workspace.Packages.SharedFlags)
local v_u_45 = v44.FFlagShowGameAgeRating
local v_u_46 = require(v2.Workspace.Packages.InExperienceTopBar).Flags.FFlagExperienceAgeRatingBadge
local v_u_47 = require(script.Parent.Parent.Parent.TopBar.Components.MenuIconContext)
local v_u_48 = require(v2.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local v49 = v44.FFlagSideSheetFocusNav
local v50 = v44.FFlagEnableConsoleExpControls
local v_u_51 = game:DefineFastFlag("AppChatEnabledChromeDropdownFtuxTooltip", false)
local v_u_52 = game:DefineFastFlag("AvatarSwitcherFtuxTooltip", false)
local v_u_53 = game:DefineFastFlag("InExperienceShopFtuxTooltip", false)
if v_u_53 then
	v_u_53 = v44.FFlagEnableInExperienceShop
end
local v_u_54 = v44.FFlagOfferNineDotActivityIndicator
if v_u_54 then
	v_u_54 = v42.FFlagChromeNineDotActivityIndicator
end
local v_u_55 = require(v2.Workspace.Packages.InExperienceShop.FFlagEnableFreeTrialBlueDot)
if v_u_55 then
	v_u_55 = v42.FFlagChromeNineDotActivityIndicator
end
local v_u_56 = require(v1.Integrations.InExperienceShop.useInExperienceOfferExposure)
local v_u_57
if v_u_54 then
	v_u_57 = require(v1.Integrations.InExperienceShop.useOfferNineDotActivityIndicator)
else
	v_u_57 = nil
end
local v_u_58
if v_u_55 then
	v_u_58 = require(v1.Integrations.InExperienceShop.useFreeTrialNineDotActivityIndicator)
else
	v_u_58 = nil
end
local v_u_59
if v_u_53 then
	v_u_59 = require(v1.Integrations.InExperienceShop.InExperienceShopFtuxTooltip)
else
	v_u_59 = nil
end
local v_u_60 = require(v1.Integrations.InExperienceShop.MenuOfferTooltip)
local v_u_61 = require(v1.Integrations.InExperienceShop.usePublishShopAvailability)
local v_u_62 = game:DefineFastInt("UnibarConnectTooltipPriority", 2000)
local v63 = v39()
if v63 then
	if v_u_51 then
		v_u_51 = v40()
	end
else
	v_u_51 = v63
end
local v_u_64 = require(v2.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v_u_65 = require(v2.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local v_u_66 = v_u_33.SELFIE_VIEW_ID
local v_u_67 = v8.new(v_u_18:GetSetVisibleChangedEvent().Event, function()
	-- upvalues: (copy) v_u_18
	return v_u_18:GetSetVisible()
end)
local v68 = v_u_4:register({
	["id"] = "leaderboard",
	["label"] = "CoreScripts.TopBar.Leaderboard",
	["sideSheetPlacement"] = nil,
	["activated"] = nil,
	["isActivated"] = nil,
	["components"] = nil,
	["sideSheetPlacement"] = v11.BelowFold,
	["activated"] = function(_) -- name: activated
		-- upvalues: (copy) v_u_64, (copy) v_u_16, (copy) v_u_17, (copy) v_u_18, (copy) v_u_34, (copy) v_u_65, (copy) v_u_6
		if v_u_64 or not v_u_16.VREnabled then
			if v_u_18:GetSetVisible() then
				v_u_18:SetVisibility(not v_u_18:GetSetVisible())
				return
			elseif v_u_64 and (v_u_34() and not v_u_65:isMovePanelToCenter()) then
				v_u_18:SetVisibility(not v_u_18:GetSetVisible())
			else
				v_u_6.dismissRobloxMenuAndRun(function()
					-- upvalues: (ref) v_u_18
					v_u_18:SetVisibility(not v_u_18:GetSetVisible())
				end)
			end
		else
			require(v_u_17.Modules.InGameMenu).openPlayersPage()
			return
		end
	end,
	["isActivated"] = v_u_67,
	["components"] = {
		["Icon"] = function(_) -- name: Icon
			-- upvalues: (copy) v_u_12, (copy) v_u_67
			return v_u_12("icons/controls/leaderboardOff", "icons/controls/leaderboardOn", v_u_67)
		end
	}
})
v5.setCoreGuiAvailability(v68, Enum.CoreGuiType.PlayerList)
local v_u_69 = v8.new(v_u_19.EmotesMenuToggled.Event, function()
	-- upvalues: (copy) v_u_19
	return v_u_19:isOpen()
end)
local v_u_70 = v_u_4:register({
	["id"] = "emotes",
	["label"] = "CoreScripts.TopBar.Emotes",
	["sideSheetPlacement"] = nil,
	["activated"] = nil,
	["isActivated"] = nil,
	["components"] = nil,
	["sideSheetPlacement"] = v11.BelowFold,
	["activated"] = function(_) -- name: activated
		-- upvalues: (copy) v_u_19, (copy) v_u_64, (copy) v_u_34, (copy) v_u_65, (copy) v_u_6
		if v_u_19:isOpen() then
			v_u_19:close()
			return
		elseif v_u_64 and (v_u_34() and not v_u_65:isMovePanelToCenter()) then
			v_u_19:open()
		else
			v_u_6.dismissRobloxMenuAndRun(function()
				-- upvalues: (ref) v_u_19
				v_u_19:open()
			end)
		end
	end,
	["isActivated"] = v_u_69,
	["components"] = {
		["Icon"] = function(_) -- name: Icon
			-- upvalues: (copy) v_u_12, (copy) v_u_69
			return v_u_12("icons/controls/emoteOff", "icons/controls/emoteOn", v_u_69)
		end
	}
})
local v_u_71 = false
local v_u_72 = v_u_19.MenuIsVisible
function updateEmoteAvailability() -- name: updateEmoteAvailability
	-- upvalues: (ref) v_u_71, (ref) v_u_72, (copy) v_u_70
	if v_u_71 and v_u_72 then
		v_u_70.availability:available()
	else
		v_u_70.availability:unavailable()
	end
end
v5.setCoreGuiAvailability(v_u_70, Enum.CoreGuiType.EmotesMenu, function(p73)
	-- upvalues: (ref) v_u_71
	v_u_71 = p73
	updateEmoteAvailability()
end)
v_u_19.MenuVisibilityChanged.Event:Connect(function()
	-- upvalues: (ref) v_u_72, (copy) v_u_19
	v_u_72 = v_u_19.MenuIsVisible
	updateEmoteAvailability()
end)
local v_u_74
if v_u_20 then
	v_u_74 = nil
else
	v_u_74 = v8.new(v_u_23.StateChanged.Event, function()
		-- upvalues: (copy) v_u_23
		return v_u_23.IsOpen
	end)
end
local v75
if v_u_20 then
	local v_u_76 = v21.new()
	v_u_22.onVisibilityChanged(v_u_22.FeatureName.Backpack, function()
		-- upvalues: (copy) v_u_76
		v_u_76:fire()
		return nil
	end)
	v75 = v8.new(v_u_76, function()
		-- upvalues: (copy) v_u_22
		return v_u_22.getVisibility(v_u_22.FeatureName.Backpack)
	end)
else
	v75 = v_u_74
end
if v_u_48 and (v49 and v50) then
	v75:connect(function(p77)
		-- upvalues: (copy) v_u_4
		v_u_4:setHideShortcutBar("Backpack", p77)
	end)
end
local v78 = v_u_4:register({
	["id"] = "backpack",
	["label"] = "CoreScripts.TopBar.Inventory",
	["sideSheetPlacement"] = nil,
	["activated"] = nil,
	["isActivated"] = nil,
	["components"] = nil,
	["sideSheetPlacement"] = v11.BelowFold,
	["activated"] = function(_) -- name: activated
		-- upvalues: (copy) v_u_20, (copy) v_u_22, (copy) v_u_64, (copy) v_u_34, (copy) v_u_65, (copy) v_u_6, (copy) v_u_23
		if v_u_20 then
			if v_u_22.getVisibility(v_u_22.FeatureName.Backpack) then
				v_u_22.toggleVisibility(v_u_22.FeatureName.Backpack)
				return
			elseif v_u_64 and (v_u_34() and not v_u_65:isMovePanelToCenter()) then
				v_u_22.toggleVisibility(v_u_22.FeatureName.Backpack)
			else
				v_u_6.dismissRobloxMenuAndRun(function()
					-- upvalues: (ref) v_u_22
					v_u_22.toggleVisibility(v_u_22.FeatureName.Backpack)
				end)
			end
		elseif v_u_23.IsOpen then
			v_u_23:OpenClose()
			return
		elseif v_u_64 and (v_u_34() and not v_u_65:isMovePanelToCenter()) then
			v_u_23:OpenClose()
		else
			v_u_6.dismissRobloxMenuAndRun(function()
				-- upvalues: (ref) v_u_23
				v_u_23:OpenClose()
			end)
		end
	end,
	["isActivated"] = v75,
	["components"] = {
		["Icon"] = function(_) -- name: Icon
			-- upvalues: (copy) v_u_12, (copy) v_u_41, (copy) v_u_74
			return v_u_12("icons/menu/inventoryOff", v_u_41 and "icons/menu/inventoryOn" or "icons/menu/inventory", v_u_74)
		end
	}
})
v5.setCoreGuiAvailability(v78, Enum.CoreGuiType.Backpack)
local v_u_79 = v_u_4:register({
	["id"] = "respawn",
	["label"] = "CoreScripts.InGameMenu.QuickActions.Respawn",
	["sideSheetPlacement"] = nil,
	["activated"] = nil,
	["isActivated"] = nil,
	["components"] = nil,
	["sideSheetPlacement"] = v11.BelowFold,
	["activated"] = function(_) -- name: activated
		-- upvalues: (copy) v_u_7
		v_u_7.respawnPage()
	end,
	["isActivated"] = v_u_7.respawnPageOpenSignal,
	["components"] = {
		["Icon"] = function(_) -- name: Icon
			-- upvalues: (copy) v_u_12
			return v_u_12("icons/actions/respawn")
		end
	}
})
function updateRespawn(p80) -- name: updateRespawn
	-- upvalues: (copy) v_u_79
	if p80 then
		v_u_79.availability:available()
	else
		v_u_79.availability:unavailable()
	end
end
task.defer(function()
	-- upvalues: (copy) v_u_17
	local v81 = require(v_u_17.Modules.Settings.SettingsHub)
	v81.RespawnBehaviourChangedEvent.Event:connect(updateRespawn)
	updateRespawn(v81:GetRespawnBehaviour())
end)
local v_u_82 = v_u_4:currentSubMenu()
local v_u_83 = v8.new(v_u_82:signal(), function()
	-- upvalues: (copy) v_u_82
	return v_u_82:get() == "nine_dot"
end)
if v_u_4:orderAlignment():get() == Enum.HorizontalAlignment.Right then
	v_u_83:connect(function(p84)
		-- upvalues: (copy) v_u_18
		v_u_18:SetMinimized(p84)
	end)
end
function HamburgerButton(p85) -- name: HamburgerButton
	-- upvalues: (copy) v_u_30, (copy) v_u_3, (copy) v_u_15, (copy) v_u_54, (copy) v_u_55, (copy) v_u_61, (copy) v_u_56, (ref) v_u_57, (ref) v_u_58, (copy) v_u_43, (copy) v_u_9, (copy) v_u_33, (copy) v_u_83, (copy) v_u_24, (copy) v_u_51, (copy) v_u_13, (copy) v_u_62, (copy) v_u_25, (copy) v_u_36, (copy) v_u_37, (copy) v_u_38, (copy) v_u_45, (copy) v_u_26, (copy) v_u_46, (copy) v_u_47, (copy) v_u_48, (copy) v_u_32, (copy) v_u_27, (copy) v_u_31, (copy) v_u_29, (copy) v_u_35, (copy) v_u_4, (copy) v_u_66, (copy) v_u_52, (copy) v_u_14, (copy) v_u_53, (ref) v_u_59, (copy) v_u_60
	local v86 = p85.toggleTransition
	local v_u_87 = v_u_30()
	local v88 = v_u_3.useRef(nil)
	if not v_u_15:IsStudio() or (v_u_54 or v_u_55) then
		v_u_61()
	end
	if not v_u_15:IsStudio() or v_u_54 then
		v_u_56()
	end
	if v_u_54 then
		v_u_57()
	end
	if v_u_55 then
		v_u_58()
	end
	local v_u_89, v_u_90
	if v_u_43 then
		local v91 = v_u_9.use()
		v_u_89 = v91.ICON_SIZE
		v_u_90 = v91.MEDIUM_ICON_SIZE
	else
		v_u_89 = v_u_33.ICON_SIZE
		v_u_90 = v_u_33.MEDIUM_ICON_SIZE
	end
	local v92 = v_u_83 and v_u_24(v_u_83) or false
	local v93
	if v_u_51 then
		v93 = v_u_13({
			["id"] = "CONNECT_TOOLTIP",
			["priority"] = nil,
			["isIconVisible"] = nil,
			["headerKey"] = nil,
			["bodyKey"] = nil,
			["localStorageKey"] = nil,
			["showDelay"] = nil,
			["dismissDelay"] = nil,
			["priority"] = v_u_62,
			["isIconVisible"] = p85.visible,
			["headerKey"] = v_u_25() and "CoreScripts.FTUX.Heading.CheckOutRobloxParty" or "CoreScripts.FTUX.Heading.CheckOutRobloxConnect",
			["bodyKey"] = v_u_25() and "CoreScripts.FTUX.Label.PartyWithYourFriendsAnytime" or "CoreScripts.FTUX.Label.ChatWithYourFriendsAnytime",
			["localStorageKey"] = v_u_36(),
			["showDelay"] = v_u_37(),
			["dismissDelay"] = v_u_38()
		})
	else
		v93 = nil
	end
	local v94
	if v_u_45 then
		v94 = v_u_26(function(p95)
			return p95.getShowGameAgeRating()
		end)
	else
		v94 = v_u_26(function(p96)
			return p96.getShowBadgeOver12()
		end)
	end
	local v97
	if v_u_46 then
		v97 = v_u_3.useContext(v_u_47).replacesAgeRating
	else
		v97 = false
	end
	local v98 = v_u_3.createElement
	local v99 = "Frame"
	local v100 = {
		["Size"] = nil,
		["BorderSizePixel"] = 0,
		["ref"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = nil,
		["Size"] = UDim2.new(0, v_u_89, 0, v_u_89)
	}
	local v101
	if v_u_15:IsStudio() then
		v101 = nil
	else
		v101 = v88
	end
	v100.ref = v101
	v100.BackgroundColor3 = v_u_87.Theme.BackgroundOnHover.Color
	v100.BackgroundTransparency = v86:map(function(p102)
		-- upvalues: (copy) v_u_87
		return 1 - (1 - v_u_87.Theme.BackgroundOnHover.Transparency) * p102
	end)
	local v103 = {}
	local v104 = v_u_3.createElement("UICorner", {
		["Name"] = "Corner",
		["CornerRadius"] = nil,
		["CornerRadius"] = UDim.new(1, 0)
	})
	local v105
	if v_u_48 then
		local v106 = v_u_3.createElement
		local v107 = v_u_32
		local v108 = {}
		local v109 = {}
		local v110 = v_u_3.createElement
		local v111 = v_u_27
		local v112 = {}
		if v94 then
			v94 = not v97
		end
		v112.showBadgeOver12 = v94
		v109.Icon = v110(v111, v112)
		v105 = v106(v107, v108, v109)
	else
		v105 = nil
	end
	local v113
	if v_u_48 then
		v113 = nil
	else
		v113 = v_u_3.createElement(v_u_31, {
			["Name"] = "Overflow",
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["Size"] = nil,
			["ImageColor3"] = nil,
			["ImageTransparency"] = nil,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["Image"] = v_u_29["icons/common/hamburgermenu"],
			["Size"] = v86:map(function(p114)
				-- upvalues: (ref) v_u_89
				local v115 = 1 - p114
				return UDim2.new(0, v_u_89 * v115, 0, v_u_89 * v115)
			end),
			["ImageColor3"] = v_u_87.Theme.IconEmphasis.Color,
			["ImageTransparency"] = v86:map(function(p116)
				-- upvalues: (copy) v_u_87
				return p116 * v_u_87.Theme.IconEmphasis.Transparency
			end)
		})
	end
	local v117
	if v_u_48 then
		v117 = nil
	else
		v117 = v_u_3.createElement(v_u_31, {
			["Name"] = "Close",
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["Size"] = nil,
			["ImageColor3"] = nil,
			["ImageTransparency"] = nil,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["Image"] = v_u_29["icons/navigation/close"],
			["Size"] = v86:map(function(p118)
				-- upvalues: (ref) v_u_90
				return UDim2.new(0, v_u_90 * p118, 0, v_u_90 * p118)
			end),
			["ImageColor3"] = v_u_87.Theme.IconEmphasis.Color,
			["ImageTransparency"] = v86:map(function(p119)
				-- upvalues: (copy) v_u_87
				return (1 - p119) * v_u_87.Theme.IconEmphasis.Transparency
			end)
		})
	end
	local v120
	if v_u_35.useCameraOn() and not (v_u_4:isWindowOpen(v_u_66) or v92) then
		v120 = v_u_3.createElement(v_u_35.CameraStatusDot, {
			["Name"] = "CameraStatusDot",
			["Position"] = nil,
			["ZIndex"] = 2,
			["Position"] = UDim2.new(1, -4, 1, -7)
		})
	else
		v120 = nil
	end
	local v121
	if v_u_52 then
		v121 = v_u_3.createElement(v_u_14, {
			["visible"] = p85.visible
		})
	else
		v121 = nil
	end
	local v122
	if v_u_53 then
		v122 = v_u_3.createElement(v_u_59, {
			["visible"] = p85.visible
		})
	else
		v122 = nil
	end
	local v123
	if v_u_15:IsStudio() then
		v123 = nil
	else
		v123 = v_u_3.createElement(v_u_60, {
			["anchorRef"] = v88,
			["visible"] = p85.visible
		})
	end
	__set_list(v103, 1, {v104, v105, v113, v117, v120, v93, v121, v122, v123})
	return v98(v99, v100, v103)
end
return v_u_4:register({
	["initialAvailability"] = nil,
	["id"] = "nine_dot",
	["label"] = nil,
	["sideSheetPlacement"] = nil,
	["hotkeyCodes"] = nil,
	["isActivated"] = nil,
	["components"] = nil,
	["initialAvailability"] = v_u_4.AvailabilitySignal.Pinned,
	["label"] = v_u_48 and "CoreScripts.TopBar.RobloxMenu" or "CoreScripts.TopBar.MoreMenu",
	["sideSheetPlacement"] = v11.None,
	["hotkeyCodes"] = v_u_48 and { Enum.KeyCode.Escape } or nil,
	["isActivated"] = v_u_83,
	["components"] = {
		["Icon"] = function(p124) -- name: Icon
			-- upvalues: (copy) v_u_3
			return v_u_3.createElement(HamburgerButton, p124)
		end
	}
})