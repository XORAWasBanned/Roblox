-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Components.createCleanup
local v1 = script:FindFirstAncestor("AbuseReportMenu")
require(v1.Components.Types)
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v1.Components.Constants)
local v_u_4 = v_u_3.ReportTypes
local v5 = game:GetService("EventIngestService")
local v6 = game:GetService("RbxAnalyticsService")
local v_u_7 = require(v1.ReportAnything.Utility.ReportAnythingAnalytics)
local v8 = require(v2.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local v9 = require(v2.Workspace.Packages.Analytics).Analytics.new(v6)
local v10 = require(v1.Analytics.ReportAbuseAnalytics)
local v_u_11 = require(v1.Analytics.collectAnalyticsParameters)
local v_u_12 = v10.new(v8.new(v5), v9.Diag, v10.MenuContexts.NewMenu)
return function(p_u_13, p_u_14, p_u_15, p_u_16)
	-- upvalues: (copy) v_u_4, (copy) v_u_11, (copy) v_u_7, (copy) v_u_12, (copy) v_u_3
	return function(p17, p18)
		-- upvalues: (copy) p_u_13, (copy) p_u_16, (ref) v_u_4, (ref) v_u_11, (ref) v_u_7, (ref) v_u_12, (ref) v_u_3, (copy) p_u_14, (copy) p_u_15
		if p_u_13.menuEverShown then
			local v19
			if p_u_16 == v_u_4.Person then
				v19 = v_u_11.forPersonReport(p_u_13, p17, v_u_7.getAccumulatedParameters())
			else
				v19 = v_u_11.forExperienceReport(p_u_13, p17, v_u_7.getAccumulatedParameters())
			end
			v_u_12:reportInGameAbuseReportInteraction(v19)
			p18({
				["type"] = v_u_3.ReportAnythingActions.ClearAnnotationFlowProperties
			})
			p_u_14({
				["type"] = v_u_3.AnalyticsActions.Reset
			})
			v_u_7.clear()
			p_u_15(nil)
			v_u_12:endAbuseReportSession()
		end
	end
end