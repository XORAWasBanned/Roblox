-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Actions.SetMenuOpen
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator("SET_MENU_OPEN", function(p2)
	return {
		["isMenuOpen"] = p2
	}
end)