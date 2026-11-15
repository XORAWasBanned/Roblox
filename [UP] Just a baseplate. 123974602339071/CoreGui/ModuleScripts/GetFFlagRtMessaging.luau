-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagRtMessaging
game:DefineFastFlag("RtMessaging", false)
return function()
	return game:GetFastFlag("RtMessaging")
end