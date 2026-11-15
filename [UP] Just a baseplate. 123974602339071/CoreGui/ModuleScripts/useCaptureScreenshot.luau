-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Hooks.useCaptureScreenshot
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
require(v1.Components.Types)
local v4 = require(v2.Workspace.Packages.TnSAvatarIdentification)
local v5 = require(v2.Workspace.Packages.TnSAdIdentification)
local v_u_6 = require(v2.Workspace.Packages.TnSScreenshot).ScreenshotManager
local v_u_7 = v4.AvatarIdentification
local v_u_8 = v5.AdIdentification
return function(p_u_9, p_u_10, p_u_11)
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8
	return v_u_3.useCallback(function()
		-- upvalues: (ref) v_u_6, (copy) p_u_10, (copy) p_u_9, (ref) v_u_7, (ref) v_u_8, (copy) p_u_11
		v_u_6:TakeScreenshotWithCallback(p_u_10, p_u_9)
		local v12, v13 = v_u_7.getVisibleAvatars()
		local v14, v15 = v_u_8.getVisibleAds()
		p_u_11({
			["identifiedAvatars"] = v12,
			["identifiedAds"] = v14,
			["avatarIDStats"] = v13,
			["adIDStats"] = v15
		})
	end, { p_u_10, p_u_9, p_u_11 })
end