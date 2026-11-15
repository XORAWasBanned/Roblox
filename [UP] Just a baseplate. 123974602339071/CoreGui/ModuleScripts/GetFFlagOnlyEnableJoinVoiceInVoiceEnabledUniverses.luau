-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Flags.GetFFlagOnlyEnableJoinVoiceInVoiceEnabledUniverses
game:DefineFastFlag("OnlyEnableJoinVoiceInVoiceEnabledUniversesV2", false)
return function()
	return game:GetFastFlag("OnlyEnableJoinVoiceInVoiceEnabledUniversesV2")
end