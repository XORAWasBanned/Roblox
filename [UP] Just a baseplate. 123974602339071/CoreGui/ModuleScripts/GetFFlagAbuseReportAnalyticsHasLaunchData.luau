-- Path: CoreGui.RobloxGui.Modules.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData
game:DefineFastFlag("LuaAppAbuseReportAnalyticsHasLaunchData", false)
return function()
	return game:GetFastFlag("LuaAppAbuseReportAnalyticsHasLaunchData")
end