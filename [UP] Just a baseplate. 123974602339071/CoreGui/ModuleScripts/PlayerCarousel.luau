-- Path: CoreGui.RobloxGui.Modules.AvatarContextMenu.PlayerCarousel
local v_u_1 = {}
v_u_1.__index = v_u_1
local v_u_2 = game:GetService("GuiService")
local v3 = game:GetService("CoreGui")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = game:GetService("UserInputService")
local v_u_6 = Color3.fromRGB(0, 162, 255)
local v_u_7 = Color3.fromRGB(0, 0, 0)
local v_u_8 = v3:WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("AvatarContextMenu")
local v_u_9 = nil
local v_u_10 = nil
local v_u_11 = nil
local v_u_12 = {}
local v_u_13 = {}
local function v_u_20() -- name: getSortedCarouselButtons
	-- upvalues: (ref) v_u_9
	local v14 = {}
	local v_u_15 = {}
	for v16, v17 in ipairs(v_u_9:GetChildren()) do
		if not v17:IsA("GuiObject") or v17.Name == "_CarouselDivider" then
			continue
		end
		table.insert(v14, v17)
		v_u_15[v17] = v16
	end
	table.sort(v14, function(p18, p19)
		-- upvalues: (copy) v_u_15
		if p18.LayoutOrder == p19.LayoutOrder then
			return v_u_15[p18] < v_u_15[p19]
		else
			return p18.LayoutOrder < p19.LayoutOrder
		end
	end)
	return v14
end
local function v_u_38(p21) -- name: CreateMenuCarousel
	-- upvalues: (ref) v_u_9, (ref) v_u_10, (ref) v_u_11, (copy) v_u_20, (copy) v_u_7, (copy) v_u_2, (copy) v_u_6, (ref) v_u_12, (copy) v_u_5
	local v22 = Instance.new("Frame")
	v22.Name = "PlayerCarousel"
	v22.AnchorPoint = Vector2.new(0.5, 0.5)
	v22.BackgroundTransparency = 1
	v22.Position = UDim2.new(0.5, 0, 0.5, 0)
	v22.Size = UDim2.new(1, 0, 0.28, 0)
	v22.ClipsDescendants = true
	local v23 = Instance.new("Frame")
	v23.Name = "InnerFrame"
	v23.AnchorPoint = Vector2.new(0.5, 0.5)
	v23.BackgroundTransparency = 1
	v23.Position = UDim2.new(0.5, 0, 0.5, 0)
	v23.Size = UDim2.new(0.8, 0, 1, 0)
	v23.ClipsDescendants = true
	v23.Active = true
	v23.Parent = v22
	v_u_9 = Instance.new("Frame")
	v_u_9.Name = "SelectedPlayer"
	v_u_9.AnchorPoint = Vector2.new(0.5, 0.5)
	v_u_9.BackgroundTransparency = 1
	v_u_9.Position = UDim2.new(0.5, 0, 0.5, 0)
	v_u_9.Size = UDim2.new(0, 100, 1, -10)
	v_u_9.Parent = v23
	v_u_10 = Instance.new("UIPageLayout")
	v_u_10.EasingDirection = Enum.EasingDirection.Out
	v_u_10.EasingStyle = Enum.EasingStyle.Quad
	v_u_10.Padding = UDim.new(0, 5)
	v_u_10.TweenTime = 0.25
	v_u_10.HorizontalAlignment = Enum.HorizontalAlignment.Center
	v_u_10.VerticalAlignment = Enum.VerticalAlignment.Center
	v_u_10.TouchInputEnabled = false
	v_u_10.Circular = true
	v_u_10.SortOrder = Enum.SortOrder.LayoutOrder
	local v24 = Instance.new("UIAspectRatioConstraint")
	v24.DominantAxis = Enum.DominantAxis.Height
	v24.Parent = v_u_9
	v_u_11 = Instance.new("BindableEvent")
	v_u_11.Name = "PlayerChanged"
	local v_u_25 = nil
	v_u_10:GetPropertyChangedSignal("CurrentPage"):Connect(function()
		-- upvalues: (ref) v_u_10, (ref) v_u_20, (ref) v_u_25, (ref) v_u_7, (ref) v_u_2, (ref) v_u_6, (ref) v_u_11, (ref) v_u_12
		if v_u_10.CurrentPage then
			if v_u_10.CurrentPage.Name == "_CarouselDivider" then
				if v_u_25 == v_u_20()[1] then
					v_u_10:Previous()
				else
					v_u_10:Next()
				end
			else
				v_u_10.CurrentPage.BackgroundColor3 = v_u_7
				v_u_25 = v_u_10.CurrentPage
			end
		end
		if v_u_2.SelectedCoreObject and v_u_2.SelectedCoreObject.Parent == v_u_10.Parent then
			v_u_2.SelectedCoreObject.BackgroundColor3 = v_u_6
		end
		v_u_2.SelectedCoreObject = v_u_10.CurrentPage
		if v_u_10.CurrentPage then
			v_u_11:Fire(v_u_12[v_u_10.CurrentPage])
		end
	end)
	v_u_10.Parent = v_u_9
	local v_u_26 = Instance.new("ImageButton")
	v_u_26.Name = "NextButton"
	v_u_26.Image = p21.ScrollRightImage
	v_u_26.BackgroundTransparency = 1
	v_u_26.AnchorPoint = Vector2.new(1, 0.5)
	v_u_26.Position = UDim2.new(1, -5, 0.5, 0)
	v_u_26.Size = UDim2.new(0.3, 0, 0.3, 0)
	v_u_26.Selectable = false
	v_u_26.Parent = v22
	local v27 = Instance.new("UIAspectRatioConstraint")
	v27.DominantAxis = Enum.DominantAxis.Width
	v27.Parent = v_u_26
	local v_u_28 = v_u_26:Clone()
	v_u_28.Name = "PrevButton"
	if p21.ScrollLeftImage == "" then
		v_u_28.Rotation = 180
	else
		v_u_28.Image = p21.ScrollLeftImage
	end
	v_u_28.AnchorPoint = Vector2.new(0, 0.5)
	v_u_28.Position = UDim2.new(0, 5, 0.5, 0)
	v_u_28.Selectable = false
	v_u_28.Parent = v22
	v_u_26.MouseButton1Click:Connect(function()
		-- upvalues: (ref) v_u_10
		v_u_10:Next()
	end)
	v_u_28.MouseButton1Click:Connect(function()
		-- upvalues: (ref) v_u_10
		v_u_10:Previous()
	end)
	local function v34() -- name: checkButtonVisibility
		-- upvalues: (ref) v_u_5, (copy) v_u_28, (ref) v_u_9, (copy) v_u_26
		local v29 = v_u_5:GetLastInputType() == Enum.UserInputType.Touch
		local v30 = v_u_28
		local v31 = not v29
		if v31 then
			v31 = #v_u_9:GetChildren() > 3
		end
		v30.Visible = v31
		local v32 = v_u_26
		local v33 = not v29
		if v33 then
			v33 = #v_u_9:GetChildren() > 3
		end
		v32.Visible = v33
	end
	local v35 = v_u_5:GetLastInputType() == Enum.UserInputType.Touch
	local v36 = not v35
	if v36 then
		v36 = #v_u_9:GetChildren() > 3
	end
	v_u_28.Visible = v36
	local v37 = not v35
	if v37 then
		v37 = #v_u_9:GetChildren() > 3
	end
	v_u_26.Visible = v37
	v_u_5.LastInputTypeChanged:Connect(v34)
	return v22
