-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.MakeupPreviewUtils
local v_u_1 = game:GetService("AssetService")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("Players")
local v_u_4 = require(v2.Packages.Thumbnailing)
local v_u_5 = v_u_4.FFlagSharedMakeupThumbnailCamera
local v6 = script.Parent
local v_u_7 = require(v6.Constants)
local v_u_8 = BrickColor.new(194)
local v_u_9 = CFrame.lookAt(Vector3.new(0, 0.0936213, -15.755899), Vector3.new(0, 0.0936213, -14.755899))
local v_u_10 = {
	[Enum.AvatarAssetType.FaceMakeup] = v_u_9,
	[Enum.AvatarAssetType.LipMakeup] = CFrame.lookAt(Vector3.new(0, -0.2991416, -6.4134803), Vector3.new(0, -0.2991416, -5.4134803)),
	[Enum.AvatarAssetType.EyeMakeup] = CFrame.lookAt(Vector3.new(0, 0.10852961, -9.357428), Vector3.new(0, 0.10852961, -8.357428)),
	[Enum.AvatarAssetType.EyebrowAccessory] = CFrame.lookAt(Vector3.new(4.5928926, 0.37917417, -7.374273), Vector3.new(4.0461125, 0.35952252, -6.537227)),
	[Enum.AvatarAssetType.EyelashAccessory] = CFrame.lookAt(Vector3.new(4.593966, 0.2791934, -7.375918), Vector3.new(4.047186, 0.25954175, -6.5388722))
}
local v_u_22 = {
	["getHeadPreviewCameraData"] = function(p11) -- name: getHeadPreviewCameraData
		local v12 = p11:FindFirstChild("Head")
		if v12 and (v12:IsA("MeshPart") and not p11:FindFirstChild("HumanoidRootPart")) then
			return v12.CFrame, v12.Size
		else
			return nil, nil
		end
	end,
	["setupMakeupThumbnailCamera"] = function(p13, p14, p15) -- name: setupMakeupThumbnailCamera
		-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_9, (copy) v_u_10
		local v16 = p13:FindFirstChild("Head")
		if not (v16 and v16:IsA("MeshPart")) then
			return false
		end
		if v_u_5 then
			local v17 = v_u_4.MakeupCameraUtility.SetupCamera
			local v18 = v16.CFrame
			local v19
			if p15 then
				v19 = p15.Value
			else
				v19 = nil
			end
			v17(p14, v18, v19)
			return true
		end
		local v20 = v_u_9
		if p15 then
			v20 = v_u_10[p15] or v20
		end
		p14.CFrame = v16.CFrame * v20
		p14.Focus = v16.CFrame
		p14.FieldOfView = 5
		return true
	end,
	["isMakeupAssetType"] = function(p21) -- name: isMakeupAssetType
		-- upvalues: (copy) v_u_7
		return v_u_7.MakeupAssetTypes[p21] == true
	end
}
local v_u_23 = {
	[Enum.AvatarAssetType.FaceMakeup] = Enum.MakeupType.Face,
	[Enum.AvatarAssetType.LipMakeup] = Enum.MakeupType.Lip,
	[Enum.AvatarAssetType.EyeMakeup] = Enum.MakeupType.Eye
}
local v_u_24 = {
	[Enum.AvatarAssetType.EyebrowAccessory] = Enum.AccessoryType.Eyebrow,
	[Enum.AvatarAssetType.EyelashAccessory] = Enum.AccessoryType.Eyelash
}
local v_u_25 = {
	[Enum.AccessoryType.Hat] = true,
	[Enum.AccessoryType.Hair] = true,
	[Enum.AccessoryType.Face] = true,
	[Enum.AccessoryType.Eyebrow] = true,
	[Enum.AccessoryType.Eyelash] = true
}
local function v_u_29(p26, p27) -- name: removeMatchingChildren
	for _, v28 in ipairs(p26:GetChildren()) do
		if not p27(v28) then
			continue
		end
		v28:Destroy()
	end
