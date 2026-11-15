-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Flags.GetFFlagFixFullscreenTitleBarPromiseCancel
game:DefineFastFlag("FixFullscreenTitleBarPromiseCancel", false)
return function()
	return game:GetFastFlag("FixFullscreenTitleBarPromiseCancel")
end