-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagMicConnectingToast
game:DefineFastFlag("MicConnectingToast", false)
return function()
	return game:GetFastFlag("MicConnectingToast")
end