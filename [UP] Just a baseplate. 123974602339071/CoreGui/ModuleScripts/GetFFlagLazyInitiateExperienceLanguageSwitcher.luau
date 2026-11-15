-- Path: CoreGui.RobloxGui.Modules.Settings.Flags.GetFFlagLazyInitiateExperienceLanguageSwitcher
game:DefineFastFlag("LazyInitiateExperienceLanguageSwitcher", false)
return function()
	return game:GetFastFlag("LazyInitiateExperienceLanguageSwitcher")
end