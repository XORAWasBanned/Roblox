-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.TryOnViewport
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v3 = script.Parent.Parent
local v_u_4 = require(v1.Packages.Roact)
local v5 = require(v1.Packages.RoactRodux)
local v_u_6 = require(v3.Constants)
local v_u_7 = require(v3.Components.AvatarViewport)
local v_u_8 = require(v3.Thunks.GetHumanoidDescriptionFromCostumeId)
local v_u_9 = require(v3.Flags.GetFFlagDisplayCollectiblesIcon)
local v10 = v_u_4.PureComponent:extend("TryOnViewport")
function v10.init(p11) -- name: init
	p11.model = p11.props.localPlayerModel
	p11.model.HumanoidRootPart.Anchored = true
	p11.humanoidDescriptions = {}
	p11.humanoidDescriptionForLocalPlayer = p11.model.Humanoid.HumanoidDescription
	p11.state = {
		["obtainedHumanoidDescriptions"] = {}
	}
end
function v10.didMount(p12) -- name: didMount
	p12.isMounted = true
end
function v10.didUpdate(p_u_13, p14) -- name: didUpdate
	-- upvalues: (copy) v_u_2
	local v15 = p_u_13.props.assetInfo
	local v16 = p_u_13.props.bundles
	local v17 = p_u_13.props.tryingOnInfo
	if v17 ~= p14.tryingOnInfo and v17.tryingOn then
		local v18
		if v15 and v15.parentBundleId ~= nil then
			v18 = not v15.isForSale or false
		else
			v18 = false
		end
		local v_u_19 = v18 and v16[v15.parentBundleId].costumeId
		if v_u_19 then
			p_u_13.props.getHumanoidDescriptionFromCostumeId(v_u_19, function(p20)
				-- upvalues: (copy) p_u_13, (copy) v_u_19, (ref) v_u_2
				if p_u_13 and p_u_13.isMounted then
					p_u_13.humanoidDescriptions[v_u_19] = p20
					local v21 = p_u_13
					local v22 = {}
					local v23 = {
						[v_u_19] = true
					}
					v22.obtainedHumanoidDescriptions = v_u_2.Dictionary.join(p_u_13.state.obtainedHumanoidDescriptions, v23)
					v21:setState(v22)
				end
			end)
		end
	end
end
function v10.tryOnBundleWithoutCostumeId(p24, p25, p26) -- name: tryOnBundleWithoutCostumeId
	-- upvalues: (copy) v_u_6
	local v27 = {}
	local v28 = {}
	local v29 = false
	for _, v30 in pairs(p24.props.bundles[p25].assetIds) do
		local v31 = p24.props.assets[v30]
		local v32 = v_u_6.AssetTypeIdToAccessoryTypeEnum[v31.assetTypeId]
		if not v32 then
			continue
		end
		v27[v32] = true
		local v33 = v_u_6.AssetTypeToAssetCategory[v31.assetTypeId]
		if v33 then
			v28[v33] = true
		end
		v29 = true
	end
	local v34 = p26:GetAccessories(true)
	local v35 = {}
	if v29 then
		for _, v36 in pairs(v34) do
			local v37 = v_u_6.AccessoryTypeEnumToAssetTypeId[v36.AccessoryType]
			local v38 = v_u_6.AssetTypeToAssetCategory[v37]
			local v39 = not (v38 and v28[v38])
			if v27[v36.AccessoryType] or not v39 then
				continue
			end
			table.insert(v35, v36)
		end
	end
	for _, v40 in pairs(p24.props.bundles[p25].assetIds) do
		local v41 = p24.props.assets[v40]
		if v_u_6.AssetTypeIdToAccessoryTypeEnum[v41.assetTypeId] then
			local v42 = v41.assetTypeId
			local v43 = {
				["AssetId"] = tonumber(v40),
				["Order"] = v_u_6.LayeredClothingOrder[v42],
				["AccessoryType"] = v_u_6.AssetTypeIdToAccessoryTypeEnum[v42],
				["IsLayered"] = v_u_6.LayeredAssetTypes[v42] ~= nil
			}
			table.insert(v35, v43)
		else
			p26[v_u_6.AssetTypeIdStringToHumanoidDescriptionProp[v41.assetTypeId]] = v40
		end
	end
	if v29 then
		p26:SetAccessories(v35, true)
	end
	return p26
