-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Reducers.reportAnythingReducer
local v1 = script:FindFirstAncestor("AbuseReportMenu")
require(v1.Components.Types)
local v_u_2 = require(v1.Components.Constants)
local v_u_3 = v_u_2.ReportAnythingActions
return function(p4, p5) -- name: reportAnythingReducer
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v6 = table.clone(p4)
	local v7 = p5.type
	if v7 == v_u_3.ClearAll then
		return v_u_2.ReportAnythingInitialState
	end
	if v7 == v_u_3.ClearAnnotationFlowProperties then
		v6.annotationPoints = {}
		v6.attachCompleted = false
		v6.annotationPageSeen = false
		v6.annotationOptionSeen = false
		return v6
	end
	if v7 == v_u_3.SetScreenshotId then
		v6.screenshotId = p5.screenshotId
		return v6
	end
	if v7 == v_u_3.SetScreenshotContentId then
		v6.screenshotContentId = p5.screenshotContentId
		return v6
	end
	if v7 == v_u_3.SetAnnotationPoints then
		v6.annotationPoints = p5.annotationPoints
		v6.annotationPageSeen = true
		v6.annotationOptionSeen = true
		return v6
	end
	if v7 == v_u_3.SetIdentificationResults then
		v6.identificationResults = p5.identificationResults
		return v6
	end
	if v7 == v_u_3.CompleteAttachment then
		v6.attachCompleted = true
		return v6
	end
	if v7 == v_u_3.SetAnnotationCircleRadius then
		v6.annotationCircleRadius = p5.radius
		return v6
	end
	if v7 ~= v_u_3.SetAnnotationAreaDimensions then
		if v7 == v_u_3.SetAnnotationOptionSeen then
			v6.annotationOptionSeen = true
		end
		return v6
	end
	v6.annotationAreaWidth = p5.width
	v6.annotationAreaHeight = p5.height
	return v6
end