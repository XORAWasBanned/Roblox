-- Path: CoreGui.RobloxGui.Modules.Settings.Flags.GetFFlagDefaultFriendingLabelTextNonEmpty
game:DefineFastFlag("DefaultFriendingLabelTextNonEmpty", false)
return function()
	return game:GetFastFlag("DefaultFriendingLabelTextNonEmpty")
end