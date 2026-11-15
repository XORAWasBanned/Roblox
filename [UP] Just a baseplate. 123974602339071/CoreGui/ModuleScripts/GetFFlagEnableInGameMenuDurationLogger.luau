-- Path: CoreGui.RobloxGui.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger
game:DefineFastFlag("EnableInGameMenuDurationLogger", false)
return function()
	return game:GetFastFlag("EnableInGameMenuDurationLogger")
end