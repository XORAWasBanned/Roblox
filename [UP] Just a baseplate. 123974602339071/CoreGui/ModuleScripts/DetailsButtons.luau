-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.DetailsButtons
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("Players")
local v4 = script.Parent.Parent
local v_u_5 = require(v1.Packages.Roact)
local v6 = require(v1.Packages.RoactRodux)
local v_u_7 = require(v4.Constants)
local v_u_8 = require(v4.UtilityFunctions)
local v_u_9 = require(v4.Components.FavoritesButton)
local v_u_10 = require(v4.Components.TryOnButton)
local v_u_11 = require(v4.Components.BuyButton)
local v_u_12 = require(v4.Components.InspectAndBuyControllerBar)
local v_u_13 = require(v4.Selectors.GetIsFavorite)
local v_u_14 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_15 = require(v1.Packages.tutils)
local v_u_16 = require(v4.Flags.GetFFlagIBGateUGC4ACollectibleAssetsBundles)
local v_u_17 = require(v4.Flags.GetFFlagIBEnableCollectiblesSystemSupport)
local v18 = v_u_5.PureComponent:extend("DetailsButtons")
local function v_u_25(p19, p20, p21, p22) -- name: getBuyText
	-- upvalues: (copy) v_u_17, (copy) v_u_14, (copy) v_u_7, (copy) v_u_3
	local v23 = nil
	local v24 = not p19.isLimited and v_u_17()
	if v24 then
		v24 = p19.isLimitedUnique
	end
	if p22 then
		return v_u_14:FormatByKeyForLocale("InGame.InspectMenu.Action.FromResale", p20, {
			["PRICE"] = tostring(p22)
		})
	end
	if p21 and p19.isForSale then
		return v_u_14:FormatByKeyForLocale("InGame.InspectMenu.Action.LimitReached", p20)
	end
	if p19.price ~= nil and (p19.productType == v_u_7.ProductType.CollectibleItem and p19.isForSale) then
		return p19.price
	end
	if p19.owned then
		return v_u_14:FormatByKeyForLocale("InGame.InspectMenu.Label.Owned", p20)
	end
	if v24 then
		return v_u_14:FormatByKeyForLocale("InGame.InspectMenu.Label.Limited", p20)
	end
	if not (p19.isForSale or v24) then
		return v_u_14:FormatByKeyForLocale("InGame.InspectMenu.Label.Offsale", p20)
	end
	if p19.isForSale then
		if p19.premiumPricing ~= nil then
			if v_u_3.LocalPlayer.MembershipType == Enum.MembershipType.Premium then
				return p19.premiumPricing.premiumPriceInRobux
			elseif p19.price == nil then
				return v_u_14:FormatByKeyForLocale("InGame.InspectMenu.Label.PremiumOnly", p20)
			else
				return p19.price
			end
		end
		v23 = p19.price
	end
	return v23
end
function v18.init(p26) -- name: init
	-- upvalues: (copy) v_u_5
	p26.tryOnButtonRef = v_u_5.createRef()
	p26.buyButtonRef = v_u_5.createRef()
	p26.favoriteButtonRef = v_u_5.createRef()
end
function v18.didUpdate(p27, p28) -- name: didUpdate
	-- upvalues: (copy) v_u_2
	local v29 = p27.props.detailsInformation
	local v30 = p27.props.gamepadEnabled
	if v29.viewingDetails then
		if v30 and p27.props.visible then
			v_u_2.SelectedCoreObject = p27.favoriteButtonRef.current
		end
	elseif p27.props.assetInfo.bundlesAssetIsIn == nil and (v29.viewingDetails and v30) then
		v_u_2.SelectedCoreObject = nil
	end
	local v31 = p27.props.overlay
	local v32 = p28.overlay
	if v30 and (v31 and (v31.overlay == nil and (v32 and v32.overlay ~= nil))) then
		v_u_2.SelectedCoreObject = p27.tryOnButtonRef.current
	end
