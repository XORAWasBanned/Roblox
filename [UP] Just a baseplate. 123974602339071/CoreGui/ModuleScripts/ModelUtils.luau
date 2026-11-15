-- Path: CoreGui.RobloxGui.Modules.SelfieView.Utils.ModelUtils
local v_u_1 = game:GetService("CollectionService")
local v_u_2 = {
	["Accessory"] = "Accessory",
	["CharacterMesh"] = "CharacterMesh",
	["Decal"] = "Decal",
	["MeshPart"] = "MeshPart",
	["Pants"] = "Pants",
	["Part"] = "Part",
	["Shirt"] = "Shirt",
	["ShirtGraphic"] = "ShirtGraphic",
	["SpecialMesh"] = "SpecialMesh",
	["SurfaceAppearance"] = "SurfaceAppearance"
}
local function v_u_7(p3, p4, p5) -- name: findObjectOfNameAndTypeName
	if p5 == nil then
		return nil
	end
	for _, v6 in p5:GetDescendants() do
		if not v6:IsA(p4) or v6.Name ~= p3 then
			continue
		end
		return v6
	end
	return nil
end
local function v_u_11(p8) -- name: getHead
	-- upvalues: (copy) v_u_7
	if not p8 then
		return nil
	end
	local v9 = nil
	local v10
	if p8 == nil then
		v10 = nil
	else
		v10 = p8:FindFirstChildWhichIsA("FaceControls", true)
	end
	if v10 ~= nil and (v10.Parent and (v10.Parent.ClassName == "MeshPart" or v10.Parent.ClassName == "Part")) then
		v9 = v10.Parent
	end
	return v9 or v_u_7("Head", "MeshPart", p8) or v_u_7("Head", "Part", p8)
end
local function v_u_16(p12, p13) -- name: getAnimator
	local v14 = nil
	local v15
	if p13 > 0 then
		v15 = p12:WaitForChild("Humanoid", p13)
		if v15 then
			if not v15:IsA("Humanoid") then
				v15 = p12:FindFirstChildWhichIsA("Humanoid")
			end
		else
			v15 = p12:FindFirstChildWhichIsA("Humanoid")
		end
	else
		v15 = p12:FindFirstChildWhichIsA("Humanoid")
	end
	if v15 ~= nil then
		if p13 > 0 then
			v14 = v15:WaitForChild("Animator", p13)
		else
			v14 = v15:FindFirstChild("Animator")
		end
	end
	if v14 == nil then
		v14 = p12:FindFirstChildWhichIsA("Animator", true)
	end
	return v14
end
local v_u_17 = {
	"Head",
	"UpperTorso",
	"LowerTorso",
	"Torso",
	"LeftFoot",
	"LeftLowerLeg",
	"LeftUpperLeg",
	"RightFoot",
	"RightLowerLeg",
	"RightUpperLeg",
	"LeftHand",
	"LeftLowerArm",
	"LeftUpperArm",
	"RightHand",
	"RightLowerArm",
	"RightUpperArm"
}
local v_u_18 = {
	["Accessory"] = "Accessory",
	["Animator"] = "Animator",
	["Attachment"] = "Attachment",
	["AnimationConstraint"] = "AnimationConstraint",
	["BallSocketConstraint"] = "BallSocketConstraint",
	["BodyColors"] = "BodyColors",
	["Bone"] = "Bone",
	["CharacterMesh"] = "CharacterMesh",
	["Decal"] = "Decal",
	["DigitsRigDescription"] = "DigitsRigDescription",
	["FaceControls"] = "FaceControls",
	["Humanoid"] = "Humanoid",
	["HumanoidDescription"] = "HumanoidDescription",
	["HumanoidRigDescription"] = "HumanoidRigDescription",
	["MeshPart"] = "MeshPart",
	["Motor6D"] = "Motor6D",
	["NumberValue"] = "NumberValue",
	["Pants"] = "Pants",
	["Part"] = "Part",
	["Shirt"] = "Shirt",
	["ShirtGraphic"] = "ShirtGraphic",
	["SpecialMesh"] = "SpecialMesh",
	["StringValue"] = "StringValue",
	["SurfaceAppearance"] = "SurfaceAppearance",
	["Vector3Value"] = "Vector3Value",
	["WrapTarget"] = "WrapTarget",
	["Weld"] = "Weld",
	["WrapLayer"] = "WrapLayer",
	["WeldConstraint"] = "WeldConstraint",
	["AccessoryWeld"] = "AccessoryWeld",
	["PackageLink"] = "PackageLink",
	["Folder"] = "Folder",
	["RigidConstraint"] = "RigidConstraint",
	["WrapTextureTransfer"] = "WrapTextureTransfer"
}
local function v_u_21(p19) -- name: disableScripts
	-- upvalues: (copy) v_u_21
	for _, v20 in p19:GetChildren() do
		if v20:IsA("Script") then
			v20.Disabled = true
			v20.Parent = nil
		end
		v_u_21(v20)
	end
