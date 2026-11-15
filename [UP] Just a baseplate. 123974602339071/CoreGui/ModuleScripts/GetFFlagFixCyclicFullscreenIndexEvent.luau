-- Path: CoreGui.RobloxGui.Modules.Settings.Flags.GetFFlagFixCyclicFullscreenIndexEvent
game:DefineFastFlag("FixCyclicFullscreenIndexEvent", false)
return function()
	return game:GetFastFlag("FixCyclicFullscreenIndexEvent")
end