end
function v18.calculateBuyStatusForLimitedItem(p33, p34, p35, _) -- name: calculateBuyStatusForLimitedItem
	-- upvalues: (copy) v_u_8, (copy) v_u_15, (copy) v_u_3, (copy) v_u_25, (copy) v_u_7
	local v36 = v_u_8.isLimited2Point0_Or_LimitedCollectible(p34)
	local v37 = v_u_8.isLimited1Point0(p34) or v_u_8.isLimited1Point0_LimitedUnique(p34)
	local v38 = nil
	local v39 = nil
	local v40 = nil
	local v41 = nil
	local v42 = nil
	local v43
	if v36 then
		v43 = p34.isForSale
		local v44 = p33.props.resellableInstances
		v38 = v44 and v44[p34.collectibleItemId]
		if v38 then
			v38 = v_u_15.fieldCount(v44[p34.collectibleItemId])
		end
		if v38 then
			if p34.collectibleQuantityLimitPerUser == nil or p34.collectibleQuantityLimitPerUser <= 0 then
				v38 = false
			else
				v38 = p34.collectibleQuantityLimitPerUser <= v38
			end
		end
		local v45 = p34.collectibleLowestAvailableResaleProductId
		if v45 then
			v45 = p34.collectibleLowestAvailableResaleProductId ~= ""
		end
		local v46
		if p34.remaining > 0 then
			if v45 then
				v46 = (p34.price or 0) > p34.collectibleLowestResalePrice
			else
				v46 = v45
			end
		elseif v45 then
			v46 = p34.collectibleLowestResalePrice
		else
			v46 = v45
		end
		if v45 then
			if not v43 or (v38 or v46) then
				v39 = p34.collectibleLowestResalePrice
				v40 = p34.collectibleLowestAvailableResaleItemInstanceId
				v41 = p34.collectibleLowestAvailableResaleProductId
				v42 = p34.collectibleItemId
				v43 = true
			end
		elseif v38 then
			v43 = false
		end
	else
		v43 = p34.isForSale
		if v43 then
			v43 = not p34.owned
			if v43 then
				v43 = not v37
			end
		end
	end
	if v43 and (p34.price == nil and p34.premiumPricing ~= nil) then
		v43 = v_u_3.LocalPlayer.MembershipType == Enum.MembershipType.Premium
	end
	local v47 = v_u_25(p34, p35, v38, v39)
	local v48
	if p34.price == nil or (p34.owned or not v43) then
		if v39 == nil then
			if p34.price == nil then
				v48 = false
			elseif p34.productType == v_u_7.ProductType.CollectibleItem then
				v48 = v43
			else
				v48 = false
			end
		else
			v48 = true
		end
	else
		v48 = v43
	end
	return {
		["buyText"] = v47,
		["showRobuxIcon"] = v48,
		["forSale"] = v43,
		["collectibleQuantityLimitReached"] = v38,
		["collectibleLowestResalePrice"] = v39,
		["collectibleLowestAvailableResaleItemInstanceId"] = v40,
		["collectibleLowestAvailableResaleProductId"] = v41,
		["collectibleItemId"] = v42
	}