end
function v_u_1.UpdateGuiTheme(p39, p40) -- name: UpdateGuiTheme
	p39.rbxGui.NextButton.Image = p40.ScrollRightImage
	if p40.ScrollLeftImage == "" then
		p39.rbxGui.PrevButton.Image = p40.ScrollRightImage
		p39.rbxGui.PrevButton.Rotation = 180
	else
		p39.rbxGui.PrevButton.Image = p40.ScrollLeftImage
	end
end
function v_u_1.FadeTowardsEdges(_) -- name: FadeTowardsEdges
	-- upvalues: (ref) v_u_10, (copy) v_u_20
	if v_u_10.CurrentPage then
		local v41 = v_u_20()
		local v42 = 0
		for v43, v44 in ipairs(v41) do
			if v44 ~= v_u_10.CurrentPage then
				continue
			end
			v42 = v43
		end
		for v45, v46 in ipairs(v41) do
			local v47 = (v42 - v45) % #v41
			local v48 = (v45 - v42) % #v41
			local v49 = math.min(v47, v48)
			if v49 >= 2 then
				v46.ImageTransparency = 0.7
			elseif v49 == 1 then
				v46.ImageTransparency = 0.4
			else
				v46.ImageTransparency = 0
			end
		end
	end
end
function v_u_1.AddCarouselDivider(_) -- name: AddCarouselDivider
	-- upvalues: (ref) v_u_9
	local v50 = v_u_9:FindFirstChild("_CarouselDivider")
	if v50 then
		v50:Destroy()
	end
	if #v_u_9:GetChildren() - 1 >= 5 then
		local v51 = Instance.new("Frame")
		v51.Name = "_CarouselDivider"
		v51.Size = UDim2.new(1, 0, 1, 0)
		v51.BackgroundTransparency = 1
		v51.Parent = v_u_9
		v51.LayoutOrder = 1000000
		local v52 = Instance.new("Frame")
		v52.Name = "line"
		v52.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		v52.BorderSizePixel = 0
		v52.Position = UDim2.new(0.25, 0, 0, -3)
		v52.Size = UDim2.new(0, 2, 1, 6)
		v52.Parent = v51
		local v53 = v52:Clone()
		v53.Position = UDim2.new(0.5, 0, 0, -3)
		v53.Parent = v51
		local v54 = v52:Clone()
		v54.Position = UDim2.new(0.75, 0, 0, -3)
		v54.Parent = v51
	end
