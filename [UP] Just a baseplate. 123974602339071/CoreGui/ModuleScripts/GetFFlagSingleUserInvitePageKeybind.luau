-- Path: CoreGui.RobloxGui.Modules.Settings.Flags.GetFFlagSingleUserInvitePageKeybind
game:DefineFastFlag("SingleUserInvitePageKeybind", false)
return function()
	return game:GetFastFlag("SingleUserInvitePageKeybind")
end