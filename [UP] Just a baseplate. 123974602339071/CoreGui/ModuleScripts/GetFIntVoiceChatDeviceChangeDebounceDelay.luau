-- Path: CoreGui.RobloxGui.Modules.Flags.GetFIntVoiceChatDeviceChangeDebounceDelay
game:DefineFastInt("VoiceChatDeviceChangeDebounceDelay", 0.5)
return function()
	return game:GetFastInt("VoiceChatDeviceChangeDebounceDelay")
end