-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Reducers.Assets
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v3 = require(v1.Packages.Rodux)
local v4 = script.Parent.Parent
local v_u_5 = require(v4.Models.AssetInfo)
local v6 = require(v4.Actions.SetAssets)
local v7 = require(v4.Actions.SetBundlesAssetIsPartOf)
local v8 = require(v4.Actions.SetAssetFromBundleInfo)
local v9 = require(v4.Actions.SetAvatarPreviewDetails)
local v10 = require(v4.Actions.SetFavoriteAsset)
local v11 = require(v4.Actions.UpdateBulkPuchaseResults)
local v_u_12 = require(v1.Workspace.Packages.AvatarExperienceModel).Enums.ItemTypeEnum
local v13 = require(v4.Flags.FFlagAXEnableFetchAvatarPreview)
local v14 = require(v1.Workspace.Packages.SharedFlags).FFlagAXEnableInspectAndBuyBulkPurchase
return v3.createReducer({}, {
	[v10.name] = function(p15, p16)
		-- upvalues: (copy) v_u_2, (copy) v_u_5
		local v17 = p15[p16.id] or {}
		local v18 = v_u_2.Dictionary.join({}, v17)
		p15[p16.id] = v_u_2.Dictionary.join(v18, v_u_5.fromGetFavoriteForAsset(p16.id, p16.isFavorite))
		return p15
	end,
	[v11.name] = v14 and function(p19, p20)
		-- upvalues: (copy) v_u_2, (copy) v_u_5
		for _, v21 in p20.result.Items do
			if v21.type ~= Enum.MarketplaceProductType.AvatarAsset then
				continue
			end
			local v22 = v_u_2.Dictionary.join({}, p19[v21.id])
			p19[v21.id] = v_u_2.Dictionary.join(v22, v_u_5.fromBulkPurchaseResult(v21, v22))
		end
		return p19
	end or nil,
	[v6.name] = function(p23, p24)
		-- upvalues: (copy) v_u_2, (copy) v_u_5
		local v25 = {}
		for _, v26 in ipairs(p24.assets) do
			local v27 = v26.assetId ~= nil
			assert(v27, "Expected an asset id when setting an asset\'s information.")
			local v28 = p23[v26.assetId] or {}
			v25[v26.assetId] = v_u_2.Dictionary.join(v28, v26)
			if not v25[v26.assetId] then
				continue
			end
			v25[v26.assetId] = v_u_5.getSaleDetailsForCollectibles(v25[v26.assetId])
		end
		return v_u_2.Dictionary.join(p23, v25)
	end,
	[v9.name] = v13 and function(p29, p30)
		-- upvalues: (copy) v_u_12, (copy) v_u_5, (copy) v_u_2
		local v31 = p30.avatarPreviewDetails.look
		if not v31.items then
			return p29
		end
		local v32 = {}
		for _, v33 in v31.items do
			if v33.itemType ~= v_u_12.Asset then
				continue
			end
			local v34 = v33.id
			v32[tostring(v34)] = v_u_5.fromAvatarPreviewItem(v33)
		end
		return v_u_2.Dictionary.join(p29, v32)
	end or nil,
	[v7.name] = function(p35, p36)
		-- upvalues: (copy) v_u_5, (copy) v_u_2
		local v37 = p36.assetId
		local v38 = tostring(v37)
		local v39 = p36.bundleIds
		local v40 = p35[v38] or {}
		local v41 = v_u_5.fromGetAssetBundles(v38, v39)
		local v42 = {
			[v38] = v_u_2.Dictionary.join(v40, v41)
		}
		return v_u_2.Dictionary.join(p35, v42)
	end,
	[v8.name] = function(p43, p44)
		-- upvalues: (copy) v_u_5, (copy) v_u_2
		local v45 = p44.bundleInfo
		local v46 = p44.assetId
		local v47 = tostring(v46)
		local v48 = p43[v47] or {}
		local v49 = v_u_5.fromBundleInfo(v47, v45)
		local v50 = {
			[v47] = v_u_2.Dictionary.join(v48, v49)
		}
		return v_u_2.Dictionary.join(p43, v50)
	end
})