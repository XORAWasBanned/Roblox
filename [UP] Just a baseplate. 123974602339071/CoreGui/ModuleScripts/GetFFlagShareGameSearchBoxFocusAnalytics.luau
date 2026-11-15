-- Path: CoreGui.RobloxGui.Modules.Settings.Flags.GetFFlagShareGameSearchBoxFocusAnalytics
game:DefineFastFlag("ShareGameSearchBoxFocusAnalytics", false)
return function()
	return game:GetFastFlag("ShareGameSearchBoxFocusAnalytics")
end