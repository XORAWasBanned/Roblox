-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Thunks.GetAssetsFromHumanoidDescription
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Thunk)
local v_u_3 = require(v1.Thunks.GetProductInfo)
local v_u_4 = require(v1.Thunks.GetVersionInfo)
local v_u_5 = require(v1.Models.AssetInfo)
local v_u_6 = require(v1.Actions.SetAssets)
local v_u_7 = require(v1.Actions.SetEquippedAssets)
local v_u_8 = require(v1.Constants)
local v_u_9 = require(v1.Thunks.GetAssetBundles)
local v_u_10 = require(v1.Thunks.BatchGetAssets)
local v_u_11 = require(v1.Flags.FFlagAXEnableRegionalFilteringofAssets)
local v_u_12 = {}
local function v_u_25(p13) -- name: getAssetIds
	-- upvalues: (copy) v_u_8, (copy) v_u_5
	local v14 = {}
	for v15, v16 in pairs(v_u_8.AssetTypeIdStringToHumanoidDescriptionProp) do
		if v_u_8.AssetTypeIdToAccessoryTypeEnum[v15] ~= nil then
			continue
		end
		local v17 = p13[v16] or ""
		for _, v18 in pairs(string.split(v17)) do
			if not tonumber(v18) or v18 == "0" then
				continue
			end
			local v19 = v_u_5.fromHumanoidDescription
			table.insert(v14, v19(v18))
		end
	end
	local v20 = p13:GetAccessories(true)
	for _, v21 in pairs(v20) do
		v14[#v14 + 1] = v_u_5.fromHumanoidDescription(v21.AssetId)
	end
	local v22 = p13:GetEmotes()
	for _, v23 in pairs(v22) do
		for _, v24 in pairs(v23) do
			v14[#v14 + 1] = v_u_5.fromHumanoidDescription(v24)
		end
	end
	return v14
end
return function(p_u_26, p_u_27) -- name: GetAssetsFromHumanoidDescription
	-- upvalues: (copy) v_u_2, (copy) v_u_12, (copy) v_u_25, (copy) v_u_11, (copy) v_u_10, (copy) v_u_3, (copy) v_u_9, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7
	return v_u_2.new(script.Name, v_u_12, function(p_u_28, _)
		-- upvalues: (ref) v_u_25, (copy) p_u_26, (copy) p_u_27, (ref) v_u_11, (ref) v_u_10, (ref) v_u_3, (ref) v_u_9, (ref) v_u_4, (ref) v_u_6, (ref) v_u_7
		local v29 = v_u_25(p_u_26)
		if p_u_27 then
			p_u_28:dispatch(v_u_7(v29))
			return
		elseif v_u_11 then
			p_u_28:dispatch(v_u_10(v29))
		else
			for _, v_u_30 in ipairs(v29) do
				coroutine.wrap(function()
					-- upvalues: (copy) p_u_28, (ref) v_u_3, (copy) v_u_30, (ref) v_u_9, (ref) v_u_4
					p_u_28:dispatch(v_u_3(v_u_30.assetId))
					if v_u_30.parentBundleId == nil then
						p_u_28:dispatch(v_u_9(v_u_30.assetId))
					end
					p_u_28:dispatch(v_u_4(v_u_30.assetId))
				end)()
			end
			p_u_28:dispatch(v_u_6(v29))
		end
	end)
end