-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagEnableVoiceMuteAnalytics
game:DefineFastFlag("EnableVoiceMuteAnalytics", false)
return function()
	return game:GetFastFlag("EnableVoiceMuteAnalytics")
end