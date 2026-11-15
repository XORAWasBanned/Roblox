-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.GamepadMenu
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("ContextActionService")
local v_u_3 = game:GetService("CoreGui")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = game:GetService("VRService")
local v_u_6 = game:GetService("TextChatService")
local v_u_7 = game:GetService("StarterGui")
local v_u_8 = require(v1.Packages.Roact)
local v9 = require(v1.Packages.RoactRodux)
local v_u_10 = require(v1.Packages.Cryo)
local v11 = require(v1.Packages.t)
local v12 = require(v1.Packages.UIBlox)
local v_u_13 = require(v1.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local v_u_14 = require(v1.Workspace.Packages.ExperimentLayers).AppUserLayers
local v_u_15 = require(v1.Packages.Signals)
local v_u_16 = require(v1.Workspace.Packages.Display)
local v_u_17 = v12.Core.Style.withStyle
local v18 = v12.App.ImageSet.Images
local v_u_19 = v12.Core.ImageSet.ImageSetLabel
local v_u_20 = require(script.MenuHeader)
local v_u_21 = require(script.ChatIcon)
local v_u_22 = require(script.MenuCell)
local v_u_23 = require(script.QuickMenuControllerBar)
local v_u_24 = require(script.MenuNavigationToggleDialog)
local v_u_25 = v_u_3:WaitForChild("RobloxGui").Modules
local v26 = v_u_25.TopBar
local v_u_27 = require(v_u_25.TenFootInterface)
local v_u_28 = require(v1.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local v_u_29
if v_u_28 then
	v_u_29 = require(v1.Workspace.Packages.System).Features
else
	v_u_29 = nil
end
local v_u_30
if v_u_28 then
	v_u_30 = nil
else
	v_u_30 = require(v_u_25.BackpackScript)
end
local v_u_31 = require(v_u_25.EmotesMenu.EmotesMenuMaster)
local v_u_32 = require(v_u_25.ChatSelector)
local v33 = require(v1.Workspace.Packages.PlayerList)
local v_u_34 = require(v_u_25.PlayerList.PlayerListManager)
local v_u_35 = require(v_u_25.isNewInGameMenuEnabled)
local v_u_36 = require(v_u_25.InGameMenuConstants)
local v_u_37 = require(v1.Workspace.Packages.Chrome).Enabled
local v_u_38 = require(v1.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize
local v39 = require(v26:WaitForChild("Telemetry"))
local v_u_40 = v39.LogGamepadOpenExperienceControlsMenu
local v_u_41 = v39.GamepadMenuTelemetry.default
local v_u_42 = UserSettings().GameSettings
local v43 = script.Parent.Parent.Parent.Actions
local v_u_44 = require(v43.SetGamepadMenuOpen)
local v_u_45 = require(script.EnumGamepadMenuOptions)
local v_u_46 = v18["icons/logo/block"]
local v_u_47 = v18["icons/menu/AR"]
local v_u_48 = v18["icons/actions/respawn"]
local v_u_49 = v18["icons/navigation/close"]
local v_u_50 = v18["component_assets/circle_17"]
local v_u_51 = Rect.new(8, 8, 9, 9)
local v_u_52 = v_u_8.PureComponent:extend("GamepadMenu")
local v53 = require(v1.Workspace.Packages.SharedFlags)
local v_u_54 = v53.FFlagAddMenuNavigationToggleDialog
local v_u_55 = v53.FFlagEnableConsoleExpControls
local v_u_56 = v53.FFlagExperienceMenuGamepadExposureEnabled
local v_u_57 = require(v_u_25.Flags.FFlagMountCoreGuiBackpack)
local v_u_58 = v33.Flags.FFlagPlayerListUseFocusNavHook
local v_u_59 = v53.getFFlagExpChatAlwaysRunTCS
local v_u_60 = nil
local v_u_61 = nil
local v_u_62 = nil
task.spawn(function()
	-- upvalues: (ref) v_u_60, (copy) v_u_3, (ref) v_u_61, (ref) v_u_62
	v_u_60 = v_u_3:WaitForChild("ToastNotification", 3)
	local v63
	if v_u_60 == nil then
		v63 = nil
	else
		v63 = v_u_60:WaitForChild("ToastNotificationWrapper", 3)
	end
	v_u_61 = v63
	local v64
	if v_u_61 == nil then
		v64 = nil
	else
		v64 = v_u_61:FindFirstChild("Toast", true)
	end
	v_u_62 = v64
end)
local v65 = v11.strictInterface
local v66 = {}
local v67
if v_u_38 then
	v67 = nil
else
	v67 = v11.Vector2
end
v66.screenSize = v67
v66.chatVersion = v11.optional(v11.EnumItem)
v66.chatEnabled = v11.boolean
v66.leaderboardEnabled = v11.boolean
v66.emotesEnabled = v11.boolean
local v68
if v_u_57 then
	v68 = nil
else
	v68 = v11.boolean
end
v66.backpackEnabled = v68
v66.respawnEnabled = v11.boolean
v66.leaderboardOpen = v11.boolean
v66.backpackOpen = v11.boolean
v66.emotesOpen = v11.boolean
v66.menuOpen = v11.boolean
local v69
if v_u_57 then
	v69 = v11.boolean
else
	v69 = nil
end
v66.topBarEnabled = v69
v66.setGamepadMenuOpen = v11.callback
v66.isGamepadMenuOpen = v11.boolean
v_u_52.validateProps = v65(v66)
function v_u_52.init(p_u_70) -- name: init
	-- upvalues: (copy) v_u_57, (copy) v_u_7, (copy) v_u_56, (copy) v_u_41, (copy) v_u_45, (copy) v_u_32, (ref) v_u_62, (copy) v_u_58, (copy) v_u_34, (copy) v_u_40, (copy) v_u_52, (copy) v_u_4, (copy) v_u_38, (copy) v_u_16, (copy) v_u_15
	if v_u_57 then
		p_u_70:setState({
			["selectedIndex"] = 1,
			["menuActions"] = nil,
			["mountBackpack"] = nil,
			["menuActions"] = {},
			["mountBackpack"] = v_u_7:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack)
		})
		v_u_7.CoreGuiChangedSignal:Connect(function(p71, p72)
			-- upvalues: (copy) p_u_70
			if p71 == Enum.CoreGuiType.Backpack or p71 == Enum.CoreGuiType.All then
				p_u_70:setState({
					["mountBackpack"] = p72
				})
			end
		end)
	else
		p_u_70:setState({
			["selectedIndex"] = 1,
			["menuActions"] = nil,
			["menuActions"] = {}
		})
	end
	if v_u_56 then
		p_u_70.loggedExperienceMenuGamepadExposure = false
	end
	p_u_70.boundMenuOpenActions = false
	p_u_70.lastMenuButtonPress = 0
	function p_u_70.toggleChatVisibilityAction(_, p73, _)
		-- upvalues: (copy) p_u_70, (ref) v_u_41, (ref) v_u_45, (ref) v_u_32
		if p73 == Enum.UserInputState.Begin then
			p_u_70.toggleChatVisible()
			v_u_41.onOptionSelected({
				["menuOptionName"] = nil,
				["usedShortcut"] = true,
				["isToggleOpen"] = nil,
				["menuOptionName"] = v_u_45.Chat,
				["isToggleOpen"] = v_u_32:GetVisibility()
			})
		end
	end
	function p_u_70.toggleMenuVisibleAction(_, p74, _)
		-- upvalues: (copy) p_u_70, (ref) v_u_62, (ref) v_u_58, (ref) v_u_34, (ref) v_u_40
		if p_u_70.props.menuOpen then
			return Enum.ContextActionResult.Pass
		end
		local v75
		if v_u_62 == nil then
			v75 = false
		else
			v75 = v_u_62.Visible
		end
		if p74 == Enum.UserInputState.Begin then
			p_u_70.lastMenuButtonPress = tick()
			return Enum.ContextActionResult.Pass
		end
		if p74 ~= Enum.UserInputState.End or v75 and tick() - p_u_70.lastMenuButtonPress >= 1 then
			return Enum.ContextActionResult.Pass
		end
		local v76 = not p_u_70.props.isGamepadMenuOpen
		if v_u_58 and (v76 and (v_u_34:GetIsModal() and v_u_34:GetVisibility())) then
			v_u_34:SetVisibility(false)
		end
		p_u_70.props.setGamepadMenuOpen(v76)
		v_u_40(v76)
		p_u_70:logExperienceMenuGamepadExposure()
		return Enum.ContextActionResult.Sink
	end
	function p_u_70.closeMenuAction(_, p77, _)
		-- upvalues: (copy) p_u_70
		if p77 ~= Enum.UserInputState.Begin then
			return Enum.ContextActionResult.Pass
		end
		p_u_70.props.setGamepadMenuOpen(false)
		return Enum.ContextActionResult.Sink
	end
	function p_u_70.leaveGameMenuAction(_, p78, _)
		-- upvalues: (ref) v_u_52, (copy) p_u_70, (ref) v_u_41, (ref) v_u_45
		if p78 ~= Enum.UserInputState.Begin then
			return Enum.ContextActionResult.Pass
		end
		v_u_52.leaveGame()
		p_u_70.props.setGamepadMenuOpen(false)
		v_u_41.onOptionSelected({
			["menuOptionName"] = nil,
			["usedShortcut"] = true,
			["isToggleOpen"] = true,
			["menuOptionName"] = v_u_45.Leave
		})
		return Enum.ContextActionResult.Sink
	end
	function p_u_70.respawnMenuAction(_, p79, _)
		-- upvalues: (ref) v_u_52, (copy) p_u_70, (ref) v_u_41, (ref) v_u_45
		if p79 ~= Enum.UserInputState.Begin then
			return Enum.ContextActionResult.Pass
		end
		v_u_52.respawnCharacter()
		p_u_70.props.setGamepadMenuOpen(false)
		v_u_41.onOptionSelected({
			["menuOptionName"] = nil,
			["usedShortcut"] = true,
			["isToggleOpen"] = true,
			["menuOptionName"] = v_u_45.Respawn
		})
		return Enum.ContextActionResult.Sink
	end
	p_u_70.lastThumbStickMove = 0
	function p_u_70.moveSelectionAction(_, p80, p81)
		-- upvalues: (copy) p_u_70
		if p80 == Enum.UserInputState.Begin then
			if p81.KeyCode == Enum.KeyCode.DPadUp then
				if p_u_70.state.selectedIndex > 1 then
					p_u_70:setState({
						["selectedIndex"] = p_u_70.state.selectedIndex - 1
					})
				end
				return Enum.ContextActionResult.Sink
			end
			if p81.KeyCode == Enum.KeyCode.DPadDown then
				if p_u_70.state.selectedIndex < #p_u_70.state.menuActions then
					p_u_70:setState({
						["selectedIndex"] = p_u_70.state.selectedIndex + 1
					})
				end
				return Enum.ContextActionResult.Sink
			end
		elseif p81.KeyCode == Enum.KeyCode.Thumbstick1 then
			if tick() - p_u_70.lastThumbStickMove < 0.15 then
				return Enum.ContextActionResult.Pass
			end
			if p81.Position.Y > 0.8 then
				if p_u_70.state.selectedIndex > 1 then
					p_u_70:setState({
						["selectedIndex"] = p_u_70.state.selectedIndex - 1
					})
					p_u_70.lastThumbStickMove = tick()
				end
				return Enum.ContextActionResult.Pass
			end
			if p81.Position.Y < -0.8 then
				if p_u_70.state.selectedIndex < #p_u_70.state.menuActions then
					p_u_70:setState({
						["selectedIndex"] = p_u_70.state.selectedIndex + 1
					})
					p_u_70.lastThumbStickMove = tick()
				end
				return Enum.ContextActionResult.Sink
			end
		end
		return Enum.ContextActionResult.Pass
	end
	function p_u_70.goToTopAction(_, p82, _)
		-- upvalues: (copy) p_u_70
		if p82 ~= Enum.UserInputState.Begin then
			return Enum.ContextActionResult.Pass
		end
		p_u_70:setState({
			["selectedIndex"] = 1
		})
	end
	function p_u_70.goToBottomAction(_, p83, _)
		-- upvalues: (copy) p_u_70
		if p83 ~= Enum.UserInputState.Begin then
			return Enum.ContextActionResult.Pass
		end
		p_u_70:setState({
			["selectedIndex"] = #p_u_70.state.menuActions
		})
	end
	function p_u_70.activateSelectionAction(_, p84, _)
		-- upvalues: (copy) p_u_70, (ref) v_u_4, (ref) v_u_45, (ref) v_u_34, (ref) v_u_41
		if p84 ~= Enum.UserInputState.Begin then
			return Enum.ContextActionResult.Pass
		end
		local v85 = p_u_70.state.menuActions[p_u_70.state.selectedIndex]
		p_u_70.props.setGamepadMenuOpen(false)
		v_u_4:SetMenuIsOpen(false, "GamepadMenu")
		v85.onActivated()
		v_u_41.onOptionSelected({
			["menuOptionName"] = nil,
			["usedShortcut"] = false,
			["isToggleOpen"] = nil,
			["menuOptionName"] = v85.name,
			["isToggleOpen"] = v85.name ~= v_u_45.Leaderboard and true or v_u_34:GetSetVisible()
		})
		return Enum.ContextActionResult.Sink
	end
	function p_u_70.overlayDismiss()
		-- upvalues: (copy) p_u_70
		p_u_70.props.setGamepadMenuOpen(false)
	end
	if v_u_38 then
		local v_u_86 = v_u_16.GetDisplayStore(false).getViewportSize
		p_u_70.disposeScreenSize = v_u_15.createEffect(function(p87)
			-- upvalues: (copy) p_u_70, (copy) v_u_86
			p_u_70:setState({
				["screenSize"] = v_u_86(p87)
			})
		end)
	end
end
function v_u_52.openRootMenu() -- name: openRootMenu
	-- upvalues: (copy) v_u_35, (copy) v_u_25, (copy) v_u_36
	if v_u_35() then
		require(v_u_25.InGameMenuInit).openInGameMenu(v_u_36.MainPagePageKey)
	else
		require(v_u_25.Settings.SettingsHub):SetVisibility(true, nil, nil, true, v_u_36.AnalyticsMenuOpenTypes.PlayersTriggered)
	end
end
function v_u_52.openUnibarMenu() -- name: openUnibarMenu
	-- upvalues: (copy) v_u_25
	require(v_u_25.Chrome.Service):enableFocusNav()
end
function v_u_52.closeUnibarMenu() -- name: closeUnibarMenu
	-- upvalues: (copy) v_u_25
	require(v_u_25.Chrome.Service):disableFocusNav()
end
function v_u_52.toggleChatVisible() -- name: toggleChatVisible
	-- upvalues: (copy) v_u_32, (copy) v_u_42
	v_u_32:ToggleVisibility()
	v_u_42.ChatVisible = v_u_32:GetVisibility()
end
function v_u_52.focusChatBar() -- name: focusChatBar
	-- upvalues: (copy) v_u_32, (copy) v_u_42
	v_u_32:SetVisible(true)
	v_u_42.ChatVisible = true
	v_u_32:FocusChatBar()
end
function v_u_52.toggleLeaderboard() -- name: toggleLeaderboard
	-- upvalues: (copy) v_u_35, (copy) v_u_25, (copy) v_u_34
	if v_u_35() then
		require(v_u_25.InGameMenuInit).openPlayersPage()
	else
		v_u_34:SetVisibility(not v_u_34:GetSetVisible())
	end
end
function v_u_52.toggleEmotesMenu() -- name: toggleEmotesMenu
	-- upvalues: (copy) v_u_31
	if v_u_31:isOpen() then
		v_u_31:close()
	else
		v_u_31:open()
	end
end
function v_u_52.toggleBackpack() -- name: toggleBackpack
	-- upvalues: (copy) v_u_28, (copy) v_u_29, (copy) v_u_30
	if v_u_28 then
		v_u_29.toggleVisibility(v_u_29.FeatureName.Backpack)
	else
		v_u_30:OpenClose()
	end
end
function v_u_52.leaveGame() -- name: leaveGame
	-- upvalues: (copy) v_u_35, (copy) v_u_25, (copy) v_u_36
	if v_u_35() then
		require(v_u_25.InGameMenuInit).openGameLeavePage()
	else
		local v88 = require(v_u_25.Settings.SettingsHub)
		v88:SetVisibility(true, false, v88.Instance.LeaveGamePage, true, v_u_36.AnalyticsMenuOpenTypes.GamepadLeaveGame)
	end
end
function v_u_52.respawnCharacter() -- name: respawnCharacter
	-- upvalues: (copy) v_u_35, (copy) v_u_25, (copy) v_u_36
	if v_u_35() then
		require(v_u_25.InGameMenuInit).openCharacterResetPage()
	else
		local v89 = require(v_u_25.Settings.SettingsHub)
		v89:SetVisibility(true, false, v89.Instance.ResetCharacterPage, true, v_u_36.AnalyticsMenuOpenTypes.GamepadResetCharacter)
	end
end
function v_u_52.shouldShowChatMenuOption(p90, p91) -- name: shouldShowChatMenuOption
	-- upvalues: (copy) v_u_27, (copy) v_u_6, (copy) v_u_59
	if not v_u_27:IsEnabled() then
		return p91
	end
	local v92 = p90 or v_u_6.ChatVersion
	if v_u_59() then
		return p91
	end
	if p91 then
		p91 = v92 == Enum.ChatVersion.TextChatService
	end
	return p91
end
function v_u_52.getMenuActionsFromProps(p93, p94) -- name: getMenuActionsFromProps
	-- upvalues: (copy) v_u_45, (copy) v_u_46, (copy) v_u_52, (copy) v_u_21, (copy) v_u_37, (copy) v_u_47, (copy) v_u_27, (copy) v_u_57, (copy) v_u_48, (copy) v_u_49
	local v95 = {}
	local v96 = {
		["name"] = nil,
		["icon"] = nil,
		["iconComponent"] = nil,
		["localizationKey"] = "CoreScripts.TopBar.Menu",
		["onActivated"] = nil,
		["name"] = v_u_45.Menu,
		["icon"] = v_u_46,
		["onActivated"] = v_u_52.openRootMenu
	}
	table.insert(v95, v96)
	if v_u_52.shouldShowChatMenuOption(p93.chatVersion, p93.chatEnabled) then
		local v97 = {
			["name"] = nil,
			["icon"] = nil,
			["iconComponent"] = nil,
			["localizationKey"] = "CoreScripts.TopBar.Chat",
			["onActivated"] = nil,
			["name"] = v_u_45.Chat,
			["iconComponent"] = v_u_21,
			["onActivated"] = v_u_52.focusChatBar
		}
		table.insert(v95, v97)
	end
	if v_u_37() then
		local v98 = {
			["name"] = nil,
			["icon"] = nil,
			["iconComponent"] = nil,
			["localizationKey"] = "CoreScripts.TopBar.Title.ExperienceControls",
			["onActivated"] = nil,
			["name"] = v_u_45.Unibar,
			["icon"] = v_u_47,
			["onActivated"] = v_u_52.openUnibarMenu
		}
		table.insert(v95, v98)
	end
	if p93.leaderboardEnabled or v_u_27:IsEnabled() then
		local v99 = p93.leaderboardOpen and "rbxasset://textures/ui/TopBar/leaderboardOn.png" or "rbxasset://textures/ui/TopBar/leaderboardOff.png"
		local v100 = {
			["name"] = nil,
			["icon"] = nil,
			["iconComponent"] = nil,
			["localizationKey"] = "CoreScripts.TopBar.Leaderboard",
			["onActivated"] = nil,
			["name"] = v_u_45.Leaderboard,
			["icon"] = v99,
			["onActivated"] = v_u_52.toggleLeaderboard
		}
		table.insert(v95, v100)
	end
	if p93.emotesEnabled then
		local v101 = p93.emotesOpen and "rbxasset://textures/ui/TopBar/emotesOn.png" or "rbxasset://textures/ui/TopBar/emotesOff.png"
		local v102 = {
			["name"] = nil,
			["icon"] = nil,
			["iconComponent"] = nil,
			["localizationKey"] = "CoreScripts.TopBar.Emotes",
			["onActivated"] = nil,
			["name"] = v_u_45.Emotes,
			["icon"] = v101,
			["onActivated"] = v_u_52.toggleEmotesMenu
		}
		table.insert(v95, v102)
	end
	local v103
	if v_u_57 then
		v103 = p93.topBarEnabled
		if v103 then
			v103 = p94.mountBackpack
		end
	else
		v103 = p93.backpackEnabled
	end
	if v103 then
		local v104 = p93.backpackOpen and "rbxasset://textures/ui/TopBar/inventoryOn.png" or "rbxasset://textures/ui/TopBar/inventoryOff.png"
		local v105 = {
			["name"] = nil,
			["icon"] = nil,
			["iconComponent"] = nil,
			["localizationKey"] = "CoreScripts.TopBar.Inventory",
			["onActivated"] = nil,
			["name"] = v_u_45.Inventory,
			["icon"] = v104,
			["onActivated"] = v_u_52.toggleBackpack
		}
		table.insert(v95, v105)
	end
	if p93.respawnEnabled then
		local v106 = {
			["name"] = nil,
			["icon"] = nil,
			["iconComponent"] = nil,
			["localizationKey"] = "CoreScripts.TopBar.Respawn",
			["onActivated"] = nil,
			["name"] = v_u_45.Respawn,
			["icon"] = v_u_48,
			["onActivated"] = v_u_52.respawnCharacter
		}
		table.insert(v95, v106)
	end
	local v107 = {
		["name"] = nil,
		["icon"] = nil,
		["iconComponent"] = nil,
		["localizationKey"] = "CoreScripts.TopBar.Leave",
		["onActivated"] = nil,
		["name"] = v_u_45.Leave,
		["icon"] = v_u_49,
		["onActivated"] = v_u_52.leaveGame
	}
	table.insert(v95, v107)
	return v95
end
function v_u_52.getDerivedStateFromProps(p108, p109) -- name: getDerivedStateFromProps
	-- upvalues: (copy) v_u_57, (copy) v_u_52, (copy) v_u_10
	local v110
	if v_u_57 then
		v110 = v_u_52.getMenuActionsFromProps(p108, p109)
	else
		v110 = v_u_52.getMenuActionsFromProps(p108)
	end
	local v111 = p109.selectedIndex or 1
	local v112 = #v110 < v111 and #v110 or v111
	return v_u_10.Dictionary.join(p109, {
		["selectedIndex"] = v112,
		["menuActions"] = v110
	})
end
function v_u_52.render(p_u_113) -- name: render
	-- upvalues: (copy) v_u_17, (copy) v_u_8, (copy) v_u_20, (copy) v_u_22, (copy) v_u_38, (copy) v_u_23, (copy) v_u_19, (copy) v_u_50, (copy) v_u_51, (copy) v_u_37, (copy) v_u_55, (copy) v_u_54, (copy) v_u_24
	return v_u_17(function(p114)
		-- upvalues: (ref) v_u_8, (ref) v_u_20, (copy) p_u_113, (ref) v_u_22, (ref) v_u_38, (ref) v_u_23, (ref) v_u_19, (ref) v_u_50, (ref) v_u_51, (ref) v_u_37, (ref) v_u_55, (ref) v_u_54, (ref) v_u_24
		local v115 = p114.Theme
		local v116 = {
			["Layout"] = v_u_8.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Vertical,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["VerticalAlignment"] = Enum.VerticalAlignment.Top,
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			}),
			["MenuHeader"] = v_u_8.createElement(v_u_20, {
				["layoutOrder"] = 1,
				["height"] = 120
			})
		}
		for v117, v118 in ipairs(p_u_113.state.menuActions) do
			v116[v118.name] = v_u_8.createElement(v_u_22, {
				["layoutOrder"] = nil,
				["icon"] = nil,
				["iconComponent"] = nil,
				["localizationKey"] = nil,
				["height"] = 56,
				["hasDivider"] = nil,
				["isSelected"] = nil,
				["layoutOrder"] = v117 + 1,
				["icon"] = v118.icon,
				["iconComponent"] = v118.iconComponent,
				["localizationKey"] = v118.localizationKey,
				["hasDivider"] = v117 ~= #p_u_113.state.menuActions,
				["isSelected"] = v117 == p_u_113.state.selectedIndex
			})
		end
		local v119 = #p_u_113.state.menuActions * 56 + 120
		local v120 = 1
		local v121
		if v_u_38 then
			v121 = p_u_113.state.screenSize
		else
			v121 = p_u_113.props.screenSize
		end
		if v121.Y * 0.75 < v119 then
			v120 = v121.Y * 0.75 / v119
		end
		local v122
		if v121.X * 0.75 < 336 then
			v122 = v121.X * 0.75 / 336
			if v122 >= v120 then
				v122 = v120
			end
		else
			v122 = v120
		end
		if v122 < 1 then
			v116.UIScale = v_u_8.createElement("UIScale", {
				["Scale"] = v122
			})
		end
		local v123 = p_u_113.props.isGamepadMenuOpen
		local v124
		if v123 then
			v124 = v_u_8.createElement(v_u_23, {
				["chatMenuEnabled"] = p_u_113.shouldShowChatMenuOption(p_u_113.props.chatVersion, p_u_113.props.chatEnabled)
			})
		else
			v124 = nil
		end
		local v125 = {
			["Menu"] = v_u_8.createElement(v_u_19, {
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["SliceCenter"] = nil,
				["ScaleType"] = nil,
				["ImageTransparency"] = nil,
				["ImageColor3"] = nil,
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["Image"] = v_u_50,
				["SliceCenter"] = v_u_51,
				["ScaleType"] = Enum.ScaleType.Slice,
				["ImageTransparency"] = v115.BackgroundUIContrast.Transparency,
				["ImageColor3"] = v115.BackgroundUIContrast.Color,
				["Size"] = UDim2.fromOffset(336, v119),
				["Position"] = UDim2.fromScale(0.5, 0.5),
				["AnchorPoint"] = Vector2.new(0.5, 0.5)
			}, v116),
			["ControllerBar"] = v124
		}
		local v126
		if v_u_37() or (v_u_55 or not v_u_54) then
			v126 = nil
		else
			v126 = v_u_8.createElement(v_u_24, {
				["Position"] = UDim2.fromScale(0.5, 0.1)
			})
		end
		v125.MenuNavigationToggleDialog = v126
		return v_u_8.createElement("TextButton", {
			["Visible"] = v123,
			["Text"] = "",
			["BackgroundTransparency"] = v115.Overlay.Transparency,
			["BackgroundColor3"] = v115.Overlay.Color,
			["Size"] = UDim2.fromScale(1, 1),
			["BorderSizePixel"] = 0,
			["ZIndex"] = 10,
			[v_u_8.Event.Activated] = p_u_113.overlayDismiss
		}, v125)
	end)
