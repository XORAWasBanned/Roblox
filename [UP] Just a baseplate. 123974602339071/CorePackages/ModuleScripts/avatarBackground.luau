-- Path: CorePackages.Packages._Index.MomentScenes.MomentScenes.Builders._Utils.avatarBackground
local v_u_1 = require(script.Parent.loadAsset)
local v_u_2 = CFrame.Angles(0, 3.141592653589793, 0)
local function v_u_6(p3) -- name: findBackgroundFolder
	local v4 = p3:FindFirstChild("AvatarBackground")
	if v4 ~= nil then
		return v4
	end
	if p3:FindFirstChild("ImageId") ~= nil and p3:FindFirstChild("Color") ~= nil then
		return p3
	end
	for _, v5 in p3:GetChildren() do
		if v5:FindFirstChild("ImageId") == nil or v5:FindFirstChild("Color") == nil then
			continue
		end
		return v5
	end
	return nil
end
local function v_u_11(p7) -- name: readBackgroundData
	-- upvalues: (copy) v_u_6
	local v8 = v_u_6(p7)
	if v8 == nil then
		return nil
	else
		local v9 = v8:FindFirstChild("ImageId")
		local v10 = v8:FindFirstChild("Color")
		if v9 == nil or not v9:IsA("IntValue") then
			return nil
		else
			return v10 ~= nil and v10:IsA("Color3Value") and {
				["imageId"] = v9.Value,
				["backgroundColor"] = v10.Value
			} or nil
		end
	end
end
local function v_u_18(p12) -- name: extractCycloramaModel
	local v13 = p12:FindFirstChild("AvatarCyclorama")
	if v13 ~= nil and v13:IsA("Model") then
		local v14
		if v13:FindFirstChild("texture_mesh") == nil then
			v14 = false
		else
			v14 = v13:FindFirstChild("color_mesh") ~= nil
		end
		if v14 then
			return v13
		end
	end
	local v15 = p12:FindFirstChildWhichIsA("Model")
	if v15 ~= nil then
		local v16
		if v15:FindFirstChild("texture_mesh") == nil then
			v16 = false
		else
			v16 = v15:FindFirstChild("color_mesh") ~= nil
		end
		if v16 then
			return v15
		end
	end
	if p12:IsA("Model") then
		local v17
		if p12:FindFirstChild("texture_mesh") == nil then
			v17 = false
		else
			v17 = p12:FindFirstChild("color_mesh") ~= nil
		end
		if v17 then
			return p12
		end
	end
	return nil
end
local function v_u_23() -- name: loadCyclorama
	-- upvalues: (copy) v_u_1, (copy) v_u_18
	local v19 = v_u_1.loadAsset
	local v20, v21 = pcall(v19, 94967210842404)
	if v20 then
		if v21 == nil or typeof(v21) ~= "Instance" then
			warn((("avatarBackground: cyclorama %* loaded a %*, expected an Instance"):format(94967210842404, (typeof(v21)))))
			return nil
		else
			local v22 = v_u_18(v21)
			if v22 == nil then
				warn((("avatarBackground: cyclorama %* has no Model holding both texture_mesh and color_mesh"):format(94967210842404)))
				v21:Destroy()
				return nil
			else
				if v22 ~= v21 then
					v22.Parent = nil
					v21:Destroy()
				end
				v22.Name = "AvatarCyclorama"
				return v22
			end
		end
	else
		warn((("avatarBackground: cyclorama %* failed to load: %*"):format(94967210842404, v21)))
		return nil
	end
end
local function v_u_29(p24) -- name: loadBackgroundData
	-- upvalues: (copy) v_u_1, (copy) v_u_11
	local v25 = v_u_1.loadAsset
	local v26, v27 = pcall(v25, p24)
	if not v26 then
		warn((("avatarBackground: background %* failed to load: %*"):format(p24, v27)))
		return nil
	end
	if v27 == nil or typeof(v27) ~= "Instance" then
		warn((("avatarBackground: background %* loaded a %*, expected an Instance"):format(p24, (typeof(v27)))))
		return nil
	end
	local v28 = v_u_11(v27)
	if v28 == nil then
		warn((("avatarBackground: background %* has no folder with an ImageId IntValue and a Color Color3Value"):format(p24)))
	end
	v27:Destroy()
	return v28
end
local function v_u_35(p_u_30, p31) -- name: applyTexture
	local v_u_32 = ("rbxassetid://%*"):format(p31)
	if p_u_30:IsA("MeshPart") then
		p_u_30.TextureID = v_u_32
	end
	local v33, v34 = pcall(function()
		-- upvalues: (copy) p_u_30, (copy) v_u_32
		p_u_30.TextureContent = Content.fromUri(v_u_32)
	end)
	if not v33 then
		warn((("avatarBackground: TextureContent assignment failed for %*: %*"):format(p31, v34)))
	end
end
local function v_u_40(p36, p37) -- name: applyBackground
	-- upvalues: (copy) v_u_35
	local v38 = p36:FindFirstChild("texture_mesh")
	local v39 = p36:FindFirstChild("color_mesh")
	if v38 ~= nil and v38:IsA("BasePart") then
		v38.Anchored = true
		v38.Transparency = 0.015
		v_u_35(v38, p37.imageId)
	end
	if v39 ~= nil and v39:IsA("BasePart") then
		v39.Anchored = true
		v39.Transparency = 0
		v39.Color = p37.backgroundColor
	end
end
return {
	["attach"] = nil,
	["pinToParent"] = nil,
	["REST"] = nil,
	["applyBackground"] = nil,
	["resolveAssetId"] = nil,
	["CYCLORAMA_ASSET_ID"] = 94967210842404,
	["DEFAULT_ASSET_ID"] = 121199209890990,
	["FRONT_VISIBLE_TRANSPARENCY"] = 0.015,
	["attach"] = function(p41, p42) -- name: attach
		-- upvalues: (copy) v_u_23, (copy) v_u_29, (copy) v_u_40, (copy) v_u_2
		if p42 == false or p42 == "none" then
			p42 = nil
		elseif type(p42) == "number" then
			if p42 <= 0 then
				p42 = nil
			end
		else
			p42 = 121199209890990
		end
		if p42 == nil then
			return nil
		end
		local v43 = v_u_23()
		if v43 == nil then
			return nil
		end
		local v44 = v_u_29(p42)
		if v44 == nil then
			v43:Destroy()
			return nil
		end
		v_u_40(v43, v44)
		v43:PivotTo(CFrame.new() * v_u_2)
		v43.Parent = p41
		v43.WorldPivot = p41:GetPivot()
		return v43
	end,
	["pinToParent"] = function(p45, p46) -- name: pinToParent
		p45.WorldPivot = p46:GetPivot()
	end,
	["REST"] = v_u_2,
	["applyBackground"] = v_u_40,
	["resolveAssetId"] = function(p47) -- name: resolveAssetId
		if p47 == false or p47 == "none" then
			return nil
		elseif type(p47) == "number" then
			if p47 <= 0 then
				return nil
			else
				return p47
			end
		else
			return 121199209890990
		end
	end
}