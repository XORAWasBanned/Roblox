-- Path: CoreGui.RobloxGui.Modules.Common.Flags.GetFFlagEnableVoiceDefaultServerScript
game:DefineFastFlag("EnableVoiceDefaultServerScript", false)
return function()
	return game:GetFastFlag("EnableVoiceDefaultServerScript")
end