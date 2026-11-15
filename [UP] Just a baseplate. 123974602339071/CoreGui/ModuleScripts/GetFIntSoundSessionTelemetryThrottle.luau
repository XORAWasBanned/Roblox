-- Path: CoreGui.RobloxGui.Modules.Flags.GetFIntSoundSessionTelemetryThrottle
game:DefineFastInt("SoundSessionTelemetryThrottle", 0)
return function()
	return game:GetFastInt("SoundSessionTelemetryThrottle")
end