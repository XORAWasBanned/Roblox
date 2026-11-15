-- Path: CoreGui.RobloxGui.Modules.FTUX.Flags.GetFFlagDebugEnableVRFTUXExperienceInStudio
game:DefineFastFlag("DebugEnableVRFTUXExperienceInStudio", false)
return function()
	return game:GetFastFlag("DebugEnableVRFTUXExperienceInStudio")
end