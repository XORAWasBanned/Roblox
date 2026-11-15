-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.ChatWindow
local v1 = {}
local v_u_2 = game:GetService("Players")
game:GetService("Chat")
local v_u_3 = v_u_2.LocalPlayer:WaitForChild("PlayerGui")
local v_u_4 = game:GetService("Chat")
local v5 = v_u_4:WaitForChild("ClientChatModules")
local v6 = script.Parent
local v_u_7 = require(v6:WaitForChild("ChatChannel"))
local v_u_8 = require(v5:WaitForChild("ChatSettings"))
local v_u_9 = require(v6:WaitForChild("CurveUtil"))
local v_u_10 = {}
v_u_10.__index = v_u_10
function getClassicChatEnabled() -- name: getClassicChatEnabled
	-- upvalues: (copy) v_u_8, (copy) v_u_2
	if v_u_8.ClassicChatEnabled == nil then
		return v_u_2.ClassicChat
	else
		return v_u_8.ClassicChatEnabled
	end
end
function getBubbleChatEnabled() -- name: getBubbleChatEnabled
	-- upvalues: (copy) v_u_8, (copy) v_u_2
	if v_u_8.BubbleChatEnabled == nil then
		return v_u_2.BubbleChat
	else
		return v_u_8.BubbleChatEnabled
	end
end
function bubbleChatOnly() -- name: bubbleChatOnly
	local v11 = not getClassicChatEnabled()
	if v11 then
		v11 = getBubbleChatEnabled()
	end
	return v11
end
function mergeProps(p12, p13) -- name: mergeProps
	if p12 and p13 then
		for v14, v15 in pairs(p12) do
			if p13[v14] == nil then
				continue
			end
			p13[v14] = v15
		end
	end
