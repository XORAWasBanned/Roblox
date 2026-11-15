-- Path: CoreGui.RobloxGui.Modules.Flags.getFFlagEnableAnalyticsForCameraDevicePermissions
game:DefineFastFlag("EnableAnalyticsForCameraDevicePermissions", false)
return function()
	return game:GetFastFlag("EnableAnalyticsForCameraDevicePermissions")
end