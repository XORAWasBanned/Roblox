-- Path: CoreGui.RobloxGui.Modules.Settings.Flags.GetFFlagCleanupMuteSelfButton
game:DefineFastFlag("CleanupMuteSelfButtonV3", false)
return function()
	return game:GetFastFlag("CleanupMuteSelfButtonV3")
end