end
function v_u_10.CreateGuiObjects(p16, p17) -- name: CreateGuiObjects
	-- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_3
	local v_u_18 = nil
	local function v19()
		-- upvalues: (ref) v_u_18, (ref) v_u_4
		v_u_18 = v_u_4:InvokeChatCallback(Enum.ChatCallbackType.OnCreatingChatWindow, nil)
	end
	pcall(v19)
	mergeProps(v_u_18, v_u_8)
	local v20 = Instance.new("Frame")
	v20.BackgroundTransparency = 1
	v20.Active = v_u_8.WindowDraggable
	v20.Parent = p17
	v20.AutoLocalize = false
	local v_u_21 = Instance.new("Frame")
	v_u_21.Selectable = false
	v_u_21.Name = "ChatBarParentFrame"
	v_u_21.BackgroundTransparency = 1
	v_u_21.Parent = v20
	local v_u_22 = Instance.new("Frame")
	v_u_22.Selectable = false
	v_u_22.Name = "ChannelsBarParentFrame"
	v_u_22.BackgroundTransparency = 1
	v_u_22.Position = UDim2.new(0, 0, 0, 0)
	v_u_22.Parent = v20
	local v_u_23 = Instance.new("Frame")
	v_u_23.Selectable = false
	v_u_23.Name = "ChatChannelParentFrame"
	v_u_23.BackgroundTransparency = 1
	v_u_23.BackgroundColor3 = v_u_8.BackGroundColor
	v_u_23.BackgroundTransparency = 0.6
	v_u_23.BorderSizePixel = 0
	v_u_23.Parent = v20
	local v_u_24 = Instance.new("ImageButton")
	v_u_24.Selectable = false
	v_u_24.Image = ""
	v_u_24.BackgroundTransparency = 0.6
	v_u_24.BorderSizePixel = 0
	v_u_24.Visible = false
	v_u_24.BackgroundColor3 = v_u_8.BackGroundColor
	v_u_24.Active = true
	if bubbleChatOnly() then
		v_u_24.Position = UDim2.new(1, -v_u_24.AbsoluteSize.X, 0, 0)
	else
		v_u_24.Position = UDim2.new(1, -v_u_24.AbsoluteSize.X, 1, -v_u_24.AbsoluteSize.Y)
	end
	v_u_24.Parent = v20
	local v25 = Instance.new("ImageLabel")
	v25.Selectable = false
	v25.Size = UDim2.new(0.8, 0, 0.8, 0)
	v25.Position = UDim2.new(0.2, 0, 0.2, 0)
	v25.BackgroundTransparency = 1
	v25.Image = "rbxassetid://261880743"
	v25.Parent = v_u_24
	local v_u_26 = v20
	local v27 = 3
	while v20 and not v20:IsA("ScreenGui") do
		v20 = v20.Parent
	end
	local v_u_28 = v20.AbsoluteSize.X <= 640 and 1 or (v20.AbsoluteSize.X <= 1024 and 2 or v27)
	local v_u_29 = false
	local function v_u_47() -- name: doCheckSizeBounds
		-- upvalues: (ref) v_u_29, (copy) v_u_26, (ref) v_u_3, (ref) v_u_8, (copy) v_u_22, (copy) v_u_21
		if v_u_29 then
			return
		else
			v_u_29 = true
			if v_u_26:IsDescendantOf(v_u_3) then
				local v30 = v_u_26
				while v30 and not v30:IsA("ScreenGui") do
					v30 = v30.Parent
				end
				local v31 = v_u_8.MinimumWindowSize
				local v32 = v_u_8.MaximumWindowSize
				local v33 = v_u_22.AbsoluteSize.Y + v_u_21.AbsoluteSize.Y
				local v34 = v31.X.Scale * v30.AbsoluteSize.X + v31.X.Offset
				local v35 = v31.Y.Scale * v30.AbsoluteSize.Y + v31.Y.Offset
				local v36 = math.max(v35, v33)
				local v37 = v32.X.Scale * v30.AbsoluteSize.X + v32.X.Offset
				local v38 = v32.Y.Scale * v30.AbsoluteSize.Y + v32.Y.Offset
				local v39 = v_u_26.AbsoluteSize.X
				local v40 = v_u_26.AbsoluteSize.Y
				if v39 < v34 then
					local v41 = UDim2.new(0, v34 - v39, 0, 0)
					v_u_26.Size = v_u_26.Size + v41
				elseif v37 < v39 then
					local v42 = UDim2.new(0, v37 - v39, 0, 0)
					v_u_26.Size = v_u_26.Size + v42
				end
				if v40 < v36 then
					local v43 = UDim2.new(0, 0, 0, v36 - v40)
					v_u_26.Size = v_u_26.Size + v43
				elseif v38 < v40 then
					local v44 = UDim2.new(0, 0, 0, v38 - v40)
					v_u_26.Size = v_u_26.Size + v44
				end
				local v45 = v_u_26.AbsoluteSize.X / v30.AbsoluteSize.X
				local v46 = v_u_26.AbsoluteSize.Y / v30.AbsoluteSize.Y
				v_u_26.Size = UDim2.new(v45, 0, v46, 0)
				v_u_29 = false
			end
		end
	end
	v_u_26.Changed:connect(function(p48)
		-- upvalues: (copy) v_u_47
		if p48 == "AbsoluteSize" then
			v_u_47()
		end
	end)
	v_u_24.DragBegin:connect(function(_)
		-- upvalues: (copy) v_u_26
		v_u_26.Draggable = false
	end)
	local function v_u_51(p49) -- name: UpdatePositionFromDrag
		-- upvalues: (ref) v_u_8, (copy) v_u_26, (copy) v_u_24
		if v_u_8.WindowDraggable == false and v_u_8.WindowResizable == false then
			return
		else
			local v50 = p49 - v_u_26.AbsolutePosition + v_u_24.AbsoluteSize
			v_u_26.Size = UDim2.new(0, v50.X, 0, v50.Y)
			if bubbleChatOnly() then
				v_u_24.Position = UDim2.new(1, -v_u_24.AbsoluteSize.X, 0, 0)
			else
				v_u_24.Position = UDim2.new(1, -v_u_24.AbsoluteSize.X, 1, -v_u_24.AbsoluteSize.Y)
			end
		end
	end
	v_u_24.DragStopped:connect(function(_, _)
		-- upvalues: (copy) v_u_26, (ref) v_u_8
		v_u_26.Draggable = v_u_8.WindowDraggable
	end)
	local v_u_52 = false
	v_u_24.Changed:connect(function(p53)
		-- upvalues: (copy) v_u_26, (ref) v_u_52, (copy) v_u_51, (copy) v_u_24
		if p53 == "AbsolutePosition" and not v_u_26.Draggable then
			if v_u_52 then
				return
			end
			v_u_52 = true
			v_u_51(v_u_24.AbsolutePosition)
			v_u_52 = false
		end
	end)
	local v_u_54
	if bubbleChatOnly() then
		v_u_21.Position = UDim2.new(0, 0, 0, 0)
		v_u_22.Visible = false
		v_u_22.Active = false
		v_u_23.Visible = false
		v_u_23.Active = false
		v_u_54 = v_u_26
		while v_u_26 and not v_u_26:IsA("ScreenGui") do
			v_u_26 = v_u_26.Parent
		end
		local v55, v56
		if v_u_28 == 1 then
			v55 = v_u_8.DefaultWindowSizePhone.X.Scale
			v56 = v_u_8.DefaultWindowSizePhone.X.Offset
		elseif v_u_28 == 2 then
			v55 = v_u_8.DefaultWindowSizeTablet.X.Scale
			v56 = v_u_8.DefaultWindowSizeTablet.X.Offset
		else
			v55 = v_u_8.DefaultWindowSizeDesktop.X.Scale
			v56 = v_u_8.DefaultWindowSizeDesktop.X.Offset
		end
		local v57 = nil
		local v58
		if v_u_28 == 1 then
			v58 = v57 or v_u_8.ChatBarTextSizePhone
		else
			v58 = v57 or v_u_8.ChatBarTextSize
		end
		local v59 = v58 + 14 + 10
		v_u_54.Size = UDim2.new(v55, v56, 0, v59)
		v_u_54.Position = v_u_8.DefaultWindowPosition
	else
		v_u_54 = v_u_26
		while v_u_26 and not v_u_26:IsA("ScreenGui") do
			v_u_26 = v_u_26.Parent
		end
		if v_u_28 == 1 then
			v_u_54.Size = v_u_8.DefaultWindowSizePhone
		elseif v_u_28 == 2 then
			v_u_54.Size = v_u_8.DefaultWindowSizeTablet
		else
			v_u_54.Size = v_u_8.DefaultWindowSizeDesktop
		end
		v_u_54.Position = v_u_8.DefaultWindowPosition
	end
	if v_u_28 == 1 then
		v_u_8.ChatWindowTextSize = v_u_8.ChatWindowTextSizePhone
		v_u_8.ChatChannelsTabTextSize = v_u_8.ChatChannelsTabTextSizePhone
		v_u_8.ChatBarTextSize = v_u_8.ChatBarTextSizePhone
	end
	local function v_u_62(p60) -- name: UpdateResizable
		-- upvalues: (copy) v_u_24, (copy) v_u_21
		v_u_24.Visible = p60
		v_u_24.Draggable = p60
		local v61 = v_u_21.Size.Y.Offset
		if p60 then
			v_u_21.Size = UDim2.new(1, -v61 - 2, 0, v61)
			if not bubbleChatOnly() then
				v_u_21.Position = UDim2.new(0, 0, 1, -v61)
				return
			end
		else
			v_u_21.Size = UDim2.new(1, 0, 0, v61)
			if not bubbleChatOnly() then
				v_u_21.Position = UDim2.new(0, 0, 1, -v61)
			end
		end
	end
	local function v_u_70() -- name: UpdateChatChannelParentFrameSize
		-- upvalues: (ref) v_u_28, (ref) v_u_8, (copy) v_u_23
		local v63 = nil
		local v64
		if v_u_28 == 1 then
			v64 = v63 or v_u_8.ChatChannelsTabTextSizePhone
		else
			v64 = v63 or v_u_8.ChatChannelsTabTextSize
		end
		local v65 = v64 + 8
		local v66 = math.max(32, v65) + 2
		local v67 = nil
		local v68
		if v_u_28 == 1 then
			v68 = v67 or v_u_8.ChatBarTextSizePhone
		else
			v68 = v67 or v_u_8.ChatBarTextSize
		end
		local v69 = v68 + 14 + 10
		if v_u_8.ShowChannelsBar then
			v_u_23.Size = UDim2.new(1, 0, 1, -(v66 + v69 + 2 + 2))
			v_u_23.Position = UDim2.new(0, 0, 0, v66 + 2)
		else
			v_u_23.Size = UDim2.new(1, 0, 1, -(v69 + 2 + 2))
			v_u_23.Position = UDim2.new(0, 0, 0, 2)
		end
	end
	local function v_u_74(p71) -- name: UpdateChatBarTextSize
		-- upvalues: (ref) v_u_28, (ref) v_u_8, (copy) v_u_21, (copy) v_u_24, (copy) v_u_70, (copy) v_u_62
		local v72
		if v_u_28 == 1 then
			v72 = p71 or v_u_8.ChatBarTextSizePhone
		else
			v72 = p71 or v_u_8.ChatBarTextSize
		end
		local v73 = v72 + 14 + 10
		v_u_21.Size = UDim2.new(1, 0, 0, v73)
		if not bubbleChatOnly() then
			v_u_21.Position = UDim2.new(0, 0, 1, -v73)
		end
		v_u_24.Size = UDim2.new(0, v73, 0, v73)
		v_u_24.Position = UDim2.new(1, -v73, 1, -v73)
		v_u_70()
		v_u_62(v_u_8.WindowResizable)
	end
	local v75 = v_u_8.ChatChannelsTabTextSize
	local v76
	if v_u_28 == 1 then
		v76 = v75 or v_u_8.ChatChannelsTabTextSizePhone
	else
		v76 = v75 or v_u_8.ChatChannelsTabTextSize
	end
	local v77 = v76 + 8
	local v78 = math.max(32, v77) + 2
	v_u_22.Size = UDim2.new(1, 0, 0, v78)
	v_u_70()
	v_u_74(v_u_8.ChatBarTextSize)
	local v79 = v_u_8.WindowDraggable
	v_u_54.Active = v79
	v_u_54.Draggable = v79
	v_u_62(v_u_8.WindowResizable)
	v_u_22.Visible = v_u_8.ShowChannelsBar
	v_u_70()
	v_u_8.SettingsChanged:connect(function(p80, p81)
		-- upvalues: (copy) v_u_54, (copy) v_u_62, (ref) v_u_28, (ref) v_u_8, (copy) v_u_22, (copy) v_u_70, (copy) v_u_74
		if p80 == "WindowDraggable" then
			v_u_54.Active = p81
			v_u_54.Draggable = p81
			return
		elseif p80 == "WindowResizable" then
			v_u_62(p81)
			return
		elseif p80 == "ChatChannelsTabTextSize" then
			local v82
			if v_u_28 == 1 then
				v82 = p81 or v_u_8.ChatChannelsTabTextSizePhone
			else
				v82 = p81 or v_u_8.ChatChannelsTabTextSize
			end
			local v83 = v82 + 8
			local v84 = math.max(32, v83) + 2
			v_u_22.Size = UDim2.new(1, 0, 0, v84)
			v_u_70()
			return
		elseif p80 == "ChatBarTextSize" then
			v_u_74(p81)
		elseif p80 == "ShowChannelsBar" then
			v_u_22.Visible = p81
			v_u_70()
		end
	end)
	p16.GuiObject = v_u_54
	p16.GuiObjects.BaseFrame = v_u_54
	p16.GuiObjects.ChatBarParentFrame = v_u_21
	p16.GuiObjects.ChannelsBarParentFrame = v_u_22
	p16.GuiObjects.ChatChannelParentFrame = v_u_23
	p16.GuiObjects.ChatResizerFrame = v_u_24
	p16.GuiObjects.ResizeIcon = v25
	p16:AnimGuiObjects()
