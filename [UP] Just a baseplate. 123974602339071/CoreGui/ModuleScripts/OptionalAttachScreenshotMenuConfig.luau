-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.MenuConfigs.Experience.OptionalAttachScreenshotMenuConfig
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
	["getIsVisible"] = function(_) -- name: getIsVisible
		-- upvalues: (copy) v_u_3
		return v_u_3.getReportAnythingExperienceEnabled()
	end,
	["getIsDisabled"] = function(_, p5) -- name: getIsDisabled
		return p5.reportAnythingState.attachCompleted
	end,
	["getIconSrc"] = function(p6) -- name: getIconSrc
		return p6.reportAnythingState.attachCompleted and "icons/actions/accept" or "icons/controls/screenshot"
	end,
	["getButtonLabel"] = function(p7) -- name: getButtonLabel
		return p7.reportAnythingState.attachCompleted and "SceneCaptured" or "CaptureScene"
	end,
	["onClick"] = function(_, _, p8) -- name: onClick
		-- upvalues: (copy) v_u_2, (copy) v_u_4
		p8.analyticsDispatch({
			["type"] = v_u_2.AnalyticsActions.IncrementCaptureScene
		})
		v_u_4.mountAnnotationPage(v_u_2.ReportTypes.Experience, p8.hideReportTab, p8.reportAnythingAnalytics, p8.reportAnythingState, p8.reportAnythingDispatch)
	end
}