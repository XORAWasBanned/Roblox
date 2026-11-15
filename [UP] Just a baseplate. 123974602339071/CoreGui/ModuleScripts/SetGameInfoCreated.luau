-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Actions.SetGameInfoCreated
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["Created"] = p2
	}
end)