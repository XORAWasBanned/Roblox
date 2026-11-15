-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Services.Network
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("MarketplaceService")
local v_u_3 = game:GetService("Players")
local v_u_4 = game:GetService("HttpService")
local v_u_5 = require(v1.Packages.Promise)
local v_u_6 = game:GetService("AvatarEditorService")
local v_u_7 = require(v1.Workspace.Packages.Http).Url
require(v1.Packages.LuauPolyfill)
require(v1.Workspace.Packages.AvatarExperienceInspectAndBuy)
local v_u_8 = string.format("https://develop.%s", v_u_7.DOMAIN)
local v_u_9 = game:DefineFastFlag("AXEnableIaBRbxClientFeature", false)
local v_u_10 = game:DefineFastString("InspectAndBuyFeature", "InspectAndBuy")
local function v_u_25(p_u_11, p_u_12) -- name: createYieldingPromise
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_5, (copy) v_u_4
	if v_u_9 then
		p_u_11.Headers = p_u_11.Headers or {}
		p_u_11.Headers["rbx-client-feature"] = v_u_10
	end
	return v_u_5.new(function(p_u_13, p_u_14)
		-- upvalues: (copy) p_u_11, (copy) p_u_12, (ref) v_u_4
		coroutine.wrap(function()
			-- upvalues: (ref) p_u_11, (ref) p_u_12, (copy) p_u_13, (copy) p_u_14, (ref) v_u_4
			local v_u_15 = p_u_12
			local v_u_16 = p_u_13
			local v_u_17 = p_u_14
			v_u_4:RequestInternal(p_u_11):Start(function(p18, p19)
				-- upvalues: (copy) v_u_15, (ref) v_u_4, (copy) v_u_16, (copy) v_u_17
				if p18 and p19.StatusCode == 200 then
					local v20 = true
					local v21
					if v_u_15 and p19.Body ~= "null" then
						local v22 = v_u_4.JSONDecode
						local v23 = v_u_4
						local v24 = p19.Body
						v20, v21 = pcall(v22, v23, v24)
					else
						v21 = p19.Body
					end
					if v20 then
						v_u_16(v21)
					else
						v_u_17("Could not parse JSON.")
					end
				else
					v_u_17(p19)
					return
				end
			end)
		end)()
	end)
end
local function v_u_28(p26) -- name: getPreviewAvatar
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_25
	local v27 = {
		["Url"] = nil,
		["Method"] = "POST",
		["Body"] = nil,
		["Headers"] = nil,
		["Url"] = v_u_7.APIS_URL .. "look-api/v1/looks/purchase-details",
		["Body"] = v_u_4:JSONEncode({
			["assets"] = p26
		}),
		["Headers"] = {
			["Content-Type"] = "application/json"
		}
	}
	return v_u_25(v27, true)
end
local function v_u_35(p_u_29) -- name: getProductInfo
	-- upvalues: (copy) v_u_5, (copy) v_u_2
	return v_u_5.new(function(p30, p31)
		-- upvalues: (ref) v_u_2, (copy) p_u_29
		local function v32()
			-- upvalues: (ref) v_u_2, (ref) p_u_29
			return v_u_2:GetProductInfoAsync(p_u_29)
		end
		local v33, v34 = pcall(v32)
		if v33 then
			p30(v34)
		else
			p31("Failure in getProductInfo: ", (tostring(v34)))
		end
	end)
end
local function v_u_43(p_u_36, p_u_37) -- name: getBatchItemDetails
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	return v_u_5.new(function(p38, p39)
		-- upvalues: (ref) v_u_6, (copy) p_u_36, (copy) p_u_37
		local function v40()
			-- upvalues: (ref) v_u_6, (ref) p_u_36, (ref) p_u_37
			return v_u_6:GetBatchItemDetailsAsync(p_u_36, p_u_37)
		end
		local v41, v42 = pcall(v40)
		if v41 then
			p38(v42)
		else
			p39("Failure in batchGetItemDetails: ", (tostring(v42)))
		end
	end)
end
local function v_u_46(p44) -- name: getBatchItemDetailsV2
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_25
	local v45 = {
		["Url"] = nil,
		["Method"] = "POST",
		["Body"] = nil,
		["Headers"] = nil,
		["Url"] = v_u_7.CATALOG_URL .. "v1/catalog/items/details",
		["Body"] = v_u_4:JSONEncode({
			["items"] = p44
		}),
		["Headers"] = {
			["Content-Type"] = "application/json"
		}
	}
	return v_u_25(v45, true)
end
local function v_u_54(p_u_47, p_u_48) -- name: getItemDetails
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	return v_u_5.new(function(p49, p50)
		-- upvalues: (ref) v_u_6, (copy) p_u_47, (copy) p_u_48
		local function v51()
			-- upvalues: (ref) v_u_6, (ref) p_u_47, (ref) p_u_48
			return v_u_6:GetItemDetailsAsync(p_u_47, p_u_48)
		end
		local v52, v53 = pcall(v51)
		if v52 then
			p49(v53)
		else
			p50("Failure in getItemDetails: ", (tostring(v53)))
		end
	end)
