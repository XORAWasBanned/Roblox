-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Actions.SetRespawnBehavior
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator("SET_RESPAWN_BEHAVIOR", function(p2, p3)
	return {
		["respawnEnabled"] = p2,
		["customCallback"] = p3
	}
end)