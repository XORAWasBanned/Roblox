-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagChatTranslationNewDefaults
game:DefineFastFlag("ChatTranslationNewDefaults", false)
return function()
	return game:GetFastFlag("ChatTranslationNewDefaults")
end