-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagChatTranslationForceSetting
game:DefineFastFlag("ChatTranslationForceSetting", false)
return function()
	return game:GetFastFlag("ChatTranslationForceSetting")
end