-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Reducers.Bundles
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v3 = require(v1.Packages.Rodux)
local v4 = script.Parent.Parent
local v5 = require(v4.Actions.SetBundles)
local v6 = require(v4.Actions.SetFavoriteBundle)
local v7 = require(v4.Actions.UpdateBulkPuchaseResults)
local v8 = require(v4.Actions.SetAvatarPreviewDetails)
local v_u_9 = require(v1.Workspace.Packages.AvatarExperienceModel).Enums.ItemTypeEnum
local v10 = require(v4.Flags.FFlagAXEnableFetchAvatarPreview)
local v11 = require(v1.Workspace.Packages.SharedFlags).FFlagAXEnableInspectAndBuyBulkPurchase
local v_u_12 = require(v4.Models.BundleInfo)
return v3.createReducer({}, {
	[v6.name] = function(p13, p14)
		-- upvalues: (copy) v_u_2, (copy) v_u_12
		local v15 = p13[p14.id] or {}
		local v16 = v_u_2.Dictionary.join({}, v15)
		p13[p14.id] = v_u_2.Dictionary.join(v16, v_u_12.fromGetFavoriteForAsset(p14.id, p14.isFavorite))
		return p13
	end,
	[v7.name] = v11 and function(p17, p18)
		-- upvalues: (copy) v_u_2, (copy) v_u_12
		for _, v19 in p18.result.Items do
			if v19.type ~= Enum.MarketplaceProductType.AvatarBundle then
				continue
			end
			local v20 = v_u_2.Dictionary.join({}, p17[v19.id])
			p17[v19.id] = v_u_2.Dictionary.join(v20, v_u_12.fromBulkPurchaseResult(v19, v20))
		end
		return p17
	end or nil,
	[v8.name] = v10 and function(p21, p22)
		-- upvalues: (copy) v_u_9, (copy) v_u_12, (copy) v_u_2
		local v23 = p22.avatarPreviewDetails.look
		local v24 = {}
		if v23.items then
			for _, v25 in v23.items do
				if v25.itemType ~= v_u_9.Bundle then
					continue
				end
				local v26 = v25.id
				v24[tostring(v26)] = v_u_12.fromAvatarPreviewItem(v25)
			end
		end
		return v_u_2.Dictionary.join(p21, v24)
	end or nil,
	[v5.name] = function(p27, p28)
		-- upvalues: (copy) v_u_2, (copy) v_u_12
		local v29 = {}
		for _, v30 in ipairs(p28.bundles) do
			local v31 = v30.bundleId ~= nil
			assert(v31, "Expected a bundle id when setting a bundle\'s information.")
			local v32 = p27[v30.bundleId] or {}
			if v30.assetsInBundle then
				local v33 = {}
				for _, v34 in v30.assetsInBundle do
					for _, v35 in v32.assetsInBundle or {} do
						if v35.id ~= v34.id then
							continue
						end
						local v36 = v_u_2.Dictionary.join(v35, v34)
						table.insert(v33, v36)
					end
				end
				v30.assetsInBundle = v33
			end
			v29[v30.bundleId] = v_u_2.Dictionary.join(v32, v30)
			if not v29[v30.bundleId] then
				continue
			end
			v29[v30.bundleId] = v_u_12.getSaleDetailsForCollectibles(v29[v30.bundleId])
		end
		return v_u_2.Dictionary.join(p27, v29)
	end
})