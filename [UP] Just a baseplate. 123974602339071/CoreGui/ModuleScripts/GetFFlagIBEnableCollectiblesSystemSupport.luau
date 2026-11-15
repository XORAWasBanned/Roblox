-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Flags.GetFFlagIBEnableCollectiblesSystemSupport
game:DefineFastFlag("IBEnableCollectiblesSystemSupport", false)
return function()
	return game:GetFastFlag("IBEnableCollectiblesSystemSupport")
end