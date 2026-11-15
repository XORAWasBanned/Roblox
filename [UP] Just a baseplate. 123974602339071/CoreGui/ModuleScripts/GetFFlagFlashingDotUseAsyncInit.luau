-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagFlashingDotUseAsyncInit
game:DefineFastFlag("FlashingDotUseAsyncInit", false)
return function()
	return game:GetFastFlag("FlashingDotUseAsyncInit")
end