end
local function v_u_61(p_u_55) -- name: getPlayerName
	-- upvalues: (copy) v_u_5, (copy) v_u_3
	return v_u_5.new(function(p56, p57)
		-- upvalues: (ref) v_u_3, (copy) p_u_55
		local function v58()
			-- upvalues: (ref) v_u_3, (ref) p_u_55
			return v_u_3:GetNameFromUserIdAsync(p_u_55)
		end
		local v59, v60 = pcall(v58)
		if v59 then
			p56(v60)
		else
			p57("Failure in getPlayerName: ", (tostring(v60)))
		end
	end)
end
local function v_u_63(p62) -- name: getAssetBundles
	-- upvalues: (copy) v_u_7, (copy) v_u_25
	return v_u_25({
		["Url"] = nil,
		["Method"] = "GET",
		["Url"] = v_u_7.CATALOG_URL .. "v1/assets/" .. tostring(p62) .. "/bundles"
	}, true)
end
local function v_u_67(p_u_64) -- name: getHumanoidDescriptionFromCostumeId
	-- upvalues: (copy) v_u_5, (copy) v_u_3
	return v_u_5.new(function(p_u_65, _)
		-- upvalues: (ref) v_u_3, (copy) p_u_64
		spawn(function()
			-- upvalues: (ref) v_u_3, (ref) p_u_64, (copy) p_u_65
			local v66 = v_u_3:GetHumanoidDescriptionFromOutfitIdAsync(p_u_64)
			if v66 then
				p_u_65(v66)
			end
		end)
	end)
end
local function v_u_69(p68) -- name: getAssetFavoriteCount
	-- upvalues: (copy) v_u_7, (copy) v_u_25
	return v_u_25({
		["Url"] = nil,
		["Method"] = "GET",
		["Url"] = v_u_7.CATALOG_URL .. "v1/favorites/assets/" .. tostring(p68) .. "/count"
	}, false)
end
local function v_u_71(p70) -- name: getBundleFavoriteCount
	-- upvalues: (copy) v_u_7, (copy) v_u_25
	return v_u_25({
		["Url"] = nil,
		["Method"] = "GET",
		["Url"] = v_u_7.CATALOG_URL .. "v1/favorites/bundles/" .. tostring(p70) .. "/count"
	}, false)
end
local function v_u_74(p72) -- name: getFavoriteForAsset
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_25
	local v73 = v_u_3.LocalPlayer.UserId
	return v_u_25({
		["Url"] = nil,
		["Method"] = "GET",
		["Url"] = v_u_7.CATALOG_URL .. "v1/favorites/users/" .. tostring(v73) .. "/assets/" .. tostring(p72) .. "/favorite"
	}, true)
end
local function v_u_77(p75) -- name: getFavoriteForBundle
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_25
	local v76 = v_u_3.LocalPlayer.UserId
	return v_u_25({
		["Url"] = nil,
		["Method"] = "GET",
		["Url"] = v_u_7.CATALOG_URL .. "v1/favorites/users/" .. tostring(v76) .. "/bundles/" .. tostring(p75) .. "/favorite"
	}, true)
end
local function v_u_80(p78) -- name: createFavoriteForAsset
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_4, (copy) v_u_25
	local v79 = v_u_3.LocalPlayer.UserId
	return v_u_25({
		["Url"] = nil,
		["Method"] = "POST",
		["Body"] = nil,
		["Url"] = v_u_7.CATALOG_URL .. "v1/favorites/users/" .. tostring(v79) .. "/assets/" .. tostring(p78) .. "/favorite",
		["Body"] = v_u_4:JSONEncode({})
	}, true)
end
local function v_u_83(p81) -- name: deleteFavoriteForAsset
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_25
	local v82 = v_u_3.LocalPlayer.UserId
	return v_u_25({
		["Url"] = nil,
		["Method"] = "DELETE",
		["Url"] = v_u_7.CATALOG_URL .. "v1/favorites/users/" .. tostring(v82) .. "/assets/" .. tostring(p81) .. "/favorite"
	}, true)
end
local function v_u_86(p84) -- name: createFavoriteForBundle
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_4, (copy) v_u_25
	local v85 = v_u_3.LocalPlayer.UserId
	return v_u_25({
		["Url"] = nil,
		["Method"] = "POST",
		["Body"] = nil,
		["Url"] = v_u_7.CATALOG_URL .. "v1/favorites/users/" .. tostring(v85) .. "/bundles/" .. tostring(p84) .. "/favorite",
		["Body"] = v_u_4:JSONEncode({})
	}, true)
