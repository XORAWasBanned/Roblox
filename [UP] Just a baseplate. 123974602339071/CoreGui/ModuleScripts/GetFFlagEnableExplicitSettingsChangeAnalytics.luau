-- Path: CoreGui.RobloxGui.Modules.Settings.Flags.GetFFlagEnableExplicitSettingsChangeAnalytics
game:DefineFastFlag("EnableExplicitSettingsChangeAnalytics", false)
return function()
	return game:GetFastFlag("EnableExplicitSettingsChangeAnalytics")
end