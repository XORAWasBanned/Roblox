-- Path: CoreGui.RobloxGui.Modules.VR.Healthbar3D
local v1 = Color3.new(0.8941176470588236, 0.9254901960784314, 0.9647058823529412)
local v_u_2 = Color3.new(1, 0.10980392156862745, 0)
local v3 = Color3.new(0.9803921568627451, 0.9215686274509803, 0)
local v_u_4 = Color3.new(0.10588235294117647, 0.9882352941176471, 0.4196078431372549)
local v_u_5 = game:GetService("Players")
local v6 = game:GetService("CoreGui")
local v_u_7 = game:GetService("StarterGui")
local v_u_8 = game:GetService("UserInputService")
local v_u_9 = game:GetService("CorePackages")
v6:WaitForChild("RobloxGui")
local v_u_10 = Instance.new("Frame")
v_u_10.Name = "HealthbarContainer"
v_u_10.BackgroundTransparency = 1
v_u_10.Size = UDim2.new(1, 0, 1, 0)
local v_u_11 = Instance.new("ImageLabel")
v_u_11.ImageColor3 = v1
v_u_11.BackgroundTransparency = 1
v_u_11.ScaleType = Enum.ScaleType.Slice
v_u_11.SliceCenter = Rect.new(10, 10, 10, 10)
v_u_11.Name = "HealthbarBack"
v_u_11.Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png"
v_u_11.Size = UDim2.new(1, 0, 0.3, 0)
v_u_11.Position = UDim2.new(0, 0, 0.7, 0)
v_u_11.Parent = v_u_10
local v_u_12 = Instance.new("ImageLabel")
v_u_12.ImageColor3 = v_u_4
v_u_12.BackgroundTransparency = 1
v_u_12.ScaleType = Enum.ScaleType.Slice
v_u_12.SliceCenter = Rect.new(10, 10, 10, 10)
v_u_12.Size = UDim2.new(1, 0, 1, 0)
v_u_12.Position = UDim2.new(0, 0, 0, 0)
v_u_12.Name = "HealthbarFill"
v_u_12.Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png"
v_u_12.Parent = v_u_11
local v_u_13 = Instance.new("TextLabel")
v_u_13.Name = "PlayerName"
v_u_13.BackgroundTransparency = 1
v_u_13.TextColor3 = Color3.new(1, 1, 1)
v_u_13.Text = ""
v_u_13.Font = Enum.Font.SourceSansBold
v_u_13.FontSize = Enum.FontSize.Size24
v_u_13.TextXAlignment = Enum.TextXAlignment.Left
v_u_13.Size = UDim2.new(1, 0, 0, 14)
v_u_13.Parent = v_u_10
local function v_u_17(p14, p15) -- name: FindChildOfType
	for _, v16 in pairs(p14:GetChildren()) do
		if not v16:IsA(p15) then
			continue
		end
		return v16
	end
end
local v_u_18 = {}
local v19 = v_u_2.r
local v20 = v_u_2.g
local v21 = v_u_2.b
v_u_18[Vector3.new(v19, v20, v21)] = 0.1
local v22 = v3.r
local v23 = v3.g
local v24 = v3.b
v_u_18[Vector3.new(v22, v23, v24)] = 0.5
local v25 = v_u_4.r
local v26 = v_u_4.g
local v27 = v_u_4.b
v_u_18[Vector3.new(v25, v26, v27)] = 0.8
local function v_u_36(p28) -- name: HealthbarColorTransferFunction
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_18
	if p28 <= 0.1 then
		return v_u_2
	end
	if p28 >= 0.8 then
		return v_u_4
	end
	local v29 = Vector3.new(0, 0, 0)
	local v30 = 0
	for v31, v32 in pairs(v_u_18) do
		local v33 = p28 - v32
		if v33 == 0 then
			return Color3.new(v31.x, v31.y, v31.z)
		end
		local v34 = 1 / (v33 * v33)
		v29 = v29 + v34 * v31
		v30 = v30 + v34
	end
	local v35 = v29 / v30
	return Color3.new(v35.x, v35.y, v35.z)
