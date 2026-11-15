-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.MenuConfigs.getToastMessageFromAbuseReason
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v_u_2 = require(v1.Components.Constants)
local v_u_3 = v_u_2.ReportSuccessToast
local v_u_4 = v_u_2.PlayerAbuseTypes
return function(p5, p6) -- name: getToastMessageFromAbuseReason
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_2
	local v7 = v_u_3.ChatGeneric
	if p5 == v_u_4.Cheating then
		v7 = v_u_3.Cheating
	elseif p5 == v_u_4.Username then
		v7 = v_u_3.BadUserName
	elseif p5 == v_u_4.Links or p5 == v_u_2.InappropriateContentAbuseReason then
		v7 = v_u_3.Place
	end
	if p6 then
		v7 = v_u_3.ReportAnythingGeneric
	end
	return v7
end