-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Actions.CloseNativeClosePrompt
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator("CLOSE_NATIVE_PROMPT", function()
	return {}
end)