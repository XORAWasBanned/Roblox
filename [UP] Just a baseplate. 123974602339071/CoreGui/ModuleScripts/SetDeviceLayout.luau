-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Actions.SetDeviceLayout
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["deviceLayout"] = p2
	}
end)