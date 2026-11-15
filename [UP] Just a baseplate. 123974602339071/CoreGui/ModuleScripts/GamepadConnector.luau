-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.GamepadConnector
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("ContextActionService")
local v_u_3 = game:GetService("CoreGui")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = game:GetService("UserInputService")
local v_u_6 = game:GetService("GamepadService")
local v7 = require(v1.Workspace.Packages.AppCommonLib)
local v_u_8 = require(v1.Workspace.Packages.Responsive)
local v_u_9 = v_u_8.GetInputModeStore(false)
local v_u_10 = require(v1.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local v_u_11 = require(v1.Workspace.Packages.ExperimentLayers).AppUserLayers
local v12 = require(v1.Workspace.Packages.PlayerList)
local v_u_13 = require(v1.Packages.Signals)
local v14 = require(v1.Workspace.Packages.SharedFlags)
local v_u_15 = v14.FFlagEnableConsoleExpControls
local v_u_16 = v14.FFlagShowUnibarOnVirtualCursor
local v_u_17 = v14.FFlagConsoleChatUseChromeFocusUtils
local v_u_18 = v14.FFlagExperienceMenuGamepadExposureEnabled
local v_u_19 = game:GetEngineFeature("PTFBackButtonAlwaysAsButtonB")
local v_u_20 = v12.Flags.FFlagAddNewPlayerListFocusNav
local v_u_21 = v12.Flags.FFlagAddNewPlayerListMobileFocusNav
local v22 = script.Parent.Parent.Parent
local v23 = v22.TopBar
local v_u_24 = require(v23.Flags.FFlagAddTopBarScrim)
local v_u_25 = require(v23.Flags.FFlagUseObservableDefaultForChromeFocused)
local v_u_26 = v7.isSpatial
local v_u_27 = require(v23:WaitForChild("Telemetry")).LogGamepadOpenExperienceControlsMenu
local v28 = v22.Chrome
local v_u_29 = require(v1.Workspace.Packages.Chrome).Enabled()
local v_u_30
if v_u_29 then
	v_u_30 = require(v28.Service)
else
	v_u_30 = nil
end
local v31 = require(v28.ChromeShared.Service.ChromeUtils)
local v_u_32 = require(v1.Workspace.Packages.Chrome).FocusUtils
local v_u_33
if v_u_25 or v_u_29 and v_u_15 then
	v_u_33 = v31.ObservableValue
else
	v_u_33 = nil
end
local v_u_34
if v_u_29 then
	v_u_34 = require(v28.ChromeShared.Unibar.Constants)
else
	v_u_34 = nil
end
local v_u_35 = require(v1.Workspace.Packages.ToastNotification).ToastNotificationConstants
local v_u_36 = require(script.Parent.Parent.Constants)
local v_u_37 = require(v1.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local v38 = v22.PlayerList
local v_u_39 = require(v38.PlayerListManager)
local v_u_40 = v_u_32.MenuIconSelectedSignal
local v41 = require(v1.Workspace.Packages.CoreGuiCommon)
local v_u_42 = v41.Flags.FFlagEnableUISelector
local v_u_43
if v_u_42 then
	v_u_43 = v41.Stores.GetUiSelectorSignalStore
else
	v_u_43 = nil
end
local v_u_44 = require(v1.Workspace.Packages.ExpChat).Stores.GetFocusNavigationStore(false)
local v_u_45 = require(v1.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local v_u_46 = v14.FFlagSideSheetFocusNav
local v_u_47 = require(v1.Workspace.Packages.InExperienceSideSheet).getSideSheetVisibility
local v_u_48 = nil
local v_u_49 = nil
local v_u_50 = nil
task.spawn(function()
	-- upvalues: (ref) v_u_48, (copy) v_u_3, (ref) v_u_49, (ref) v_u_50
	v_u_48 = v_u_3:WaitForChild("ToastNotification", 3)
	local v51
	if v_u_48 == nil then
		v51 = nil
	else
		v51 = v_u_48:WaitForChild("ToastNotificationWrapper", 3)
	end
	v_u_49 = v51
	local v52
	if v_u_49 == nil then
		v52 = nil
	else
		v52 = v_u_49:FindFirstChild("Toast", true)
	end
	v_u_50 = v52
end)
local v_u_53 = {}
v_u_53.__index = v_u_53
function v_u_53.new() -- name: new
	-- upvalues: (copy) v_u_4, (copy) v_u_30, (copy) v_u_25, (copy) v_u_33, (copy) v_u_29, (copy) v_u_15, (copy) v_u_5, (copy) v_u_36, (copy) v_u_20, (copy) v_u_37, (copy) v_u_39, (copy) v_u_21, (copy) v_u_26, (copy) v_u_42, (copy) v_u_43, (copy) v_u_16, (copy) v_u_6, (copy) v_u_40, (copy) v_u_24, (copy) v_u_13, (copy) v_u_53
	local v_u_54 = {
		["_loggedExperienceMenuGamepadExposure"] = false,
		["_devSetCoreGuiNavEnabled"] = v_u_4.CoreGuiNavigationEnabled
	}
	local v55
	if v_u_30 then
		v55 = v_u_30:inFocusNav()
	elseif v_u_25 then
		v55 = v_u_33.new(false)
	else
		v55 = false
	end
	v_u_54._chromeFocused = v55
	v_u_54._lastMenuButtonPress = 0
	v_u_54._dismissFocusConnections = {}
	local v_u_56
	if v_u_29 and v_u_15 then
		v_u_56 = v_u_33.new(v_u_4.SelectedCoreObject)
		v_u_4:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
			-- upvalues: (copy) v_u_56, (ref) v_u_4
			v_u_56:set(v_u_4.SelectedCoreObject)
		end)
	else
		v_u_56 = nil
	end
	v_u_54._selectedCoreObject = v_u_56
	v_u_54._connections = {}
	if v_u_29 and v_u_15 then
		local v57 = v_u_33.new
		local v58 = v_u_5:GetLastInputType()
		for _, v59 in v_u_36.GamepadInputTypes do
			if v58 ~= v59 then
				continue
			end
			v60 = true
		end
		local v60 = false
		v_u_54._gamepadActive = v57(v60)
		v_u_54._tiltMenuOpen = v_u_33.new(false)
		local v61
		if v_u_20 then
			v61 = v_u_33.new(false)
		else
			v61 = nil
		end
		v_u_54._playerListModalOpen = v61
		v_u_54._showTopBar = v_u_33.new(true)
		v_u_5.LastInputTypeChanged:Connect(function(p62)
			-- upvalues: (copy) v_u_54, (ref) v_u_36
			local v63 = v_u_54._gamepadActive
			for _, v64 in v_u_36.GamepadInputTypes do
				if p62 ~= v64 then
					continue
				end
				v65 = true
			end
			local v65 = false
			v63:set(v65)
		end)
		v_u_37:connect(function(p66)
			-- upvalues: (copy) v_u_54
			v_u_54._tiltMenuOpen:set(p66)
		end)
		if v_u_20 then
			v_u_39:GetVisibilityChangedEvent().Event:Connect(function()
				-- upvalues: (ref) v_u_21, (ref) v_u_39, (copy) v_u_54
				local v67 = not v_u_21 and true or v_u_39:GetIsModal()
				local v68 = v_u_54._playerListModalOpen
				if v67 then
					v67 = v_u_39:GetVisibility()
				end
				v68:set(v67)
			end)
		end
		if not v_u_26() then
			local function v70()
				-- upvalues: (copy) v_u_54, (ref) v_u_42, (ref) v_u_43, (ref) v_u_5, (ref) v_u_20, (ref) v_u_16, (ref) v_u_6, (ref) v_u_4
				local v69 = not v_u_54._gamepadActive:get() or v_u_54._chromeFocused:get() or v_u_54._selectedCoreObject:get() ~= nil and not (v_u_42 and v_u_43(false).getVisibility()) or (v_u_5.TouchEnabled or (v_u_54._tiltMenuOpen:get() or v_u_20 and v_u_54._playerListModalOpen:get()) or (v_u_16 and v_u_6.GamepadCursorEnabled or v_u_6.GamepadCursorEnabled))
				v_u_54._showTopBar:set(v69)
				if v69 then
					v_u_4.CoreGuiNavigationEnabled = true
				else
					v_u_4.CoreGuiNavigationEnabled = v_u_54._devSetCoreGuiNavEnabled
				end
			end
			v_u_54._selectedCoreObject:connect(v70)
			v_u_54._chromeFocused:connect(v70)
			v_u_54._tiltMenuOpen:connect(v70)
			v_u_6:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(v70)
			v_u_54._gamepadActive:connect(v70, true)
		end
	end
	if v_u_15 then
		v_u_4:GetPropertyChangedSignal("CoreGuiNavigationEnabled"):Connect(function()
			-- upvalues: (copy) v_u_54, (ref) v_u_4
			v_u_54._devSetCoreGuiNavEnabled = v_u_4.CoreGuiNavigationEnabled
		end)
	end
	function v_u_54._isTopBarFocused()
		-- upvalues: (ref) v_u_6, (copy) v_u_54, (ref) v_u_40
		if v_u_6.GamepadCursorEnabled then
			return false
		else
			return v_u_54._chromeFocused:get() or v_u_40:get()
		end
	end
	if v_u_24 then
		local v71 = v_u_54._isTopBarFocused()
		local v72, v73 = v_u_13.createSignal(v71)
		v_u_54._topBarFocused = v72
		v_u_54._setTopBarFocused = v73
	end
	local v74 = v_u_53
	return setmetatable(v_u_54, v74)
end
function v_u_53.connectToTopbar(p_u_75) -- name: connectToTopbar
	-- upvalues: (copy) v_u_29, (copy) v_u_15, (copy) v_u_2, (copy) v_u_19, (copy) v_u_4, (copy) v_u_24, (copy) v_u_30, (copy) v_u_34, (copy) v_u_40
	if v_u_29 then
		if v_u_15 then
			p_u_75:disconnectFromTopbar()
		end
		v_u_2:BindCoreAction("FocusGamepadToTopbar", p_u_75:_bindSelf(p_u_75._toggleTopbar), false, Enum.KeyCode.ButtonStart)
		if v_u_19 then
			v_u_2:BindCoreAction("ToggleUISelector", p_u_75:_bindSelf(p_u_75._toggleUiSelector), false, Enum.KeyCode.ButtonB)
		end
		local function v77()
			-- upvalues: (copy) p_u_75, (ref) v_u_4, (ref) v_u_24, (ref) v_u_30, (ref) v_u_34
			local v76 = p_u_75:_isTopBarFocused()
			v_u_4:SetMenuIsOpen(v76, "TopbarMenu")
			if v_u_24 then
				p_u_75._setTopBarFocused(v76)
			end
			if v76 then
				v_u_30:setShortcutBar(v_u_34.UNIBAR_SHORTCUTBAR_ID)
				p_u_75:_addDismissFocusConnections()
			else
				p_u_75:_removeDismissFocusConnections()
			end
		end
		local v78 = p_u_75._connections
		local v79 = p_u_75._chromeFocused
		table.insert(v78, v79:connect(v77))
		local v80 = p_u_75._connections
		local v81 = v_u_40
		table.insert(v80, v81:connect(v77))
	end
end
function v_u_53.disconnectFromTopbar(p82) -- name: disconnectFromTopbar
	-- upvalues: (copy) v_u_2, (copy) v_u_19
	for _, v83 in p82._connections do
		v83:disconnect()
	end
	p82._connections = {}
	p82:_removeDismissFocusConnections()
	v_u_2:UnbindCoreAction("FocusGamepadToTopbar")
	if v_u_19 then
		v_u_2:UnbindCoreAction("ToggleUISelector")
	end
end
function v_u_53.getSelectedCoreObject(p84) -- name: getSelectedCoreObject
	return p84._selectedCoreObject
end
function v_u_53.getShowTopBar(p85) -- name: getShowTopBar
	return p85._showTopBar
end
function v_u_53.getGamepadActive(p86) -- name: getGamepadActive
	return p86._gamepadActive
end
function v_u_53.topBarFocused(p87, p88) -- name: topBarFocused
	-- upvalues: (copy) v_u_24
	if v_u_24 then
		return p87._topBarFocused(p88)
	end
end
function v_u_53._addDismissFocusConnections(p_u_89) -- name: _addDismissFocusConnections
	-- upvalues: (copy) v_u_5, (copy) v_u_9, (copy) v_u_8
	p_u_89._dismissFocusConnections = { (v_u_5.InputEnded:Connect(function(p90, p91)
			-- upvalues: (ref) v_u_9, (ref) v_u_8, (copy) p_u_89
			local v92 = v_u_9.getLastInputType(false)
			local v93
			if v92 == v_u_8.Input.Pointer then
				v93 = p90.UserInputType ~= Enum.UserInputType.Keyboard
			else
				v93 = false
			end
			if v93 or v92 == v_u_8.Input.Touch and not p91 then
				p_u_89:_unfocusGamepadFromTopBar()
			end
		end)) }
end
function v_u_53._removeDismissFocusConnections(p94) -- name: _removeDismissFocusConnections
	for _, v95 in p94._dismissFocusConnections do
		v95:Disconnect()
	end
	p94._dismissFocusConnections = {}
end
function v_u_53._toggleTopbar(p96, p97, p98, p99) -- name: _toggleTopbar
	-- upvalues: (copy) v_u_29, (copy) v_u_15, (copy) v_u_19, (copy) v_u_42, (copy) v_u_5, (copy) v_u_30, (copy) v_u_45, (copy) v_u_46, (copy) v_u_47, (copy) v_u_44, (copy) v_u_27, (copy) v_u_21, (copy) v_u_39
	if not v_u_29 or p96:_focusToastNotification(p98) or (v_u_15 or p98 ~= Enum.UserInputState.End) and (not v_u_15 or p98 ~= Enum.UserInputState.Begin) then
		return Enum.ContextActionResult.Pass
	end
	if not v_u_19 and (v_u_42 and not v_u_5:GamepadSupports(v_u_5:GetLastInputType(), Enum.KeyCode.ButtonSelect)) then
		return p96:_toggleUiSelector(p97, p98, p99)
	end
	if v_u_15 then
		if v_u_30:integrations().nine_dot == nil then
			return Enum.ContextActionResult.Pass
		end
		if v_u_45 and (v_u_46 and v_u_47()) then
			return Enum.ContextActionResult.Pass
		end
		local v100 = not (p96:_isTopBarFocused() or v_u_44.getChatInputBarFocused(false))
		if v100 then
			p96:_focusGamepadToTopBar()
		else
			p96:_unfocusGamepadFromTopBar()
		end
		p96:_logExperienceMenuGamepadExposure()
		v_u_27(v100)
	else
		p96:_toggleUnibarMenu()
	end
	if v_u_21 and (v_u_39:GetIsModal() and v_u_39:GetVisibility()) then
		v_u_39:SetVisibility(false)
	end
	return Enum.ContextActionResult.Sink
end
function v_u_53._toggleUiSelector(p101, _, p102, _) -- name: _toggleUiSelector
	-- upvalues: (copy) v_u_42, (copy) v_u_29, (copy) v_u_15, (copy) v_u_5, (copy) v_u_6, (copy) v_u_4, (copy) v_u_43
	if v_u_42 and (v_u_29 and not p101:_focusToastNotification(p102)) and (not v_u_15 and p102 == Enum.UserInputState.End or v_u_15 and p102 == Enum.UserInputState.Begin) and not v_u_5:GamepadSupports(v_u_5:GetLastInputType(), Enum.KeyCode.ButtonSelect) then
		if v_u_6.GamepadCursorEnabled or v_u_4.SelectedObject ~= nil then
			v_u_6:DisableGamepadCursor()
			v_u_4.SelectedObject = nil
			return Enum.ContextActionResult.Sink
		end
		local v103 = v_u_43(false)
		if v103.getVisibility(false) then
			v103.setVisibility(false)
			return Enum.ContextActionResult.Sink
		end
		if not p101:_isTopBarFocused() then
			v103.setVisibility(true)
			return Enum.ContextActionResult.Sink
		end
	end
	return Enum.ContextActionResult.Pass
end
function v_u_53._toggleUnibarMenu(p104) -- name: _toggleUnibarMenu
	-- upvalues: (copy) v_u_15, (copy) v_u_30, (copy) v_u_27
	local v105 = p104._chromeFocused:get()
	if v105 then
		if v_u_15 then
			p104:_unfocusGamepadFromTopBar()
		else
			v_u_30:disableFocusNav()
		end
	elseif v_u_15 then
		p104:_focusGamepadToTopBar()
	else
		v_u_30:enableFocusNav()
	end
	p104:_logExperienceMenuGamepadExposure()
	v_u_27(v105)
end
function v_u_53._focusGamepadToTopBar(_) -- name: _focusGamepadToTopBar
	-- upvalues: (copy) v_u_32
	v_u_32.FocusOnChrome()
end
function v_u_53._unfocusGamepadFromTopBar(_) -- name: _unfocusGamepadFromTopBar
	-- upvalues: (copy) v_u_32, (copy) v_u_17, (copy) v_u_44, (copy) v_u_4
	v_u_32.FocusOffChrome(function()
		-- upvalues: (ref) v_u_17, (ref) v_u_44, (ref) v_u_4
		if v_u_17 and v_u_44.getChatInputBarFocused(false) then
			v_u_44.unfocusChatInputBar()
		end
		v_u_4.SelectedCoreObject = nil
	end)
end
function v_u_53._focusToastNotification(p106, p107) -- name: _focusToastNotification
	-- upvalues: (ref) v_u_50, (copy) v_u_35
	local v108
	if v_u_50 == nil then
		v108 = false
	else
		v108 = v_u_50.Visible
	end
	if p107 == Enum.UserInputState.Begin then
		p106._lastMenuButtonPress = tick()
		return false
	else
		if p107 == Enum.UserInputState.End then
			if v108 then
				v108 = tick() - p106._lastMenuButtonPress < v_u_35.MenuButtonPressHoldTime
			end
		else
			v108 = false
		end
		return v108
	end
end
function v_u_53._logExperienceMenuGamepadExposure(p109) -- name: _logExperienceMenuGamepadExposure
	-- upvalues: (copy) v_u_18, (copy) v_u_10, (copy) v_u_11
	if v_u_18 and not p109._loggedExperienceMenuGamepadExposure then
		v_u_10:LogFlagLinkedUserLayerExposure(v_u_11.ExperienceMenuGamepadExposureLayer)
		p109._loggedExperienceMenuGamepadExposure = true
	end
end
function v_u_53._bindSelf(p_u_110, p_u_111) -- name: _bindSelf
	return function(...)
		-- upvalues: (copy) p_u_111, (copy) p_u_110
		return p_u_111(p_u_110, ...)
	end
end
if v_u_15 then
	return v_u_53.new()
else
	return v_u_53
end