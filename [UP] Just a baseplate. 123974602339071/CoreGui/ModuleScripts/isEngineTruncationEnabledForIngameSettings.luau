-- Path: CoreGui.RobloxGui.Modules.Flags.isEngineTruncationEnabledForIngameSettings
game:DefineFastFlag("EngineTruncationEnabledForIngameSettingsV2", false)
return function()
	return game:GetFastFlag("EngineTruncationEnabledForIngameSettingsV2")
end