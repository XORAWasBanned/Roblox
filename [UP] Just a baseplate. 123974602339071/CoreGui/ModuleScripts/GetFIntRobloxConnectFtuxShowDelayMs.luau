-- Path: CoreGui.RobloxGui.Modules.Chrome.Flags.GetFIntRobloxConnectFtuxShowDelayMs
game:DefineFastInt("RobloxConnectFtuxShowDelayMs", 3000)
return function()
	return game:GetFastInt("RobloxConnectFtuxShowDelayMs")
end