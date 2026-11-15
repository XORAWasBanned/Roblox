-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.ChannelsBar
local v1 = {}
local v2 = game:GetService("Chat"):WaitForChild("ClientChatModules")
local v3 = script.Parent
local v_u_4 = require(v3:WaitForChild("ChannelsTab"))
local v_u_5 = require(v3:WaitForChild("MessageSender"))
local v_u_6 = require(v2:WaitForChild("ChatSettings"))
local v_u_7 = require(v3:WaitForChild("CurveUtil"))
local v_u_8 = {}
v_u_8.__index = v_u_8
function v_u_8.CreateGuiObjects(p_u_9, p10) -- name: CreateGuiObjects
	-- upvalues: (copy) v_u_6, (copy) v_u_5
	local v11 = Instance.new("Frame")
	v11.Selectable = false
	v11.Size = UDim2.new(1, 0, 1, 0)
	v11.BackgroundTransparency = 1
	v11.Parent = p10
	local v12 = Instance.new("Frame")
	v12.Selectable = false
	v12.Name = "ScrollingBase"
	v12.BackgroundTransparency = 1
	v12.ClipsDescendants = true
	v12.Size = UDim2.new(1, 0, 1, 0)
	v12.Position = UDim2.new(0, 0, 0, 0)
	v12.Parent = v11
	local v13 = Instance.new("Frame")
	v13.Selectable = false
	v13.Name = "ScrollerSizer"
	v13.BackgroundTransparency = 1
	v13.Size = UDim2.new(1, 0, 1, 0)
	v13.Position = UDim2.new(0, 0, 0, 0)
	v13.Parent = v12
	local v14 = Instance.new("Frame")
	v14.Selectable = false
	v14.Name = "ScrollerFrame"
	v14.BackgroundTransparency = 1
	v14.Size = UDim2.new(1, 0, 1, 0)
	v14.Position = UDim2.new(0, 0, 0, 0)
	v14.Parent = v13
	local v15 = Instance.new("Frame")
	v15.Selectable = false
	v15.Size = UDim2.new(1, 0, 1, 0)
	v15.Position = UDim2.new(0, 0, 0, 0)
	v15.ClipsDescendants = true
	v15.BackgroundTransparency = 1
	v15.Parent = v11
	local v_u_16 = Instance.new("Frame")
	v_u_16.Selectable = false
	v_u_16.Name = "LeaveConfirmationFrame"
	v_u_16.Size = UDim2.new(1, 0, 1, 0)
	v_u_16.Position = UDim2.new(0, 0, 1, 0)
	v_u_16.BackgroundTransparency = 0.6
	v_u_16.BorderSizePixel = 0
	v_u_16.BackgroundColor3 = Color3.new(0, 0, 0)
	v_u_16.Parent = v15
	local v17 = Instance.new("TextButton")
	v17.Selectable = false
	v17.Size = UDim2.new(1, 0, 1, 0)
	v17.BackgroundTransparency = 1
	v17.Text = ""
	v17.Parent = v_u_16
	local v18 = Instance.new("TextButton")
	v18.Selectable = false
	v18.Size = UDim2.new(0.25, 0, 1, 0)
	v18.BackgroundTransparency = 1
	v18.Font = v_u_6.DefaultFont
	v18.TextSize = 18
	v18.TextStrokeTransparency = 0.75
	v18.Position = UDim2.new(0, 0, 0, 0)
	v18.TextColor3 = Color3.new(0, 1, 0)
	v18.Text = "Confirm"
	v18.Parent = v_u_16
	local v19 = v18:Clone()
	v19.Parent = v_u_16
	v19.Position = UDim2.new(0.75, 0, 0, 0)
	v19.TextColor3 = Color3.new(1, 0, 0)
	v19.Text = "Cancel"
	local v20 = Instance.new("TextLabel")
	v20.Selectable = false
	v20.Size = UDim2.new(0.5, 0, 1, 0)
	v20.Position = UDim2.new(0.25, 0, 0, 0)
	v20.BackgroundTransparency = 1
	v20.TextColor3 = Color3.new(1, 1, 1)
	v20.TextStrokeTransparency = 0.75
	v20.Text = "Leave channel <XX>?"
	v20.Font = v_u_6.DefaultFont
	v20.TextSize = 18
	v20.Parent = v_u_16
	local v_u_21 = Instance.new("StringValue")
	v_u_21.Name = "LeaveTarget"
	v_u_21.Parent = v_u_16
	local v_u_22 = v_u_16.Position
	v18.MouseButton1Click:connect(function()
		-- upvalues: (ref) v_u_5, (copy) v_u_21, (copy) v_u_16, (copy) v_u_22
		v_u_5:SendMessage(string.format("/leave %s", v_u_21.Value), nil)
		v_u_16:TweenPosition(v_u_22, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
	end)
	v19.MouseButton1Click:connect(function()
		-- upvalues: (copy) v_u_16, (copy) v_u_22
		v_u_16:TweenPosition(v_u_22, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
	end)
	local v23 = Instance.new("ImageButton", v11)
	v23.Selectable = v_u_6.GamepadNavigationEnabled
	v23.Name = "PageLeftButton"
	v23.SizeConstraint = Enum.SizeConstraint.RelativeYY
	v23.Size = UDim2.new(0.7, 0, 0.7, 0)
	v23.BackgroundTransparency = 1
	v23.Position = UDim2.new(0, 4, 0.15000000000000002, 0)
	v23.Visible = false
	v23.Image = "rbxassetid://471630199"
	local v24 = Instance.new("ImageLabel", v23)
	v24.Name = "ArrowLabel"
	v24.BackgroundTransparency = 1
	v24.Size = UDim2.new(0.4, 0, 0.4, 0)
	v24.Image = "rbxassetid://471630112"
	local v25 = Instance.new("Frame", v11)
	v25.Selectable = false
	v25.BackgroundTransparency = 1
	v25.Name = "PositionalHelper"
	v25.Size = v23.Size
	v25.SizeConstraint = v23.SizeConstraint
	v25.Position = UDim2.new(1, 0, 0.15000000000000002, 0)
	local v26 = v23:Clone()
	v26.Parent = v25
	v26.Name = "PageRightButton"
	v26.Size = UDim2.new(1, 0, 1, 0)
	v26.SizeConstraint = Enum.SizeConstraint.RelativeXY
	v26.Position = UDim2.new(-1, -4, 0, 0)
	local v27 = UDim2.new(0.05, 0, 0, 0)
	v26.ArrowLabel.Position = UDim2.new(0.3, 0, 0.3, 0) + v27
	v23.ArrowLabel.Position = UDim2.new(0.3, 0, 0.3, 0) - v27
	v23.ArrowLabel.Rotation = 180
	p_u_9.GuiObject = v11
	p_u_9.GuiObjects.BaseFrame = v11
	p_u_9.GuiObjects.ScrollerSizer = v13
	p_u_9.GuiObjects.ScrollerFrame = v14
	p_u_9.GuiObjects.PageLeftButton = v23
	p_u_9.GuiObjects.PageRightButton = v26
	p_u_9.GuiObjects.LeaveConfirmationFrame = v_u_16
	p_u_9.GuiObjects.LeaveConfirmationNotice = v20
	p_u_9.GuiObjects.PageLeftButtonArrow = v23.ArrowLabel
	p_u_9.GuiObjects.PageRightButtonArrow = v26.ArrowLabel
	p_u_9:AnimGuiObjects()
	v23.MouseButton1Click:connect(function()
		-- upvalues: (copy) p_u_9
		p_u_9:ScrollChannelsFrame(-1)
	end)
	v26.MouseButton1Click:connect(function()
		-- upvalues: (copy) p_u_9
		p_u_9:ScrollChannelsFrame(1)
	end)
	p_u_9:ScrollChannelsFrame(0)
end
function v_u_8.UpdateMessagePostedInChannel(p28, p29) -- name: UpdateMessagePostedInChannel
	local v30 = p28:GetChannelTab(p29)
	if v30 then
		v30:UpdateMessagePostedInChannel()
	else
		warn("ChannelsTab \'" .. p29 .. "\' does not exist!")
	end
end
function v_u_8.AddChannelTab(p_u_31, p32) -- name: AddChannelTab
	-- upvalues: (copy) v_u_4, (copy) v_u_6
	if p_u_31:GetChannelTab(p32) then
		error("Channel tab \'" .. p32 .. "\'already exists!")
	end
	local v_u_33 = v_u_4.new(p32)
	v_u_33.GuiObject.Parent = p_u_31.GuiObjects.ScrollerFrame
	p_u_31.ChannelTabs[p32:lower()] = v_u_33
	p_u_31.NumTabs = p_u_31.NumTabs + 1
	p_u_31:OrganizeChannelTabs()
	if v_u_6.RightClickToLeaveChannelEnabled then
		v_u_33.NameTag.MouseButton2Click:connect(function()
			-- upvalues: (copy) p_u_31, (copy) v_u_33
			p_u_31.LeaveConfirmationNotice.Text = string.format("Leave channel %s?", v_u_33.ChannelName)
			p_u_31.LeaveConfirmationFrame.LeaveTarget.Value = v_u_33.ChannelName
			p_u_31.LeaveConfirmationFrame:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.2, true)
		end)
	end
	return v_u_33
end
function v_u_8.RemoveChannelTab(p34, p35) -- name: RemoveChannelTab
	if not p34:GetChannelTab(p35) then
		error("Channel tab \'" .. p35 .. "\'does not exist!")
	end
	local v36 = p35:lower()
	p34.ChannelTabs[v36]:Destroy()
	p34.ChannelTabs[v36] = nil
	p34.NumTabs = p34.NumTabs - 1
	p34:OrganizeChannelTabs()
end
function v_u_8.GetChannelTab(p37, p38) -- name: GetChannelTab
	return p37.ChannelTabs[p38:lower()]
end
function v_u_8.OrganizeChannelTabs(p39) -- name: OrganizeChannelTabs
	-- upvalues: (copy) v_u_6
	local v40 = {}
	local v41 = v_u_6.GeneralChannelName
	table.insert(v40, p39:GetChannelTab(v41))
	table.insert(v40, p39:GetChannelTab("System"))
	for _, v42 in pairs(p39.ChannelTabs) do
		if v42.ChannelName == v_u_6.GeneralChannelName or v42.ChannelName == "System" then
			continue
		end
		table.insert(v40, v42)
	end
	for v43, v44 in pairs(v40) do
		v44.GuiObject.Position = UDim2.new(v43 - 1, 0, 0, 0)
	end
	local v45 = p39.GuiObjects.ScrollerSizer
	local v46 = UDim2.new
	local v47 = v_u_6.ChannelsBarFullTabSize
	local v48 = p39.NumTabs
	local v49 = math.min(v47, v48)
	v45.Size = v46(1 / math.max(1, v49), 0, 1, 0)
	p39:ScrollChannelsFrame(0)
end
function v_u_8.ResizeChannelTabText(p50, p51) -- name: ResizeChannelTabText
	for _, v52 in pairs(p50.ChannelTabs) do
		v52:SetTextSize(p51)
	end
end
function v_u_8.ScrollChannelsFrame(p_u_53, p54) -- name: ScrollChannelsFrame
	-- upvalues: (copy) v_u_6
	if p_u_53.ScrollChannelsFrameLock then
		return
	else
		p_u_53.ScrollChannelsFrameLock = true
		local v55 = v_u_6.ChannelsBarFullTabSize
		local v56 = p_u_53.CurPageNum + p54
		if v56 < 0 then
			v56 = 0
		elseif v56 > 0 and v56 + v55 > p_u_53.NumTabs then
			v56 = p_u_53.NumTabs - v55
		end
		p_u_53.CurPageNum = v56
		local v57 = UDim2.new(-p_u_53.CurPageNum, 0, 0, 0)
		p_u_53.GuiObjects.PageLeftButton.Visible = p_u_53.CurPageNum > 0
		p_u_53.GuiObjects.PageRightButton.Visible = p_u_53.CurPageNum + v55 < p_u_53.NumTabs
		if p54 == 0 then
			p_u_53.ScrollChannelsFrameLock = false
		else
			p_u_53:WaitUntilParentedCorrectly()
			p_u_53.GuiObjects.ScrollerFrame:TweenPosition(v57, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15, true, function() -- name: UnlockFunc
				-- upvalues: (copy) p_u_53
				p_u_53.ScrollChannelsFrameLock = false
			end)
		end
	end
end
function v_u_8.FadeOutBackground(p58, p59) -- name: FadeOutBackground
	-- upvalues: (copy) v_u_7
	for _, v60 in pairs(p58.ChannelTabs) do
		v60:FadeOutBackground(p59)
	end
	p58.AnimParams.Background_TargetTransparency = 1
	p58.AnimParams.Background_NormalizedExptValue = v_u_7:NormalizedDefaultExptValueInSeconds(p59)
end
function v_u_8.FadeInBackground(p61, p62) -- name: FadeInBackground
	-- upvalues: (copy) v_u_7
	for _, v63 in pairs(p61.ChannelTabs) do
		v63:FadeInBackground(p62)
	end
	p61.AnimParams.Background_TargetTransparency = 0.6
	p61.AnimParams.Background_NormalizedExptValue = v_u_7:NormalizedDefaultExptValueInSeconds(p62)
end
function v_u_8.FadeOutText(p64, p65) -- name: FadeOutText
	for _, v66 in pairs(p64.ChannelTabs) do
		v66:FadeOutText(p65)
	end
end
function v_u_8.FadeInText(p67, p68) -- name: FadeInText
	for _, v69 in pairs(p67.ChannelTabs) do
		v69:FadeInText(p68)
	end
end
function v_u_8.AnimGuiObjects(p70) -- name: AnimGuiObjects
	p70.GuiObjects.PageLeftButton.ImageTransparency = p70.AnimParams.Background_CurrentTransparency
	p70.GuiObjects.PageRightButton.ImageTransparency = p70.AnimParams.Background_CurrentTransparency
	p70.GuiObjects.PageLeftButtonArrow.ImageTransparency = p70.AnimParams.Background_CurrentTransparency
	p70.GuiObjects.PageRightButtonArrow.ImageTransparency = p70.AnimParams.Background_CurrentTransparency
end
function v_u_8.InitializeAnimParams(p71) -- name: InitializeAnimParams
	-- upvalues: (copy) v_u_7
	p71.AnimParams.Background_TargetTransparency = 0.6
	p71.AnimParams.Background_CurrentTransparency = 0.6
	p71.AnimParams.Background_NormalizedExptValue = v_u_7:NormalizedDefaultExptValueInSeconds(0)
end
function v_u_8.Update(p72, p73) -- name: Update
	-- upvalues: (copy) v_u_7
	for _, v74 in pairs(p72.ChannelTabs) do
		v74:Update(p73)
	end
	p72.AnimParams.Background_CurrentTransparency = v_u_7:Expt(p72.AnimParams.Background_CurrentTransparency, p72.AnimParams.Background_TargetTransparency, p72.AnimParams.Background_NormalizedExptValue, p73)
	p72:AnimGuiObjects()
end
function v_u_8.WaitUntilParentedCorrectly(p75) -- name: WaitUntilParentedCorrectly
	while not p75.GuiObject:IsDescendantOf(game:GetService("Players").LocalPlayer) do
		p75.GuiObject.AncestryChanged:wait()
	end
end
function v1.new() -- name: new
	-- upvalues: (copy) v_u_8, (copy) v_u_6
	local v76 = v_u_8
	local v_u_77 = setmetatable({}, v76)
	v_u_77.GuiObject = nil
	v_u_77.GuiObjects = {}
	v_u_77.ChannelTabs = {}
	v_u_77.NumTabs = 0
	v_u_77.CurPageNum = 0
	v_u_77.ScrollChannelsFrameLock = false
	v_u_77.AnimParams = {}
	v_u_77:InitializeAnimParams()
	v_u_6.SettingsChanged:connect(function(p78, p79)
		-- upvalues: (copy) v_u_77
		if p78 == "ChatChannelsTabTextSize" then
			v_u_77:ResizeChannelTabText(p79)
		end
	end)
	return v_u_77
end
return v1