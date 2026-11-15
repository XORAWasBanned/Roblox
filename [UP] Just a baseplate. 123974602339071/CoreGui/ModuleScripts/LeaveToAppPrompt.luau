-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.Pages.Dialog.LeaveToAppPrompt
local v_u_1 = game:GetService("RunService")
local v2 = game:GetService("CorePackages")
local v3 = require(v2.Workspace.Packages.LinkingProtocol)
local v_u_4 = v3.Enums.DeepLinkSource
local v5 = v3.LinkingProtocol
local v6 = require(v2.Packages.InGameMenuDependencies)
local v_u_7 = v6.Roact
local v8 = v6.RoactRodux
local v9 = v6.t
local v_u_10 = require(script.Parent.LeavePrompt)
local v11 = script.Parent.Parent.Parent.Parent
local v_u_12 = require(v11.Localization.withLocalization)
local v_u_13 = require(v11.Thunks.CloseMenu)
local v_u_14 = require(v11.Utility.SendAnalytics)
local v_u_15 = require(v11.Resources.Constants)
local v16 = v_u_7.PureComponent:extend("LeaveToAppPrompt")
v16.validateProps = v9.strictInterface({
	["closeMenu"] = v9.callback,
	["canGamepadCaptureFocus"] = v9.optional(v9.boolean),
	["canKeyboardCaptureFocus"] = v9.optional(v9.boolean),
	["onConfirm"] = v9.optional(v9.callback),
	["linkingProtocol"] = v9.table
})
v16.defaultProps = {
	["linkingProtocol"] = v5.default
}
function v16.init(p_u_17) -- name: init
	-- upvalues: (copy) v_u_14, (copy) v_u_15, (copy) v_u_4, (copy) v_u_1
	function p_u_17.goToHomePage()
		-- upvalues: (ref) v_u_14, (ref) v_u_15, (copy) p_u_17, (ref) v_u_4, (ref) v_u_1
		v_u_14(v_u_15.AnalyticsLeaveToHomeName, v_u_15.AnalyticsLeaveToHomeName, {
			["confirmed"] = v_u_15.AnalyticsLeaveToHomeName
		})
		if p_u_17.props.linkingProtocol:isInternalDlicEnabled() then
			local v18 = p_u_17.props.linkingProtocol:createInternalDlic("roblox://navigation/home", v_u_4.LuaInternal)
			v_u_1.Heartbeat:Wait()
			p_u_17.props.linkingProtocol:detectDeeplinkIntent(v18)
		else
			v_u_1.Heartbeat:Wait()
			p_u_17.props.linkingProtocol:detectURL("roblox://navigation/home")
		end
		game:Shutdown()
	end
end
function v16.render(p_u_19) -- name: render
	-- upvalues: (copy) v_u_12, (copy) v_u_7, (copy) v_u_10
	return v_u_12({
		["titleText"] = "CoreScripts.InGameMenu.Prompt.LeaveGameTitle",
		["bodyText"] = "CoreScripts.InGameMenu.Prompt.LeaveGameBodyText",
		["confirmText"] = "CoreScripts.InGameMenu.Prompt.BackToHome",
		["cancelText"] = "CoreScripts.InGameMenu.Prompt.ResumeGame"
	})(function(p20)
		-- upvalues: (ref) v_u_7, (ref) v_u_10, (copy) p_u_19
		return v_u_7.createElement(v_u_10, {
			["titleText"] = p20.titleText,
			["bodyText"] = p20.bodyText,
			["confirmText"] = p20.confirmText,
			["cancelText"] = p20.cancelText,
			["onConfirm"] = p_u_19.props.onConfirm or p_u_19.goToHomePage,
			["onCancel"] = p_u_19.props.closeMenu,
			["canGamepadCaptureFocus"] = p_u_19.props.canGamepadCaptureFocus,
			["canKeyboardCaptureFocus"] = p_u_19.props.canKeyboardCaptureFocus
		})
	end)
end
return v8.UNSTABLE_connect2(function(p21, _)
	-- upvalues: (copy) v_u_15
	local v22 = p21.menuPage == v_u_15.LeaveToAppPromptPageKey and p21.displayOptions.inputType == v_u_15.InputType.Gamepad and not p21.respawn.dialogOpen
	if v22 then
		v22 = p21.currentZone == 1
	end
	local v23
	if p21.menuPage == v_u_15.LeaveToAppPromptPageKey and p21.displayOptions.inputType == v_u_15.InputType.MouseAndKeyboard then
		v23 = not p21.respawn.dialogOpen
	else
		v23 = false
	end
	return {
		["canGamepadCaptureFocus"] = v22,
		["canKeyboardCaptureFocus"] = v23
	}
end, function(p_u_24)
	-- upvalues: (copy) v_u_13
	return {
		["closeMenu"] = function() -- name: closeMenu
			-- upvalues: (copy) p_u_24, (ref) v_u_13
			p_u_24(v_u_13)
		end
	}
end)(v16)