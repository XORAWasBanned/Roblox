-- Path: CoreGui.RobloxGui.Modules.Flags.GetFIntDebounceChatSummariesSettingDelay
game:DefineFastInt("DebounceChatSummariesSettingDelay", 1)
return function()
	return game:GetFastInt("DebounceChatSummariesSettingDelay")
end