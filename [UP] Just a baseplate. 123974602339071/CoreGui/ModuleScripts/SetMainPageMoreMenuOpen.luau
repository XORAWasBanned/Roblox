-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Actions.SetMainPageMoreMenuOpen
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator("SET_MORE_MENU_OPEN", function(p2)
	return {
		["isMainPageMoreMenuOpen"] = p2
	}
end)