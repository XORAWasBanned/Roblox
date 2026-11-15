-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Models.AssetInfo
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v_u_3 = require(v1.Packages.Dash)
local v_u_4 = require(v1.Workspace.Packages.AvatarExperienceFlags).FFlagAXMarketplaceLicensing
local v5 = script.Parent.Parent
local v_u_6 = require(v5.MockId)
local v_u_7 = require(v5.Constants)
require(v1.Workspace.Packages.AvatarExperienceInspectAndBuy)
local v8 = require(v1.Workspace.Packages.AvatarExperienceCommon)
local v_u_9 = v8.Enums.ItemRestrictions
local v_u_10 = v8.Utils.getRawItemLicensingInfo
local v_u_11 = v8.Utils.parseItemLicensing
local v_u_12 = require(v5.Flags.GetFFlagIBEnableCollectiblesSystemSupport)
local v_u_103 = {
	["new"] = function() -- name: new
		return {}
	end,
	["mock"] = function() -- name: mock
		-- upvalues: (copy) v_u_103, (copy) v_u_6, (copy) v_u_12
		local v13 = v_u_103.new()
		v13.name = ""
		v13.assetId = v_u_6()
		v13.assetTypeId = ""
		v13.creatorId = ""
		v13.creatorName = ""
		v13.creatorHasVerifiedBadge = false
		v13.owned = false
		v13.isForSale = false
		v13.description = ""
		v13.price = ""
		v13.productId = ""
		v13.isLimited = false
		local v14
		if v_u_12() then
			v14 = false
		else
			v14 = nil
		end
		v13.isLimitedUnique = v14
		local v15
		if v_u_12() then
			v15 = false
		else
			v15 = nil
		end
		v13.collectibleIsLimited = v15
		v13.bundlesAssetIsIn = {}
		v13.parentBundleId = nil
		v13.numFavorites = 0
		v13.minimumMembershipLevel = 0
		v13.collectibleItemId = ""
		v13.collectibleProductId = ""
		v13.collectibleLowestResalePrice = 0
		v13.collectibleLowestAvailableResaleProductId = ""
		v13.collectibleLowestAvailableResaleItemInstanceId = ""
		v13.collectibleQuantityLimitPerUser = 0
		v13.remaining = 0
		v13.creatingUniverseId = nil
		return v13
	end,
	["fromBulkPurchaseResult"] = function(p16, p17) -- name: fromBulkPurchaseResult
		-- upvalues: (copy) v_u_103, (copy) v_u_9
		local v18 = v_u_103.new()
		local v19 = not (p17 and p17.itemRestrictions) and {} or p17.itemRestrictions
		v18.resellableCount = not (p17 and p17.resellableCount) and 0 or p17.resellableCount
		if p16.status == Enum.MarketplaceItemPurchaseStatus.Success and p16.type == Enum.MarketplaceProductType.AvatarAsset then
			v18.owned = true
			if v19[v_u_9.Collectible] or (v19[v_u_9.Limited] or v19[v_u_9.LimitedUnique]) then
				v18.resellableCount = v18.resellableCount + 1
			end
		end
		return v18
	end,
	["fromAvatarPreviewItem"] = function(p20) -- name: fromAvatarPreviewItem
		-- upvalues: (copy) v_u_103, (copy) v_u_4, (copy) v_u_11, (copy) v_u_10
		local v21 = v_u_103.new()
		v21.name = p20.name
		v21.description = p20.description
		v21.price = p20.priceInRobux
		local v22 = p20.productId
		v21.productId = tostring(v22)
		v21.collectibleItemId = p20.collectibleItemId
		v21.owned = p20.quantityOwned > 0
		v21.resellableCount = p20.quantityOwned
		local v23 = p20.creator.id
		v21.creatorId = tostring(v23)
		v21.creatorName = p20.creator.name
		v21.creatorHasVerifiedBadge = p20.creator.hasVerifiedBadge
		local v24 = p20.id
		v21.assetId = tostring(v24)
		local v25 = p20.assetType
		v21.assetTypeId = tostring(v25)
		local v26 = p20.productId
		v21.productId = tostring(v26)
		v21.isForSale = p20.isPurchasable
		v21.noPriceStatus = p20.noPriceStatus
		v21.meta = p20.meta
		if v_u_4 then
			v21.itemLicensingInfo = v_u_11(v_u_10(p20))
		end
		if p20.itemRestrictions then
			local v27 = {}
			for _, v28 in p20.itemRestrictions do
				v27[v28] = true
			end
			v21.itemRestrictions = v27
		end
		return v21
	end,
	["fromGetProductInfo"] = function(p29) -- name: fromGetProductInfo
		-- upvalues: (copy) v_u_103, (copy) v_u_7, (copy) v_u_12
		local v30 = v_u_103.new()
		v30.name = p29.Name
		v30.description = p29.Description
		v30.price = p29.PriceInRobux
		v30.productType = p29.ProductType
		v30.remaining = p29.Remaining
		local v31 = p29.Creator.Id
		v30.creatorId = tostring(v31)
		v30.creatorName = p29.Creator.Name
		local v32 = p29.AssetId
		v30.assetId = tostring(v32)
		local v33 = p29.AssetTypeId
		v30.assetTypeId = tostring(v33)
		local v34 = p29.ProductId
		v30.productId = tostring(v34)
		v30.isForSale = p29.IsForSale
		v30.canBeSoldInThisGame = p29.CanBeSoldInThisGame
		v30.saleLocation = p29.SaleLocation
		v30.remaining = p29.Remaining or 0
		if v30.productType == v_u_7.ProductType.CollectibleItem then
			v30.collectibleItemId = p29.CollectibleItemId or ""
			v30.collectibleProductId = p29.CollectibleProductId or ""
			if p29.CollectiblesItemDetails then
				v30.collectibleLowestResalePrice = p29.CollectiblesItemDetails.CollectibleLowestResalePrice or 0
				v30.collectibleLowestAvailableResaleProductId = p29.CollectiblesItemDetails.CollectibleLowestAvailableResaleProductId or ""
				v30.collectibleLowestAvailableResaleItemInstanceId = p29.CollectiblesItemDetails.CollectibleLowestAvailableResaleItemInstanceId or ""
				v30.collectibleQuantityLimitPerUser = p29.CollectiblesItemDetails.CollectibleQuantityLimitPerUser or 0
				v30.collectibleIsLimited = p29.CollectiblesItemDetails.IsLimited
			end
		end
		v30.creatorHasVerifiedBadge = p29.Creator.HasVerifiedBadge
		if not v_u_12() then
			v30.isLimited = p29.IsLimited or p29.IsLimitedUnique
			return v30
		end
		v30.isLimited = p29.IsLimited
		v30.isLimitedUnique = p29.IsLimitedUnique
		return v30
	end,
	["fromHumanoidDescription"] = function(p35) -- name: fromHumanoidDescription
		-- upvalues: (copy) v_u_103
		local v36 = v_u_103.new()
		v36.assetId = tostring(p35)
		return v36
	end,
	["fromHumanoidDescriptionAccessory"] = function(p37) -- name: fromHumanoidDescriptionAccessory
		-- upvalues: (copy) v_u_103
		local v38 = v_u_103.new()
		local v39 = p37.AssetId
		v38.assetId = tostring(v39)
		v38.meta = {}
		local v40 = v38.meta
		local v41 = {}
		local v42 = p37.Position.X * 100
		v41.x = math.round(v42) / 100
		local v43 = p37.Position.Y * 100
		v41.y = math.round(v43) / 100
		local v44 = p37.Position.Z * 100
		v41.z = math.round(v44) / 100
		v40.position = v41
		local v45 = v38.meta
		local v46 = {}
		local v47 = p37.Rotation.X * 100
		v46.x = math.round(v47) / 100
		local v48 = p37.Rotation.Y * 100
		v46.y = math.round(v48) / 100
		local v49 = p37.Rotation.Z * 100
		v46.z = math.round(v49) / 100
		v45.rotation = v46
		local v50 = v38.meta
		local v51 = {}
		local v52 = p37.Scale.X * 100
		v51.x = math.round(v52) / 100
		local v53 = p37.Scale.Y * 100
		v51.y = math.round(v53) / 100
		local v54 = p37.Scale.Z * 100
		v51.z = math.round(v54) / 100
		v50.scale = v51
		if p37.IsLayered then
			v38.meta.order = p37.Order
		end
		return v38
	end,
	["fromGetAssetBundles"] = function(p55, p56) -- name: fromGetAssetBundles
		-- upvalues: (copy) v_u_103
		local v57 = v_u_103.new()
		v57.assetId = tostring(p55)
		v57.bundlesAssetIsIn = p56
		return v57
	end,
	["fromGetFavoriteForAsset"] = function(p58, p59) -- name: fromGetFavoriteForAsset
		-- upvalues: (copy) v_u_103
		local v60 = v_u_103.new()
		v60.assetId = tostring(p58)
		v60.isFavorited = p59
		return v60
	end,
	["fromBundleInfo"] = function(p61, p62) -- name: fromBundleInfo
		-- upvalues: (copy) v_u_103, (copy) v_u_7
		local v63 = v_u_103.new()
		v63.assetId = tostring(p61)
		v63.parentBundleId = p62.bundleId
		v63.bundlesAssetIsIn = { p62.bundleId }
		v63.collectibleItemId = p62.collectibleItemId
		v63.collectibleProductId = p62.collectibleProductId
		v63.collectibleLowestResalePrice = p62.collectibleLowestResalePrice
		v63.collectibleLowestAvailableResaleProductId = p62.collectibleLowestAvailableResaleProductId
		v63.collectibleLowestAvailableResaleItemInstanceId = p62.collectibleLowestAvailableResaleItemInstanceId
		v63.collectibleQuantityLimitPerUser = p62.collectibleQuantityLimitPerUser
		v63.collectibleIsLimited = p62.collectibleIsLimited
		v63.isForSale = p62.isForSale
		v63.remaining = p62.remaining
		v63.owned = p62.owned
		if not v63.collectibleIsLimited then
			local v64 = v63.isForSale
			if v64 then
				v64 = not v63.owned
			end
			v63.isForSale = v64
		end
		v63.description = p62.description or ""
		v63.productType = v_u_7.ProductType.CollectibleItem
		if p62.price then
			v63.price = p62.price
		end
		return v63
	end,
	["fromGetAssetFavoriteCount"] = function(p65, p66) -- name: fromGetAssetFavoriteCount
		-- upvalues: (copy) v_u_103
		local v67 = v_u_103.new()
		v67.assetId = tostring(p65)
		v67.numFavorites = p66
		return v67
	end,
	["fromGetEconomyProductInfo"] = function(p68, p69, p70, p71, p72) -- name: fromGetEconomyProductInfo
		-- upvalues: (copy) v_u_103
		local v73 = v_u_103.new()
		local v74 = p68.assetId
		v73.assetId = tostring(v74)
		v73.owned = p69
		if p70 then
			v73.price = p70
		end
		v73.isForSale = p71
		v73.premiumPricing = p72
		return v73
	end,
	["fromGetItemDetailsV2"] = function(p75) -- name: fromGetItemDetailsV2
		-- upvalues: (copy) v_u_103, (copy) v_u_10, (copy) v_u_4, (copy) v_u_11, (copy) v_u_2
		local v76 = v_u_103.new()
		local v77 = p75.id
		v76.assetId = tostring(v77)
		v76.isForSale = p75.isPurchasable
		v76.price = p75.price or 0
		v76.hasResellers = p75.hasResellers
		v76.collectibleItemId = p75.collectibleItemId
		local v78 = {}
		if p75.itemRestrictions then
			for _, v79 in p75.itemRestrictions do
				v78[v79] = true
			end
			v76.itemRestrictions = v78
		end
		v76.saleLocationType = p75.saleLocationType
		v76.remaining = p75.unitsAvailableForConsumption
		v76.collectibleTotalQuantity = p75.totalQuantity
		v76.collectibleLowestResalePrice = p75.lowestResalePrice
		v76.isOffSale = p75.isOffSale
		v76.saleLocationType = p75.saleLocationType
		v76.numFavorites = p75.favoriteCount
		v76.catalogPriceStatus = p75.priceStatus
		v76.timedOptions = p75.timedOptions
		local v80 = v_u_10(p75)
		if v_u_4 and v80 ~= nil then
			v76.itemLicensingInfo = v_u_11(v80) or v_u_2.None
		end
		return v76
	end,
	["fromGetItemDetails"] = function(p81) -- name: fromGetItemDetails
		-- upvalues: (copy) v_u_103
		local v82 = v_u_103.new()
		local v83 = p81.Id
		v82.assetId = tostring(v83)
		v82.owned = p81.Owned
		v82.isForSale = p81.IsPurchasable
		v82.price = p81.Price or 0
		v82.hasResellers = p81.HasResellers
		v82.collectibleItemId = p81.CollectibleItemId
		local v84 = {}
		if p81.ItemRestrictions then
			for _, v85 in p81.ItemRestrictions do
				v84[v85] = true
			end
			v82.itemRestrictions = v84
		end
		v82.saleLocationType = p81.SaleLocationType
		v82.remaining = p81.UnitsAvailableForConsumption
		v82.collectibleTotalQuantity = p81.TotalQuantity
		v82.collectibleLowestResalePrice = p81.LowestResalePrice
		v82.isOffSale = p81.IsOffSale
		v82.saleLocationType = p81.SaleLocationType
		v82.numFavorites = p81.FavoriteCount
		v82.catalogPriceStatus = p81.PriceStatus
		v82.creatingUniverseId = p81.CreatingUniverseId
		return v82
	end,
	["fromPurchaseSuccess"] = function(p86) -- name: fromPurchaseSuccess
		-- upvalues: (copy) v_u_103
		local v87 = v_u_103.new()
		v87.assetId = tostring(p86)
		v87.owned = true
		return v87
	end,
	["fromGetVersionInfo"] = function(p88, p89) -- name: fromGetVersionInfo
		-- upvalues: (copy) v_u_103
		local v90 = v_u_103.new()
		v90.assetId = tostring(p88)
		local v91
		if p89.creatingUniverseId then
			local v92 = p89.creatingUniverseId
			v91 = tostring(v92)
		else
			v91 = nil
		end
		v90.creatingUniverseId = v91
		return v90
	end,
	["getSaleDetailsForCollectibles"] = function(p93) -- name: getSaleDetailsForCollectibles
		-- upvalues: (copy) v_u_3, (copy) v_u_7
		local v94 = v_u_3.joinDeep({}, p93)
		local v95 = p93.saleLocation
		if p93.productType == v_u_7.ProductType.CollectibleItem then
			local v96
			if v95 then
				v96 = v95.SaleLocationType ~= v_u_7.SaleLocationType.ShopOnly
			else
				v96 = v95
			end
			local v97
			if v95 then
				v97 = v95.SaleLocationType ~= v_u_7.SaleLocationType.ShopAndExperiencesById
			else
				v97 = v95
			end
			local v98
			if v95 then
				if v95.SaleLocationType == v_u_7.SaleLocationType.ShopAndExperiencesById then
					local v99 = v95.UniverseIds
					if type(v99) == "table" then
						v98 = table.find(v95.UniverseIds, game.GameId) ~= nil
					else
						v98 = false
					end
				else
					v98 = false
				end
			else
				v98 = v95
			end
			if v95 then
				v95 = v95.SaleLocationType ~= v_u_7.SaleLocationType.ExperiencesDevApiOnly
			end
			local v100 = p93.isForSale and p93.canBeSoldInThisGame
			if v100 then
				if v96 then
					if not (v97 or v98) then
						v95 = v98
					end
				else
					v95 = v96
				end
			else
				v95 = v100
			end
			v94.isForSale = v95
			if not p93.collectibleIsLimited then
				local v101 = v94.isForSale
				if v101 then
					v101 = not v94.owned
				end
				v94.isForSale = v101
				return v94
			end
		else
			local v102 = p93.isForSale
			if v102 then
				v102 = p93.canBeSoldInThisGame
			end
			v94.isForSale = v102
			if p93.canBeSoldInThisGame == nil then
				v94.isForSale = p93.isForSale
			end
		end
		return v94
	end
}
return v_u_103