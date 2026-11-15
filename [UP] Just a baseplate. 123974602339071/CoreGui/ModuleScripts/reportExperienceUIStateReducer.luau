-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Reducers.reportExperienceUIStateReducer
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = require(v1.Components.Constants)
require(v1.Components.Types)
local v_u_3 = v2.PlayerMenuActions
return function(p4, p5) -- name: reportExperienceUIStateReducer
	-- upvalues: (copy) v_u_3
	local v6 = table.clone(p4)
	if p5.type == v_u_3.UpdateComment then
		v6.comment = p5.comment
	end
	return v6
end