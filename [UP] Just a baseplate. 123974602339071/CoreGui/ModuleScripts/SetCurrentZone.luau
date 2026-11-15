-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Actions.SetCurrentZone
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["zone"] = p2
	}
end)