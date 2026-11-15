-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagNewEventIngestPlayerScriptsDimensions
game:DefineFastFlag("NewEventIngestPlayerScriptsDimensions", false)
return function()
	return game:GetFastFlag("NewEventIngestPlayerScriptsDimensions")
end