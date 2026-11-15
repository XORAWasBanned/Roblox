-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Actions.SetView
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["view"] = p2
	}
end)