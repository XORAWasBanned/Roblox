-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Flags.GetFFlagDisableConsentModalForExistingUsers
game:DefineFastFlag("DisableConsentModalForExistingUsers", false)
return function()
	return game:GetFastFlag("DisableConsentModalForExistingUsers")
end