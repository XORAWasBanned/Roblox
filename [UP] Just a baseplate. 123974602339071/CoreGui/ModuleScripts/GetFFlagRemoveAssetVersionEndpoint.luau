-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagRemoveAssetVersionEndpoint
game:DefineFastFlag("RemoveAssetVersionEndpoint", false)
return function()
	return game:GetFastFlag("RemoveAssetVersionEndpoint")
end