end
local v_u_37 = nil
local v_u_38 = nil
local function v_u_48(p_u_39) -- name: RegisterHumanoid
	-- upvalues: (ref) v_u_38, (ref) v_u_37, (copy) v_u_5, (copy) v_u_48, (copy) v_u_12, (copy) v_u_36
	if v_u_38 then
		v_u_38:disconnect()
		v_u_38 = nil
	end
	if v_u_37 then
		v_u_37:disconnect()
		v_u_37 = nil
	end
	if p_u_39 then
		v_u_38 = p_u_39.AncestryChanged:connect(function(p40, p41)
			-- upvalues: (ref) v_u_5, (copy) p_u_39, (ref) v_u_48
			local v42 = v_u_5.LocalPlayer
			if p40 == p_u_39 and (not v42 or p41 ~= v42.Character) then
				v_u_48(nil)
			end
		end)
		v_u_37 = p_u_39.HealthChanged:connect(function()
			-- upvalues: (copy) p_u_39, (ref) v_u_12, (ref) v_u_36
			local v43 = p_u_39
			local v44 = v43.Health / v43.MaxHealth
			local v45 = v44 ~= v44 and 1 or v44
			v_u_12.ImageColor3 = v_u_36(v45)
			v_u_12.Size = UDim2.new(v45, 0, 1, 0)
		end)
		local v46 = p_u_39.Health / p_u_39.MaxHealth
		local v47 = v46 ~= v46 and 1 or v46
		v_u_12.ImageColor3 = v_u_36(v47)
		v_u_12.Size = UDim2.new(v47, 0, 1, 0)
	end
end
local function v_u_51(p49) -- name: OnCharacterChildAdded
	-- upvalues: (copy) v_u_5, (copy) v_u_48
	local v50 = v_u_5.LocalPlayer
	if v50 and (p49.Parent == v50.Character and p49:IsA("Humanoid")) then
		v_u_48(p49)
	end
end
local v_u_52 = nil
local function v_u_55(p53) -- name: OnCharacterAdded
	-- upvalues: (copy) v_u_17, (copy) v_u_48, (ref) v_u_52, (copy) v_u_51
	local v54 = v_u_17(p53, "Humanoid")
	if v54 then
		v_u_48(v54)
	end
	if v_u_52 then
		v_u_52:disconnect()
		v_u_52 = nil
	end
	v_u_52 = p53.ChildAdded:connect(v_u_51)
end
if v_u_5.LocalPlayer then
	local v56 = v_u_5.LocalPlayer
	v_u_13.Text = v56.Name
	v56.CharacterAdded:connect(v_u_55)
	if v56.Character then
		local v57 = v56.Character
		local v58 = v_u_17(v57, "Humanoid")
		if v58 then
			v_u_48(v58)
		end
		if v_u_52 then
			v_u_52:disconnect()
			v_u_52 = nil
		end
		v_u_52 = v57.ChildAdded:connect(v_u_51)
	end
else
	spawn(function()
		-- upvalues: (copy) v_u_5, (copy) v_u_13, (copy) v_u_55, (copy) v_u_17, (copy) v_u_48, (ref) v_u_52, (copy) v_u_51
		while not v_u_5.LocalPlayer do
			v_u_5.ChildAdded:wait()
		end
		local v59 = v_u_5.LocalPlayer
		v_u_13.Text = v59.Name
		v59.CharacterAdded:connect(v_u_55)
		if v59.Character then
			local v60 = v59.Character
			local v61 = v_u_17(v60, "Humanoid")
			if v61 then
				v_u_48(v61)
			end
			if v_u_52 then
				v_u_52:disconnect()
				v_u_52 = nil
			end
			v_u_52 = v60.ChildAdded:connect(v_u_51)
		end
	end)
