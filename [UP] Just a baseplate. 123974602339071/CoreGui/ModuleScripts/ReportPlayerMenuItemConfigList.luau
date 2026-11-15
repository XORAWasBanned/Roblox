-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.MenuConfigs.Players.ReportPlayerMenuItemConfigList
local v1 = script:FindFirstAncestor("AbuseReportMenu")
require(v1.Components.Types)
local v2 = v1.MenuConfigs
local v3 = require(v2.Players.MethodOfAbuseModalMenuConfig)
local v4 = require(v2.Players.OptionalAttachScreenshotMenuConfig)
local v5 = require(v2.Players.PlayerModalSelectorMenuConfig)
local v6 = require(v2.Players.AbuseReasonModalSelectorMenuConfig)
local v7 = require(v2.Players.SubmitReportButtonMenuConfig)
return {
	v3,
	v5,
	v6,
	v4,
	require(v2.Players.FreeFormCommentMenuConfig),
	v7
}