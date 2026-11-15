-- Path: CoreGui.RobloxGui.Modules.Settings.Flags.GetFFlagEnablePlayerNamesEnabledSetting
game:DefineFastFlag("EnablePlayerNamesEnabledSetting", false)
return function()
	local v1 = game:GetEngineFeature("EnablePlayerNamesEnabledSettingEngineFeature")
	if v1 then
		v1 = game:GetFastFlag("EnablePlayerNamesEnabledSetting")
	end
	return v1
end