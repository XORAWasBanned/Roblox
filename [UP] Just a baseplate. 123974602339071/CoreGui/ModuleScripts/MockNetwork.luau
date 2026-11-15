-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Test.MockNetwork
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v_u_3 = require(v1.Packages.Promise)
local v4 = require(v1.Workspace.Packages.DiscoveryTypes).PlayabilityStatusEnum
local v_u_5 = {
	{
		["id"] = 100425207,
		["name"] = "Reinforced Wizard",
		["assetType"] = nil,
		["assetType"] = {
			["id"] = 8,
			["name"] = "Hat"
		}
	},
	{
		["id"] = 2510238627,
		["name"] = "Rthro Run",
		["assetType"] = nil,
		["assetType"] = {
			["id"] = 53,
			["name"] = "Run Animation"
		}
	},
	{
		["id"] = 2807164805,
		["name"] = "Mech Golem - Head",
		["assetType"] = nil,
		["assetType"] = {
			["id"] = 17,
			["name"] = "Head"
		}
	}
}
local v_u_6 = {}
local v7 = {}
local v8 = {
	["id"] = 451,
	["name"] = "test name",
	["description"] = "test description",
	["bundleType"] = "testBundleType",
	["items"] = nil,
	["creator"] = nil,
	["product"] = nil,
	["items"] = {
		{
			["owned"] = false,
			["id"] = 2510230574,
			["name"] = "test asset name"
		},
		{
			["owned"] = false,
			["id"] = 2510233257,
			["name"] = "test asset name 2"
		},
		{
			["owned"] = false,
			["type"] = "UserOutfit",
			["id"] = 2510233258,
			["name"] = "Outfit"
		}
	},
	["creator"] = {
		["id"] = 1,
		["name"] = "test creator name"
	},
	["product"] = {
		["id"] = 480872498,
		["isForSale"] = true,
		["priceInRobux"] = 250
	}
}
v7[1] = v8
v_u_6.data = v7
local v_u_9 = Instance.new("HumanoidDescription")
v_u_9.HatAccessory = 1
v_u_9.LeftArm = 2
v_u_9.ClimbAnimation = 3
v_u_9.BodyTypeScale = 0.3
v_u_9.LeftLegColor = Color3.new(0, 0, 0)
v_u_9.GraphicTShirt = 4
local v_u_10 = Instance.new("HumanoidDescription")
v_u_10:SetEmotes({
	["Wave"] = { 1 },
	["Laugh"] = { 2 },
	["Cheer"] = { 3 }
})
local v_u_11 = Instance.new("HumanoidDescription")
local v_u_12 = {
	["assetId"] = 123,
	["userId"] = 401784814,
	["created"] = ""
}
local v_u_13 = {
	["Name"] = "test name",
	["Description"] = "test description",
	["PriceInRobux"] = 100,
	["Creator"] = nil,
	["AssetId"] = 100425207,
	["AssetTypeId"] = 8,
	["ProductId"] = 18929548,
	["Creator"] = {
		["Id"] = 1,
		["Name"] = "TEST CREATOR"
	}
}
local v_u_14 = {
	["Owned"] = true,
	["IsPurchasable"] = false,
	["Id"] = 100425207,
	["ItemType"] = "Asset"
}
local v_u_15 = {
	["purchasable"] = false,
	["reason"] = "InsufficientFunds",
	["price"] = 200,
	["assetId"] = 10
}
local v_u_16 = {
	["playabilityStatus"] = nil,
	["universeId"] = 13,
	["isPlayable"] = true,
	["playabilityStatus"] = v4.Playable
}
local v_u_17 = {
	["name"] = "fakename",
	["id"] = 13,
	["rootPlaceId"] = 17
}
local function v_u_20(p18) -- name: getRobloxProductInfo
	-- upvalues: (copy) v_u_2, (copy) v_u_13, (copy) v_u_3
	local v19 = v_u_2.Dictionary.join(v_u_13, {
		["AssetId"] = p18
	})
	return v_u_3.resolve(v19)
end
local function v_u_23(p21) -- name: getProductInfo
	-- upvalues: (copy) v_u_2, (copy) v_u_13, (copy) v_u_3
	local v22 = v_u_2.Dictionary.join(v_u_13, {
		["AssetId"] = p21
	})
	v22.Creator.Id = 2
	return v_u_3.resolve(v22)