end
function v_u_10.GetChatBar(p85) -- name: GetChatBar
	return p85.ChatBar
end
function v_u_10.RegisterChatBar(p86, p87) -- name: RegisterChatBar
	p86.ChatBar = p87
	p86.ChatBar:CreateGuiObjects(p86.GuiObjects.ChatBarParentFrame)
end
function v_u_10.RegisterChannelsBar(p88, p89) -- name: RegisterChannelsBar
	p88.ChannelsBar = p89
	p88.ChannelsBar:CreateGuiObjects(p88.GuiObjects.ChannelsBarParentFrame)
end
function v_u_10.RegisterMessageLogDisplay(p90, p91) -- name: RegisterMessageLogDisplay
	p90.MessageLogDisplay = p91
	p90.MessageLogDisplay.GuiObject.Parent = p90.GuiObjects.ChatChannelParentFrame
end
function v_u_10.AddChannel(p_u_92, p_u_93) -- name: AddChannel
	-- upvalues: (copy) v_u_7
	if not p_u_92:GetChannel(p_u_93) then
		local v94 = v_u_7.new(p_u_93, p_u_92.MessageLogDisplay)
		p_u_92.Channels[p_u_93:lower()] = v94
		v94:SetActive(false)
		local v95 = p_u_92.ChannelsBar:AddChannelTab(p_u_93)
		v95.NameTag.MouseButton1Click:connect(function()
			-- upvalues: (copy) p_u_92, (copy) p_u_93
			p_u_92:SwitchCurrentChannel(p_u_93)
		end)
		v94:RegisterChannelTab(v95)
		return v94
	end
	error("Channel \'" .. p_u_93 .. "\' already exists!")
