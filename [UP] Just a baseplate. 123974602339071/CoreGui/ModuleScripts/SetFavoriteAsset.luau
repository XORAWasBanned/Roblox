-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Actions.SetFavoriteAsset
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2, p3)
	return {
		["id"] = p2,
		["isFavorite"] = p3
	}
end)