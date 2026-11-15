-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Flags.GetFFlagDisplayCollectiblesIcon
game:DefineFastFlag("DisplayCollectiblesIcon", false)
return function()
	return game:GetFastFlag("DisplayCollectiblesIcon")
end