end
function v_u_52.didMount(p127) -- name: didMount
	-- upvalues: (copy) v_u_5, (copy) v_u_2
	if not v_u_5.VREnabled then
		v_u_2:BindCoreAction("TopBarGamepadToggleGamepadMenu", p127.toggleMenuVisibleAction, false, Enum.KeyCode.ButtonStart)
	end
end
function v_u_52.bindMenuOpenActions(p128) -- name: bindMenuOpenActions
	-- upvalues: (copy) v_u_2
	p128.boundMenuOpenActions = true
	v_u_2:BindCoreAction("TopBarGamepadFreezeController", function() end, false, Enum.UserInputType.Gamepad1)
	v_u_2:BindCoreAction("TopBarGamepadCloseMenu", p128.closeMenuAction, false, Enum.KeyCode.ButtonB)
	v_u_2:BindCoreAction("TopBarGamepadLeaveGame", p128.leaveGameMenuAction, false, Enum.KeyCode.ButtonX)
	v_u_2:BindCoreAction("TopBarGamepadRespawnAction", p128.respawnMenuAction, false, Enum.KeyCode.ButtonY)
	v_u_2:BindCoreAction("TopBarGamepadActivateSelection", p128.activateSelectionAction, false, Enum.KeyCode.ButtonA)
	v_u_2:BindCoreAction("TopBarGamepadMoveSelection", p128.moveSelectionAction, false, Enum.KeyCode.Thumbstick1, Enum.KeyCode.DPadUp, Enum.KeyCode.DPadDown)
	v_u_2:BindCoreAction("TopBarGamepadMoveSelectionTop", p128.goToTopAction, false, Enum.KeyCode.ButtonL2)
	v_u_2:BindCoreAction("TopBarGamepadMoveSelectionBottom", p128.goToBottomAction, false, Enum.KeyCode.ButtonR2)
	v_u_2:BindCoreAction("TopBarGamepadToggleChatVisibility", p128.toggleChatVisibilityAction, false, Enum.KeyCode.ButtonR1)
	v_u_2:BindCoreAction("TopBarGamepadToggleGamepadMenu", p128.toggleMenuVisibleAction, false, Enum.KeyCode.ButtonStart)
