-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagLazyPerfStatsInit
game:DefineFastFlag("LazyPerfStatsInit", false)
return function()
	return game:GetFastFlag("LazyPerfStatsInit")
end