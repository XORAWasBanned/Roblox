-- Path: CoreGui.RobloxGui.Modules.Settings.Flags.GetFFlagReportAbuseMenuEntrypointAnalytics
game:DefineFastFlag("ReportAbuseMenuEntrypointAnalytics", false)
return function()
	return game:GetFastFlag("ReportAbuseMenuEntrypointAnalytics")
end