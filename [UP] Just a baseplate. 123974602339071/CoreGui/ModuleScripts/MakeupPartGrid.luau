-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.Common.MakeupPartGrid
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v3 = require(v1.Packages.UIBlox)
local v_u_4 = v3.App.Grid.GridMetrics
local v_u_5 = v3.App.Grid.DefaultMetricsGridView
local v_u_6 = v3.Tile.ItemTile
local v_u_7 = require(script.Parent.Parent.Parent.Constants)
local v_u_8 = require(script.Parent.Parent.PublishAvatarPrompt.AvatarParts.AvatarItemCard)
local v_u_9 = require(script.Parent.Parent.Parent.Flags.GetFFlagUploadMakeupSupport)
local v_u_10 = Vector2.new(20, 20)
local v_u_11 = {
	[Enum.AvatarAssetType.FaceMakeup] = "Face Makeup",
	[Enum.AvatarAssetType.LipMakeup] = "Lip Makeup",
	[Enum.AvatarAssetType.EyeMakeup] = "Eye Makeup",
	[Enum.AvatarAssetType.EyebrowAccessory] = "Eyebrow",
	[Enum.AvatarAssetType.EyelashAccessory] = "Eyelash"
}
local function v_u_27(p12, p13, p14, p15) -- name: getItemsFromFolder
	-- upvalues: (copy) v_u_9, (copy) v_u_11
	local v16 = p12:GetChildren()
	local v17 = {}
	for v24, v19 in ipairs(v16) do
		if not (v19:IsA("Decal") or v19:IsA("Accessory")) then
			continue
		end
		local v20 = nil
		local v21
		if p14 and p14[v24] then
			v21 = p14[v24].assetType
		else
			v21 = nil
		end
		local v22
		if p15 then
			if v_u_9() then
				local v23 = v19.Name
				if v21 and v_u_11[v21] then
					v23 = v_u_11[v21]
				end
				v22 = p13 .. " - " .. v23
			else
				v22 = v19.Name
				if v21 and v_u_11[v21] then
					v22 = v_u_11[v21]
					v20 = p13
				else
					v20 = p13
				end
			end
		else
			v22 = p13
		end
		if p14 and (p14[v24] and p14[v24].sortOrder) then
			local v24 = p14[v24].sortOrder
		end
		table.insert(v17, {
			["asset"] = v19,
			["assetType"] = v21,
			["bodyName"] = v20,
			["partName"] = v22,
			["LayoutOrder"] = v24
		})
	end
	table.sort(v17, function(p25, p26)
		return (p25.LayoutOrder or 0) < (p26.LayoutOrder or 0)
	end)
	return v17
end
return function(p_u_28) -- name: MakeupPartGrid
	-- upvalues: (copy) v_u_2, (copy) v_u_27, (copy) v_u_11, (copy) v_u_9, (copy) v_u_7, (copy) v_u_8, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4, (copy) v_u_10
	local v_u_29, v_u_30 = v_u_2.useState({})
	local v_u_31 = p_u_28.showAssetTypeInLabel == nil and true or p_u_28.showAssetTypeInLabel
	v_u_2.useEffect(function()
		-- upvalues: (copy) p_u_28, (copy) v_u_30, (ref) v_u_27, (copy) v_u_31, (ref) v_u_11
		if p_u_28.makeupFolder then
			v_u_30((v_u_27(p_u_28.makeupFolder, p_u_28.name, p_u_28.makeupEntries, v_u_31)))
			return
		elseif p_u_28.singleDecal then
			local v32 = p_u_28.name
			local v33 = p_u_28.singleAssetType
			local v34
			if v_u_31 then
				v34 = p_u_28.name
				v32 = p_u_28.singleDecal.Name
				if v33 and v_u_11[v33] then
					v32 = v_u_11[v33]
				end
			else
				v34 = nil
			end
			v_u_30({
				{
					["asset"] = nil,
					["assetType"] = nil,
					["bodyName"] = nil,
					["partName"] = nil,
					["LayoutOrder"] = 1,
					["asset"] = p_u_28.singleDecal,
					["assetType"] = v33,
					["bodyName"] = v34,
					["partName"] = v32
				}
			})
		else
			v_u_30({
				{},
				{}
			})
		end
	end, { p_u_28.makeupFolder, p_u_28.singleDecal })
	v_u_2.useEffect(function()
		-- upvalues: (copy) v_u_29, (ref) v_u_9, (copy) v_u_31, (ref) v_u_11, (copy) p_u_28, (copy) v_u_30
		if v_u_29[1] and v_u_29[1].asset then
			local v35 = {}
			for v36, v37 in v_u_29 do
				local v38 = v37.bodyName
				local v39 = v37.partName
				if v_u_9() then
					if v_u_31 then
						local v40 = v37.assetType and (v_u_11[v37.assetType] or "") or ""
						v39 = p_u_28.name .. " - " .. v40
					else
						v39 = p_u_28.name
					end
					v38 = nil
				elseif v_u_31 then
					v38 = p_u_28.name
				else
					v39 = p_u_28.name
				end
				v35[v36] = {
					["asset"] = v37.asset,
					["assetType"] = v37.assetType,
					["bodyName"] = v38,
					["partName"] = v39,
					["LayoutOrder"] = v37.LayoutOrder
				}
			end
			v_u_30(v35)
		end
	end, { p_u_28.name })
	local v_u_41
	if p_u_28.screenSize.Y > p_u_28.screenSize.X then
		v_u_41 = v_u_7.ItemCardWidthPortrait
	else
		v_u_41 = v_u_7.ItemCardWidthLandscape
	end
	local v43 = v_u_2.useCallback(function(p42)
		-- upvalues: (ref) v_u_2, (ref) v_u_8, (copy) v_u_41, (ref) v_u_6
		if p42.asset then
			return v_u_2.createElement(v_u_8, {
				["asset"] = p42.asset,
				["assetType"] = p42.assetType,
				["bodyName"] = p42.bodyName,
				["partName"] = p42.partName,
				["viewportSize"] = v_u_41
			})
		else
			return v_u_2.createElement(v_u_6)
		end
	end, { v_u_41, p_u_28.name })
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["LayoutOrder"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.fromScale(1, 0),
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["LayoutOrder"] = p_u_28.LayoutOrder
	}, {
		["Grid"] = v_u_2.createElement(v_u_5, {
			["getItemHeight"] = function(p44) -- name: getItemHeight
				return p44 * 1.3333333333333333
			end,
			["getItemMetrics"] = v_u_4.makeCustomMetricsGetter({
				["minimumItemsPerRow"] = 2,
				["minimumItemWidth"] = nil,
				["minimumItemWidth"] = v_u_41
			}),
			["renderItem"] = v43,
			["itemPadding"] = v_u_10,
			["items"] = v_u_29
		})
	})
end