end
function v_u_52.unbindMenuOpenActions(p129) -- name: unbindMenuOpenActions
	-- upvalues: (copy) v_u_2
	p129.boundMenuOpenActions = false
	v_u_2:UnbindCoreAction("TopBarGamepadFreezeController")
	v_u_2:UnbindCoreAction("TopBarGamepadCloseMenu")
	v_u_2:UnbindCoreAction("TopBarGamepadActivateSelection")
	v_u_2:UnbindCoreAction("TopBarGamepadLeaveGame")
	v_u_2:UnbindCoreAction("TopBarGamepadRespawnAction")
	v_u_2:UnbindCoreAction("TopBarGamepadMoveSelection")
	v_u_2:UnbindCoreAction("TopBarGamepadMoveSelectionTop")
	v_u_2:UnbindCoreAction("TopBarGamepadMoveSelectionBottom")
	v_u_2:UnbindCoreAction("TopBarGamepadToggleChatVisibility")
end
function v_u_52.unbindAllActions(p130) -- name: unbindAllActions
	-- upvalues: (copy) v_u_2
	if p130.boundMenuOpenActions then
		p130:unbindMenuOpenActions()
	end
	v_u_2:UnbindCoreAction("TopBarGamepadToggleGamepadMenu")
end
function v_u_52.didUpdate(p131, p132, _) -- name: didUpdate
	-- upvalues: (copy) v_u_4, (copy) v_u_37, (copy) v_u_52
	local v133 = p132.isGamepadMenuOpen ~= p131.props.isGamepadMenuOpen
	local v134 = p131.props.isGamepadMenuOpen
	if v133 then
		if v134 then
			p131:bindMenuOpenActions()
			if p131.state.selectedIndex ~= 1 then
				p131:setState({
					["selectedIndex"] = 1
				})
			end
			p131.savedSelectedCoreObject = v_u_4.SelectedCoreObject
			v_u_4.SelectedCoreObject = nil
			p131.savedSelectedObject = v_u_4.SelectedObject
			v_u_4.SelectedObject = nil
			v_u_4:SetMenuIsOpen(true, "GamepadMenu")
			if v_u_37() then
				v_u_52.closeUnibarMenu()
				return
			end
		else
			p131:unbindMenuOpenActions()
			v_u_4:SetMenuIsOpen(false, "GamepadMenu")
		end
	end
