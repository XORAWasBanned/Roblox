-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Models.BundleInfo
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v_u_3 = require(v1.Packages.Dash)
local v_u_4 = require(v1.Workspace.Packages.AvatarExperienceFlags).FFlagAXMarketplaceLicensing
local v5 = script.Parent.Parent
local v_u_6 = require(v5.Constants)
require(v1.Workspace.Packages.AvatarExperienceInspectAndBuy)
local v7 = require(v1.Workspace.Packages.AvatarExperienceCommon)
local v_u_8 = v7.Enums.ItemRestrictions
local v_u_9 = v7.Utils.getRawItemLicensingInfo
local v_u_10 = v7.Utils.parseItemLicensing
local v_u_11 = require(script.Parent.Parent.MockId)
local v_u_77 = {
	["new"] = function() -- name: new
		return {}
	end,
	["mock"] = function() -- name: mock
		-- upvalues: (copy) v_u_77, (copy) v_u_11
		local v12 = v_u_77.new()
		v12.name = ""
		v12.bundleId = v_u_11()
		v12.description = ""
		v12.bundleType = ""
		v12.creatorId = ""
		v12.creatorName = ""
		v12.productId = ""
		v12.isForSale = false
		v12.price = ""
		v12.assetIds = {}
		v12.numFavorites = 0
		v12.costumeId = ""
		v12.owned = false
		v12.isForSale = false
		v12.collectibleItemId = ""
		v12.collectibleIsLimited = nil
		v12.collectibleProductId = ""
		v12.collectibleLowestResalePrice = 0
		v12.collectibleLowestAvailableResaleProductId = ""
		v12.collectibleLowestAvailableResaleItemInstanceId = ""
		v12.collectibleQuantityLimitPerUser = 0
		v12.remaining = 0
		v12.productType = ""
		return v12
	end,
	["fromBulkPurchaseResult"] = function(p13, p14) -- name: fromBulkPurchaseResult
		-- upvalues: (copy) v_u_77, (copy) v_u_8
		local v15 = v_u_77.new()
		local v16 = not (p14 and p14.itemRestrictions) and {} or p14.itemRestrictions
		v15.resellableCount = not (p14 and p14.resellableCount) and 0 or p14.resellableCount
		if p13.status == Enum.MarketplaceItemPurchaseStatus.Success and p13.type == Enum.MarketplaceProductType.AvatarBundle then
			v15.owned = true
			if v16[v_u_8.Collectible] or (v16[v_u_8.Limited] or v16[v_u_8.LimitedUnique]) then
				v15.resellableCount = v15.resellableCount + 1
			end
		end
		return v15
	end,
	["fromGetFavoriteForAsset"] = function(p17, p18) -- name: fromGetFavoriteForAsset
		-- upvalues: (copy) v_u_77
		local v19 = v_u_77.new()
		v19.bundleId = tostring(p17)
		v19.isFavorited = p18
		return v19
	end,
	["fromAvatarPreviewItem"] = function(p20) -- name: fromAvatarPreviewItem
		-- upvalues: (copy) v_u_77, (copy) v_u_4, (copy) v_u_10, (copy) v_u_9
		local v21 = v_u_77.new()
		v21.name = p20.name
		v21.description = p20.description
		v21.price = p20.priceInRobux
		v21.isForSale = p20.isPurchasable
		local v22 = p20.productId
		v21.productId = tostring(v22)
		v21.collectibleItemId = p20.collectibleItemId
		v21.collectibleProductId = p20.collectibleProductId
		v21.owned = p20.quantityOwned > 0
		v21.resellableCount = p20.quantityOwned
		local v23 = p20.creator.id
		v21.creatorId = tostring(v23)
		v21.creatorName = p20.creator.name
		v21.creatorHasVerifiedBadge = p20.creator.hasVerifiedBadge
		local v24 = p20.id
		v21.bundleId = tostring(v24)
		local v25 = p20.bundleType
		v21.bundleType = tostring(v25)
		v21.noPriceStatus = p20.noPriceStatus
		if v_u_4 then
			v21.itemLicensingInfo = v_u_10(v_u_9(p20))
		end
		local v26 = {}
		if p20.assetsInBundle then
			for _, v27 in p20.assetsInBundle do
				local v28 = {}
				local v29 = v27.id
				v28.id = tostring(v29)
				local v30 = v27.assetType
				v28.assetType = tostring(v30)
				v28.isIncluded = v27.isIncluded
				v28.meta = v27.meta
				table.insert(v26, v28)
			end
		end
		v21.assetsInBundle = v26
		if p20.itemRestrictions then
			local v31 = {}
			for _, v32 in p20.itemRestrictions do
				v31[v32] = true
			end
			v21.itemRestrictions = v31
		end
		return v21
	end,
	["fromGetAssetBundles"] = function(p33) -- name: fromGetAssetBundles
		-- upvalues: (copy) v_u_77, (copy) v_u_6
		local v34 = v_u_77.new()
		v34.name = p33.name
		local v35 = p33.id
		v34.bundleId = tostring(v35)
		v34.description = p33.description
		v34.bundleType = p33.bundleType
		local v36 = p33.creator.id
		v34.creatorId = tostring(v36)
		v34.creatorName = p33.creator.name
		local v37 = p33.product.id
		v34.productId = tostring(v37)
		if p33.collectibleItemDetail then
			v34.isForSale = p33.collectibleItemDetail.saleStatus == v_u_6.SaleStatus.OnSale
			v34.collectibleItemId = p33.collectibleItemDetail.collectibleItemId or ""
			v34.collectibleProductId = p33.collectibleItemDetail.collectibleProductId or ""
			v34.collectibleLowestResalePrice = p33.collectibleItemDetail.lowestResalePrice or 0
			v34.collectibleLowestAvailableResaleProductId = p33.collectibleItemDetail.lowestAvailableResaleProductId or ""
			v34.collectibleLowestAvailableResaleItemInstanceId = p33.collectibleItemDetail.lowestAvailableResaleItemInstanceId or ""
			v34.collectibleQuantityLimitPerUser = p33.collectibleItemDetail.quantityLimitPerUser or 0
			v34.productType = v_u_6.ProductType.CollectibleItem
			v34.price = p33.collectibleItemDetail.price
			v34.remaining = p33.collectibleItemDetail.unitsAvailable or 0
			v34.collectibleIsLimited = p33.collectibleItemDetail.collectibleItemType == "Limited"
			v34.saleLocation = p33.collectibleItemDetail.saleLocation
		end
		v34.assetIds = {}
		for _, v38 in pairs(p33.items) do
			if v38.type == "UserOutfit" then
				local v39 = v38.id
				v34.costumeId = tostring(v39)
			else
				local v40 = v34.assetIds
				local v41 = v38.id
				local v42 = tostring(v41)
				table.insert(v40, v42)
			end
		end
		return v34
	end,
	["fromGetItemDetailsV2"] = function(p43) -- name: fromGetItemDetailsV2
		-- upvalues: (copy) v_u_77, (copy) v_u_9, (copy) v_u_4, (copy) v_u_10, (copy) v_u_2
		local v44 = v_u_77.new()
		local v45 = p43.id
		v44.bundleId = tostring(v45)
		v44.isForSale = p43.isPurchasable
		v44.price = p43.price or 0
		v44.hasResellers = p43.hasResellers
		v44.collectibleItemId = p43.collectibleItemId
		v44.remaining = p43.unitsAvailableForConsumption
		v44.collectibleTotalQuantity = p43.totalQuantity
		v44.collectibleLowestResalePrice = p43.lowestResalePrice
		v44.isOffSale = p43.isOffSale
		v44.saleLocationType = p43.saleLocationType
		v44.numFavorites = p43.favoriteCount
		v44.catalogPriceStatus = p43.priceStatus
		local v46 = v_u_9(p43)
		if v_u_4 and v46 ~= nil then
			v44.itemLicensingInfo = v_u_10(v46) or v_u_2.None
		end
		local v47 = {}
		if p43.bundledItems then
			for _, v48 in p43.bundledItems do
				local v49 = {}
				local v50 = v48.id
				v49.id = tostring(v50)
				v49.name = v48.name
				table.insert(v47, v49)
			end
		end
		v44.assetsInBundle = v47
		return v44
	end,
	["fromGetItemDetails"] = function(p51) -- name: fromGetItemDetails
		-- upvalues: (copy) v_u_77
		local v52 = v_u_77.new()
		local v53 = p51.Id
		v52.bundleId = tostring(v53)
		v52.owned = p51.Owned
		v52.isForSale = p51.IsPurchasable
		v52.price = p51.Price or 0
		v52.hasResellers = p51.HasResellers
		v52.collectibleItemId = p51.CollectibleItemId
		v52.remaining = p51.UnitsAvailableForConsumption
		v52.collectibleTotalQuantity = p51.TotalQuantity
		v52.collectibleLowestResalePrice = p51.LowestResalePrice
		v52.isOffSale = p51.IsOffSale
		v52.saleLocationType = p51.SaleLocationType
		v52.numFavorites = p51.FavoriteCount
		v52.catalogPriceStatus = p51.PriceStatus
		local v54 = {}
		if p51.BundledItems then
			for _, v55 in p51.BundledItems do
				local v56 = {}
				local v57 = v55.Id
				v56.id = tostring(v57)
				v56.name = v55.Name
				table.insert(v54, v56)
			end
		end
		v52.assetsInBundle = v54
		return v52
	end,
	["fromGetBundleFavoriteCount"] = function(p58, p59) -- name: fromGetBundleFavoriteCount
		-- upvalues: (copy) v_u_77
		local v60 = v_u_77.new()
		v60.bundleId = tostring(p58)
		v60.numFavorites = p59
		return v60
	end,
	["fromGetEconomyProductInfo"] = function(p61, p62, p63, p64) -- name: fromGetEconomyProductInfo
		-- upvalues: (copy) v_u_77
		local v65 = v_u_77.new()
		v65.bundleId = tostring(p62)
		v65.owned = p61
		v65.price = p63
		v65.isForSale = p64
		return v65
	end,
	["fromPurchaseSuccess"] = function(p66) -- name: fromPurchaseSuccess
		-- upvalues: (copy) v_u_77
		local v67 = v_u_77.new()
		v67.bundleId = tostring(p66)
		v67.owned = true
		return v67
	end,
	["getSaleDetailsForCollectibles"] = function(p68) -- name: getSaleDetailsForCollectibles
		-- upvalues: (copy) v_u_3, (copy) v_u_6
		local v69 = v_u_3.joinDeep({}, p68)
		if p68.productType == v_u_6.ProductType.CollectibleItem then
			local v70 = v69.saleLocation
			local v71
			if v70 then
				v71 = v70.saleLocationTypeId ~= v_u_6.SaleLocationType.ShopOnly
			else
				v71 = v70
			end
			local v72
			if v70 then
				v72 = v70.saleLocationTypeId ~= v_u_6.SaleLocationType.ShopAndExperiencesById
			else
				v72 = v70
			end
			local v73
			if v70 then
				if v70.saleLocationTypeId == v_u_6.SaleLocationType.ShopAndExperiencesById then
					local v74 = v70.universeIds
					if type(v74) == "table" then
						v73 = table.find(v70.universeIds, game.GameId) ~= nil
					else
						v73 = false
					end
				else
					v73 = false
				end
			else
				v73 = v70
			end
			if v70 then
				v70 = v70.saleLocationTypeId ~= v_u_6.SaleLocationType.ExperiencesDevApiOnly
			end
			local v75 = v69.isForSale
			if v75 then
				if v71 then
					if not (v72 or v73) then
						v70 = v73
					end
				else
					v70 = v71
				end
			else
				v70 = v75
			end
			v69.isForSale = v70
			if not p68.collectibleIsLimited then
				local v76 = v69.isForSale
				if v76 then
					v76 = not v69.owned
				end
				v69.isForSale = v76
			end
		end
		return v69
	end
}
return v_u_77