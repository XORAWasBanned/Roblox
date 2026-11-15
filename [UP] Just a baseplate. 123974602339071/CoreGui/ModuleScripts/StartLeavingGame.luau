-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Actions.StartLeavingGame
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator("START_LEAVING_GAME", function()
	return {}
end)