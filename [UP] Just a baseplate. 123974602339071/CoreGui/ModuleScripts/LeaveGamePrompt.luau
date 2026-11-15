-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.Pages.Dialog.LeaveGamePrompt
local v_u_1 = game:GetService("RunService")
local v2 = game:GetService("CorePackages")
local v3 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v4 = require(v2.Packages.InGameMenuDependencies)
local v_u_5 = v4.Roact
local v6 = v4.RoactRodux
local v7 = v4.t
local v_u_8 = require(script.Parent.LeavePrompt)
local v9 = script.Parent.Parent.Parent.Parent
local v_u_10 = require(v9.Localization.withLocalization)
local v_u_11 = require(v9.Resources.Constants)
local v_u_12 = require(v9.Thunks.CloseMenu)
local v_u_13 = require(v9.Utility.SendAnalytics)
local v_u_14 = require(v2.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local v_u_15 = require(v3.Modules.FTUX.Flags.GetFFlagEnableVRFTUXExperience)
local v_u_16 = require(v3.Modules.FTUX.Utility.IsFTUXExperience)
local v_u_17 = require(v3.Modules.FTUX.Enums.PlatformEnum)
local v18 = v_u_5.PureComponent:extend("LeaveGamePrompt")
v18.validateProps = v7.strictInterface({
	["closeMenu"] = v7.callback,
	["canGamepadCaptureFocus"] = v7.optional(v7.boolean),
	["canKeyboardCaptureFocus"] = v7.optional(v7.boolean),
	["onConfirm"] = v7.optional(v7.callback)
})
function v18.init(p19) -- name: init
	-- upvalues: (copy) v_u_13, (copy) v_u_11, (copy) v_u_1, (copy) v_u_14
	function p19.leaveGameConfirm()
		-- upvalues: (ref) v_u_13, (ref) v_u_11, (ref) v_u_1, (ref) v_u_14
		v_u_13(v_u_11.AnalyticsInGameMenuName, v_u_11.AnalyticsLeaveGameName, {
			["confirmed"] = v_u_11.AnalyticsConfirmedName
		})
		v_u_1.Heartbeat:Wait()
		game:Shutdown()
		settings().Rendering.QualityLevel = v_u_14()
	end
end
function v18.render(p_u_20) -- name: render
	-- upvalues: (copy) v_u_10, (copy) v_u_15, (copy) v_u_16, (copy) v_u_17, (copy) v_u_5, (copy) v_u_8
	return v_u_10({
		["titleText"] = "CoreScripts.InGameMenu.Prompt.LeaveGameTitle",
		["bodyText"] = nil,
		["confirmText"] = "CoreScripts.InGameMenu.Prompt.LeaveGame",
		["cancelText"] = "CoreScripts.InGameMenu.Prompt.ResumeGame",
		["bodyText"] = v_u_15() and v_u_16(v_u_17.QuestVR) and "CoreScripts.InGameMenu.Prompt.VRFTUXLeaveGameBodyText" or "CoreScripts.InGameMenu.Prompt.LeaveGameBodyText"
	})(function(p21)
		-- upvalues: (ref) v_u_5, (ref) v_u_8, (copy) p_u_20
		return v_u_5.createElement(v_u_8, {
			["titleText"] = p21.titleText,
			["bodyText"] = p21.bodyText,
			["confirmText"] = p21.confirmText,
			["cancelText"] = p21.cancelText,
			["onConfirm"] = p_u_20.props.onConfirm or p_u_20.leaveGameConfirm,
			["onCancel"] = p_u_20.props.closeMenu,
			["canGamepadCaptureFocus"] = p_u_20.props.canGamepadCaptureFocus,
			["canKeyboardCaptureFocus"] = p_u_20.props.canKeyboardCaptureFocus
		})
	end)
end
return v6.UNSTABLE_connect2(function(p22, _)
	-- upvalues: (copy) v_u_11
	local v23 = p22.menuPage == v_u_11.LeaveGamePromptPageKey and p22.displayOptions.inputType == v_u_11.InputType.Gamepad and not p22.respawn.dialogOpen
	if v23 then
		v23 = p22.currentZone == 1
	end
	local v24
	if p22.menuPage == v_u_11.LeaveGamePromptPageKey and p22.displayOptions.inputType == v_u_11.InputType.MouseAndKeyboard then
		v24 = not p22.respawn.dialogOpen
	else
		v24 = false
	end
	return {
		["canGamepadCaptureFocus"] = v23,
		["canKeyboardCaptureFocus"] = v24
	}
end, function(p_u_25)
	-- upvalues: (copy) v_u_12, (copy) v_u_13, (copy) v_u_11
	return {
		["closeMenu"] = function() -- name: closeMenu
			-- upvalues: (copy) p_u_25, (ref) v_u_12, (ref) v_u_13, (ref) v_u_11
			p_u_25(v_u_12)
			v_u_13(v_u_11.AnalyticsInGameMenuName, v_u_11.AnalyticsLeaveGameName, {
				["confirmed"] = v_u_11.AnalyticsCancelledName
			})
		end
	}
end)(v18)