end
local function v_u_89(p87) -- name: deleteFavoriteForBundle
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_25
	local v88 = v_u_3.LocalPlayer.UserId
	return v_u_25({
		["Url"] = nil,
		["Method"] = "DELETE",
		["Url"] = v_u_7.CATALOG_URL .. "v1/favorites/users/" .. tostring(v88) .. "/bundles/" .. tostring(p87) .. "/favorite"
	}, true)
end
local function v_u_91(p90) -- name: getEconomyProductInfo
	-- upvalues: (copy) v_u_7, (copy) v_u_25
	return v_u_25({
		["Url"] = nil,
		["Method"] = "GET",
		["Url"] = v_u_7.ECONOMY_URL .. "v1/products/" .. tostring(p90) .. "?showPurchasable=true"
	}, true)
end
local function v_u_96(p_u_92) -- name: getModelFromUserId
	-- upvalues: (copy) v_u_5, (copy) v_u_3
	return v_u_5.new(function(p_u_93, p_u_94)
		-- upvalues: (ref) v_u_3, (copy) p_u_92
		spawn(function()
			-- upvalues: (ref) v_u_3, (ref) p_u_92, (copy) p_u_93, (copy) p_u_94
			local v95 = v_u_3:CreateHumanoidModelFromUserIdAsync(p_u_92)
			if v95 then
				p_u_93(v95)
			else
				p_u_94("Failure in getModelFromUserId")
			end
		end)
	end)
end
local function v_u_100(p97, p98) -- name: getCollectibleResellableInstances
	-- upvalues: (copy) v_u_7, (copy) v_u_25
	local v99 = v_u_7:makeQueryString({
		["ownerId"] = nil,
		["ownerType"] = "User",
		["cursor"] = "",
		["limit"] = 500,
		["ownerId"] = tostring(p98)
	})
	return v_u_25({
		["Url"] = nil,
		["Method"] = "GET",
		["Url"] = string.format("%smarketplace-sales/v1/item/%s/resellable-instances?%s", v_u_7.APIS_URL, p97, v99)
	}, true)
end
local function v_u_102(p101) -- name: getVersionInfo
	-- upvalues: (copy) v_u_8, (copy) v_u_25
	return v_u_25({
		["Url"] = nil,
		["Method"] = "GET",
		["Url"] = string.format("%sv1/assets/%s/saved-versions", v_u_8, p101)
	}, true)
end
local function v_u_104(p103) -- name: getExperiencePlayability
	-- upvalues: (copy) v_u_7, (copy) v_u_25
	return v_u_25({
		["Url"] = nil,
		["Method"] = "GET",
		["Url"] = string.format("%sv1/games/multiget-playability-status?universeIds=%s", v_u_7.GAME_URL, p103)
	}, true)
end
local function v_u_106(p105) -- name: getExperienceInfo
	-- upvalues: (copy) v_u_7, (copy) v_u_25
	return v_u_25({
		["Url"] = nil,
		["Method"] = "GET",
		["Url"] = string.format("%sv1/games?universeIds=%s", v_u_7.GAME_URL, p105)
	}, true)
end
return {
	["new"] = function() -- name: new
		-- upvalues: (copy) v_u_35, (copy) v_u_91, (copy) v_u_61, (copy) v_u_63, (copy) v_u_67, (copy) v_u_69, (copy) v_u_71, (copy) v_u_74, (copy) v_u_77, (copy) v_u_80, (copy) v_u_83, (copy) v_u_86, (copy) v_u_89, (copy) v_u_96, (copy) v_u_100, (copy) v_u_102, (copy) v_u_104, (copy) v_u_106, (copy) v_u_54, (copy) v_u_28, (copy) v_u_43, (copy) v_u_46
		local v107 = {
			["getProductInfo"] = v_u_35,
			["getEconomyProductInfo"] = v_u_91,
			["getPlayerName"] = v_u_61,
			["getAssetBundles"] = v_u_63,
			["getHumanoidDescriptionFromCostumeId"] = v_u_67,
			["getAssetFavoriteCount"] = v_u_69,
			["getBundleFavoriteCount"] = v_u_71,
			["getFavoriteForAsset"] = v_u_74,
			["getFavoriteForBundle"] = v_u_77,
			["createFavoriteForAsset"] = v_u_80,
			["deleteFavoriteForAsset"] = v_u_83,
			["createFavoriteForBundle"] = v_u_86,
			["deleteFavoriteForBundle"] = v_u_89,
			["getModelFromUserId"] = v_u_96,
			["getCollectibleResellableInstances"] = v_u_100,
			["getVersionInfo"] = v_u_102,
			["getExperiencePlayability"] = v_u_104,
			["getExperienceInfo"] = v_u_106,
			["getItemDetails"] = v_u_54,
			["getPreviewAvatar"] = v_u_28,
			["getBatchItemDetails"] = v_u_43,
			["getBatchItemDetailsV2"] = v_u_46
		}
		setmetatable(v107, {
			["__tostring"] = function() -- name: __tostring
				return "Service(Network)"
			end
		})
		return v107
	end
}