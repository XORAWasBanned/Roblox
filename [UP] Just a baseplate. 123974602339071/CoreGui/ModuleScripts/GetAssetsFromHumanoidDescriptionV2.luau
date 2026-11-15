-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Thunks.GetAssetsFromHumanoidDescriptionV2
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Thunk)
local v_u_3 = require(v1.Models.AssetInfo)
local v_u_4 = require(v1.Actions.SetEquippedAssets)
local v_u_5 = require(v1.Constants)
local v_u_6 = require(v1.Thunks.GetAvatarPreview)
local v_u_7 = require(v1.Thunks.SendCounter)
local v8 = game:GetService("CorePackages")
local v_u_9 = require(v8.Packages.Promise)
local v10 = require(v8.Workspace.Packages.AvatarExperienceFlags)
local v_u_11 = require(v8.Workspace.Packages.DataHydration.AvatarBackground)
local v_u_12 = v10.FFlagAXInspectAndBuyMakeupSupport
local v_u_13 = v10.FFlagAXInspectAndBuyAvatarBackground
local v_u_14 = {}
local function v_u_30(p15) -- name: getAssetIds
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_12
	local v16 = false
	local v17 = {}
	for v18, v19 in v_u_5.AssetTypeIdStringToHumanoidDescriptionProp do
		if v_u_5.AssetTypeIdToAccessoryTypeEnum[v18] ~= nil then
			continue
		end
		local v20 = p15[v19] or ""
		local v21 = Enum.AssetType.Head.Value
		local v22
		if v18 == tostring(v21) then
			v22 = true
		else
			local v23 = Enum.AssetType.DynamicHead.Value
			v22 = v18 == tostring(v23)
		end
		if v16 and v22 then
			continue
		end
		v16 = v22 and true or v16
		for _, v24 in string.split(v20) do
			if not tonumber(v24) or v24 == "0" then
				continue
			end
			local v25 = v_u_3.fromHumanoidDescription
			table.insert(v17, v25(v24))
		end
	end
	for _, v26 in p15:GetAccessories(true) do
		v17[#v17 + 1] = v_u_3.fromHumanoidDescriptionAccessory(v26)
	end
	for _, v27 in p15:GetEmotes() do
		for _, v28 in v27 do
			v17[#v17 + 1] = v_u_3.fromHumanoidDescription(v28)
		end
	end
	if v_u_12 then
		for _, v29 in p15:GetChildren() do
			if not v29:IsA("MakeupDescription") or v29.AssetId <= 0 then
				continue
			end
			v17[#v17 + 1] = v_u_3.fromHumanoidDescription(v29.AssetId)
		end
	end
	return v17
end
local function v_u_38(p_u_31, p_u_32, p33) -- name: withEquippedBackground
	-- upvalues: (copy) v_u_9, (copy) v_u_11, (copy) v_u_3, (copy) v_u_7, (copy) v_u_5
	if p33 == nil or p33 == "" then
		return v_u_9.resolve(p_u_32)
	else
		return v_u_11.getAvatarBackgroundStore(false).awaitAvatarBackground(p33):andThen(function(p34)
			-- upvalues: (copy) p_u_32, (ref) v_u_3
			if not p34.assetId then
				return p_u_32
			end
			local v35 = table.clone(p_u_32)
			local v36 = v_u_3.fromHumanoidDescription
			local v37 = p34.assetId
			table.insert(v35, v36(v37))
			return v35
		end):catch(function()
			-- upvalues: (copy) p_u_31, (ref) v_u_7, (ref) v_u_5, (copy) p_u_32
			p_u_31:dispatch(v_u_7(v_u_5.Counters.GetAvatarBackground .. v_u_5.CounterSuffix.RequestFailed))
			return p_u_32
		end)
	end
end
return function(p_u_39, p_u_40, p_u_41) -- name: GetAssetsFromHumanoidDescriptionV2
	-- upvalues: (copy) v_u_2, (copy) v_u_14, (copy) v_u_30, (copy) v_u_13, (copy) v_u_38, (copy) v_u_6, (copy) v_u_4
	return v_u_2.new(script.Name, v_u_14, function(p_u_42, _)
		-- upvalues: (ref) v_u_30, (copy) p_u_39, (copy) p_u_40, (ref) v_u_13, (copy) p_u_41, (ref) v_u_38, (ref) v_u_6, (ref) v_u_4
		local v43 = v_u_30(p_u_39)
		if p_u_40 then
			p_u_42:dispatch(v_u_4(v43))
			return
		elseif v_u_13 then
			local v_u_44 = p_u_41
			v_u_38(p_u_42, v43, p_u_42:getState().playerId):andThen(function(p45)
				-- upvalues: (copy) v_u_44, (copy) p_u_42, (ref) v_u_6
				if not v_u_44 or v_u_44() then
					p_u_42:dispatch(v_u_6(p45))
				end
			end)
		else
			p_u_42:dispatch(v_u_6(v43))
		end
	end)
end