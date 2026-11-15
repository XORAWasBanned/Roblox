-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagDisableChromeV4ClosedSelfView
game:DefineFastFlag("DisableChromeV4ClosedSelfView", false)
return function()
	return game:GetFastFlag("DisableChromeV4ClosedSelfView")
end