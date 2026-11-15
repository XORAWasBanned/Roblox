-- Path: CoreGui.RobloxGui.Modules.Flags.getFFlagAddApolloClientToExperienceChat
game:DefineFastFlag("AddApolloClientToExperienceChat", false)
return function()
	return game:GetFastFlag("AddApolloClientToExperienceChat")
end