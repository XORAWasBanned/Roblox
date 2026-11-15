-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagEnableUniveralVoiceToasts
game:DefineFastFlag("EnableUniveralVoiceToasts", false)
return function()
	return game:GetFastFlag("EnableUniveralVoiceToasts")
end