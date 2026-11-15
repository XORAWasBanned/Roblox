-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.PublishAvatarPrompt.AvatarParts.AvatarPartGrid
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v3 = require(v1.Packages.UIBlox)
local v_u_4 = v3.App.Grid.GridMetrics
local v_u_5 = v3.App.Grid.DefaultMetricsGridView
local v_u_6 = require(script.Parent.Parent.Parent.Parent.Constants)
local v_u_7 = require(script.Parent.AvatarItemCard)
local v_u_8 = v3.Tile.ItemTile
local v_u_9 = Vector2.new(20, 20)
local function v_u_37(p10, _) -- name: getItems
	local v11 = nil
	local v12 = nil
	local v13 = nil
	for _, v14 in ipairs(p10:GetChildren()) do
		if not v14:IsA("Accessory") then
			continue
		end
		if v14.AccessoryType == Enum.AccessoryType.Eyebrow then
			v11 = v14
		elseif v14.AccessoryType == Enum.AccessoryType.Eyelash then
			v12 = v14
		else
			if v14.AccessoryType ~= Enum.AccessoryType.Hair then
				continue
			end
			v13 = v14
		end
	end
	local v15 = {
		["asset"] = nil,
		["partName"] = "Head",
		["asset"] = p10:FindFirstChild("Head")
	}
	local v16 = { p10:FindFirstChild("UpperTorso"), (p10:FindFirstChild("LowerTorso")) }
	local v17 = Instance.new("Folder")
	v17.Name = "R15ArtistIntent"
	local v18 = {
		["asset"] = nil,
		["partName"] = "Torso"
	}
	local v19 = {}
	for _, v20 in v16 do
		v20.Parent = v17
	end
	v18.asset = { v17 }
	local v21 = { p10:FindFirstChild("LeftUpperArm"), p10:FindFirstChild("LeftLowerArm"), (p10:FindFirstChild("LeftHand")) }
	local v22 = Instance.new("Folder")
	v22.Name = "R15ArtistIntent"
	local v23 = {
		["asset"] = nil,
		["partName"] = "Left Arm"
	}
	for _, v24 in v21 do
		v24.Parent = v22
	end
	v23.asset = { v22 }
	local v25 = { p10:FindFirstChild("LeftUpperLeg"), p10:FindFirstChild("LeftLowerLeg"), (p10:FindFirstChild("LeftFoot")) }
	local v26 = Instance.new("Folder")
	v26.Name = "R15ArtistIntent"
	local v27 = {
		["asset"] = nil,
		["partName"] = "Left Leg"
	}
	for _, v28 in v25 do
		v28.Parent = v26
	end
	v27.asset = { v26 }
	local v29 = { p10:FindFirstChild("RightUpperArm"), p10:FindFirstChild("RightLowerArm"), (p10:FindFirstChild("RightHand")) }
	local v30 = Instance.new("Folder")
	v30.Name = "R15ArtistIntent"
	local v31 = {
		["asset"] = nil,
		["partName"] = "Right Arm"
	}
	for _, v32 in v29 do
		v32.Parent = v30
	end
	v31.asset = { v30 }
	local v33 = { p10:FindFirstChild("RightUpperLeg"), p10:FindFirstChild("RightLowerLeg"), (p10:FindFirstChild("RightFoot")) }
	local v34 = Instance.new("Folder")
	v34.Name = "R15ArtistIntent"
	local v35 = {
		["asset"] = nil,
		["partName"] = "Right Leg"
	}
	for _, v36 in v33 do
		v36.Parent = v34
	end
	v35.asset = { v34 }
	__set_list(v19, 1, {v15, v18, v23, v27, v31, v35})
	if v11 then
		table.insert(v19, {
			["asset"] = nil,
			["partName"] = "Eyebrows",
			["asset"] = v11
		})
	end
	if v12 then
		table.insert(v19, {
			["asset"] = nil,
			["partName"] = "Eyelashes",
			["asset"] = v12
		})
	end
	if v13 then
		table.insert(v19, {
			["asset"] = nil,
			["partName"] = "Hair",
			["asset"] = v13
		})
	end
	return v19
end
return function(p_u_38) -- name: AvatarPartGrid
	-- upvalues: (copy) v_u_2, (copy) v_u_37, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_5, (copy) v_u_4, (copy) v_u_9
	local v_u_39, v_u_40 = v_u_2.useState({})
	v_u_2.useEffect(function()
		-- upvalues: (copy) p_u_38, (copy) v_u_40, (ref) v_u_37
		if p_u_38.humanoidModel then
			v_u_40((v_u_37(p_u_38.humanoidModel:Clone(), p_u_38.name)))
		else
			local v41 = {}
			for v42 = 1, 6 do
				v41[v42] = {}
			end
			v_u_40(v41)
		end
	end, { p_u_38.humanoidModel })
	v_u_2.useEffect(function()
		-- upvalues: (copy) v_u_39, (copy) v_u_40
		if v_u_39[1] and v_u_39[1].asset then
			local v43 = {}
			for v44, v45 in v_u_39 do
				v43[v44] = {
					["asset"] = v45.asset,
					["partName"] = v45.partName
				}
			end
			v_u_40(v43)
		end
	end, { p_u_38.name })
	local v_u_46
	if p_u_38.screenSize.Y > p_u_38.screenSize.X then
		v_u_46 = v_u_6.ItemCardWidthPortrait
	else
		v_u_46 = v_u_6.ItemCardWidthLandscape
	end
	local v48 = v_u_2.useCallback(function(p47)
		-- upvalues: (ref) v_u_2, (ref) v_u_7, (copy) p_u_38, (copy) v_u_46, (ref) v_u_8
		if p47.asset then
			return v_u_2.createElement(v_u_7, {
				["asset"] = p47.asset,
				["bodyName"] = p_u_38.name,
				["partName"] = p47.partName,
				["viewportSize"] = v_u_46
			})
		else
			return v_u_2.createElement(v_u_8)
		end
	end, { v_u_46, p_u_38.name })
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["LayoutOrder"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.fromScale(1, 0),
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["LayoutOrder"] = p_u_38.LayoutOrder
	}, {
		["Grid"] = v_u_2.createElement(v_u_5, {
			["getItemHeight"] = function(p49) -- name: getItemHeight
				return p49 * 1.3333333333333333
			end,
			["getItemMetrics"] = v_u_4.makeCustomMetricsGetter({
				["minimumItemsPerRow"] = 2,
				["minimumItemWidth"] = nil,
				["minimumItemWidth"] = v_u_46
			}),
			["renderItem"] = v48,
			["itemPadding"] = v_u_9,
			["items"] = v_u_39
		})
	})
end