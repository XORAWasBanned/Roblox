-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Actions.SetLocale
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["locale"] = p2
	}
end)