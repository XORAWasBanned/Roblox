-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagBubbleChatInexistantAdorneeFix
game:DefineFastFlag("BubbleChatInexistantAdorneeFix", false)
return function()
	return game:GetFastFlag("BubbleChatInexistantAdorneeFix")
end