end
local function v_u_39(p30, p31, p_u_32) -- name: addAssetToDescription
	-- upvalues: (copy) v_u_23, (copy) v_u_24, (copy) v_u_29
	local v33
	if p_u_32 then
		v33 = v_u_23[p_u_32]
	else
		v33 = p_u_32
	end
	if p_u_32 then
		p_u_32 = v_u_24[p_u_32]
	end
	if v33 then
		v_u_29(p30, function(p34)
			return p34:IsA("MakeupDescription")
		end)
		local v35 = Instance.new("MakeupDescription")
		v35.MakeupType = v33
		v35.Instance = p31
		v35.Parent = p30
	elseif p_u_32 then
		v_u_29(p30, function(p36)
			-- upvalues: (copy) p_u_32
			local v37 = p36:IsA("AccessoryDescription")
			if v37 then
				v37 = p36.AccessoryType == p_u_32
			end
			return v37
		end)
		local v38 = Instance.new("AccessoryDescription")
		v38.AccessoryType = p_u_32
		v38.Instance = p31
		v38.IsLayered = true
		v38.Parent = p30
	end
end
function v_u_22.stripToHead(p40) -- name: stripToHead
	-- upvalues: (copy) v_u_25
	local v41 = p40:FindFirstChild("Head")
	if v41 then
		for _, v42 in ipairs(p40:GetChildren()) do
			if v42:IsA("BasePart") then
				if v42 == v41 then
					continue
				end
				v42:Destroy()
			else
				if not v42:IsA("Accessory") or v_u_25[v42.AccessoryType] then
					continue
				end
				v42:Destroy()
			end
		end
	end
end
function v_u_22.anchorRigidPreviewParts(p43) -- name: anchorRigidPreviewParts
	for _, v44 in ipairs(p43:GetDescendants()) do
		if not v44:IsA("BasePart") then
			continue
		end
		local v45 = v44:FindFirstAncestorWhichIsA("Accessory")
		if v45 then
			v45 = v45:FindFirstChildWhichIsA("WrapLayer", true) ~= nil
		end
		if v45 then
			continue
		end
		v44.Anchored = true
	end
end
function v_u_22.getFolderAccessories(p46, p47) -- name: getFolderAccessories
	local v48 = {}
	for v49, v50 in ipairs(p46:GetChildren()) do
		if not v50:IsA("Accessory") then
			continue
		end
		local v51
		if p47 and p47[v49] then
			v51 = p47[v49].assetType
		else
			v51 = nil
		end
		table.insert(v48, {
			["asset"] = v50,
			["assetType"] = v51
		})
	end
	return v48
end
local function v_u_59(p_u_52, p53, p54, p55) -- name: createHeadWithAsset
	-- upvalues: (copy) v_u_39, (copy) v_u_3, (copy) v_u_22
	if p53 then
		v_u_39(p_u_52, p53, p54)
	end
	if p55 then
		for _, v56 in ipairs(p55) do
			v_u_39(p_u_52, v56.asset, v56.assetType)
		end
	end
	local v_u_57 = nil
	local function v58()
		-- upvalues: (ref) v_u_57, (ref) v_u_3, (copy) p_u_52
		v_u_57 = v_u_3:CreateHumanoidModelFromDescriptionAsync(p_u_52, Enum.HumanoidRigType.R15)
	end
	if not (pcall(v58) and v_u_57) then
		return nil
	end
	v_u_57.Parent = workspace
	v_u_57:GetBoundingBox()
	v_u_57.Parent = nil
	v_u_22.stripToHead(v_u_57)
	v_u_22.anchorRigidPreviewParts(v_u_57)
	return v_u_57
end
function v_u_22.createMakeupHeadPreview(p60, p61, p62) -- name: createMakeupHeadPreview
	-- upvalues: (copy) v_u_3, (copy) v_u_59
	local v63 = nil
	local v_u_64 = v_u_3.LocalPlayer
	if v_u_64 then
		local function v65()
			-- upvalues: (ref) v_u_3, (copy) v_u_64
			return v_u_3:GetHumanoidDescriptionFromUserIdAsync(v_u_64.UserId)
		end
		local v66, v67 = pcall(v65)
		if v66 then
			v63 = v67 or v63
		end
	end
	return v_u_59(v63 or Instance.new("HumanoidDescription"), p60, p61, p62)
