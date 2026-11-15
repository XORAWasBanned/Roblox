-- Path: CoreGui.RobloxGui.Modules.Settings.Flags.GetFFlagEnableConsoleJoinVoice
game:DefineFastFlag("EnableConsoleJoinVoiceV2", false)
return function()
	return game:GetFastFlag("EnableConsoleJoinVoiceV2")
end