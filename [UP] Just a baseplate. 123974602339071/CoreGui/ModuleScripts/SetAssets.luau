-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Actions.SetAssets
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["assets"] = p2
	}
end)