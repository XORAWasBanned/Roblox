-- Path: CoreGui.RobloxGui.Modules.Settings.Components.MenuButtons.MenuButtons
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("ContextActionService")
local v_u_4 = game:GetService("UserInputService")
local v5 = v1:WaitForChild("RobloxGui")
local v_u_6 = require(v5.Modules.Settings.Utility)
local v_u_7 = require(v5.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local v_u_8 = require(v2.Packages.React)
local v9 = require(v2.Packages.Foundation)
require(v2.Packages.Signals)
local v10 = require(v2.Packages.SignalsReact)
local v11 = require(v2.Workspace.Packages.Responsive)
local v_u_12 = require(v2.Workspace.Packages.Localization).Hooks.useLocalization
local v_u_13 = require(script.Parent.MenuButton)
local v_u_14 = v10.useSignalState
local v_u_15 = v11.useLastInput
local v_u_16 = v9.View
local v_u_17 = require(v5.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant)
local v_u_18 = require(v5.Modules.Settings.Flags.FFlagAddTraversalHistoryReactMenuButtons)
local v_u_19 = require(v2.Workspace.Packages.SharedFlags).FFlagGamepadIconSupportCheck
local v_u_20 = game:DefineFastFlag("MenuButtonsDisconnectGamepadConnected", false)
local v_u_21 = game:DefineFastFlag("MenuButtonsUseGreyResumeButton", false)
local v_u_22 = require(v5.Modules.Settings.Flags.FFlagIEMFocusNavSupportNewButtons)
local function v_u_40(p23, p24, p25) -- name: createMenuButtons
	-- upvalues: (copy) v_u_8, (copy) v_u_16, (copy) v_u_22, (copy) v_u_13, (copy) v_u_19, (copy) v_u_18
	local v26 = {}
	for v27 = 1, #p23 do
		local v28 = "MenuButtonContainer" .. v27
		local v29 = v_u_8.createElement
		local v30 = v_u_16
		local v31 = {
			["tag"] = "fill row align-y-center",
			["LayoutOrder"] = nil,
			["SelectionGroup"] = nil,
			["LayoutOrder"] = v27,
			["SelectionGroup"] = v_u_22 and true or nil
		}
		local v32 = {}
		local v33 = v_u_8.createElement
		local v34 = v_u_13
		local v35 = {
			["text"] = nil,
			["lastInput"] = nil,
			["keyboardButtonImageHint"] = nil,
			["gamepadButton"] = nil,
			["gamepadButtonImageHint"] = nil,
			["onActivated"] = nil,
			["layoutOrder"] = 1,
			["isEmphasized"] = nil,
			["isSmall"] = nil,
			["isDisabled"] = nil,
			["addTraversalHistoryMenu"] = nil,
			["currentPageChangeSignal"] = nil,
			["buttonRef"] = nil,
			["text"] = p23[v27].text,
			["lastInput"] = p24,
			["keyboardButtonImageHint"] = p23[v27].hint.keyboardButtonImage
		}
		local v36
		if v_u_19 then
			v36 = p23[v27].hint.gamepadButton
		else
			v36 = nil
		end
		v35.gamepadButton = v36
		v35.gamepadButtonImageHint = p23[v27].hint.gamepadButtonImage
		v35.onActivated = p23[v27].onActivated
		v35.isEmphasized = p23[v27].isEmphasized
		v35.isSmall = p25
		v35.isDisabled = p23[v27].getIsDisabled()
		local v37
		if v_u_18 then
			v37 = p23[v27].addTraversalHistoryMenu
		else
			v37 = nil
		end
		v35.addTraversalHistoryMenu = v37
		local v38
		if v_u_18 then
			v38 = p23[v27].currentPageChangeSignal
		else
			v38 = nil
		end
		v35.currentPageChangeSignal = v38
		local v39
		if v_u_22 then
			v39 = p23[v27].buttonRef
		else
			v39 = nil
		end
		v35.buttonRef = v39
		v32.MenuButton = v33(v34, v35)
		v26[v28] = v29(v30, v31, v32)
	end
	return v26
end
return function(p_u_41) -- name: MenuButtons
	-- upvalues: (copy) v_u_8, (copy) v_u_6, (copy) v_u_14, (copy) v_u_22, (copy) v_u_12, (copy) v_u_7, (copy) v_u_15, (copy) v_u_18, (copy) v_u_21, (copy) v_u_17, (copy) v_u_3, (copy) v_u_4, (copy) v_u_20, (copy) v_u_16, (copy) v_u_40
	local v42, _ = v_u_8.useState(v_u_6:IsSmallTouchScreen())
	v_u_14(p_u_41.getCanRespawn)
	local v_u_43 = v_u_8.useRef(nil)
	local v_u_44 = v_u_8.useRef(nil)
	if v_u_22 then
		v_u_8.useEffect(function()
			-- upvalues: (copy) p_u_41, (copy) v_u_44
			if p_u_41.setResumeMenuButton then
				p_u_41.setResumeMenuButton(v_u_44.current)
			end
		end, { p_u_41.setResumeMenuButton })
	end
	local v_u_45, v_u_46 = v_u_8.useBinding("")
	local v_u_47, v_u_48 = v_u_8.useBinding("")
	local v_u_49, v_u_50 = v_u_8.useBinding("")
	local v_u_51 = v_u_12({
		["LeaveGame"] = v_u_7.LeaveGameLocalizedKey,
		["Respawn"] = v_u_7.RespawnLocalizedKey,
		["Resume"] = v_u_7.ResumeLocalizedKey
	})
	local v52 = v_u_15()
	local v_u_61 = v_u_8.useMemo(function()
		-- upvalues: (copy) v_u_51, (copy) v_u_45, (copy) v_u_46, (copy) p_u_41, (ref) v_u_7, (ref) v_u_18, (copy) v_u_43, (copy) v_u_47, (copy) v_u_48, (copy) v_u_49, (copy) v_u_50, (ref) v_u_21, (ref) v_u_17, (ref) v_u_22, (copy) v_u_44
		local v53 = {}
		local v54 = {
			["name"] = "LeaveGameButton",
			["text"] = nil,
			["hint"] = nil,
			["isEmphasized"] = false,
			["getIsDisabled"] = nil,
			["onActivated"] = nil,
			["hotkeys"] = nil,
			["hotkeyFunc"] = nil,
			["addTraversalHistoryMenu"] = nil,
			["currentPageChangeSignal"] = nil,
			["buttonRef"] = nil,
			["text"] = v_u_51.LeaveGame,
			["hint"] = {
				["keyboard"] = "L",
				["keyboardButtonImage"] = "icons/controls/keys/key_l",
				["gamepadButton"] = nil,
				["gamepadButtonImage"] = nil,
				["setGamepadButtonImage"] = nil,
				["gamepadButton"] = Enum.KeyCode.ButtonX,
				["gamepadButtonImage"] = v_u_45,
				["setGamepadButtonImage"] = v_u_46
			},
			["getIsDisabled"] = function() -- name: getIsDisabled
				return false
			end,
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (ref) p_u_41, (ref) v_u_7
				p_u_41.onLeaveGame(v_u_7.AnalyticsMenuButtonSource)
			end,
			["hotkeys"] = { Enum.KeyCode.L, Enum.KeyCode.ButtonX },
			["hotkeyFunc"] = function() -- name: hotkeyFunc
				-- upvalues: (ref) p_u_41, (ref) v_u_7
				p_u_41.onLeaveGame(v_u_7.AnalyticsMenuHotkeySource)
			end,
			["addTraversalHistoryMenu"] = v_u_18 and true or nil
		}
		local v55
		if v_u_18 then
			v55 = p_u_41.currentPageChangeSignal
		else
			v55 = nil
		end
		v54.currentPageChangeSignal = v55
		v54.buttonRef = v_u_43
		local v56 = {
			["name"] = "ResetButton",
			["text"] = nil,
			["hint"] = nil,
			["isEmphasized"] = false,
			["getIsDisabled"] = nil,
			["onActivated"] = nil,
			["hotkeys"] = nil,
			["hotkeyFunc"] = nil,
			["text"] = v_u_51.Respawn,
			["hint"] = {
				["keyboard"] = "R",
				["keyboardButtonImage"] = "icons/controls/keys/key_r",
				["gamepadButton"] = nil,
				["gamepadButtonImage"] = nil,
				["setGamepadButtonImage"] = nil,
				["gamepadButton"] = Enum.KeyCode.ButtonY,
				["gamepadButtonImage"] = v_u_47,
				["setGamepadButtonImage"] = v_u_48
			},
			["getIsDisabled"] = function() -- name: getIsDisabled
				-- upvalues: (ref) p_u_41
				return not p_u_41.getCanRespawn(false)
			end,
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (ref) p_u_41, (ref) v_u_7
				p_u_41.onRespawn(v_u_7.AnalyticsMenuButtonSource)
			end,
			["hotkeys"] = { Enum.KeyCode.R, Enum.KeyCode.ButtonY },
			["hotkeyFunc"] = function() -- name: hotkeyFunc
				-- upvalues: (ref) p_u_41, (ref) v_u_7
				p_u_41.onRespawn(v_u_7.AnalyticsMenuHotkeySource)
			end
		}
		local v57 = {
			["name"] = "ResumeButton",
			["text"] = nil,
			["hint"] = nil,
			["isEmphasized"] = nil,
			["getIsDisabled"] = nil,
			["onActivated"] = nil,
			["hotkeyFunc"] = nil,
			["hotkeys"] = nil,
			["buttonRef"] = nil,
			["text"] = v_u_51.Resume,
			["hint"] = {
				["keyboard"] = "ESC",
				["keyboardButtonImage"] = "icons/controls/keys/key_esc",
				["gamepadButton"] = nil,
				["gamepadButtonImage"] = nil,
				["setGamepadButtonImage"] = nil,
				["gamepadButton"] = Enum.KeyCode.ButtonStart,
				["gamepadButtonImage"] = v_u_49,
				["setGamepadButtonImage"] = v_u_50
			}
		}
		local v58
		if v_u_21 then
			v58 = false
		else
			local v59 = v_u_17 == 1
			v58 = not v59
		end
		v57.isEmphasized = v58
		function v57.getIsDisabled() -- name: getIsDisabled
			return false
		end
		function v57.onActivated() -- name: onActivated
			-- upvalues: (ref) p_u_41, (ref) v_u_7
			p_u_41.onResume(v_u_7.AnalyticsMenuButtonSource)
		end
		function v57.hotkeyFunc() -- name: hotkeyFunc
			-- upvalues: (ref) p_u_41, (ref) v_u_7
			p_u_41.onResume(v_u_7.AnalyticsMenuHotkeySource)
		end
		v57.hotkeys = { Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart }
		local v60
		if v_u_22 then
			v60 = v_u_44
		else
			v60 = nil
		end
		v57.buttonRef = v60
		__set_list(v53, 1, {v54, v56, v57})
		return v53
	end, {
		v_u_51,
		p_u_41.onLeaveGame,
		p_u_41.onRespawn,
		p_u_41.onResume,
		p_u_41.getCanRespawn
	})
	local v_u_68 = v_u_8.useCallback(function(p62)
		-- upvalues: (copy) p_u_41, (ref) v_u_3
		if p_u_41.getVisibility() then
			for v63 = 1, #p62 do
				if p62[v63].hotkeyFunc == nil then
					continue
				end
				local v64 = v_u_3
				local v65 = p62[v63].name
				local v66 = p62[v63].hotkeyFunc
				local v67 = p62[v63].hotkeys
				v64:BindCoreAction(v65, v66, false, unpack(v67))
			end
		end
	end, {})
	local v_u_71 = v_u_8.useCallback(function(p69)
		-- upvalues: (ref) v_u_3
		for v70 = 1, #p69 do
			v_u_3:UnbindCoreAction(p69[v70].name)
		end
	end, {})
	local v_u_83 = v_u_8.useCallback(function(p_u_72)
		-- upvalues: (copy) v_u_71, (ref) v_u_4, (copy) p_u_41, (copy) v_u_68
		for v73 = 1, #p_u_72 do
			local v74 = p_u_72[v73]
			local v_u_75 = p_u_72[v73].onActivated
			local v_u_76 = p_u_72[v73].getIsDisabled
			function v74.onActivated()
				-- upvalues: (copy) v_u_76, (ref) v_u_71, (copy) p_u_72, (copy) v_u_75
				if not v_u_76() then
					v_u_71(p_u_72)
					v_u_75()
				end
			end
			local v77 = p_u_72[v73]
			local v_u_78 = p_u_72[v73].hotkeyFunc
			local v_u_79 = p_u_72[v73].getIsDisabled
			function v77.hotkeyFunc(_, p80, _)
				-- upvalues: (copy) v_u_78, (copy) v_u_79, (ref) v_u_71, (copy) p_u_72
				if p80 == Enum.UserInputState.Begin then
					local v_u_81 = v_u_78
					local v_u_82 = v_u_79;
					(function()
						-- upvalues: (copy) v_u_82, (ref) v_u_71, (ref) p_u_72, (copy) v_u_81
						if not v_u_82() then
							v_u_71(p_u_72)
							v_u_81()
						end
					end)()
				end
			end
			p_u_72[v73].hint.setGamepadButtonImage(v_u_4:GetImageForKeyCode(p_u_72[v73].hint.gamepadButton))
		end
		p_u_41.setAddMenuKeyBindings(function()
			-- upvalues: (ref) v_u_68, (copy) p_u_72
			v_u_68(p_u_72)
		end)
		p_u_41.setRemoveMenuKeyBindings(function()
			-- upvalues: (ref) v_u_71, (copy) p_u_72
			v_u_71(p_u_72)
		end)
		return p_u_72
	end, {})
	local v_u_84 = v_u_8.useMemo(function()
		-- upvalues: (copy) v_u_83, (copy) v_u_61
		return v_u_83(v_u_61)
	end, { v_u_61 })
	v_u_8.useEffect(function()
		-- upvalues: (ref) v_u_4, (copy) v_u_84, (ref) v_u_20
		local v_u_86 = v_u_4.GamepadConnected:Connect(function()
			-- upvalues: (ref) v_u_84, (ref) v_u_4
			for v85 = 1, #v_u_84 do
				v_u_84[v85].hint.setGamepadButtonImage(v_u_4:GetImageForKeyCode(v_u_84[v85].hint.gamepadButton))
			end
		end)
		return function()
			-- upvalues: (ref) v_u_20, (copy) v_u_86
			if v_u_20 then
				v_u_86:Disconnect()
			end
		end
	end, { v_u_84 })
	local v87 = {
		["tag"] = {
			["size-full row align-y-center"] = true,
			["gap-small"] = not v42,
			["gap-xsmall"] = v42
		}
	}
	return v_u_8.createElement(v_u_16, v87, (v_u_40(v_u_84, v52, v42)))
end