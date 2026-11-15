-- Path: CoreGui.RobloxGui.Modules.AvatarContextMenu.ContextMenuGui
local v1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = v1:WaitForChild("RobloxGui")
local v4 = v_u_3:WaitForChild("Modules")
local v5 = v4:WaitForChild("Settings")
local v_u_6 = v4:WaitForChild("AvatarContextMenu")
local v_u_7 = nil
local v_u_8 = Instance.new("BindableEvent")
require(v_u_6:WaitForChild("ContextMenuUtil"))
require(v5:WaitForChild("Utility"))
local v_u_9 = {}
v_u_9.__index = v_u_9
function v_u_9.CreateContextMenuHolder(_, _) -- name: CreateContextMenuHolder
	-- upvalues: (copy) v_u_3
	local v10 = Instance.new("Frame")
	v10.Name = "AvatarContextMenu"
	v10.Position = UDim2.new(0, 0, 0, 0)
	v10.Size = UDim2.new(1, 0, 1, 0)
	v10.BackgroundTransparency = 1
	v10.Parent = v_u_3
	v10.AutoLocalize = false
	return v10
end
function v_u_9.CreateLeaveMenuButton(p_u_11, p12, p13) -- name: CreateLeaveMenuButton
	local v14 = Instance.new("ImageButton")
	v14.Name = "CloseMenuButton"
	v14.BackgroundTransparency = 1
	v14.AnchorPoint = Vector2.new(1, 0)
	v14.Position = UDim2.new(1, -10, 0, 10)
	v14.Size = UDim2.new(0.05, 0, 0.1, 0)
	v14.Image = p13.LeaveMenuImage
	v14.Selectable = false
	v14.Activated:Connect(function() -- name: closeMenu
		-- upvalues: (copy) p_u_11
		p_u_11.CloseMenuFunc()
	end)
	local v15 = Instance.new("UIAspectRatioConstraint")
	v15.AspectType = Enum.AspectType.FitWithinMaxSize
	v15.DominantAxis = Enum.DominantAxis.Height
	v15.AspectRatio = 1
	v15.Parent = v14
	v14.Parent = p12
	return v14
