-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Actions.SetRespawning
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator("SET_RESPAWNING", function(p2)
	return {
		["respawning"] = p2
	}
end)