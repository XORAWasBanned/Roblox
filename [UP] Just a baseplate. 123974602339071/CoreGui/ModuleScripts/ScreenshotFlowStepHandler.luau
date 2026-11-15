-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.ReportAnything.Components.ScreenshotFlowStepHandler
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Workspace.Packages.RobloxTranslator)
local v4 = script.Parent.Parent
local v_u_5 = require(v4.Components.ScreenshotDialog)
local v_u_6 = require(v4.Components.ScreenshotReviewDialog)
require(script.Parent.Parent.Parent.Components.Types)
return function(p_u_7) -- name: ScreenshotFlowStepHandler
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_3, (copy) v_u_5
	local v8, v_u_9 = v_u_2.useState(p_u_7.initialPageNumber == nil and 1 or p_u_7.initialPageNumber)
	local v10, v_u_11 = v_u_2.useState(1.7777777777777777)
	local v12, v_u_13 = v_u_2.useState(800)
	local v14, v_u_15 = v_u_2.useState(800)
	local v16, v_u_17 = v_u_2.useState(true)
	local v18 = v_u_2.useCallback(function()
		-- upvalues: (copy) v_u_9
		v_u_9(2)
	end, { v_u_9 })
	local v19 = v_u_2.useCallback(function()
		-- upvalues: (copy) v_u_9
		v_u_9(1)
	end, { v_u_9 })
	v_u_2.useEffect(function()
		-- upvalues: (copy) p_u_7, (copy) v_u_11, (copy) v_u_13, (copy) v_u_15, (copy) v_u_17
		local v20 = game.Workspace.CurrentCamera
		if v20 ~= nil then
			local v21 = v20.viewportSize
			if p_u_7.viewportInfo then
				v_u_11(p_u_7.viewportInfo.width / p_u_7.viewportInfo.height)
			else
				v_u_11(v21.X / v21.Y)
			end
			v_u_13(v21.Y)
			v_u_15(v21.X)
			local v22 = v_u_17
			local v23
			if v21.X < v21.Y then
				v23 = v21.X < 800
			else
				v23 = false
			end
			v22(v23)
		end
	end, {})
	if v8 == 1 then
		return v_u_2.createElement(v_u_6, {
			["imageAspectRatio"] = v10,
			["isSmallPortraitMode"] = v16,
			["viewportUISafeAreaHeight"] = v12,
			["viewportUISafeAreaWidth"] = v14,
			["onNextPage"] = v18,
			["onBack"] = p_u_7.dismissAction,
			["onSkip"] = p_u_7.skipAnnotationAction,
			["onRestart"] = p_u_7.restartAction,
			["screenshot"] = p_u_7.screenshot,
			["reportAnythingAnalytics"] = p_u_7.reportAnythingAnalytics
		}, {})
	end
	local v24
	if p_u_7.entryPoint == "player" then
		v24 = v_u_3:FormatByKey("Feature.ReportAbuse.Label.SelectPerson")
	else
		v24 = v_u_3:FormatByKey("Feature.ReportAbuse.Label.SelectProblem")
	end
	return v_u_2.createElement(v_u_5, {
		["titleText"] = v24,
		["backAction"] = v19,
		["dismissAction"] = p_u_7.dismissAction,
		["finishAnnotationAction"] = p_u_7.finishAnnotationAction,
		["initialAnnotationPoints"] = p_u_7.initialAnnotationPoints,
		["isSmallPortraitMode"] = v16,
		["screenshot"] = p_u_7.screenshot,
		["imageAspectRatio"] = v10,
		["setAnnotationCircleRadius"] = p_u_7.setAnnotationCircleRadius,
		["setAnnotationAreaDimensions"] = p_u_7.setAnnotationAreaDimensions,
		["reportAnythingAnalytics"] = p_u_7.reportAnythingAnalytics
	})
end