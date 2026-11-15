-- Path: CoreGui.RobloxGui.Modules.TopBar.Flags.GetFFlagEnableTopBarAnalytics
game:DefineFastFlag("EnableTopBarAnalytics", false)
return function()
	return game:GetFastFlag("EnableTopBarAnalytics")
end