-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagChatTranslationWaitForIXP
game:DefineFastFlag("ChatTranslationWaitForIXP", false)
return function()
	return game:GetFastFlag("ChatTranslationWaitForIXP")
end