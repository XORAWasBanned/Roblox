-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Actions.SetTryingOnInfo
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2, p3, p4)
	return {
		["tryingOn"] = p2,
		["assetId"] = p3,
		["assetTypeId"] = p4
	}
end)