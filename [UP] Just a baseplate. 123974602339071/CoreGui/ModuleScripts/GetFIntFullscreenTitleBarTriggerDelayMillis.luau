-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Flags.GetFIntFullscreenTitleBarTriggerDelayMillis
game:DefineFastInt("FullscreenTitleBarTriggerDelayMillis", 0)
return function()
	local v1 = game:GetFastInt("FullscreenTitleBarTriggerDelayMillis")
	return v1 < 0 and 0 or v1
end