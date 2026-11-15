-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Shortcuts.ConfigureShortcuts
local v_u_1 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("GamepadService")
local v_u_4 = UserSettings().GameSettings
local v5 = script:FindFirstAncestor("Chrome")
local v6 = script:FindFirstAncestor("ChromeShared")
local v_u_7 = require(v6.Utility.FocusSelectExpChat)
local v_u_8 = require(v6.Service)
local v_u_9 = game:GetService("GuiService")
local v_u_10 = require(v6.Unibar.Constants)
local v_u_11 = require(v5.Integrations.RespawnUtils)
local v_u_12 = require(v2.Workspace.Packages.Chrome).FocusUtils
local v_u_13 = require(v2.Workspace.Packages.ExpChat).Stores.GetFocusNavigationStore(false)
local v14 = require(v2.Workspace.Packages.SharedFlags)
local v_u_15 = v14.FFlagEnableConsoleExpControls
local v_u_16 = v14.FFlagChromeShortcutAddRespawnLeaveToIEM
local v_u_17 = v14.FFlagChromeShortcutRemoveLeaveOnRespawnPage
local v_u_18 = v14.FFlagChromeShortcutRemoveRespawnOnLeavePage
local v_u_19 = v14.FFlagConsoleChatUseChromeFocusUtils
local v_u_20 = v14.FFlagChromeShortcutChatOpenKeyboard
local v_u_21 = v14.FFlagAddSwitchTabHintsToIEM
local v_u_22 = require(v2.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local v_u_23 = v14.FFlagSideSheetFocusNav
local v24 = v5.Flags
local v_u_25 = require(v24.FFlagRespawnChromeShortcutTelemetry)
local v_u_26 = require(v24.FFlagLeaveActionChromeShortcutTelemetry)
local v_u_27 = require(v24.FFlagLeaveChromeShortcutTelemetry)
local v_u_28 = require(v24.FFlagRespawnActionChromeShortcutTelemetry)
local v29 = require(v6.Flags)
local v_u_30 = v29.FFlagRemoveLeaveShortcutFromLeaveConfirm
local v_u_31 = v29.FFlagRemoveRespawnShortcutFromRespawnConfirmation
local v_u_32
if v_u_15 then
	v_u_32 = require(v_u_1.Modules.ChatSelector)
else
	v_u_32 = nil
end
local v_u_33 = require(v_u_1.Modules.Settings.leaveGame)
local v34 = require(v2.Workspace.Packages.InExperienceSideSheet)
local v_u_35 = v34.getSideSheetVisibility
local v_u_36 = v34.toggleSideSheet
local v_u_37 = v14.FFlagShowUnibarOnVirtualCursor
local v_u_40 = {
	["keyCode"] = Enum.KeyCode.ButtonX,
	["activated"] = function() -- name: activated
		-- upvalues: (copy) v_u_1, (copy) v_u_26, (copy) v_u_33, (copy) v_u_27, (copy) v_u_19, (copy) v_u_13, (copy) v_u_25
		local v38 = require(v_u_1.Modules.Settings.SettingsHub)
		local v39 = v38.Instance.LeaveGamePage
		if v38:GetVisibility() then
			if v38.Instance.Pages.CurrentPage == v39 then
				if v_u_26 then
					v_u_33(true, {
						["telemetryFields"] = {
							["used_shortcut"] = true
						}
					})
				else
					v_u_33(true)
				end
			elseif v_u_27 then
				v38.Instance:SwitchToPage(v39, true, nil, nil, nil, {
					["used_shortcut"] = true
				})
			else
				v38:SwitchToPage(v39, true)
			end
		else
			if v_u_19 and v_u_13.getChatInputBarFocused(false) then
				v_u_13.unfocusChatInputBar()
			end
			if v_u_25 then
				v38:SetVisibility(true)
				v38.Instance:SwitchToPage(v39, true, nil, nil, nil, {
					["used_shortcut"] = true
				})
			else
				v38:SetVisibility(true, false, v39)
			end
		end
	end
}
local v_u_42 = {
	["keyCode"] = nil,
	["integration"] = "respawn",
	["activated"] = nil,
	["keyCode"] = Enum.KeyCode.ButtonY,
	["activated"] = function() -- name: activated
		-- upvalues: (copy) v_u_1, (copy) v_u_28, (copy) v_u_19, (copy) v_u_13, (copy) v_u_25, (copy) v_u_11, (copy) v_u_8
		local v41 = require(v_u_1.Modules.Settings.SettingsHub)
		if v41:GetVisibility() and v41.Instance.Pages.CurrentPage == v41.Instance.ResetCharacterPage then
			if v_u_28 then
				v41.Instance.ResetCharacterPage.ResetFunction({
					["resetTelemetryFields"] = {
						["used_shortcut"] = true
					}
				})
			else
				v41.Instance.ResetCharacterPage.ResetFunction()
			end
		else
			if v_u_19 and v_u_13.getChatInputBarFocused(false) then
				v_u_13.unfocusChatInputBar()
			end
			if v_u_25 then
				v_u_11.respawnPage({
					["usedShortcut"] = true
				})
			else
				v_u_8:activate("respawn")
			end
		end
	end
}
local function v_u_47() -- name: activateBack
	-- upvalues: (copy) v_u_15, (copy) v_u_12, (copy) v_u_19, (copy) v_u_8, (copy) v_u_1, (copy) v_u_9, (copy) v_u_13
	local v43 = v_u_15
	if v43 then
		v43 = v_u_12.MenuIconSelectedSignal:get()
	end
	local v44 = not v_u_19 or v_u_8:inFocusNav():get()
	local v45 = require(v_u_1.Modules.Settings.SettingsHub)
	if v45:GetVisibility() then
		v45.Instance:PopMenu(false, true)
		if not v45:GetVisibility() then
			v_u_8:selectMenuIcon()
		end
		return Enum.ContextActionResult.Sink
	end
	if v44 or v43 then
		local v46 = v_u_8:currentSubMenu():get()
		if v46 then
			v_u_8:toggleSubMenu(v46)
			v_u_8:setSelected(v46)
		else
			v_u_8:disableFocusNav()
			v_u_8:setShortcutBar(nil)
			v_u_9.SelectedCoreObject = nil
			if v_u_15 then
				v_u_12.MenuIconSelectedSignal:set(false)
			end
		end
		return Enum.ContextActionResult.Sink
	end
	if v_u_19 and v_u_13.getChatInputBarFocused(false) then
		v_u_12.FocusOnChrome(function()
			-- upvalues: (ref) v_u_13
			v_u_13.unfocusChatInputBar()
		end, "chat")
		return Enum.ContextActionResult.Sink
	end
end
function registerShortcuts() -- name: registerShortcuts
	-- upvalues: (copy) v_u_8, (copy) v_u_40, (copy) v_u_42, (copy) v_u_16, (copy) v_u_20, (copy) v_u_15, (copy) v_u_32, (copy) v_u_19, (copy) v_u_13, (copy) v_u_12, (copy) v_u_4, (copy) v_u_7, (copy) v_u_1, (copy) v_u_22, (copy) v_u_23, (copy) v_u_35, (copy) v_u_36, (copy) v_u_47, (copy) v_u_30, (copy) v_u_31, (copy) v_u_9, (copy) v_u_3
	v_u_8:registerShortcut({
		["id"] = "leave",
		["label"] = "CoreScripts.TopBar.Leave",
		["keyCode"] = nil,
		["integration"] = nil,
		["actionName"] = "UnibarGamepadLeaveGame",
		["activated"] = nil,
		["keyCode"] = v_u_40.keyCode,
		["activated"] = v_u_40.activated
	})
	v_u_8:registerShortcut({
		["id"] = "respawn",
		["label"] = "CoreScripts.InGameMenu.QuickActions.Respawn",
		["keyCode"] = nil,
		["integration"] = nil,
		["actionName"] = "UnibarGamepadRespawn",
		["activated"] = nil,
		["keyCode"] = v_u_42.keyCode,
		["integration"] = v_u_42.integration,
		["activated"] = v_u_42.activated
	})
	if v_u_16 then
		v_u_8:registerShortcut({
			["id"] = "leave_in_experience_menu",
			["label"] = nil,
			["keyCode"] = nil,
			["integration"] = nil,
			["actionName"] = "IEMGamepadLeaveGame",
			["activated"] = nil,
			["keyCode"] = v_u_40.keyCode,
			["activated"] = v_u_40.activated
		})
		v_u_8:registerShortcut({
			["id"] = "respawn_in_experience_menu",
			["label"] = nil,
			["keyCode"] = nil,
			["integration"] = nil,
			["actionName"] = "IEMGamepadRespawn",
			["activated"] = nil,
			["keyCode"] = v_u_42.keyCode,
			["integration"] = v_u_42.integration,
			["activated"] = v_u_42.activated
		})
	end
	local v48 = v_u_8
	local v49 = {
		["id"] = "chat",
		["label"] = "CoreScripts.TopBar.Chat",
		["keyCode"] = nil,
		["integration"] = "chat",
		["actionName"] = "UnibarGamepadChat",
		["activated"] = nil
	}
	local v50
	if v_u_20 then
		v50 = Enum.KeyCode.ButtonL2
	else
		v50 = Enum.KeyCode.ButtonR1
	end
	v49.keyCode = v50
	v49.activated = v_u_15 and function()
		-- upvalues: (ref) v_u_32, (ref) v_u_20, (ref) v_u_19, (ref) v_u_13, (ref) v_u_12, (ref) v_u_4, (ref) v_u_7
		local v51 = v_u_32:GetVisibility()
		if v_u_20 then
			if v_u_19 and v_u_13.getChatInputBarFocused(false) then
				v_u_12.FocusOnChrome(function()
					-- upvalues: (ref) v_u_13
					v_u_13.unfocusChatInputBar()
				end, "chat")
				v_u_32:SetVisible(false)
				v_u_4.ChatVisible = false
			else
				v_u_32:SetVisible(true)
				v_u_4.ChatVisible = true
				v_u_32:FocusChatBar()
				v_u_7("chat")
			end
		else
			v_u_32:SetVisible(not v51)
			if v51 then
				if v_u_19 and v_u_13.getChatInputBarFocused(false) then
					v_u_12.FocusOnChrome(function()
						-- upvalues: (ref) v_u_13
						v_u_13.unfocusChatInputBar()
					end, "chat")
				end
			else
				v_u_7("chat")
			end
		end
	end or nil
	v48:registerShortcut(v49)
	v_u_8:registerShortcut({
		["id"] = "tiltMenu",
		["label"] = "CoreScripts.TopBar.Menu",
		["keyCode"] = nil,
		["integration"] = nil,
		["actionName"] = "UnibarGamepadMenu",
		["activated"] = nil,
		["keyCode"] = Enum.KeyCode.ButtonR2,
		["activated"] = function() -- name: activated
			-- upvalues: (ref) v_u_1, (ref) v_u_19, (ref) v_u_13, (ref) v_u_22, (ref) v_u_23, (ref) v_u_35, (ref) v_u_36
			local v52 = require(v_u_1.Modules.Settings.SettingsHub)
			if v52:GetVisibility() then
				v52:SetVisibility(false)
			else
				if v_u_19 and v_u_13.getChatInputBarFocused(false) then
					v_u_13.unfocusChatInputBar()
				end
				if v_u_22 and v_u_23 then
					if not v_u_35() then
						v_u_36(true)
						return
					end
				else
					v52:SetVisibility(true)
				end
			end
		end
	})
	v_u_8:registerShortcut({
		["id"] = "back",
		["label"] = "CoreScripts.TopBar.Back",
		["keyCode"] = nil,
		["displayPriority"] = nil,
		["integration"] = nil,
		["actionName"] = "UnibarGamepadBack",
		["activated"] = nil,
		["keyCode"] = Enum.KeyCode.ButtonB,
		["displayPriority"] = v_u_15 and -10 or nil,
		["activated"] = v_u_47
	})
	if v_u_30 or v_u_31 then
		v_u_8:registerShortcut({
			["id"] = "back-invisible",
			["label"] = nil,
			["keyCode"] = nil,
			["actionName"] = "UnibarGamepadBackInvisible",
			["activated"] = nil,
			["keyCode"] = Enum.KeyCode.ButtonB,
			["activated"] = v_u_47
		})
	end
	v_u_8:registerShortcut({
		["id"] = "close",
		["label"] = nil,
		["keyCode"] = nil,
		["actionName"] = "UnibarGamepadClose",
		["activated"] = nil,
		["keyCode"] = Enum.KeyCode.ButtonStart,
		["activated"] = function() -- name: activated
			-- upvalues: (ref) v_u_1, (ref) v_u_8, (ref) v_u_9
			require(v_u_1.Modules.Settings.SettingsHub):SetVisibility(false)
			v_u_8:disableFocusNav()
			v_u_8:setShortcutBar(nil)
			v_u_9.SelectedCoreObject = nil
		end
	})
	v_u_8:registerShortcut({
		["id"] = "virtualCursor",
		["label"] = nil,
		["keyCode"] = nil,
		["actionName"] = "VirtualCursorShortcut",
		["activated"] = nil,
		["keyCode"] = Enum.KeyCode.ButtonSelect,
		["activated"] = function() -- name: activated
			-- upvalues: (ref) v_u_8, (ref) v_u_9, (ref) v_u_3
			v_u_8:disableFocusNav()
			v_u_8:setShortcutBar(nil)
			v_u_9.SelectedCoreObject = nil
			v_u_3.GamepadCursorEnabled = true
		end
	})
	v_u_8:registerShortcut({
		["id"] = "tiltMenuPreviousTab",
		["label"] = "CoreScripts.InGameMenu.Controls.PreviousTab",
		["keyCode"] = nil,
		["integration"] = nil,
		["actionName"] = nil,
		["activated"] = nil,
		["keyCode"] = Enum.KeyCode.ButtonL1
	})
	v_u_8:registerShortcut({
		["id"] = "tiltMenuNextTab",
		["label"] = "CoreScripts.InGameMenu.Controls.NextTab",
		["keyCode"] = nil,
		["integration"] = nil,
		["actionName"] = nil,
		["activated"] = nil,
		["keyCode"] = Enum.KeyCode.ButtonR1
	})
end
function configureShortcutBars() -- name: configureShortcutBars
	-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_37, (copy) v_u_21, (copy) v_u_16, (copy) v_u_18, (copy) v_u_17, (copy) v_u_30, (copy) v_u_31
	v_u_8:configureShortcutBar(v_u_10.UNIBAR_SHORTCUTBAR_ID, v_u_37 and {
		"leave",
		"respawn",
		"chat",
		"tiltMenu",
		"back",
		"virtualCursor"
	} or {
		"leave",
		"respawn",
		"chat",
		"tiltMenu",
		"back"
	})
	v_u_8:configureShortcutBar(v_u_10.TILTMENU_SHORTCUTBAR_ID, v_u_21 and {
		"leave_in_experience_menu",
		"respawn_in_experience_menu",
		"back-invisible",
		"close"
	} or (v_u_16 and {
		"leave_in_experience_menu",
		"respawn_in_experience_menu",
		"tiltMenuPreviousTab",
		"tiltMenuNextTab",
		"back",
		"close"
	} or {
		"tiltMenuPreviousTab",
		"tiltMenuNextTab",
		"back",
		"close"
	}))
	if not (v_u_18 and v_u_17) then
		v_u_8:configureShortcutBar(v_u_10.TILTMENU_DIALOG_SHORTCUTBAR_ID, {
			"leave",
			"respawn",
			"back",
			"close"
		})
	end
	if v_u_30 then
		v_u_8:configureShortcutBar(v_u_10.TILTMENU_LEAVE_DIALOG_SHORTCUTBAR_ID, { "back-invisible", "close" })
	elseif v_u_18 then
		v_u_8:configureShortcutBar(v_u_10.TILTMENU_LEAVE_DIALOG_SHORTCUTBAR_ID, { "leave", "back", "close" })
	end
	if v_u_31 then
		v_u_8:configureShortcutBar(v_u_10.TILTMENU_RESPAWN_DIALOG_SHORTCUTBAR_ID, { "back-invisible", "close" })
	elseif v_u_17 then
		v_u_8:configureShortcutBar(v_u_10.TILTMENU_RESPAWN_DIALOG_SHORTCUTBAR_ID, { "respawn", "back", "close" })
	end
end
return function()
	registerShortcuts()
	configureShortcutBars()
end