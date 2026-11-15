-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagVoiceChatUILogging
game:DefineFastFlag("VoiceChatUILogging", false)
return function()
	return game:GetFastFlag("VoiceChatUILogging")
end