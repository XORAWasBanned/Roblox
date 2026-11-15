-- Path: CoreGui.RobloxGui.Modules.Settings.Flags.GetFFlagFixIGMTabTransitions
game:DefineFastFlag("FixIGMTabTransitions", false)
return function()
	return game:GetFastFlag("FixIGMTabTransitions")
end