end
function v_u_52.willUnmount(p135) -- name: willUnmount
	-- upvalues: (copy) v_u_38
	p135:unbindAllActions()
	if v_u_38 then
		p135.disposeScreenSize()
	end
end
function v_u_52.logExperienceMenuGamepadExposure(p136) -- name: logExperienceMenuGamepadExposure
	-- upvalues: (copy) v_u_56, (copy) v_u_13, (copy) v_u_14
	if v_u_56 and not p136.loggedExperienceMenuGamepadExposure then
		v_u_13:LogFlagLinkedUserLayerExposure(v_u_14.ExperienceMenuGamepadExposureLayer)
		p136.loggedExperienceMenuGamepadExposure = true
	end
end
return v9.UNSTABLE_connect2(function(p137) -- name: mapStateToProps
	-- upvalues: (copy) v_u_38, (copy) v_u_5, (copy) v_u_57
	local v138 = p137.displayOptions.topbarEnabled
	local v139 = {}
	local v140
	if v_u_38 then
		v140 = nil
	else
		v140 = p137.displayOptions.screenSize
	end
	v139.screenSize = v140
	local v141 = p137.coreGuiEnabled[Enum.CoreGuiType.Chat]
	if v141 then
		if v138 then
			v141 = not v_u_5.VREnabled
		else
			v141 = v138
		end
	end
	v139.chatEnabled = v141
	v139.leaderboardEnabled = p137.coreGuiEnabled[Enum.CoreGuiType.PlayerList] and v138
	local v142 = p137.moreMenu.emotesEnabled
	if v142 then
		v142 = p137.coreGuiEnabled[Enum.CoreGuiType.EmotesMenu]
		if v142 then
			v142 = v138
		end
	end
	v139.emotesEnabled = v142
	local v143
	if v_u_57 then
		v143 = nil
	else
		v143 = p137.coreGuiEnabled[Enum.CoreGuiType.Backpack] and v138
	end
	v139.backpackEnabled = v143
	v139.respawnEnabled = p137.respawn.enabled
	if not v_u_57 then
		v138 = nil
	end
	v139.topBarEnabled = v138
	v139.leaderboardOpen = p137.moreMenu.leaderboardOpen
	v139.backpackOpen = p137.moreMenu.backpackOpen
	v139.emotesOpen = p137.moreMenu.emotesOpen
	v139.menuOpen = p137.displayOptions.menuOpen
	v139.isGamepadMenuOpen = p137.displayOptions.isGamepadMenuOpen
	return v139
end, function(p_u_144) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_44
	return {
		["setGamepadMenuOpen"] = function(p145) -- name: setGamepadMenuOpen
			-- upvalues: (copy) p_u_144, (ref) v_u_44
			return p_u_144(v_u_44(p145))
		end
	}
end)(v_u_52)