end
local function v_u_27(p24, p25) -- name: getItemDetails
	-- upvalues: (copy) v_u_2, (copy) v_u_14, (copy) v_u_3
	local v26 = v_u_2.Dictionary.join(v_u_14, {
		["Id"] = p24,
		["ItemType"] = p25
	})
	return v_u_3.resolve(v26)
end
local function v_u_33(p28) -- name: getBatchItemDetails
	-- upvalues: (copy) v_u_2, (copy) v_u_14, (copy) v_u_3
	local v29 = {}
	for _, v30 in ipairs(p28) do
		local v31 = v_u_2.Dictionary.join
		local v32 = v_u_14
		table.insert(v29, v31(v32, {
			["Id"] = v30
		}))
	end
	return v_u_3.resolve(v29)
end
local v_u_34 = {
	["data"] = {
		{
			["assetId"] = 17,
			["creatingUniverseId"] = 13
		}
	}
}
local function v_u_37(p35) -- name: getVersionInfo
	-- upvalues: (copy) v_u_2, (copy) v_u_34, (copy) v_u_3
	local v36 = v_u_2.Dictionary.join(v_u_34, {
		["AssetId"] = p35
	})
	return v_u_3.resolve(v36)
end
local function v_u_40(p38) -- name: getExperiencePlayability
	-- upvalues: (copy) v_u_2, (copy) v_u_16, (copy) v_u_3
	local v39 = { (v_u_2.Dictionary.join(v_u_16, {
			["universeId"] = p38
		})) }
	return v_u_3.resolve(v39)
end
local function v_u_43(p41) -- name: getExperienceInfo
	-- upvalues: (copy) v_u_2, (copy) v_u_17, (copy) v_u_3
	local v42 = {
		["data"] = { (v_u_2.Dictionary.join(v_u_17, {
				["id"] = p41
			})) }
	}
	return v_u_3.resolve(v42)
end
local function v_u_44(_) -- name: getAssetBundles
	-- upvalues: (copy) v_u_3, (copy) v_u_6
	return v_u_3.resolve(v_u_6)
end
local function v_u_45(_) -- name: getPlayerName
	-- upvalues: (copy) v_u_3
	return v_u_3.resolve("TEST")
end
local function v_u_46(_) -- name: createFavoriteForAsset
	-- upvalues: (copy) v_u_3
	return v_u_3.resolve()
end
local function v_u_47(_) -- name: createFavoriteForBundle
	-- upvalues: (copy) v_u_3
	return v_u_3.resolve()
end
local function v_u_48(_) -- name: deleteFavoriteForAsset
	-- upvalues: (copy) v_u_3
	return v_u_3.resolve()
end
local function v_u_49(_) -- name: deleteFavoriteForBundle
	-- upvalues: (copy) v_u_3
	return v_u_3.resolve()
end
local function v_u_50(_) -- name: getAssetFavoriteCount
	-- upvalues: (copy) v_u_3
	return v_u_3.resolve(120)
end
local function v_u_51(_) -- name: getBundleFavoriteCount
	-- upvalues: (copy) v_u_3
	return v_u_3.resolve(120)
end
local function v_u_53(p52) -- name: getFavoriteForAsset
	-- upvalues: (copy) v_u_3, (copy) v_u_12
	if p52 == "GetFavoriteModel" then
		return v_u_3.resolve(v_u_12)
	else
		return v_u_3.resolve("null")
	end
end
local function v_u_55(p54) -- name: getFavoriteForBundle
	-- upvalues: (copy) v_u_3, (copy) v_u_12
	if p54 == "GetFavoriteModel" then
		return v_u_3.resolve(v_u_12)
	else
		return v_u_3.resolve("null")
	end
end
local function v_u_56(_) -- name: getEconomyProductInfo
	-- upvalues: (copy) v_u_3, (copy) v_u_15
	return v_u_3.resolve(v_u_15)
end
local function v_u_57(_) -- name: getModelFromUserId
	-- upvalues: (copy) v_u_3
	return v_u_3.resolve()
end
local function v_u_58(_, _) -- name: networkFailure
	-- upvalues: (copy) v_u_3
	return v_u_3.reject("Failed to access network service")
