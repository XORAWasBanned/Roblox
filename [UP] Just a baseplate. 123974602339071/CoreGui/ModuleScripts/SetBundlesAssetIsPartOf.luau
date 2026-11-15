-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Actions.SetBundlesAssetIsPartOf
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2, p3)
	return {
		["assetId"] = p2,
		["bundleIds"] = p3
	}
end)