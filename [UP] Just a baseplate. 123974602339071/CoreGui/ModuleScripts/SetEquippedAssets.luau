-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Actions.SetEquippedAssets
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["equippedAssets"] = p2
	}
end)