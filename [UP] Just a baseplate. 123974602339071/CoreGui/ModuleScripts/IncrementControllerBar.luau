-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Actions.IncrementControllerBar
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator("INCREMENT_CONTROLLER_BAR_COUNT", function()
	return {}
end)