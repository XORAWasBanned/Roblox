-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagBubbleVoiceIndicatorSetting
game:DefineFastFlag("BubbleVoiceIndicatorSetting", false)
return function()
	return game:GetFastFlag("BubbleVoiceIndicatorSetting")
end