-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagEnableVoicePromptReasonText
game:DefineFastFlag("EnableVoicePromptReasonText", false)
return function()
	return game:GetFastFlag("EnableVoicePromptReasonText")
end