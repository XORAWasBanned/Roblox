-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Analytics.ReportAbuseAnalytics
local v_u_1 = game:GetService("SessionService")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.Cryo)
local v_u_4 = {}
v_u_4.__index = v_u_4
v_u_4.MenuContexts = {
	["LegacyMenu"] = game:DefineFastString("ReportAnalyticsLegacyMenuContext", "ReportAbuseLegacyMenu"),
	["LegacySentPage"] = game:DefineFastString("ReportAnalyticsLegacySentPageContext", "ReportAbuseLegacySentPage"),
	["NewMenu"] = game:DefineFastString("ReportAnalyticsNewMenuContext", "ReportAbuseNewMenu")
}
v_u_4.DiagCounters = {
	["SuccessfulSubmissionTime"] = game:DefineFastString("ReportAnalyticsSuccessfulSubmissionTimeStat", "SuccessfulSubmissionTime"),
	["AbandonedSubmissionTime"] = game:DefineFastString("ReportAnalyticsAbandonedSubmissionTimeStat", "AbandonedSubmissionTime"),
	["SubmittedMethodOfAbuse"] = game:DefineFastString("ReportAnalyticsSubmittedMethodOfAbuseStat", "SubmittedMethodOfAbuse")
}
v_u_4.ActionNames = {
	["FieldChanged"] = game:DefineFastString("ReportAnalyticsFieldChanged", "FieldChanged"),
	["FormSubmitted"] = game:DefineFastString("ReportAnalyticsFormSubmitted", "FormSubmitted"),
	["FormAbandoned"] = game:DefineFastString("ReportAnalyticsFormAbandoned", "FormAbandoned"),
	["ButtonActivated"] = game:DefineFastString("ReportAnalyticsButtonActivated", "ButtonActivated"),
	["InGameAbuseReport"] = game:DefineFastString("ReportAnalyticsInGameAbuseReport", "InGameAbuseReport")
}
v_u_4.SessionConstants = {
	["StructuralIdentifier"] = {
		["Level1"] = "level1",
		["AbuseReport"] = "AbuseReport"
	},
	["Metadata"] = {
		["EntryPoint"] = "entryPoint",
		["DeleteOnGameLeave"] = "_deleteOnGameLeave"
	}
}
function v_u_4.new(p5, p6, p7) -- name: new
	-- upvalues: (copy) v_u_4
	assert(p7, "Base context needs to be provided to ReportAbuseAnalytics")
	local v8 = {
		["_eventStreamImpl"] = p5,
		["_diagImpl"] = p6,
		["_context"] = p7
	}
	local v9 = v_u_4
	setmetatable(v8, v9)
	return v8
end
function v_u_4.reportFormSubmitted(p10, p11, p12, p13) -- name: reportFormSubmitted
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local v14 = p10._context .. "_" .. v_u_4.DiagCounters.SuccessfulSubmissionTime
	local v15 = p10._context .. "_" .. v_u_4.DiagCounters.SubmittedMethodOfAbuse .. "_" .. p12
	local v16 = v_u_3.Dictionary.join(p13 or {}, {
		["timeToComplete"] = p11,
		["methodOfAbuse"] = p12
	})
	p10._diagImpl:reportStats(v14, p11)
	p10._diagImpl:reportCounter(v15, 1)
	p10._eventStreamImpl:sendEventDeferred(p10._context, v_u_4.ActionNames.FormSubmitted, v16)
end
function v_u_4.reportFormAbandoned(p17, p18, p19) -- name: reportFormAbandoned
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local v20 = p17._context .. "_" .. v_u_4.DiagCounters.AbandonedSubmissionTime
	local v21 = v_u_3.Dictionary.join(p19 or {}, {
		["timeToExit"] = p18
	})
	p17._diagImpl:reportStats(v20, p18)
	p17._eventStreamImpl:sendEventDeferred(p17._context, v_u_4.ActionNames.FormAbandoned, v21)
end
function v_u_4.reportAnalyticsFieldChanged(p22, p23) -- name: reportAnalyticsFieldChanged
	-- upvalues: (copy) v_u_4
	p22._eventStreamImpl:sendEventDeferred(p22._context, v_u_4.ActionNames.FieldChanged, p23 or {})
end
function v_u_4.reportButtonClick(p24, p25) -- name: reportButtonClick
	-- upvalues: (copy) v_u_4
	p24._eventStreamImpl:sendEventDeferred(p24._context, v_u_4.ActionNames.ButtonActivated, p25 or {})
end
function v_u_4.reportInGameAbuseReportInteraction(p26, p27) -- name: reportInGameAbuseReportInteraction
	-- upvalues: (copy) v_u_4
	local v28 = p27.interactionType == 1
	local v29 = v_u_4.DiagCounters.AbandonedSubmissionTime
	if v28 then
		v29 = v_u_4.DiagCounters.SuccessfulSubmissionTime
		local v30 = p26._context .. "_" .. v_u_4.DiagCounters.SubmittedMethodOfAbuse .. "_" .. p27.inferredTypeofabuseSelection
		p26._diagImpl:reportCounter(v30, 1)
	end
	local v31 = p26._context .. "_" .. v29
	p26._diagImpl:reportStats(v31, p27.timeSpentMs)
	p26._eventStreamImpl:sendEventDeferred(p26._context, v_u_4.ActionNames.InGameAbuseReport, p27)
end
function v_u_4.reportEventAndIncrement(p32, p33, p34) -- name: reportEventAndIncrement
	p32._diagImpl:reportCounter(p32._context .. "_" .. p33, 1)
	p32._eventStreamImpl:sendEventDeferred(p32._context, p33, p34 or {})
end
function v_u_4.startAbuseReportSession(_, p35) -- name: startAbuseReportSession
	-- upvalues: (copy) v_u_1, (copy) v_u_4
	if not v_u_1:SessionExists(v_u_4.SessionConstants.StructuralIdentifier.AbuseReport) then
		v_u_1:SetSession(v_u_4.SessionConstants.StructuralIdentifier.Level1, v_u_4.SessionConstants.StructuralIdentifier.AbuseReport, v_u_4.SessionConstants.StructuralIdentifier.AbuseReport)
	end
	if not v_u_1:GetMetadata(v_u_4.SessionConstants.StructuralIdentifier.AbuseReport, v_u_4.SessionConstants.Metadata.EntryPoint) then
		v_u_1:SetMetadata(v_u_4.SessionConstants.StructuralIdentifier.AbuseReport, v_u_4.SessionConstants.Metadata.EntryPoint, p35)
	end
	v_u_1:SetMetadata(v_u_4.SessionConstants.StructuralIdentifier.AbuseReport, v_u_4.SessionConstants.Metadata.DeleteOnGameLeave, "True")
end
function v_u_4.getAbuseReportSessionEntryPoint(_) -- name: getAbuseReportSessionEntryPoint
	-- upvalues: (copy) v_u_1, (copy) v_u_4
	return not v_u_1:SessionExists(v_u_4.SessionConstants.StructuralIdentifier.AbuseReport) and "" or v_u_1:GetMetadata(v_u_4.SessionConstants.StructuralIdentifier.AbuseReport, v_u_4.SessionConstants.Metadata.EntryPoint)
end
function v_u_4.endAbuseReportSession(_) -- name: endAbuseReportSession
	-- upvalues: (copy) v_u_1, (copy) v_u_4
	if v_u_1:SessionExists(v_u_4.SessionConstants.StructuralIdentifier.AbuseReport) then
		v_u_1:RemoveSession(v_u_4.SessionConstants.StructuralIdentifier.AbuseReport)
	end
end
return v_u_4