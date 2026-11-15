-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagChatTranslationSettingEnabled
game:DefineFastFlag("ChatTranslationSettingEnabled3", false)
return function()
	return game:GetFastFlag("ChatTranslationSettingEnabled3")
end