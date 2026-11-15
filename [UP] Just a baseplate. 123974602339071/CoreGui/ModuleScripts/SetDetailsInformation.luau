-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Actions.SetDetailsInformation
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2, p3)
	return {
		["viewingDetails"] = p2,
		["assetId"] = p3
	}
end)