-- Path: CoreGui.RobloxGui.Modules.Experiment.GetCoreScriptsLayers
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.SharedFlags).FStringSocialCaptureIXPLayer
local v_u_3 = require(v1.Workspace.Packages.SharedFlags).FStringSocialCaptureTakenIXPLayer
require(script.Parent.Parent.Flags.GetFFlagEnableNewInviteMenuIXP)
local v_u_4 = require(v1.Workspace.Packages.SharedFlags).GetFStringLargerRobuxUpsellIxpLayer
local v_u_5 = require(v1.Workspace.Packages.SharedFlags).GetFStringLuaAppExperienceMenuLayer
local v_u_6 = require(script.Parent.Parent.Flags.GetFStringLuaAppConsoleExperienceMenuLayer)
local v_u_7 = require(v1.Workspace.Packages.SharedFlags).GetFFlagReportAnythingAnnotationIXP
local v_u_8 = require(v1.Workspace.Packages.SharedFlags).GetFStringReportAnythingAnnotationIXPLayerName
local v_u_9 = require(script.Parent.Parent.Flags.GetFStringChatTranslationLayerName)
local v_u_10 = require(script.Parent.Parent.Flags.GetFFlagChatTranslationSettingEnabled)
local v_u_11 = require(script.Parent.Parent.Flags.GetFFlagVoiceUserAgencyEnableIXP)
local v_u_12 = require(script.Parent.Parent.Flags.GetFStringVoiceUserAgencyIXPLayerName)
local v_u_13 = require(v1.Workspace.Packages.SharedFlags).getFStringDesktopToastNotificationLayer
local v_u_14 = require(script.Parent.Parent.Flags.GetFFlagUXForCameraPerformanceIXPEnabled)
local v_u_15 = require(script.Parent.Parent.Flags.GetFStringUXForCameraPerformanceIXPLayerName)
local v_u_16 = require(script.Parent.Parent.Flags.GetFStringVoiceExposureIXPLayerName)
local v_u_17 = require(v1.Workspace.Packages.SharedFlags).GetFStringAndroidPhoneVerificationLayer
local v_u_18 = require(v1.Workspace.Packages.SharedFlags).GetFStringIOSPhoneVerificationLayer
local v_u_19 = require(v1.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience
local v_u_20 = require(v1.Workspace.Packages.SharedFlags).getFStringAppChatInExperienceIXPLayer
local v_u_21 = require(v1.Workspace.Packages.SharedFlags).FStringReportMenuIXPLayer
local v_u_22 = require(v1.Workspace.Packages.SharedFlags).FStringReportingIXPLayer
local v_u_23 = require(v1.Workspace.Packages.InExperienceShop.FFlagEnableShopExposureLogging)
local v_u_24 = require(v1.Workspace.Packages.InExperienceShop.FStringExperienceShopLayer1)
local v_u_25 = require(v1.Workspace.Packages.InExperienceShop.FStringExperienceShopLayer2)
return function()
	-- upvalues: (copy) v_u_13, (copy) v_u_21, (copy) v_u_22, (copy) v_u_2, (copy) v_u_3, (copy) v_u_5, (copy) v_u_6, (copy) v_u_4, (copy) v_u_7, (copy) v_u_8, (copy) v_u_10, (copy) v_u_9, (copy) v_u_11, (copy) v_u_12, (copy) v_u_14, (copy) v_u_15, (copy) v_u_16, (copy) v_u_17, (copy) v_u_18, (copy) v_u_19, (copy) v_u_20, (copy) v_u_23, (copy) v_u_24, (copy) v_u_25
	local v26 = {
		"AbuseReports",
		v_u_13(),
		v_u_21,
		v_u_22,
		v_u_2,
		v_u_3
	}
	local v27 = v_u_5
	table.insert(v26, v27())
	local v28 = v_u_6
	table.insert(v26, v28())
	if v_u_4() then
		local v29 = v_u_4
		table.insert(v26, v29())
	end
	if v_u_7() then
		local v30 = v_u_8
		table.insert(v26, v30())
	end
	if v_u_10() and #v_u_9() > 0 then
		local v31 = v_u_9
		table.insert(v26, v31())
	end
	if v_u_11() then
		local v32 = v_u_12
		table.insert(v26, v32())
	end
	if v_u_14() then
		local v33 = v_u_15
		table.insert(v26, v33())
	end
	local v34 = v_u_16
	table.insert(v26, v34())
	if v_u_17() then
		local v35 = v_u_17
		table.insert(v26, v35())
	end
	if v_u_18() then
		local v36 = v_u_18
		table.insert(v26, v36())
	end
	if v_u_19() then
		local v37 = v_u_20
		table.insert(v26, v37())
	end
	if v_u_23 then
		local v38 = v_u_24
		table.insert(v26, v38)
		local v39 = v_u_25
		table.insert(v26, v39)
	end
	return v26
end