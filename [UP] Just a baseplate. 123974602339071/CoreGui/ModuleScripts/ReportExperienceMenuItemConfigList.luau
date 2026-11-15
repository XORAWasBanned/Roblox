-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.MenuConfigs.Experience.ReportExperienceMenuItemConfigList
local v1 = script:FindFirstAncestor("AbuseReportMenu")
require(v1.Components.Types)
local v2 = v1.MenuConfigs
local v3 = require(v2.Experience.OptionalAttachScreenshotMenuConfig)
local v4 = require(v2.Experience.AbuseReasonMenuConfig)
local v5 = require(v2.Experience.SubmitReportButtonMenuConfig)
return {
	v4,
	v3,
	require(v2.Experience.FreeFormCommentMenuConfig),
	v5
}