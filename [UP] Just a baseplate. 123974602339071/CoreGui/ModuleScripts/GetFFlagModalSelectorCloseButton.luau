-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Flags.GetFFlagModalSelectorCloseButton
game:DefineFastFlag("ModalSelectorCloseButton", false)
return function()
	return game:GetFastFlag("ModalSelectorCloseButton")
end