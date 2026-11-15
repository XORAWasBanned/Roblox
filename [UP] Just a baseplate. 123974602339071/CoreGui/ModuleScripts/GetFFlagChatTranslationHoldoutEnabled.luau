-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagChatTranslationHoldoutEnabled
game:DefineFastFlag("ChatTranslationHoldoutEnabled", false)
return function()
	return game:GetFastFlag("ChatTranslationHoldoutEnabled")
end