-- Path: CoreGui.RobloxGui.Modules.PlayerList.Flags.FFlagLeaderstatsWithASideOfClient
if game:GetEngineFeature("CoreAttributes") then
	return game:DefineFastFlag("LeaderstatsWithASideOfClient", false)
else
	return false
end