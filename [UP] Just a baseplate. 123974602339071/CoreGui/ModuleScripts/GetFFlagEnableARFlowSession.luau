-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Flags.GetFFlagEnableARFlowSession
game:DefineFastFlag("EnableARFlowSession", false)
return function()
	return game:GetFastFlag("EnableARFlowSession")
end