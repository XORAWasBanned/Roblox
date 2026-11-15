-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.V2.safetyServiceSignals
local v_u_1 = game:GetService("SafetyService")
return {
	["reportMenuTabOpen"] = function() -- name: reportMenuTabOpen
		-- upvalues: (copy) v_u_1
		v_u_1:ReportMenuTabOpen()
	end,
	["reportMenuTabClose"] = function() -- name: reportMenuTabClose
		-- upvalues: (copy) v_u_1
		v_u_1:ReportMenuTabClose()
	end
}