-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Actions.SetScreenSize
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator("SET_SCREEN_SIZE", function(p2)
	return {
		["newScreenSize"] = p2
	}
end)