end
function v10.render(p44) -- name: render
	-- upvalues: (copy) v_u_6, (copy) v_u_4, (copy) v_u_9, (copy) v_u_7
	local v45 = p44.props.assetInfo
	local v46 = p44.props.bundles
	local v47 = p44.props.tryingOnInfo
	local v48 = p44.humanoidDescriptionForLocalPlayer:Clone()
	local v49 = v47.tryingOn
	local v50 = p44.props.setScrollingEnabled
	if v47 and v47.tryingOn then
		local v51
		if v45 and v45.parentBundleId ~= nil then
			v51 = not v45.isForSale or false
		else
			v51 = false
		end
		if v51 then
			local v52 = v45.parentBundleId
			local v53 = v46[v52].costumeId
			if v53 then
				local v54 = p44.humanoidDescriptions[v53]
				v49 = p44.state.obtainedHumanoidDescriptions[v53] == true
				if v54 then
					for v55, v56 in pairs(v_u_6.AssetTypeIdStringToHumanoidDescriptionProp) do
						if v_u_6.AssetTypeIdToAccessoryTypeEnum[v55] ~= nil then
							continue
						end
						local v57 = v54[v56]
						if not tonumber(v57) then
							continue
						end
						local v58 = v54[v56]
						if tostring(v58) == "0" then
							continue
						end
						v48[v56] = v54[v56]
					end
					v48:SetAccessories(v54:GetAccessories(true), true)
				end
			else
				v48 = p44:tryOnBundleWithoutCostumeId(v52, v48)
			end
		elseif v_u_6.AssetTypeIdToAccessoryTypeEnum[v47.assetTypeId] then
			local v59 = v_u_6.AssetTypeIdToAccessoryTypeEnum[v47.assetTypeId]
			local v60 = v48:GetAccessories(true)
			local v61 = {}
			for _, v62 in pairs(v60) do
				local v63 = v_u_6.AccessoryTypeEnumToAssetTypeId[v62.AccessoryType]
				local v64 = v_u_6.AssetTypeToAssetCategory[v47.assetTypeId]
				local v65 = not v64 or v_u_6.AssetTypeToAssetCategory[v63] ~= v64
				if v62.AccessoryType == v59 or not v65 then
					continue
				end
				table.insert(v61, v62)
			end
			local v66 = v47.assetTypeId
			local v67 = v47.assetId
			local v68 = {
				["AssetId"] = tonumber(v67),
				["Order"] = v_u_6.LayeredClothingOrder[v66],
				["AccessoryType"] = v_u_6.AssetTypeIdToAccessoryTypeEnum[v66],
				["IsLayered"] = v_u_6.LayeredAssetTypes[v66] ~= nil
			}
			table.insert(v61, v68)
			v48:SetAccessories(v61, true)
		else
			v48[v_u_6.AssetTypeIdStringToHumanoidDescriptionProp[v47.assetTypeId]] = v47.assetId
		end
	end
	return v_u_4.createElement("Frame", {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["LayoutOrder"] = 2,
		["Visible"] = nil,
		["Size"] = UDim2.new(1, 0, 0, v_u_9() and v_u_6.DetailsThumbnailFrameHeight or 300),
		["Visible"] = v49
	}, {
		["AvatarViewport"] = v_u_4.createElement(v_u_7, {
			["size"] = nil,
			["position"] = nil,
			["humanoidDescription"] = nil,
			["model"] = nil,
			["visible"] = true,
			["backgroundTransparency"] = 1,
			["setScrollingEnabled"] = nil,
			["size"] = UDim2.new(0.75, 0, 1, 0),
			["position"] = UDim2.new(0.5, 0, 0.5, 0),
			["humanoidDescription"] = v48,
			["model"] = p44.model,
			["setScrollingEnabled"] = v50
		})
	})
end
function v10.willUnmount(p69) -- name: willUnmount
	p69.isMounted = false
end
return v5.UNSTABLE_connect2(function(p70, _)
	local v71 = p70.detailsInformation.assetId
	return {
		["assets"] = p70.assets,
		["assetInfo"] = p70.assets[v71],
		["bundles"] = p70.bundles,
		["tryingOnInfo"] = p70.tryingOnInfo
	}
end, function(p_u_72)
	-- upvalues: (copy) v_u_8
	return {
		["getHumanoidDescriptionFromCostumeId"] = function(p73, p74) -- name: getHumanoidDescriptionFromCostumeId
			-- upvalues: (copy) p_u_72, (ref) v_u_8
			return p_u_72(v_u_8(p73, p74))
		end
	}
end)(v10)