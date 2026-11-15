-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Reducers.Favorites
local v1 = game:GetService("CorePackages")
local v2 = script.Parent
local v3 = require(v1.Packages.Rodux)
local v4 = {
	["assets"] = require(v2.FavoriteAssets),
	["bundles"] = require(v2.FavoriteBundles)
}
return v3.combineReducers(v4)