end
function v_u_10.GetFirstChannel(p96) -- name: GetFirstChannel
	for _, v97 in pairs(p96.Channels) do
		return v97
	end
	return nil
end
function v_u_10.RemoveChannel(p98, p99) -- name: RemoveChannel
	-- upvalues: (copy) v_u_8
	if not p98:GetChannel(p99) then
		error("Channel \'" .. p99 .. "\' does not exist!")
	end
	local v100 = p99:lower()
	local v101
	if p98.Channels[v100] == p98:GetCurrentChannel() then
		p98:SwitchCurrentChannel(nil)
		v101 = true
	else
		v101 = false
	end
	p98.Channels[v100]:Destroy()
	p98.Channels[v100] = nil
	p98.ChannelsBar:RemoveChannelTab(p99)
	if v101 then
		local v102
		if p98:GetChannel(v_u_8.GeneralChannelName) ~= nil and v100 ~= v_u_8.GeneralChannelName:lower() then
			v102 = v_u_8.GeneralChannelName
		else
			local v103 = p98:GetFirstChannel()
			v102 = v103 and v103.Name or nil
		end
		p98:SwitchCurrentChannel(v102)
	end
	if not v_u_8.ShowChannelsBar and p98.ChatBar.TargetChannel == p99 then
		p98.ChatBar:SetChannelTarget(v_u_8.GeneralChannelName)
	end