end
function v_u_1.RemovePlayerEntry(p55, p56) -- name: RemovePlayerEntry
	-- upvalues: (ref) v_u_13, (ref) v_u_12, (ref) v_u_10
	local v57 = v_u_13[p56]
	if v57 then
		v_u_13[p56] = nil
		v_u_12[v57] = nil
		v57:Destroy()
		if v_u_10 then
			v_u_10:ApplyLayout()
		end
		p55:FadeTowardsEdges()
	end
end
function v_u_1.ClearPlayerEntries(_) -- name: ClearPlayerEntries
	-- upvalues: (ref) v_u_12, (ref) v_u_13
	for v58 in pairs(v_u_12) do
		v58:Destroy()
	end
	v_u_12 = {}
	v_u_13 = {}
end
function v_u_1.CreatePlayerEntry(_, p_u_59, p60) -- name: CreatePlayerEntry
	-- upvalues: (ref) v_u_13, (copy) v_u_7, (copy) v_u_6, (copy) v_u_4, (ref) v_u_12, (ref) v_u_10, (ref) v_u_9, (copy) v_u_8, (copy) v_u_2
	local v61 = v_u_13[p_u_59]
	if v61 then
		v61.LayoutOrder = p60
	else
		local v_u_62 = Instance.new("ImageButton")
		v_u_62.Name = p_u_59.Name
		v_u_62.BorderSizePixel = 0
		v_u_62.LayoutOrder = p60
		v_u_62.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		v_u_62.BackgroundTransparency = 0
		v_u_62.Size = UDim2.new(1, 0, 1, 0)
		v_u_62.SelectionLost:connect(function()
			-- upvalues: (copy) v_u_62, (ref) v_u_7
			v_u_62.BackgroundColor3 = v_u_7
		end)
		v_u_62.SelectionGained:connect(function()
			-- upvalues: (copy) v_u_62, (ref) v_u_6
			v_u_62.BackgroundColor3 = v_u_6
		end)
		local v_u_63 = v_u_4:Create(v_u_62, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true), {
			["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		})
		v_u_63:Play()
		v_u_12[v_u_62] = p_u_59
		v_u_13[p_u_59] = v_u_62
		v_u_62.MouseButton1Click:Connect(function()
			-- upvalues: (ref) v_u_10, (copy) v_u_62
			v_u_10:JumpTo(v_u_62)
		end)
		v_u_62.Parent = v_u_9
		spawn(function()
			-- upvalues: (ref) v_u_8, (copy) v_u_62, (copy) p_u_59, (ref) v_u_63, (ref) v_u_2, (ref) v_u_6, (ref) v_u_7
			v_u_62.Image = require(v_u_8:WaitForChild("ContextMenuUtil")):GetHeadshotForPlayer(p_u_59)
			v_u_63:Cancel()
			v_u_63 = nil
			if v_u_62 == v_u_2.SelectedCoreObject then
				v_u_62.BackgroundColor3 = v_u_6
			else
				v_u_62.BackgroundColor3 = v_u_7
			end
		end)
	end
end
function v_u_1.SwitchToPlayerEntry(p64, p65, p66) -- name: SwitchToPlayerEntry
	-- upvalues: (ref) v_u_13, (ref) v_u_10
	if p65 then
		local v67 = v_u_13[p65]
		if not v67 then
			p64:CreatePlayerEntry(p65, 0)
			v67 = v_u_13[p65]
		end
		if p66 then
			v_u_10.TweenTime = 0
		end
		v_u_10:JumpTo(v67)
		spawn(function()
			-- upvalues: (ref) v_u_10
			v_u_10.TweenTime = 0.25
		end)
	end
end
function v_u_1.OffsetPlayerEntry(_, p68) -- name: OffsetPlayerEntry
	-- upvalues: (ref) v_u_10
	if p68 == 0 then
		return
	elseif p68 > 0 then
		v_u_10:Next()
	else
		v_u_10:Previous()
	end
end
function v_u_1.GetSelectedPlayer(_) -- name: GetSelectedPlayer
	-- upvalues: (ref) v_u_12, (ref) v_u_10
	return v_u_12[v_u_10.CurrentPage]
end
function v_u_1.new(p69) -- name: new
	-- upvalues: (copy) v_u_1, (copy) v_u_38, (ref) v_u_11
	local v70 = v_u_1
	local v_u_71 = setmetatable({}, v70)
	v_u_71.rbxGui = v_u_38(p69)
	v_u_71.PlayerChanged = v_u_11.Event
	v_u_11.Event:Connect(function()
		-- upvalues: (copy) v_u_71
		v_u_71:FadeTowardsEdges()
	end)
	return v_u_71
end
return v_u_1