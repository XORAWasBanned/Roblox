-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovements
game:DefineFastFlag("EnableFeedbackShowSourceTextAndOtherUXImprovements", false)
return function()
	return game:GetFastFlag("EnableFeedbackShowSourceTextAndOtherUXImprovements")
end