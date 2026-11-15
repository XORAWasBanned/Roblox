-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagEnableSeamlessVoiceDataConsentToast
game:DefineFastFlag("EnableSeamlessVoiceDataConsentToast", false)
return function()
	return game:GetFastFlag("EnableSeamlessVoiceDataConsentToast")
end