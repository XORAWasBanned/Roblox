-- Path: CoreGui.RobloxGui.Modules.Flags.GetFIntPlayerViewRemoteEventTimeout
game:DefineFastInt("PlayerViewRemoteEventTimeout", 5)
return function()
	return game:GetFastInt("PlayerViewRemoteEventTimeout")
end