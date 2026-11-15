-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.MenuConfigs.Players.OptionalAttachScreenshotMenuConfig
local v1 = script:FindFirstAncestor("AbuseReportMenu")
require(v1.Components.Types)
local v_u_2 = require(v1.Components.Constants)
local v_u_3 = require(v1.IXP.TnSIXPWrapper)
local v_u_4 = require(v1.ReportAnything.Components.AnnotationModal)
return {
	["componentType"] = "button",
	["getIsVisible"] = nil,
	["getIsDisabled"] = nil,
	["variant"] = "secondary",
	["getIconSrc"] = nil,
	["getButtonLabel"] = nil,
	["onClick"] = nil,
	["fieldLabel"] = "AttachScreenshot",
	["componentName"] = "OptionalScreenshot",
	["getIsVisible"] = function(p5) -- name: getIsVisible
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		local v6 = v_u_3.getReportAnythingAvatarEnabled()
		if v6 then
			v6 = p5.methodOfAbuse == v_u_2.AbuseMethods.Other and true or p5.methodOfAbuse == v_u_2.AbuseMethods.Avatar
		end
		return v6
	end,
	["getIsDisabled"] = function(_, p7) -- name: getIsDisabled
		return p7.reportAnythingState.attachCompleted
	end,
	["getIconSrc"] = function(p8) -- name: getIconSrc
		return p8.reportAnythingState.attachCompleted and "icons/actions/accept" or "icons/controls/screenshot"
	end,
	["getButtonLabel"] = function(p9) -- name: getButtonLabel
		return p9.reportAnythingState.attachCompleted and "SceneCaptured" or "CaptureScene"
	end,
	["onClick"] = function(_, _, p10) -- name: onClick
		-- upvalues: (copy) v_u_2, (copy) v_u_4
		p10.analyticsDispatch({
			["type"] = v_u_2.AnalyticsActions.IncrementCaptureScene
		})
		v_u_4.mountAnnotationPage(v_u_2.ReportTypes.Person, p10.hideReportTab, p10.reportAnythingAnalytics, p10.reportAnythingState, p10.reportAnythingDispatch)
	end
}