end
function v18.render(p49) -- name: render
	-- upvalues: (copy) v_u_8, (copy) v_u_7, (copy) v_u_16, (copy) v_u_5, (copy) v_u_12, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11
	local v50 = p49.props.locale
	local v51 = p49.props.assetInfo
	local v52 = nil
	local v53 = nil
	local v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64
	if v51 then
		v54 = v51.parentBundleId ~= nil
		if v54 then
			v55 = not v51.isForSale
		else
			v55 = v54
		end
		if v54 then
			v53 = v_u_8.getBundleId(v51)
			v56 = v_u_7.ItemType.Bundle
			v57 = v53
		else
			v56 = v_u_7.ItemType.Asset
			v57 = v51.assetId
		end
		local v65 = p49:calculateBuyStatusForLimitedItem(v51, v50, v52)
		v58 = v65.buyText
		v59 = v65.showRobuxIcon
		v52 = v65.forSale
		local _ = v65.collectibleQuantityLimitReached
		v60 = v65.collectibleLowestResalePrice
		v61 = v65.collectibleLowestAvailableResaleProductId
		v62 = v65.collectibleLowestAvailableResaleItemInstanceId
		v63 = v65.collectibleItemId
		local v66 = v51.assetTypeId
		local v67 = v_u_7.AnimationAssetTypes[v66] ~= nil
		if v_u_7.AssetTypeIdStringToHumanoidDescriptionProp[v51.assetTypeId] == nil and v_u_7.AssetTypeIdToAccessoryTypeEnum[v51.assetTypeId] == nil then
			v64 = false
		else
			v64 = not v67
		end
	else
		v61 = nil
		v57 = nil
		v59 = false
		v58 = nil
		v56 = nil
		v64 = false
		v63 = nil
		v62 = nil
		v54 = nil
		v55 = nil
		v60 = nil
	end
	local v68
	if v_u_16() then
		v68 = v_u_8.isUnlimitedCollectibleAsset(v56, v51) or (v_u_8.isLimitedBundle(v56, v51) or v_u_8.isUnlimitedCollectibleBundle(v56, v51))
	else
		v68 = nil
	end
	if v51 then
		v63 = v51.collectibleItemId
		local v69 = p49.props.assetBundles[v51.assetId]
		if v54 then
			v54 = #v69 > 1
		end
	else
		v54 = v68
	end
	local v70 = p49.props.detailsInformation.viewingDetails
	if v70 then
		v70 = p49.props.gamepadEnabled
	end
	local v71 = v_u_5.createElement
	local v72 = "Frame"
	local v73 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 51),
		["Position"] = UDim2.new(0, 0, 1, -51)
	}
	local v74 = {
		["UIListLayout"] = v_u_5.createElement("UIListLayout", {
			["Padding"] = UDim.new(0, 10),
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	if v70 then
		v70 = v_u_5.createElement(v_u_12, {
			["showTryOn"] = nil,
			["tryingOn"] = nil,
			["showFavorite"] = true,
			["isFavorited"] = nil,
			["showTryOn"] = v64,
			["tryingOn"] = p49.props.tryingOn,
			["isFavorited"] = p49.props.isFavorited
		})
	end
	v74.ControllerBar = v70
	v74.FavoriteButton = v_u_5.createElement(v_u_9, {
		["favoriteButtonRef"] = p49.favoriteButtonRef
	})
	v74.TryOnButton = v_u_5.createElement(v_u_10, {
		["showTryOn"] = v64,
		["assetInfo"] = v51,
		["partOfBundleAndOffsale"] = v55,
		["bundleId"] = v53,
		["tryOnButtonRef"] = p49.tryOnButtonRef,
		["localPlayerModel"] = p49.props.localPlayerModel
	})
	v74.TryOnFiller = v_u_5.createElement("ImageLabel", {
		["AnchorPoint"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Visible"] = nil,
		["LayoutOrder"] = 2,
		["Image"] = "",
		["ScaleType"] = nil,
		["SliceCenter"] = nil,
		["AnchorPoint"] = Vector2.new(0.5, 0),
		["Size"] = UDim2.new(0.5, -32, 0, 44),
		["Visible"] = not v64,
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = Rect.new(5, 5, 120, 20)
	})
	local v75
	if v_u_16() and v54 then
		v75 = nil
	else
		v75 = v_u_5.createElement(v_u_11, {
			["itemType"] = v56,
			["itemId"] = v57,
			["showRobuxIcon"] = v59,
			["forSale"] = v52,
			["buyText"] = v58,
			["buyButtonRef"] = p49.buyButtonRef,
			["collectibleItemId"] = v63,
			["collectibleLowestAvailableResaleProductId"] = v61,
			["collectibleLowestAvailableResaleItemInstanceId"] = v62,
			["collectibleLowestResalePrice"] = v60
		})
	end
	v74.BuyButton = v75
	return v71(v72, v73, v74)
end
return v6.UNSTABLE_connect2(function(p76, _)
	-- upvalues: (copy) v_u_13
	local v77 = p76.detailsInformation.assetId
	local v78 = v_u_13(p76)
	return {
		["visible"] = p76.visible,
		["assetInfo"] = p76.assets[v77] or {},
		["assetBundles"] = p76.assetBundles,
		["detailsInformation"] = p76.detailsInformation,
		["bundleInfo"] = p76.bundles,
		["locale"] = p76.locale,
		["gamepadEnabled"] = p76.gamepadEnabled,
		["isFavorited"] = v78,
		["tryingOn"] = p76.tryingOnInfo.tryingOn,
		["resellableInstances"] = p76.collectibleResellableInstances,
		["overlay"] = p76.overlay
	}
end)(v18)