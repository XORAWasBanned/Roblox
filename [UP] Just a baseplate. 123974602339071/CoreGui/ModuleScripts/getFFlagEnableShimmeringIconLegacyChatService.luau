-- Path: CoreGui.RobloxGui.Modules.Flags.getFFlagEnableShimmeringIconLegacyChatService
game:DefineFastFlag("EnableShimmeringIconLegacyChatService", false)
return function()
	return game:GetFastFlag("EnableShimmeringIconLegacyChatService")
end