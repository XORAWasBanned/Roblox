-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Actions.SetControllerBarHeight
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator("SET_CONTROLLER_BAR_HEIGHT", function(p2)
	return {
		["controllerBarHeight"] = p2
	}
end)