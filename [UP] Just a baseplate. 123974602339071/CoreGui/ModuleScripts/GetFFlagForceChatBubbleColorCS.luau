-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagForceChatBubbleColorCS
game:DefineFastFlag("ForceChatBubbleColorCS", true)
return function()
	return game:GetFastFlag("ForceChatBubbleColorCS")
end