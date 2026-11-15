-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.ChannelsTab
local v1 = {}
local v2 = game:GetService("Chat"):WaitForChild("ClientChatModules")
local v3 = script.Parent
local v_u_4 = require(v2:WaitForChild("ChatSettings"))
local v_u_5 = require(v3:WaitForChild("CurveUtil"))
local v_u_6 = {}
v_u_6.__index = v_u_6
local function v_u_20() -- name: CreateGuiObjects
	-- upvalues: (copy) v_u_4
	local v7 = Instance.new("Frame")
	v7.Selectable = false
	v7.Size = UDim2.new(1, 0, 1, 0)
	v7.BackgroundTransparency = 1
	local v8 = Instance.new("Frame")
	v8.Selectable = false
	v8.Name = "BackgroundFrame"
	v8.Size = UDim2.new(1, -2, 1, -2)
	v8.Position = UDim2.new(0, 1, 0, 1)
	v8.BackgroundTransparency = 1
	v8.Parent = v7
	local v9 = Instance.new("Frame")
	v9.Selectable = false
	v9.Name = "UnselectedFrame"
	v9.Size = UDim2.new(1, 0, 1, 0)
	v9.Position = UDim2.new(0, 0, 0, 0)
	v9.BorderSizePixel = 0
	v9.BackgroundColor3 = v_u_4.ChannelsTabUnselectedColor
	v9.BackgroundTransparency = 0.6
	v9.Parent = v8
	local v10 = Instance.new("Frame")
	v10.Selectable = false
	v10.Name = "SelectedFrame"
	v10.Size = UDim2.new(1, 0, 1, 0)
	v10.Position = UDim2.new(0, 0, 0, 0)
	v10.BorderSizePixel = 0
	v10.BackgroundColor3 = v_u_4.ChannelsTabSelectedColor
	v10.BackgroundTransparency = 1
	v10.Parent = v8
	local v11 = Instance.new("ImageLabel")
	v11.Selectable = false
	v11.Name = "BackgroundImage"
	v11.BackgroundTransparency = 1
	v11.BorderSizePixel = 0
	v11.Size = UDim2.new(1, 0, 1, 0)
	v11.Position = UDim2.new(0, 0, 0, 0)
	v11.ScaleType = Enum.ScaleType.Slice
	v11.Parent = v10
	v11.BackgroundTransparency = -0.4
	v11.BackgroundColor3 = Color3.fromRGB(93.6, 100.8, 115.19999999999999)
	local v12 = Instance.new("ImageLabel")
	v12.Selectable = false
	v12.Size = UDim2.new(0.5, -2, 0, 4)
	v12.BackgroundTransparency = 1
	v12.ScaleType = Enum.ScaleType.Slice
	v12.SliceCenter = Rect.new(3, 3, 32, 21)
	v12.Parent = v10
	local v13 = v12:Clone()
	v13.Parent = v10
	v12.Position = UDim2.new(0, 2, 1, -4)
	v13.Position = UDim2.new(0.5, 0, 1, -4)
	v12.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarLeft.png"
	v13.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarRight.png"
	v12.Name = "BlueBarLeft"
	v13.Name = "BlueBarRight"
	local v14 = Instance.new("TextButton")
	v14.Selectable = v_u_4.GamepadNavigationEnabled
	v14.Size = UDim2.new(1, 0, 1, 0)
	v14.Position = UDim2.new(0, 0, 0, 0)
	v14.BackgroundTransparency = 1
	v14.Font = v_u_4.DefaultFont
	v14.TextSize = v_u_4.ChatChannelsTabTextSize
	v14.TextColor3 = Color3.new(1, 1, 1)
	v14.TextStrokeTransparency = 0.75
	v14.Parent = v8
	local v15 = v14:Clone()
	local v16 = v14:Clone()
	v15.Parent = v9
	v16.Parent = v10
	v15.Font = Enum.Font.SourceSans
	v15.Active = false
	v16.Active = false
	local v17 = Instance.new("Frame")
	v17.Selectable = false
	v17.Size = UDim2.new(0, 18, 0, 18)
	v17.Position = UDim2.new(0.8, -9, 0.5, -9)
	v17.BackgroundTransparency = 1
	v17.Parent = v8
	local v18 = Instance.new("ImageLabel")
	v18.Selectable = false
	v18.Size = UDim2.new(1, 0, 1, 0)
	v18.BackgroundTransparency = 1
	v18.Image = "rbxasset://textures/ui/Chat/MessageCounter.png"
	v18.Visible = false
	v18.Parent = v17
	local v19 = Instance.new("TextLabel")
	v19.Selectable = false
	v19.BackgroundTransparency = 1
	v19.Size = UDim2.new(0, 13, 0, 9)
	v19.Position = UDim2.new(0.5, -7, 0.5, -7)
	v19.Font = v_u_4.DefaultFont
	v19.TextSize = 14
	v19.TextColor3 = Color3.new(1, 1, 1)
	v19.Text = ""
	v19.Parent = v18
	return v7, v14, v15, v16, v18, v9, v10
