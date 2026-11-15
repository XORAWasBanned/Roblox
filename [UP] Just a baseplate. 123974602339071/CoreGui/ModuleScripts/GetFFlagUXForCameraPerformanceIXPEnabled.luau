-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagUXForCameraPerformanceIXPEnabled
game:DefineFastFlag("UXForCameraPerformanceIXPEnabled", false)
return function()
	return game:GetFastFlag("UXForCameraPerformanceIXPEnabled")
end