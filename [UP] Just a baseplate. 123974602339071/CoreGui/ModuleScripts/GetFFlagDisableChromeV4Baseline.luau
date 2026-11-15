-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagDisableChromeV4Baseline
game:DefineFastFlag("DisableChromeV4Baseline", false)
return function()
	return game:GetFastFlag("DisableChromeV4Baseline")
end