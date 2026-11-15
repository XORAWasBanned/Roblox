-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagPauseMuteFix
game:DefineFastFlag("PauseMuteFixV2", false)
return function()
	return game:GetFastFlag("PauseMuteFixV2")
end