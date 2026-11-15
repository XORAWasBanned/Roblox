-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Flags.isAbuseReportMenuOpenCloseSignalEnabled
game:DefineFastFlag("AbuseReportMenuOpenCloseSignal", false)
return function()
	if game:GetEngineFeature("AbuseReportMenuOpenCloseSignal") then
		return game:GetFastFlag("AbuseReportMenuOpenCloseSignal")
	else
		return false
	end
end