-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Actions.CancelLeavingGame
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator("CANCEL_LEAVING_GAME", function()
	return {}
end)