end
function v_u_6.Destroy(p21) -- name: Destroy
	p21.GuiObject:Destroy()
end
function v_u_6.UpdateMessagePostedInChannel(p22, p23) -- name: UpdateMessagePostedInChannel
	if not p22.Active or p23 == true then
		local v24 = p22.UnreadMessageCount + 1
		p22.UnreadMessageCount = v24
		local v25 = p22.NewMessageIcon
		v25.Visible = true
		v25.TextLabel.Text = v24 < 100 and tostring(v24) or "!"
		local v26 = UDim2.new(0, 0, -0.1, 0)
		local _ = v25.Position + v26
		local v27 = Enum.EasingDirection.Out
		local v28 = Enum.EasingStyle.Quad
		v25.Position = UDim2.new(0, 0, -0.15, 0)
		v25:TweenPosition(UDim2.new(0, 0, 0, 0), v27, v28, 0.15, true)
	end
end
function v_u_6.SetActive(p29, p30) -- name: SetActive
	p29.Active = p30
	p29.UnselectedFrame.Visible = not p30
	p29.SelectedFrame.Visible = p30
	if p30 then
		p29.UnreadMessageCount = 0
		p29.NewMessageIcon.Visible = false
		p29.NameTag.Font = Enum.Font.SourceSansBold
	else
		p29.NameTag.Font = Enum.Font.SourceSans
	end
end
function v_u_6.SetTextSize(p31, p32) -- name: SetTextSize
	p31.NameTag.TextSize = p32
end
function v_u_6.FadeOutBackground(p33, p34) -- name: FadeOutBackground
	-- upvalues: (copy) v_u_5
	p33.AnimParams.Background_TargetTransparency = 1
	p33.AnimParams.Background_NormalizedExptValue = v_u_5:NormalizedDefaultExptValueInSeconds(p34)
end
function v_u_6.FadeInBackground(p35, p36) -- name: FadeInBackground
	-- upvalues: (copy) v_u_5
	p35.AnimParams.Background_TargetTransparency = 0.6
	p35.AnimParams.Background_NormalizedExptValue = v_u_5:NormalizedDefaultExptValueInSeconds(p36)
end
function v_u_6.FadeOutText(p37, p38) -- name: FadeOutText
	-- upvalues: (copy) v_u_5
	p37.AnimParams.Text_TargetTransparency = 1
	p37.AnimParams.Text_NormalizedExptValue = v_u_5:NormalizedDefaultExptValueInSeconds(p38)
	p37.AnimParams.TextStroke_TargetTransparency = 1
	p37.AnimParams.TextStroke_NormalizedExptValue = v_u_5:NormalizedDefaultExptValueInSeconds(p38)
end
function v_u_6.FadeInText(p39, p40) -- name: FadeInText
	-- upvalues: (copy) v_u_5
	p39.AnimParams.Text_TargetTransparency = 0
	p39.AnimParams.Text_NormalizedExptValue = v_u_5:NormalizedDefaultExptValueInSeconds(p40)
	p39.AnimParams.TextStroke_TargetTransparency = 0.75
	p39.AnimParams.TextStroke_NormalizedExptValue = v_u_5:NormalizedDefaultExptValueInSeconds(p40)
