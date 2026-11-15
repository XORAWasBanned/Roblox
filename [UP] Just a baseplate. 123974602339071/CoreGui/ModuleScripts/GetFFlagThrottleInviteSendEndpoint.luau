-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagThrottleInviteSendEndpoint
game:DefineFastFlag("LuaAppThrottleInviteSendEndpoint", false)
return function()
	return game:GetFastFlag("LuaAppThrottleInviteSendEndpoint")
end