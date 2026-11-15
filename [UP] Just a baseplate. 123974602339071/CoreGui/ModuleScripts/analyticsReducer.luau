-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Reducers.analyticsReducer
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
require(v1.Components.Types)
local v_u_3 = require(v1.Components.Constants)
local v_u_4 = require(v2.Packages.Cryo)
local v_u_5 = v_u_3.AnalyticsActions
local v_u_6 = {
	["typeofabuseSelection"] = v_u_4.None,
	["reasonSelection"] = v_u_4.None
}
return function(p7, p8) -- name: analyticsReducer
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_4, (copy) v_u_6
	local v9 = table.clone(p7)
	local v10 = p8.type
	if v10 == v_u_5.Reset then
		local v11 = v9.menuEverShown
		local v12 = v_u_3.AnalyticsInitialState
		v12.menuEverShown = v11
		return v12
	end
	if v10 == v_u_5.SetMenuOpenedTimestamp then
		v9.menuEverShown = true
		v9.menuOpenedUnixTimestampMilliseconds = p8.timestamp
		return v9
	end
	if v10 == v_u_5.IncrementExperiencePersonChanged then
		v9.experiencePersonChangeCount = v9.experiencePersonChangeCount + 1
		return v9
	end
	if v10 == v_u_5.IncrementTypeofabuseChanged then
		v9.typeofabuseChangeCount = v9.typeofabuseChangeCount + 1
		return v9
	end
	if v10 == v_u_5.IncrementPersonChanged then
		v9.personChangeCount = v9.personChangeCount + 1
		return v9
	end
	if v10 == v_u_5.IncrementReasonChanged then
		v9.reasonChangeCount = v9.reasonChangeCount + 1
		return v9
	end
	if v10 == v_u_5.IncrementCaptureScene then
		v9.captureSceneCount = v9.captureSceneCount + 1
		return v9
	end
	if v10 == v_u_5.SetViewportInformation then
		v9.viewportSizeX = p8.viewportSizeX
		v9.viewportSizeY = p8.viewportSizeY
		v9.isPortraitMode = p8.viewportSizeX < p8.viewportSizeY
		return v9
	end
	if v10 == v_u_5.SetMemoryRequirementMet then
		v9.memoryRequirementMet = p8.memoryRequirementMet
		return v9
	end
	if v10 == v_u_5.SetSubmissionCompleted then
		v9.isSubmissionCompleted = true
		return v9
	end
	if v10 == v_u_5.SetTypeOfAbuseSelection then
		v9.typeofabuseSelection = p8.selection
		return v9
	end
	if v10 == v_u_5.SetPreselectedAbuseSelection then
		v9.preselectedAbuseSelection = p8.selection
		return v9
	end
	if v10 == v_u_5.SetReasonSelection then
		v9.reasonSelection = p8.selection
		return v9
	end
	if v10 == v_u_5.SetCommentAdded then
		v9.commentAdded = p8.commentAdded
		return v9
	end
	if v10 == v_u_5.SwitchToExperienceInitialSelections then
		return v_u_4.Dictionary.join(v9, v_u_6, v_u_3.AnalyticsExpeirenceInitialSelections)
	end
	if v10 == v_u_5.SwitchToPersonInitialSelections then
		v9 = v_u_4.Dictionary.join(v9, v_u_6, v_u_3.AnalyticsPersonInitialSelections)
	end
	return v9
end