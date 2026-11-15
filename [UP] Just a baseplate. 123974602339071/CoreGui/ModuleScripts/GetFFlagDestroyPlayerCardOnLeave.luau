-- Path: CoreGui.RobloxGui.Modules.Settings.Flags.GetFFlagDestroyPlayerCardOnLeave
game:DefineFastFlag("DestroyPlayerCardOnLeave", false)
return function()
	return game:GetFastFlag("DestroyPlayerCardOnLeave")
end