end
local v59 = {}
v59.__index = v59
function v59.new(p60, p61) -- name: new
	-- upvalues: (copy) v_u_58, (copy) v_u_23, (copy) v_u_20, (copy) v_u_45, (copy) v_u_44, (copy) v_u_46, (copy) v_u_47, (copy) v_u_48, (copy) v_u_49, (copy) v_u_50, (copy) v_u_51, (copy) v_u_53, (copy) v_u_55, (copy) v_u_56, (copy) v_u_57, (copy) v_u_37, (copy) v_u_40, (copy) v_u_43, (copy) v_u_27, (copy) v_u_33
	local v62
	if p60 then
		v62 = {
			["getProductInfo"] = v_u_58,
			["getPlayerName"] = v_u_58,
			["getAssetBundles"] = v_u_58,
			["createFavoriteForAsset"] = v_u_58,
			["createFavoriteForBundle"] = v_u_58,
			["deleteFavoriteForAsset"] = v_u_58,
			["deleteFavoriteForBundle"] = v_u_58,
			["getAssetFavoriteCount"] = v_u_58,
			["getBundleFavoriteCount"] = v_u_58,
			["getFavoriteForAsset"] = v_u_58,
			["getFavoriteForBundle"] = v_u_58,
			["getEconomyProductInfo"] = v_u_58,
			["getModelFromUserId"] = v_u_58,
			["getVersionInfo"] = v_u_58,
			["getExperiencePlayability"] = v_u_58,
			["getExperienceInfo"] = v_u_58,
			["getItemDetails"] = v_u_58,
			["getBatchItemDetails"] = v_u_58
		}
	else
		v62 = {
			["getProductInfo"] = p61 and v_u_23 or v_u_20,
			["getPlayerName"] = v_u_45,
			["getAssetBundles"] = v_u_44,
			["createFavoriteForAsset"] = v_u_46,
			["createFavoriteForBundle"] = v_u_47,
			["deleteFavoriteForAsset"] = v_u_48,
			["deleteFavoriteForBundle"] = v_u_49,
			["getAssetFavoriteCount"] = v_u_50,
			["getBundleFavoriteCount"] = v_u_51,
			["getFavoriteForAsset"] = v_u_53,
			["getFavoriteForBundle"] = v_u_55,
			["getEconomyProductInfo"] = v_u_56,
			["getModelFromUserId"] = v_u_57,
			["getVersionInfo"] = v_u_37,
			["getExperiencePlayability"] = v_u_40,
			["getExperienceInfo"] = v_u_43,
			["getItemDetails"] = v_u_27,
			["getBatchItemDetails"] = v_u_33
		}
	end
	setmetatable(v62, {
		["__tostring"] = function() -- name: __tostring
			return "MockService(Network)"
		end
	})
	return v62
end
function v59.GetMockAssetData() -- name: GetMockAssetData
	-- upvalues: (copy) v_u_5
	return v_u_5
end
function v59.GetMockHumanoidDescription() -- name: GetMockHumanoidDescription
	-- upvalues: (copy) v_u_9
	return v_u_9
end
function v59.GetMockHumanoidDescriptionEmpty() -- name: GetMockHumanoidDescriptionEmpty
	-- upvalues: (copy) v_u_11
	return v_u_11
end
function v59.GetMockPlayerName() -- name: GetMockPlayerName
	return "TEST"
end
function v59.GetMockAssetBundlesData() -- name: GetMockAssetBundlesData
	-- upvalues: (copy) v_u_6
	return v_u_6
end
function v59.GetMockFavoriteCount() -- name: GetMockFavoriteCount
	return 120
end
function v59.GetFavoriteModelId() -- name: GetFavoriteModelId
	return "GetFavoriteModel"
end
function v59.GetProductInfo() -- name: GetProductInfo
	-- upvalues: (copy) v_u_13
	return v_u_13
end
function v59.GetEconomyProductInfo() -- name: GetEconomyProductInfo
	-- upvalues: (copy) v_u_15
	return v_u_15
end
function v59.GetMockHumanoidDescriptionEmotes() -- name: GetMockHumanoidDescriptionEmotes
	-- upvalues: (copy) v_u_10
	return v_u_10
end
function v59.GetVersionInfo() -- name: GetVersionInfo
	-- upvalues: (copy) v_u_34
	return v_u_34
end
function v59.GetExperiencePlayability() -- name: GetExperiencePlayability
	-- upvalues: (copy) v_u_16
	return { v_u_16 }
end
function v59.GetExperienceInfo() -- name: GetExperienceInfo
	-- upvalues: (copy) v_u_17
	return {
		["data"] = { v_u_17 }
	}
end
return v59