-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.IXP.TnSIXPWrapper
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.TrustAndSafetyIxp).TrustAndSafetyIXPManager.default
return {
	["getReportAnythingAvatarEnabled"] = function() -- name: getReportAnythingAvatarEnabled
		-- upvalues: (copy) v_u_2
		return v_u_2:getReportAnythingAvatarEnabled()
	end,
	["getReportAnythingExperienceEnabled"] = function() -- name: getReportAnythingExperienceEnabled
		-- upvalues: (copy) v_u_2
		return v_u_2:getReportAnythingExperienceEnabled()
	end
}