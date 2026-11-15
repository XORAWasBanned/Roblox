-- Path: CoreGui.RobloxGui.Modules.Flags.FFlagEnableVoiceChatStorybookFix
game:DefineFastFlag("EnableVoiceChatStorybookFix", false)
return function()
	return game:GetFastFlag("EnableVoiceChatStorybookFix")
end