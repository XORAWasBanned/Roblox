-- Path: CoreGui.RobloxGui.Modules.Flags.getFFlagUseCameraDevicesListener
game:DefineFastFlag("UseCameraDevicesListener", false)
return function()
	return game:GetFastFlag("UseCameraDevicesListener")
end