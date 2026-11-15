-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Flags.GetFFlagFullscreenTitleBarInjectGameServices
game:DefineFastFlag("FullscreenTitleBarInjectGameServices", false)
return function()
	return game:GetFastFlag("FullscreenTitleBarInjectGameServices")
end