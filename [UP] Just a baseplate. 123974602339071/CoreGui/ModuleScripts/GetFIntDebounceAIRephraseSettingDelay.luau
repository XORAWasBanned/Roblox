-- Path: CoreGui.RobloxGui.Modules.Flags.GetFIntDebounceAIRephraseSettingDelay
game:DefineFastInt("DebounceAIRephraseSettingDelay", 1)
return function()
	return game:GetFastInt("DebounceAIRephraseSettingDelay")
end