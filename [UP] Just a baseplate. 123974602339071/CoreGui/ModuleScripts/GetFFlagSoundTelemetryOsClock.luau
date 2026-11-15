-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagSoundTelemetryOsClock
game:DefineFastFlag("SoundTelemetryOsClock", false)
return function()
	return game:GetFastFlag("SoundTelemetryOsClock")
end