-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Actions.SetAssetFromBundleInfo
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2, p3)
	return {
		["assetId"] = p2,
		["bundleInfo"] = p3
	}
end)