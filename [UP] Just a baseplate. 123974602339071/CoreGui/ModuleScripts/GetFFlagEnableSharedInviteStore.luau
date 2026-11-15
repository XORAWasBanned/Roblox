-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagEnableSharedInviteStore
game:DefineFastFlag("EnableSharedInviteStore", false)
return function()
	return game:GetFastFlag("EnableSharedInviteStore")
end