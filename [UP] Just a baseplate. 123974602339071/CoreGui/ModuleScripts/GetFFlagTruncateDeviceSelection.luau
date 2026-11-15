-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Flags.GetFFlagTruncateDeviceSelection
game:DefineFastFlag("TruncateDeviceSelection", false)
return function()
	return game:GetFastFlag("TruncateDeviceSelection")
end