end
function v_u_9.CreateMenuFrame(p16, p17) -- name: CreateMenuFrame
	-- upvalues: (copy) v_u_2
	local v18 = p16:CreateContextMenuHolder()
	local v19 = Instance.new("ImageButton")
	v19.Name = "Menu"
	v19.AnchorPoint = p17.AnchorPoint
	v19.Size = p17.Size
	v19.Position = p17.OnScreenPosition
	v19.BackgroundTransparency = p17.BackgroundTransparency
	v19.BackgroundColor3 = p17.BackgroundColor
	v19.Image = p17.BackgroundImage
	v19.ScaleType = p17.BackgroundImageScaleType
	v19.SliceCenter = p17.BackgroundImageSliceCenter
	v19.AutoButtonColor = false
	v19.BorderSizePixel = 0
	v19.Selectable = false
	v19.Visible = false
	v19.Active = true
	v19.ClipsDescendants = true
	v19.Modal = true
	v_u_2:AddSelectionParent("AvatarContextMenuGroup", v19)
	local v_u_20 = Instance.new("UIAspectRatioConstraint")
	v_u_20.AspectType = Enum.AspectType.ScaleWithParentSize
	v_u_20.DominantAxis = Enum.DominantAxis.Height
	v_u_20.Name = "MenuAspectRatio"
	v_u_20.AspectRatio = p17.AspectRatio
	v_u_20.Parent = v19
	local function v_u_22() -- name: updateAspectRatioForViewport
		-- upvalues: (copy) v_u_20
		local v21 = workspace.CurrentCamera.ViewportSize
		if v21.x < v21.y then
			v_u_20.DominantAxis = Enum.DominantAxis.Width
		else
			v_u_20.DominantAxis = Enum.DominantAxis.Height
		end
	end
	if v_u_22 ~= nil then
		local v_u_23 = nil
		local function v25() -- name: updateCamera
			-- upvalues: (ref) v_u_23, (copy) v_u_22
			local v24 = workspace.CurrentCamera
			if v_u_23 then
				v_u_23:Disconnect()
			end
			v_u_23 = v24:GetPropertyChangedSignal("ViewportSize"):Connect(v_u_22)
			v_u_22()
		end
		workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v25)
		local v26 = workspace.CurrentCamera
		if v_u_23 then
			v_u_23:Disconnect()
		end
		v_u_23 = v26:GetPropertyChangedSignal("ViewportSize"):Connect(v_u_22)
		local v27 = workspace.CurrentCamera.ViewportSize
		if v27.x < v27.y then
			v_u_20.DominantAxis = Enum.DominantAxis.Width
		else
			v_u_20.DominantAxis = Enum.DominantAxis.Height
		end
	end
	local v28 = Instance.new("UISizeConstraint")
	v28.Name = "MenuSizeConstraint"
	v28.MaxSize = p17.MaxSize
	v28.MinSize = p17.MinSize
	v28.Parent = v19
	local v29 = Instance.new("Frame")
	v29.Name = "Content"
	v29.Size = UDim2.new(1, 0, 1, 0)
	v29.BackgroundTransparency = 1
	v29.Parent = v19
	local v30 = Instance.new("UIListLayout")
	v30.HorizontalAlignment = Enum.HorizontalAlignment.Center
	v30.VerticalAlignment = Enum.VerticalAlignment.Top
	v30.SortOrder = Enum.SortOrder.LayoutOrder
	v30.Parent = v29
	local v_u_31 = Instance.new("ScrollingFrame")
	v_u_31.Name = "ContextActionList"
	v_u_31.AnchorPoint = Vector2.new(0.5, 1)
	v_u_31.BackgroundColor3 = p17.ButtonFrameColor
	v_u_31.BackgroundTransparency = p17.ButtonFrameTransparency
	v_u_31.BorderSizePixel = 0
	v_u_31.LayoutOrder = 2
	v_u_31.Size = UDim2.new(1, -12, 0.54, 0)
	v_u_31.CanvasSize = UDim2.new(0, 0, 0, 208)
	v_u_31.ScrollBarThickness = 4
	v_u_31.Selectable = false
	v_u_31.Parent = v29
	local v_u_32 = Instance.new("UIListLayout")
	v_u_32.HorizontalAlignment = Enum.HorizontalAlignment.Center
	v_u_32.SortOrder = Enum.SortOrder.LayoutOrder
	v_u_32.VerticalAlignment = Enum.VerticalAlignment.Top
	v_u_32:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		-- upvalues: (copy) v_u_31, (copy) v_u_32
		v_u_31.CanvasSize = UDim2.new(0, 0, 0, v_u_32.AbsoluteContentSize.Y)
	end)
	v_u_32.Parent = v_u_31
	local v33 = Instance.new("TextButton")
	v33.Name = "NameTag"
	v33.AnchorPoint = Vector2.new(0.5, 1)
	v33.BackgroundColor3 = p17.NameTagColor
	v33.AutoButtonColor = false
	v33.BorderSizePixel = 0
	v33.LayoutOrder = 1
	v33.Size = UDim2.new(1, -12, 0.16, 0)
	v33.Font = p17.Font
	v33.TextColor3 = p17.TextColor
	v33.TextSize = 24 * p17.TextScale
	v33.Text = ""
	v33.TextXAlignment = Enum.TextXAlignment.Center
	v33.TextYAlignment = Enum.TextYAlignment.Center
	v33.Selectable = false
	v33.Parent = v29
	local v34 = Instance.new("Frame")
	v34.Name = "Underline"
	v34.BackgroundColor3 = p17.NameUnderlineColor
	v34.AnchorPoint = Vector2.new(0, 1)
	v34.BorderSizePixel = 0
	v34.Position = UDim2.new(0, 0, 1, 0)
	v34.Size = UDim2.new(1, 0, 0, 2)
	v34.Parent = v33
	p16:CreateLeaveMenuButton(v19, p17)
	v19.Parent = v18
	p16.ContextMenuFrame = v19
	return v19
