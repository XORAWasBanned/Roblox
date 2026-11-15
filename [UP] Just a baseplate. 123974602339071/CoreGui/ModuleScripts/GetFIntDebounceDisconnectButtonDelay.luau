-- Path: CoreGui.RobloxGui.Modules.Flags.GetFIntDebounceDisconnectButtonDelay
game:DefineFastInt("DebounceDisconnectButtonDelay", 1)
return function()
	return game:GetFastInt("DebounceDisconnectButtonDelay")
end