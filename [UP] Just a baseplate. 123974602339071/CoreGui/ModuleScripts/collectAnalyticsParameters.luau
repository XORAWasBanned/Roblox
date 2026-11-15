-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Analytics.collectAnalyticsParameters
local v1 = script:FindFirstAncestor("AbuseReportMenu")
require(v1.Components.Types)
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.Cryo)
local v_u_4 = require(v1.Components.Constants)
require(v1.ReportAnything.Utility.ReportAnythingAnalytics)
local v_u_5 = require(v1.ReportAnything.Utility.AbuseReportBuilder)
local function v_u_15(p6, p7, p8)
	-- upvalues: (copy) v_u_5, (copy) v_u_3
	local v9 = workspace:GetServerTimeNow() * 1000
	local v10 = math.floor(v9)
	local v11
	if p6.menuOpenedUnixTimestampMilliseconds > 0 then
		local v12 = v10 - p6.menuOpenedUnixTimestampMilliseconds
		v11 = math.floor(v12)
	else
		v11 = 0
	end
	local v13, _ = v_u_5.interpretAnnotations(p7)
	local v14 = {
		["placeId"] = game.PlaceId,
		["isPortraitMode"] = p6.isPortraitMode,
		["viewportSizeX"] = p6.viewportSizeX,
		["viewportSizeY"] = p6.viewportSizeY,
		["timeSpentMs"] = v11,
		["experiencePersonChangeCount"] = p6.experiencePersonChangeCount,
		["typeofabuseChangeCount"] = p6.typeofabuseChangeCount,
		["personChangeCount"] = p6.personChangeCount,
		["reasonChangeCount"] = p6.reasonChangeCount,
		["captureSceneCount"] = p6.captureSceneCount,
		["reasonSelection"] = p6.reasonSelection,
		["commentAdded"] = p6.commentAdded,
		["experiencePersonSelection"] = p6.experiencePersonSelection,
		["annotationFinalCount"] = #p7.annotationPoints,
		["avatarFinalCount"] = #v13,
		["interactionType"] = p6.isSubmissionCompleted and 1 or 2,
		["typeofabuseSelection"] = p6.typeofabuseSelection,
		["memoryRequirementMet"] = p6.memoryRequirementMet,
		["preselectedAbuseSelection"] = p6.preselectedAbuseSelection
	}
	return v_u_3.Dictionary.join(v14, p8)
end
return {
	["forPersonReport"] = function(p16, p17, p18)
		-- upvalues: (copy) v_u_15, (copy) v_u_4
		local v19 = v_u_15(p16, p17, p18)
		local v20 = v_u_4.AnalyticsAbuseMethods.Chat
		local v21 = nil
		for v22, v23 in pairs(v_u_4.AbuseMethodToAnalyticsMapping) do
			if v22 ~= p16.typeofabuseSelection then
				continue
			end
			v20 = v23
			v21 = v20
			local v24 = v20
			v20 = v21
			v24 = v21
		end
		v19.typeofabuseSelection = v21
		v19.inferredTypeofabuseSelection = v20
		return v19
	end,
	["forExperienceReport"] = function(p25, p26, p27)
		-- upvalues: (copy) v_u_15, (copy) v_u_4
		local v28 = v_u_15(p25, p26, p27)
		v28.typeofabuseSelection = v_u_4.AnalyticsAbuseMethods.Game
		v28.inferredTypeofabuseSelection = v_u_4.AnalyticsAbuseMethods.Game
		return v28
	end
}