end
function v_u_9.UpdateGuiTheme(p35, p36) -- name: UpdateGuiTheme
	-- upvalues: (ref) v_u_7
	p35.ContextMenuFrame.Size = p36.Size
	p35.ContextMenuFrame.AnchorPoint = p36.AnchorPoint
	p35.ContextMenuFrame.BackgroundTransparency = p36.BackgroundTransparency
	p35.ContextMenuFrame.BackgroundColor3 = p36.BackgroundColor
	p35.ContextMenuFrame.Image = p36.BackgroundImage
	p35.ContextMenuFrame.ScaleType = p36.BackgroundImageScaleType
	p35.ContextMenuFrame.SliceCenter = p36.BackgroundImageSliceCenter
	p35.ContextMenuFrame.CloseMenuButton.Image = p36.LeaveMenuImage
	p35.ContextMenuFrame.MenuSizeConstraint.MaxSize = p36.MaxSize
	p35.ContextMenuFrame.MenuSizeConstraint.MinSize = p36.MinSize
	p35.ContextMenuFrame.MenuAspectRatio.AspectRatio = p36.AspectRatio
	local v37 = p35.ContextMenuFrame.Content
	v37.ContextActionList.BackgroundColor3 = p36.ButtonFrameColor
	v37.ContextActionList.BackgroundTransparency = p36.ButtonFrameTransparency
	v37.NameTag.BackgroundColor3 = p36.NameTagColor
	v37.NameTag.Font = p36.Font
	v37.NameTag.TextColor3 = p36.TextColor
	v37.NameTag.TextSize = 24 * p36.TextScale
	v37.NameTag.Underline.BackgroundColor3 = p36.NameUnderlineColor
	if v_u_7 then
		v_u_7:UpdateGuiTheme(p36)
	end
end
function v_u_9.BuildPlayerCarousel(p_u_38, p39, p40) -- name: BuildPlayerCarousel
	-- upvalues: (ref) v_u_7, (copy) v_u_6, (copy) v_u_8
	if not v_u_7 then
		v_u_7 = require(v_u_6.PlayerCarousel).new(p40)
		v_u_7.rbxGui.Parent = p_u_38.ContextMenuFrame.Content
	end
	v_u_7:ClearPlayerEntries()
	if p_u_38.PlayerChangedConnection then
		p_u_38.PlayerChangedConnection:Disconnect()
	end
	p_u_38.PlayerChangedConnection = v_u_7.PlayerChanged:Connect(function(p41)
		-- upvalues: (copy) p_u_38, (ref) v_u_8
		if p41 then
			p_u_38.ContextMenuFrame.Content.NameTag.Text = p41.Name
		else
			p_u_38.ContextMenuFrame.Content.NameTag.Text = ""
		end
		v_u_8:Fire(p41)
	end)
	for v42 = 1, #p39 do
		v_u_7:CreatePlayerEntry(p39[v42][1], p39[v42][2])
	end
	v_u_7:FadeTowardsEdges()
	v_u_7:AddCarouselDivider()
end
function v_u_9.RemovePlayerEntry(_, p43) -- name: RemovePlayerEntry
	-- upvalues: (ref) v_u_7
	if v_u_7 then
		v_u_7:RemovePlayerEntry(p43)
	end
end
function v_u_9.GetBottomScreenPaddingConstant(_) -- name: GetBottomScreenPaddingConstant
	return 0.02
end
function v_u_9.SetCloseMenuFunc(p44, p45) -- name: SetCloseMenuFunc
	p44.CloseMenuFunc = p45
end
function v_u_9.SwitchToPlayerEntry(_, p46, p47) -- name: SwitchToPlayerEntry
	-- upvalues: (ref) v_u_7
	if v_u_7 then
		v_u_7:SwitchToPlayerEntry(p46, p47)
	end
end
function v_u_9.OffsetPlayerEntry(_, p48) -- name: OffsetPlayerEntry
	-- upvalues: (ref) v_u_7
	if v_u_7 then
		v_u_7:OffsetPlayerEntry(p48)
	end
end
function v_u_9.GetSelectedPlayer(_) -- name: GetSelectedPlayer
	-- upvalues: (ref) v_u_7
	if v_u_7 then
		return v_u_7:GetSelectedPlayer()
	else
		return nil
	end
end
function v_u_9.new() -- name: new
	-- upvalues: (copy) v_u_9, (copy) v_u_8
	local v49 = v_u_9
	local v50 = setmetatable({}, v49)
	v50.CloseMenuFunc = nil
	v50.ContextMenuFrame = nil
	v50.LastSetPlayerIcon = nil
	v50.PlayerChangedConnection = nil
	v50.SelectedPlayerChanged = v_u_8.Event
	return v50
end
return v_u_9.new()