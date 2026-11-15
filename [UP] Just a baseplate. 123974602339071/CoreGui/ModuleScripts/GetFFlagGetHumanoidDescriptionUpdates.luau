-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Flags.GetFFlagGetHumanoidDescriptionUpdates
game:DefineFastFlag("GetHumanoidDescriptionUpdates", false)
return function()
	return game:GetFastFlag("GetHumanoidDescriptionUpdates")
end