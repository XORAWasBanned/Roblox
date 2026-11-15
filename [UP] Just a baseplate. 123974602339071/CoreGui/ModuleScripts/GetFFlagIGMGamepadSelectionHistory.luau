-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Flags.GetFFlagIGMGamepadSelectionHistory
game:DefineFastFlag("IGMGamepadSelectionHistory", true)
return function()
	return game:GetFastFlag("IGMGamepadSelectionHistory")
end