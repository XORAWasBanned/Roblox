-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagEnableVoiceChatVoiceUISync
game:DefineFastFlag("EnableVoiceChatVoiceUISync", false)
return function()
	return game:GetFastFlag("EnableVoiceChatVoiceUISync")
end