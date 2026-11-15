-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Actions.SetGameNameAndDescription
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2, p3)
	return {
		["gameName"] = p2,
		["gameDescription"] = p3
	}
end)