end
function v_u_6.AnimGuiObjects(p41) -- name: AnimGuiObjects
	p41.UnselectedFrame.BackgroundTransparency = p41.AnimParams.Background_CurrentTransparency
	p41.SelectedFrame.BackgroundImage.BackgroundTransparency = p41.AnimParams.Background_CurrentTransparency
	p41.SelectedFrame.BlueBarLeft.ImageTransparency = p41.AnimParams.Background_CurrentTransparency
	p41.SelectedFrame.BlueBarRight.ImageTransparency = p41.AnimParams.Background_CurrentTransparency
	p41.NameTagNonSelect.TextTransparency = p41.AnimParams.Background_CurrentTransparency
	p41.NameTagNonSelect.TextStrokeTransparency = p41.AnimParams.Background_CurrentTransparency
	p41.NameTag.TextTransparency = p41.AnimParams.Text_CurrentTransparency
	p41.NewMessageIcon.ImageTransparency = p41.AnimParams.Text_CurrentTransparency
	p41.WhiteTextNewMessageNotification.TextTransparency = p41.AnimParams.Text_CurrentTransparency
	p41.NameTagSelect.TextTransparency = p41.AnimParams.Text_CurrentTransparency
	p41.NameTag.TextStrokeTransparency = p41.AnimParams.TextStroke_CurrentTransparency
	p41.WhiteTextNewMessageNotification.TextStrokeTransparency = p41.AnimParams.TextStroke_CurrentTransparency
	p41.NameTagSelect.TextStrokeTransparency = p41.AnimParams.TextStroke_CurrentTransparency
end
function v_u_6.InitializeAnimParams(p42) -- name: InitializeAnimParams
	-- upvalues: (copy) v_u_5
	p42.AnimParams.Text_TargetTransparency = 0
	p42.AnimParams.Text_CurrentTransparency = 0
	p42.AnimParams.Text_NormalizedExptValue = v_u_5:NormalizedDefaultExptValueInSeconds(0)
	p42.AnimParams.TextStroke_TargetTransparency = 0.75
	p42.AnimParams.TextStroke_CurrentTransparency = 0.75
	p42.AnimParams.TextStroke_NormalizedExptValue = v_u_5:NormalizedDefaultExptValueInSeconds(0)
	p42.AnimParams.Background_TargetTransparency = 0.6
	p42.AnimParams.Background_CurrentTransparency = 0.6
	p42.AnimParams.Background_NormalizedExptValue = v_u_5:NormalizedDefaultExptValueInSeconds(0)
end
function v_u_6.Update(p43, p44) -- name: Update
	-- upvalues: (copy) v_u_5
	p43.AnimParams.Background_CurrentTransparency = v_u_5:Expt(p43.AnimParams.Background_CurrentTransparency, p43.AnimParams.Background_TargetTransparency, p43.AnimParams.Background_NormalizedExptValue, p44)
	p43.AnimParams.Text_CurrentTransparency = v_u_5:Expt(p43.AnimParams.Text_CurrentTransparency, p43.AnimParams.Text_TargetTransparency, p43.AnimParams.Text_NormalizedExptValue, p44)
	p43.AnimParams.TextStroke_CurrentTransparency = v_u_5:Expt(p43.AnimParams.TextStroke_CurrentTransparency, p43.AnimParams.TextStroke_TargetTransparency, p43.AnimParams.TextStroke_NormalizedExptValue, p44)
	p43:AnimGuiObjects()
end
function v1.new(p45) -- name: new
	-- upvalues: (copy) v_u_6, (copy) v_u_20, (copy) v_u_4
	local v46 = v_u_6
	local v47 = setmetatable({}, v46)
	local v48, v49, v50, v51, v52, v53, v54 = v_u_20()
	v47.GuiObject = v48
	v47.NameTag = v49
	v47.NameTagNonSelect = v50
	v47.NameTagSelect = v51
	v47.NewMessageIcon = v52
	v47.UnselectedFrame = v53
	v47.SelectedFrame = v54
	v47.BlueBarLeft = v54.BlueBarLeft
	v47.BlueBarRight = v54.BlueBarRight
	v47.BackgroundImage = v54.BackgroundImage
	v47.WhiteTextNewMessageNotification = v47.NewMessageIcon.TextLabel
	v47.ChannelName = p45
	v47.UnreadMessageCount = 0
	v47.Active = false
	v47.GuiObject.Name = "Frame_" .. v47.ChannelName
	if string.len(p45) > v_u_4.MaxChannelNameLength then
		local v55 = v_u_4.MaxChannelNameLength - 3
		p45 = string.sub(p45, 1, v55) .. "..."
	end
	v47.NameTag.Text = ""
	v47.NameTagNonSelect.Text = p45
	v47.NameTagSelect.Text = p45
	v47.AnimParams = {}
	v47:InitializeAnimParams()
	v47:AnimGuiObjects()
	v47:SetActive(false)
	return v47
end
return v1