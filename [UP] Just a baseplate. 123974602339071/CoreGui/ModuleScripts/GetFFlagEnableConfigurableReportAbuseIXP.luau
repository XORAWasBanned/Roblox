-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagEnableConfigurableReportAbuseIXP
game:DefineFastFlag("EnableConfigurableReportAbuseIXP", false)
return function()
	return game:GetFastFlag("EnableConfigurableReportAbuseIXP")
end