end
local v_u_62 = {
	["ModuleName"] = "Healthbar",
	["KeepVRTopbarOpen"] = false,
	["VRIsExclusive"] = false,
	["VRClosesNonExclusive"] = false
}
local v_u_63 = nil
local v_u_64 = nil
local v_u_65 = nil
local function v94(p66) -- name: OnVREnabled
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13, (copy) v_u_7, (ref) v_u_63, (ref) v_u_64, (ref) v_u_65, (copy) v_u_10, (copy) v_u_62
	if p66 == "VREnabled" then
		if v_u_8.VREnabled then
			local v_u_67 = require(v_u_9.Workspace.Packages.VrCommon).VRHub
			local v_u_68 = require(v_u_9.Workspace.Packages.VrCommon).Panel3D
			local v_u_69 = v_u_68.Get("Healthbar")
			v_u_69:ResizeStuds(1.5, 0.25, 128)
			v_u_69:SetType(v_u_68.Type.Fixed, {
				["CFrame"] = CFrame.new(0, 0, -5)
			})
			v_u_69:SetVisible(true)
			function v_u_69.PreUpdate(p70, _, _, _, _) -- name: PreUpdate
				-- upvalues: (copy) v_u_68, (copy) v_u_69
				local v71 = v_u_68.Get("Backpack") or v_u_68.Get("Topbar3D")
				local v72 = v_u_68.Get("Topbar3D")
				if v71 and v72 then
					local v73 = v71.localCF or CFrame.new()
					local v74 = CFrame.new
					local v75 = v72.width
					local v76 = v71.width
					p70.localCF = v73 * v74(math.max(v75, v76) / 2 - v_u_69.width / 2 - 0.11, 0.25, 0.1)
				end
			end
			function v_u_69.CalculateTransparency(_) -- name: CalculateTransparency
				-- upvalues: (copy) v_u_68, (ref) v_u_11, (ref) v_u_12, (ref) v_u_13
				local v77 = v_u_68.Get("Backpack")
				local v78 = v_u_68.Get("Topbar3D")
				local v79 = v77 and (v77:IsVisible() and v77:CalculateTransparency()) or 1
				local v80 = v78 and (v78:IsVisible() and v78:CalculateTransparency()) or 1
				local v81 = math.min(v79, v80)
				v_u_11.ImageTransparency = v81
				v_u_12.ImageTransparency = v81
				v_u_13.TextTransparency = v81
				return v81
			end
			local v_u_82 = false
			v_u_63 = v_u_7.CoreGuiChangedSignal:connect(function()
				-- upvalues: (copy) v_u_69, (ref) v_u_7, (ref) v_u_82
				local v83 = v_u_69
				local v84 = v_u_7:GetCoreGuiEnabled(Enum.CoreGuiType.Health)
				if v84 then
					v84 = not v_u_82
				end
				v83:SetVisible(v84)
			end)
			v_u_64 = v_u_67.ModuleOpened.Event:connect(function(_)
				-- upvalues: (copy) v_u_67, (ref) v_u_82, (copy) v_u_69, (ref) v_u_7
				for _, v85 in pairs(v_u_67:GetOpenedModules()) do
					if not v85.VRIsExclusive then
						continue
					end
					v_u_82 = true
				end
				v_u_82 = false
				local v86 = v_u_69
				local v87 = v_u_7:GetCoreGuiEnabled(Enum.CoreGuiType.Health)
				if v87 then
					v87 = not v_u_82
				end
				v86:SetVisible(v87)
			end)
			v_u_65 = v_u_67.ModuleClosed.Event:connect(function(_)
				-- upvalues: (copy) v_u_67, (ref) v_u_82, (copy) v_u_69, (ref) v_u_7
				for _, v88 in pairs(v_u_67:GetOpenedModules()) do
					if not v88.VRIsExclusive then
						continue
					end
					v_u_82 = true
				end
				v_u_82 = false
				local v89 = v_u_69
				local v90 = v_u_7:GetCoreGuiEnabled(Enum.CoreGuiType.Health)
				if v90 then
					v90 = not v_u_82
				end
				v89:SetVisible(v90)
			end)
			for _, v91 in pairs(v_u_67:GetOpenedModules()) do
				if not v91.VRIsExclusive then
					continue
				end
				v_u_82 = true
				v92 = v_u_82
			end
			v_u_82 = false
			local v92 = v_u_82
			local v93 = v_u_7:GetCoreGuiEnabled(Enum.CoreGuiType.Health)
			if v93 then
				v93 = not v92
			end
			v_u_69:SetVisible(v93)
			v_u_10.Parent = v_u_69:GetGUI()
			v_u_67:RegisterModule(v_u_62)
			return
		end
		if v_u_63 then
			v_u_63:disconnect()
			v_u_63 = nil
		end
		if v_u_64 then
			v_u_64:disconnect()
			v_u_64 = nil
		end
		if v_u_65 then
			v_u_65:disconnect()
			v_u_65 = nil
		end
		v_u_10.Parent = nil
	end
end
v_u_8.Changed:connect(v94)
if v_u_8.VREnabled then
	v94("VREnabled")
end
return v_u_62