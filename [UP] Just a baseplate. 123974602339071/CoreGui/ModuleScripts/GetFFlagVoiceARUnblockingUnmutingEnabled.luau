-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagVoiceARUnblockingUnmutingEnabled
game:DefineFastFlag("VoiceARUnblockingUnmutingEnabled", false)
return function()
	return game:GetFastFlag("VoiceARUnblockingUnmutingEnabled")
end