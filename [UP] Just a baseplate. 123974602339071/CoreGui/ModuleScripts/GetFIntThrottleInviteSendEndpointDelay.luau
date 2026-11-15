-- Path: CoreGui.RobloxGui.Modules.Flags.GetFIntThrottleInviteSendEndpointDelay
game:DefineFastInt("LuaAppThrottleInviteSendEndpointDelay", 0.5)
return function()
	return game:GetFastInt("LuaAppThrottleInviteSendEndpointDelay")
end