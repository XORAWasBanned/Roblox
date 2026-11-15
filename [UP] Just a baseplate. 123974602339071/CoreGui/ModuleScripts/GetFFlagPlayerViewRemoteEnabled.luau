-- Path: CoreGui.RobloxGui.Modules.Common.Flags.GetFFlagPlayerViewRemoteEnabled
game:DefineFastFlag("PlayerViewRemoteEnabled", false)
return function()
	return game:GetFastFlag("PlayerViewRemoteEnabled")
end