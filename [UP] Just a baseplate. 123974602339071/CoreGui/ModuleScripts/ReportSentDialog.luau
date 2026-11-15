-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ReportPage.ReportSentDialog
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("ContextActionService")
local v4 = require(v1.Packages.InGameMenuDependencies)
local v_u_5 = v4.Roact
local v6 = v4.RoactRodux
local v7 = v4.t
local v8 = script.Parent.Parent.Parent
local v_u_9 = require(v8.Resources.Assets)
local v_u_10 = require(v8.Actions.CloseReportSentDialog)
local v_u_11 = require(v8.Resources.Constants)
local v_u_12 = require(v8.Localization.withLocalization)
local v_u_13 = require(v8.Components.InfoDialog)
local v_u_14 = require(script.Parent.Parent.Connection.FocusHandler)
local v15 = v7.strictInterface({
	["isReportSentOpen"] = v7.boolean,
	["onDismiss"] = v7.callback,
	["inputType"] = v7.optional(v7.string)
})
local v16 = v_u_5.PureComponent:extend("ReportSentDialog")
v16.validateProps = v15
function v16.init(p17) -- name: init
	-- upvalues: (copy) v_u_5
	p17.buttonRef = v_u_5.createRef()
end
function v16.renderFocusHandler(p_u_18) -- name: renderFocusHandler
	-- upvalues: (copy) v_u_5, (copy) v_u_14, (copy) v_u_11, (copy) v_u_2, (copy) v_u_3
	local v19 = v_u_5.createElement
	local v20 = v_u_14
	local v21 = {}
	local v22
	if p_u_18.props.inputType == v_u_11.InputType.Gamepad then
		v22 = p_u_18.props.isReportSentOpen
	else
		v22 = false
	end
	v21.isFocused = v22
	function v21.didFocus() -- name: didFocus
		-- upvalues: (ref) v_u_2, (copy) p_u_18, (ref) v_u_3
		v_u_2:RemoveSelectionGroup("ReportSentDialogGroup")
		v_u_2:AddSelectionParent("ReportSentDialogGroup", p_u_18.buttonRef:getValue())
		v_u_2.SelectedCoreObject = p_u_18.buttonRef:getValue()
		v_u_3:BindCoreAction("ReporSentDialogSinkAction", function(_, _)
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonY, Enum.KeyCode.ButtonX)
	end
	function v21.didBlur() -- name: didBlur
		-- upvalues: (ref) v_u_3, (ref) v_u_2
		v_u_3:UnbindCoreAction("ReporSentDialogSinkAction")
		v_u_2:RemoveSelectionGroup("ReportSentDialogGroup")
	end
	return v19(v20, v21)
end
function v16.render(p_u_23) -- name: render
	-- upvalues: (copy) v_u_12, (copy) v_u_5, (copy) v_u_13, (copy) v_u_9
	return v_u_12({
		["titleText"] = "CoreScripts.InGameMenu.Report.ThanksForReport",
		["bodyText"] = "CoreScripts.InGameMenu.Report.WillReviewBody",
		["dismissText"] = "CoreScripts.InGameMenu.Ok"
	})(function(p24)
		-- upvalues: (ref) v_u_5, (ref) v_u_13, (ref) v_u_9, (copy) p_u_23
		local v25 = v_u_5.createFragment
		local v26 = {
			["Dialog"] = v_u_5.createElement(v_u_13, {
				["titleText"] = p24.titleText,
				["bodyText"] = p24.bodyText,
				["dismissText"] = p24.dismissText,
				["iconImage"] = v_u_9.Images.SuccessTick,
				["buttonRef"] = p_u_23.buttonRef,
				["onDismiss"] = p_u_23.props.onDismiss,
				["visible"] = p_u_23.props.isReportSentOpen
			}),
			["FocusHandler"] = p_u_23:renderFocusHandler()
		}
		return v25(v26)
	end)
end
return v6.UNSTABLE_connect2(function(p27, _)
	return {
		["isReportSentOpen"] = p27.report.reportSentOpen,
		["inputType"] = p27.displayOptions.inputType
	}
end, function(p_u_28)
	-- upvalues: (copy) v_u_10
	return {
		["onDismiss"] = function() -- name: onDismiss
			-- upvalues: (copy) p_u_28, (ref) v_u_10
			p_u_28(v_u_10())
		end
	}
end)(v16)