end
local function v_u_24(p22) -- name: removeUI
	-- upvalues: (copy) v_u_24
	for _, v23 in p22:GetChildren() do
		if v23:IsA("GuiObject") or (v23:IsA("ScreenGui") or (v23:IsA("BillboardGui") or (v23:IsA("AdGui") or v23:IsA("SurfaceGui")))) then
			v23.Parent = nil
		end
		v_u_24(v23)
	end
end
local function v_u_27(p25) -- name: removeInstancesStrict
	-- upvalues: (copy) v_u_18, (copy) v_u_27
	for _, v26 in p25:GetChildren() do
		if not v_u_18[v26.ClassName] then
			v26.Parent = nil
		end
		v_u_27(v26)
	end
end
return {
	["getFaceControls"] = function(p28) -- name: getFaceControls
		if p28 ~= nil then
			return p28:FindFirstChildWhichIsA("FaceControls", true)
		end
	end,
	["getNeck"] = function(p29, p30) -- name: getNeck
		if p29 == nil or p30 == nil then
			return nil
		end
		local v31 = p29:GetDescendants()
		for _, v32 in v31 do
			if not v32:IsA("Motor6D") or v32.Part1 ~= p30 and v32.Name ~= "Neck" then
				continue
			end
			return v32
		end
		for _, v33 in v31 do
			if not v33:IsA("AnimationConstraint") or v33.Parent ~= p30 or (v33.Attachment0 == nil or v33.Attachment0.Name ~= "NeckRigAttachment") and v33.Name ~= "Neck" then
				continue
			end
			return v33
		end
		return nil
	end,
	["getHead"] = v_u_11,
	["getAnimator"] = v_u_16,
	["updateTransparency"] = function(p34, p35) -- name: updateTransparency
		-- upvalues: (copy) v_u_17, (copy) v_u_1
		for _, v36 in ipairs(p34:GetDescendants()) do
			if v36:IsA("Decal") then
				v36.Transparency = 0
			elseif v36:IsA("MeshPart") then
				if not (v36.Parent and v36.Parent:IsA("Accessory") or table.find(v_u_17, v36.Name)) then
					continue
				end
				if table.find(p35, v36.MeshId) then
					v36.Transparency = p35[v36.MeshId]
				else
					p35[v36.MeshId] = v36.Transparency
				end
			else
				if not v36:IsA("Part") then
					continue
				end
				if v36.Parent and v36.Parent:IsA("Accessory") or table.find(v_u_17, v36.Name) then
					v36.Transparency = 0
				end
				if not v_u_1:HasTag(v36, "__RBX__LOCKED_TRANSPARENT") then
					continue
				end
				v36.Transparency = 1
			end
		end
	end,
	["shouldMarkCloneDirtyForDescendant"] = function(p37) -- name: shouldMarkCloneDirtyForDescendant
		-- upvalues: (copy) v_u_2
		if p37:IsA("MeshPart") or (p37:IsA("Part") or p37:IsA("Decal")) then
			if p37.Transparency < 1 then
				return true
			end
		elseif v_u_2[p37.ClassName] then
			return true
		end
		return false
	end,
	["resetPartOrientation"] = function(p38) -- name: resetPartOrientation
		for _, v39 in ipairs(p38:GetDescendants()) do
			if not v39:IsA("Motor6D") then
				continue
			end
			v39.C0 = CFrame.new(v39.C0.Position)
			v39.C1 = CFrame.new(v39.C1.Position)
		end
	end,
	["removeScripts"] = function(p40) -- name: removeScripts
		local v41 = p40:FindFirstChild("Animate")
		if v41 then
			v41:Destroy()
		end
		local v42 = p40:FindFirstChild("Health")
		if v42 then
			v42:Destroy()
		end
		for _, v43 in pairs(p40:GetDescendants()) do
			if not v43:IsA("BaseScript") then
				continue
			end
			v43:Destroy()
		end
	end,
	["removeTags"] = function(p44) -- name: removeTags
		-- upvalues: (copy) v_u_1
		local v45 = v_u_1:GetTags(p44)
		for _, v46 in ipairs(v45) do
			if v46 == "NoFace" then
				continue
			end
			v_u_1:RemoveTag(p44, v46)
		end
		for _, v47 in ipairs(p44:GetDescendants()) do
			local v48 = v_u_1:GetTags(v47)
			for _, v49 in ipairs(v48) do
				if v49 == "NoFace" then
					continue
				end
				v_u_1:RemoveTag(v47, v49)
			end
		end
		v_u_1:GetTags(p44)
	end,
	["sanitizeCharacter"] = function(p50) -- name: sanitizeCharacter
		-- upvalues: (copy) v_u_27
		if p50 then
			v_u_27(p50)
		end
	end,
	["isValidAvatar"] = function(p51) -- name: isValidAvatar
		-- upvalues: (copy) v_u_16, (copy) v_u_11
		if v_u_16(p51, 10) then
			return v_u_11(p51) and true or false
		else
			return false
		end
	end,
	["hasDynamicHead"] = function(p52) -- name: hasDynamicHead
		local v53
		if p52 == nil then
			v53 = nil
		else
			v53 = p52:FindFirstChildWhichIsA("FaceControls", true)
		end
		return v53 ~= nil
	end
}