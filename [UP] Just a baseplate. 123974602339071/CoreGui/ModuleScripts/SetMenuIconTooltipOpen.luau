-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Actions.SetMenuIconTooltipOpen
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator("SET_MENU_ICON_TOOLTIP_OPEN", function(p2)
	return {
		["menuIconTooltipOpen"] = p2
	}
end)