-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Utility.SessionUtility
local v_u_1 = game:GetService("SessionService")
local v2 = script.Parent.Parent
local v_u_3 = require(v2.Resources.Constants)
local v_u_4 = require(v2.Flags.GetFFlagEnableARFlowSession)
local v_u_5 = require(v2.Utility.SendAnalytics)
return {
	["startAbuseReportSession"] = function(p6)
		-- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_3, (copy) v_u_5
		if v_u_4() then
			if not v_u_1:SessionExists(v_u_3.Session.StructuralIdentifier.AbuseReport) then
				v_u_1:SetSession(v_u_3.Session.StructuralIdentifier.Level1, v_u_3.Session.StructuralIdentifier.AbuseReport, v_u_3.Session.StructuralIdentifier.AbuseReport)
			end
			v_u_1:SetMetadata(v_u_3.Session.StructuralIdentifier.AbuseReport, v_u_3.Session.Metadata.EntryPoint, p6)
			v_u_1:SetMetadata(v_u_3.Session.StructuralIdentifier.AbuseReport, v_u_3.Session.Metadata.DeleteOnGameLeave, "True")
			v_u_5(v_u_3.Analytics.ReportFlowOpened, v_u_3.Analytics.ReportFlowOpened, {
				["source"] = p6
			})
		end
	end,
	["endAbuseReportSession"] = function()
		-- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_3
		if v_u_4() and v_u_1:SessionExists(v_u_3.Session.StructuralIdentifier.AbuseReport) then
			v_u_1:RemoveSession(v_u_3.Session.StructuralIdentifier.AbuseReport)
		end
	end
}