end
function v_u_22.createMakeupThumbnailPreview(p68, p69) -- name: createMakeupThumbnailPreview
	-- upvalues: (copy) v_u_39, (copy) v_u_3, (copy) v_u_22, (copy) v_u_8
	local v_u_70 = Instance.new("HumanoidDescription")
	v_u_70.Head = 103273511207307
	if p68 then
		v_u_39(v_u_70, p68, p69)
	end
	local v_u_71 = nil
	local function v72()
		-- upvalues: (ref) v_u_71, (ref) v_u_3, (copy) v_u_70
		v_u_71 = v_u_3:CreateHumanoidModelFromDescriptionAsync(v_u_70, Enum.HumanoidRigType.R15)
	end
	local v73
	if pcall(v72) and v_u_71 then
		v_u_71.Parent = workspace
		v_u_71:GetBoundingBox()
		v_u_71.Parent = nil
		v_u_22.stripToHead(v_u_71)
		v_u_22.anchorRigidPreviewParts(v_u_71)
		v73 = v_u_71
	else
		v73 = nil
	end
	if not v73 then
		return nil
	end
	local v74 = v73:FindFirstChildOfClass("BodyColors")
	if v74 then
		v74.HeadColor = v_u_8
	end
	local v75 = v73:FindFirstChild("Head")
	if v75 then
		v75.Color = v_u_8.Color
	end
	return v73
end
function v_u_22.compositeMakeupFolder(p76, p_u_77) -- name: compositeMakeupFolder
	-- upvalues: (copy) v_u_1
	local v78 = {}
	for _, v79 in ipairs(p76:GetChildren()) do
		if not v79:IsA("Decal") then
			continue
		end
		table.insert(v78, v79)
	end
	if #v78 == 0 then
		return nil
	end
	local v80 = v78[1].TextureContent
	if v80 then
		v80 = v78[1].TextureContent.Object
	end
	if not v80 then
		return nil
	end
	if p_u_77 then
		table.sort(v78, function(p81, p82)
			-- upvalues: (copy) p_u_77
			return (p_u_77[p81.Name] or 0) < (p_u_77[p82.Name] or 0)
		end)
	end
	local v83 = v80.Size
	local v84 = Vector2.new(v83.X, v83.Y)
	local v85 = Instance.new("Decal")
	for _, v86 in ipairs({
		"TextureContent",
		"RoughnessMapContent",
		"MetalnessMapContent",
		"NormalMapContent"
	}) do
		local v87 = false
		for _, v88 in ipairs(v78) do
			local v89 = v88[v86]
			if not (v89 and (v89.Object or v89.Uri)) then
				continue
			end
			v87 = true
		end
		if not v87 then
			break
		end
		local v90 = v_u_1:CreateEditableImage({
			["Size"] = v84
		})
		local v91 = false
		for _, v92 in ipairs(v78) do
			local v_u_93 = v92[v86]
			if not v_u_93 then
				continue
			end
			local v94 = v_u_93.Object
			local v95
			if v94 or (not v_u_93.Uri or v_u_93.Uri == "") then
				v95 = v94
			else
				local function v96()
					-- upvalues: (ref) v_u_1, (copy) v_u_93
					return v_u_1:CreateEditableImageAsync(v_u_93)
				end
				local v97
				v97, v95 = pcall(v96)
				if not v97 then
					v95 = v94
				end
			end
			if not v95 then
				continue
			end
			local v98
			if v91 then
				v98 = Enum.ImageCombineType.AlphaBlend
			else
				v98 = Enum.ImageCombineType.Overwrite
			end
			v90:DrawImage(Vector2.new(0, 0), v95, v98)
			v91 = true
		end
		v85[v86] = Content.fromObject(v90)
	end
	local v99 = v78[1]:FindFirstChildWhichIsA("WrapTextureTransfer")
	if v99 then
		v99:Clone().Parent = v85
	end
	return v85
end
return v_u_22