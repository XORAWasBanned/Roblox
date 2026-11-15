-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Actions.SetInspectMenuEnabled
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator("SET_INSPECT_MENU_ENABLED", function(p2)
	return {
		["enabled"] = p2
	}
end)