end
function v_u_10.GetChannel(p104, p105) -- name: GetChannel
	return p105 and p104.Channels[p105:lower()] or nil
end
function v_u_10.GetTargetMessageChannel(p106) -- name: GetTargetMessageChannel
	-- upvalues: (copy) v_u_8
	if not v_u_8.ShowChannelsBar then
		return p106.ChatBar.TargetChannel
	end
	local v107 = p106:GetCurrentChannel()
	if v107 then
		v107 = v107.Name
	end
	return v107
end
function v_u_10.GetCurrentChannel(p108) -- name: GetCurrentChannel
	return p108.CurrentChannel
end
function v_u_10.SwitchCurrentChannel(p109, p110) -- name: SwitchCurrentChannel
	-- upvalues: (copy) v_u_8
	if not v_u_8.ShowChannelsBar then
		local v111 = p109:GetChannel(p110)
		if v111 then
			p109.ChatBar:SetChannelTarget(v111.Name)
		end
		p110 = v_u_8.GeneralChannelName
	end
	local v112 = p109:GetCurrentChannel()
	local v113 = p109:GetChannel(p110)
	if v113 == nil then
		error(string.format("Channel \'%s\' does not exist.", p110))
	end
	if v113 ~= v112 then
		if v112 then
			v112:SetActive(false)
			p109.ChannelsBar:GetChannelTab(v112.Name):SetActive(false)
		end
		if v113 then
			v113:SetActive(true)
			p109.ChannelsBar:GetChannelTab(v113.Name):SetActive(true)
		end
		p109.CurrentChannel = v113
	end
end
function v_u_10.UpdateFrameVisibility(p114) -- name: UpdateFrameVisibility
	local v115 = p114.GuiObject
	local v116 = p114.Visible
	if v116 then
		v116 = p114.CoreGuiEnabled
	end
	v115.Visible = v116
end
function v_u_10.GetVisible(p117) -- name: GetVisible
	return p117.Visible
