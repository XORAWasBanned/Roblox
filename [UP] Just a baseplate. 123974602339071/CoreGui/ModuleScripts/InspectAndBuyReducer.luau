-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Reducers.InspectAndBuyReducer
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.Http).Reducers.FetchingStatus
local v3 = script.Parent
local v4 = require(v1.Packages.Rodux)
local v5 = require(v3.View)
local v6 = require(v3.PlayerId)
local v7 = require(v3.PlayerName)
local v8 = require(v3.Assets)
local v9 = require(v3.AssetBundles)
local v10 = require(v3.Bundles)
local v11 = require(v3.EquippedAssets)
local v12 = require(v3.DetailsInformation)
local v13 = require(v3.TryingOnInfo)
local v14 = require(v3.Favorites)
local v15 = require(v3.Locale)
local v16 = require(v3.Visible)
local v17 = require(v3.ItemBeingPurchased)
local v18 = require(v3.IsLoaded)
local v19 = require(v3.IsSubjectToChinaPolicies)
local v20 = require(v3.GamepadEnabled)
local v21 = require(v3.StoreId)
local v22 = require(v3.CollectibleResellableInstances)
local v23 = require(v3.CreatingExperiences)
local v24 = require(v3.Overlay)
local v25 = script.Parent.Parent
local v26 = require(v25.Flags.FFlagAXEnableFetchAvatarPreview)
local v27 = require(v3.AvatarPreviewDetails)
local v28 = v4.combineReducers
local v29 = {
	["view"] = v5,
	["playerId"] = v6,
	["playerName"] = v7,
	["assets"] = v8
}
if not v26 then
	v27 = nil
end
v29.avatarPreviewDetails = v27
v29.bundles = v10
v29.assetBundles = v9
v29.equippedAssets = v11
v29.detailsInformation = v12
v29.tryingOnInfo = v13
v29.favorites = v14
v29.locale = v15
v29.visible = v16
v29.itemBeingPurchased = v17
v29.gamepadEnabled = v20
v29.isLoaded = v18
v29.isSubjectToChinaPolicies = v19
v29.FetchingStatus = v2
v29.storeId = v21
v29.collectibleResellableInstances = v22
v29.creatingExperiences = v23
v29.overlay = v24
return v28(v29)