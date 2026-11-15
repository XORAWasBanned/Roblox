-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Hooks.useReportAnythingWithScreenshot
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v_u_4 = require(v1.Components.Constants)
local v_u_5 = require(v1.Hooks.useHideForScreenshot)
local v_u_6 = require(v1.Hooks.useCaptureScreenshot)
local v_u_7 = require(v1.Reducers.reportAnythingReducer)
local v_u_8 = require(v1.IXP.TnSIXPWrapper)
return function(p9, p10, p11, p_u_12)
	-- upvalues: (copy) v_u_8, (copy) v_u_3, (copy) v_u_7, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5
	local v13 = v_u_8.getReportAnythingAvatarEnabled()
	local v14 = v_u_8.getReportAnythingExperienceEnabled()
	local v_u_15, v_u_16 = v_u_3.useReducer(v_u_7, v_u_4.ReportAnythingInitialState)
	if v13 or v14 then
		v14 = v_u_15.screenshotContentId == ""
	end
	v_u_5(v14, p9, p10, p11, v_u_6(v_u_3.useCallback(function(p17)
		-- upvalues: (copy) v_u_16, (ref) v_u_4
		v_u_16({
			["type"] = v_u_4.ReportAnythingActions.SetScreenshotContentId,
			["screenshotContentId"] = p17
		})
	end), v_u_3.useCallback(function(p18)
		-- upvalues: (copy) v_u_16, (ref) v_u_4
		v_u_16({
			["type"] = v_u_4.ReportAnythingActions.SetScreenshotId,
			["screenshotId"] = p18
		})
	end), v_u_3.useCallback(function(p19)
		-- upvalues: (copy) v_u_16, (ref) v_u_4
		v_u_16({
			["type"] = v_u_4.ReportAnythingActions.SetIdentificationResults,
			["identificationResults"] = p19
		})
	end)), function()
		-- upvalues: (copy) p_u_12, (copy) v_u_15, (copy) v_u_16
		p_u_12(v_u_15, v_u_16)
	end)
	return v_u_15, v_u_16
end