end
function v_u_10.SetVisible(p118, p119) -- name: SetVisible
	p118.Visible = p119
	p118:UpdateFrameVisibility()
end
function v_u_10.GetCoreGuiEnabled(p120) -- name: GetCoreGuiEnabled
	return p120.CoreGuiEnabled
end
function v_u_10.SetCoreGuiEnabled(p121, p122) -- name: SetCoreGuiEnabled
	p121.CoreGuiEnabled = p122
	p121:UpdateFrameVisibility()
end
function v_u_10.EnableResizable(p123) -- name: EnableResizable
	p123.GuiObjects.ChatResizerFrame.Active = true
end
function v_u_10.DisableResizable(p124) -- name: DisableResizable
	p124.GuiObjects.ChatResizerFrame.Active = false
end
function v_u_10.FadeOutBackground(p125, p126) -- name: FadeOutBackground
	-- upvalues: (copy) v_u_9
	p125.ChannelsBar:FadeOutBackground(p126)
	p125.MessageLogDisplay:FadeOutBackground(p126)
	p125.ChatBar:FadeOutBackground(p126)
	p125.AnimParams.Background_TargetTransparency = 1
	p125.AnimParams.Background_NormalizedExptValue = v_u_9:NormalizedDefaultExptValueInSeconds(p126)
end
function v_u_10.FadeInBackground(p127, p128) -- name: FadeInBackground
	-- upvalues: (copy) v_u_9
	p127.ChannelsBar:FadeInBackground(p128)
	p127.MessageLogDisplay:FadeInBackground(p128)
	p127.ChatBar:FadeInBackground(p128)
	p127.AnimParams.Background_TargetTransparency = 0.6
	p127.AnimParams.Background_NormalizedExptValue = v_u_9:NormalizedDefaultExptValueInSeconds(p128)
end
function v_u_10.FadeOutText(p129, p130) -- name: FadeOutText
	p129.MessageLogDisplay:FadeOutText(p130)
	p129.ChannelsBar:FadeOutText(p130)
end
function v_u_10.FadeInText(p131, p132) -- name: FadeInText
	p131.MessageLogDisplay:FadeInText(p132)
	p131.ChannelsBar:FadeInText(p132)
end
function v_u_10.AnimGuiObjects(p133) -- name: AnimGuiObjects
	p133.GuiObjects.ChatChannelParentFrame.BackgroundTransparency = p133.AnimParams.Background_CurrentTransparency
	p133.GuiObjects.ChatResizerFrame.BackgroundTransparency = p133.AnimParams.Background_CurrentTransparency
	p133.GuiObjects.ResizeIcon.ImageTransparency = p133.AnimParams.Background_CurrentTransparency
end
function v_u_10.InitializeAnimParams(p134) -- name: InitializeAnimParams
	-- upvalues: (copy) v_u_9
	p134.AnimParams.Background_TargetTransparency = 0.6
	p134.AnimParams.Background_CurrentTransparency = 0.6
	p134.AnimParams.Background_NormalizedExptValue = v_u_9:NormalizedDefaultExptValueInSeconds(0)
end
function v_u_10.Update(p135, p136) -- name: Update
	-- upvalues: (copy) v_u_9
	p135.ChatBar:Update(p136)
	p135.ChannelsBar:Update(p136)
	p135.MessageLogDisplay:Update(p136)
	p135.AnimParams.Background_CurrentTransparency = v_u_9:Expt(p135.AnimParams.Background_CurrentTransparency, p135.AnimParams.Background_TargetTransparency, p135.AnimParams.Background_NormalizedExptValue, p136)
	p135:AnimGuiObjects()
end
function v1.new() -- name: new
	-- upvalues: (copy) v_u_10
	local v137 = v_u_10
	local v138 = setmetatable({}, v137)
	v138.GuiObject = nil
	v138.GuiObjects = {}
	v138.ChatBar = nil
	v138.ChannelsBar = nil
	v138.MessageLogDisplay = nil
	v138.Channels = {}
	v138.CurrentChannel = nil
	v138.Visible = true
	v138.CoreGuiEnabled = true
	v138.AnimParams = {}
	v138:InitializeAnimParams()
	return v138
end
return v1