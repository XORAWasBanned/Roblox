-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Actions.DecrementControllerBar
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator("DECREMENT_CONTROLLER_BAR_COUNT", function()
	return {}
end)