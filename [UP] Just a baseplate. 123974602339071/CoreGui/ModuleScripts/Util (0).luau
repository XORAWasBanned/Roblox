-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.DefaultClientChatModules.MessageCreatorModules.Util
local v1, v_u_2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFixOverlappingRtlChatMessages2")
end)
if not v1 then
	v_u_2 = false
end
local v_u_3 = game:GetService("TextService")
local v_u_4 = game:GetService("Players")
local v_u_5 = v_u_4.LocalPlayer
while not v_u_5 do
	v_u_4.ChildAdded:wait()
	v_u_5 = v_u_4.LocalPlayer
end
local v6 = script.Parent.Parent
local v_u_7 = require(v6:WaitForChild("ChatSettings"))
local v_u_8 = require(v6:WaitForChild("ChatConstants"))
local v9 = {}
local v_u_10 = {}
v_u_10.__index = v_u_10
function v_u_10.GetStringTextBounds(_, p11, p12, p13, p14) -- name: GetStringTextBounds
	-- upvalues: (copy) v_u_3
	return v_u_3:GetTextSize(p11, p13, p12, p14 or Vector2.new(10000, 10000))
end
function v_u_10.GetMessageHeight(p15, p16, p17, p18) -- name: GetMessageHeight
	-- upvalues: (ref) v_u_2
	local v19 = p18 or p17.AbsoluteSize.X
	local v20
	if v_u_2 then
		v20 = p16.ContentText
	else
		v20 = p16.Text
	end
	local v21 = p15:GetStringTextBounds(v20, p16.Font, p16.TextSize, Vector2.new(v19, 1000))
	local v22 = v21.Y
	local v23 = v21.Y
	if v22 == math.floor(v23) then
		return v21.Y
	else
		return v21.Y + 1
	end
end
function v_u_10.GetNumberOfSpaces(p24, p25, p26, p27) -- name: GetNumberOfSpaces
	local v28 = p24:GetStringTextBounds(p25, p26, p27)
	local v29 = p24:GetStringTextBounds(" ", p26, p27)
	local v30 = v28.X / v29.X
	return math.ceil(v30)
end
function v_u_10.CreateLeadingSpaces(_, p31) -- name: CreateLeadingSpaces
	-- upvalues: (ref) v_u_2
	if v_u_2 then
		return "<font dir=\"ltr\">" .. string.rep(" ", p31) .. "</font>"
	else
		return string.rep(" ", p31)
	end
end
function v_u_10.SanitizeForRichText(_, p32) -- name: SanitizeForRichText
	-- upvalues: (ref) v_u_2
	if v_u_2 then
		return string.gsub(p32, "%p", {
			["<"] = "&lt;",
			[">"] = "&gt;",
			["&"] = "&amp;"
		})
	else
		return p32
	end
end
function v_u_10.CreateBaseMessage(p33, p34, p35, p36, p37) -- name: CreateBaseMessage
	-- upvalues: (ref) v_u_2
	local v38 = p33:GetFromObjectPool("Frame")
	v38.Selectable = false
	v38.Size = UDim2.new(1, 0, 0, 18)
	v38.Visible = true
	v38.BackgroundTransparency = 1
	local v39 = p33:GetFromObjectPool("TextLabel")
	v39.Selectable = false
	v39.Size = UDim2.new(1, -14, 1, 0)
	v39.Position = UDim2.new(0, 8, 0, 0)
	v39.BackgroundTransparency = 1
	v39.Font = p35
	v39.TextSize = p36
	v39.TextXAlignment = Enum.TextXAlignment.Left
	v39.TextYAlignment = Enum.TextYAlignment.Top
	v39.TextTransparency = 0
	v39.TextStrokeTransparency = 0.75
	v39.TextColor3 = p37
	v39.TextWrapped = true
	v39.ClipsDescendants = true
	v39.Text = p34
	v39.Visible = true
	v39.RichText = v_u_2 and true or false
	v39.Parent = v38
	return v38, v39
end
function v_u_10.AddNameButtonToBaseMessage(p_u_40, p41, p42, p43, p_u_44) -- name: AddNameButtonToBaseMessage
	local v45 = p_u_40:GetStringTextBounds(p43, p41.Font, p41.TextSize)
	local v_u_46 = p_u_40:GetFromObjectPool("TextButton")
	v_u_46.Selectable = false
	v_u_46.Size = UDim2.new(0, v45.X, 0, v45.Y)
	v_u_46.Position = UDim2.new(0, 0, 0, 0)
	v_u_46.BackgroundTransparency = 1
	v_u_46.Font = p41.Font
	v_u_46.TextSize = p41.TextSize
	v_u_46.TextXAlignment = p41.TextXAlignment
	v_u_46.TextYAlignment = p41.TextYAlignment
	v_u_46.TextTransparency = p41.TextTransparency
	v_u_46.TextStrokeTransparency = p41.TextStrokeTransparency
	v_u_46.TextColor3 = p42
	v_u_46.Text = p43
	v_u_46.Visible = true
	v_u_46.Parent = p41
	local v_u_47 = v_u_46.MouseButton1Click:connect(function()
		-- upvalues: (copy) p_u_40, (copy) v_u_46, (copy) p_u_44
		p_u_40:NameButtonClicked(v_u_46, p_u_44)
	end)
	local v_u_48 = nil
	v_u_48 = v_u_46.Changed:connect(function(p49)
		-- upvalues: (copy) v_u_47, (ref) v_u_48
		if p49 == "Parent" then
			v_u_47:Disconnect()
			v_u_48:Disconnect()
		end
	end)
	return v_u_46
end
function v_u_10.AddTranslationButtonToBaseMessage(p50, p51) -- name: AddTranslationButtonToBaseMessage
	local v52 = p51.TextSize * 0.9
	local v53 = math.floor(v52)
	local v54 = Vector2.new(v53, v53)
	local v55 = p50:GetFromObjectPool("ImageButton")
	v55.Selectable = false
	v55.Size = UDim2.new(0, v54.X, 0, v54.Y)
	v55.Position = UDim2.new(0, 0, 0, 0)
	v55.BackgroundTransparency = 1
	v55.Visible = false
	v55.Parent = p51
	v55.Image = "rbxasset://textures/translateIcon.png"
	v55.HoverImage = "rbxasset://textures/translateIconDark.png"
	v55.PressedImage = "rbxasset://textures/translateIconDark.png"
	return v55
end
function v_u_10.AddChannelButtonToBaseMessage(p_u_56, p57, p58, p59, p_u_60) -- name: AddChannelButtonToBaseMessage
	local v61 = p_u_56:GetStringTextBounds(p59, p57.Font, p57.TextSize)
	local v_u_62 = p_u_56:GetFromObjectPool("TextButton")
	v_u_62.Selectable = false
	v_u_62.Size = UDim2.new(0, v61.X, 0, v61.Y)
	v_u_62.Position = UDim2.new(0, 0, 0, 0)
	v_u_62.BackgroundTransparency = 1
	v_u_62.Font = p57.Font
	v_u_62.TextSize = p57.TextSize
	v_u_62.TextXAlignment = p57.TextXAlignment
	v_u_62.TextYAlignment = p57.TextYAlignment
	v_u_62.TextTransparency = p57.TextTransparency
	v_u_62.TextStrokeTransparency = p57.TextStrokeTransparency
	v_u_62.TextColor3 = p58
	v_u_62.Text = p59
	v_u_62.Visible = true
	v_u_62.Parent = p57
	local v_u_63 = v_u_62.MouseButton1Click:connect(function()
		-- upvalues: (copy) p_u_56, (copy) v_u_62, (copy) p_u_60
		p_u_56:ChannelButtonClicked(v_u_62, p_u_60)
	end)
	local v_u_64 = nil
	v_u_64 = v_u_62.Changed:connect(function(p65)
		-- upvalues: (copy) v_u_63, (ref) v_u_64
		if p65 == "Parent" then
			v_u_63:Disconnect()
			v_u_64:Disconnect()
		end
	end)
	return v_u_62
end
function v_u_10.AddTagLabelToBaseMessage(p66, p67, p68, p69) -- name: AddTagLabelToBaseMessage
	local v70 = p66:GetStringTextBounds(p69, p67.Font, p67.TextSize)
	local v71 = p66:GetFromObjectPool("TextLabel")
	v71.Selectable = false
	v71.Size = UDim2.new(0, v70.X, 0, v70.Y)
	v71.Position = UDim2.new(0, 0, 0, 0)
	v71.BackgroundTransparency = 1
	v71.Font = p67.Font
	v71.TextSize = p67.TextSize
	v71.TextXAlignment = p67.TextXAlignment
	v71.TextYAlignment = p67.TextYAlignment
	v71.TextTransparency = p67.TextTransparency
	v71.TextStrokeTransparency = p67.TextStrokeTransparency
	v71.TextColor3 = p68
	v71.Text = p69
	v71.Visible = true
	v71.Parent = p67
	return v71
end
function GetWhisperChannelPrefix() -- name: GetWhisperChannelPrefix
	-- upvalues: (copy) v_u_8
	return not v_u_8.WhisperChannelPrefix and "To " or v_u_8.WhisperChannelPrefix
end
function v_u_10.NameButtonClicked(p72, _, p73) -- name: NameButtonClicked
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (ref) v_u_5
	if p72.ChatWindow then
		if v_u_7.ClickOnPlayerNameToWhisper then
			local v74 = v_u_4:FindFirstChild(p73)
			if v74 and v74 ~= v_u_5 then
				local v75 = GetWhisperChannelPrefix() .. p73
				if p72.ChatWindow:GetChannel(v75) then
					p72.ChatBar:ResetCustomState()
					if p72.ChatWindow:GetTargetMessageChannel() ~= v75 then
						p72.ChatWindow:SwitchCurrentChannel(v75)
					end
					local v76 = "/w " .. p73
					p72.ChatBar:SetText(v76)
					p72.ChatBar:CaptureFocus()
					return
				end
				if not p72.ChatBar:IsInCustomState() then
					local v77 = "/w " .. p73
					p72.ChatBar:SetText(v77)
					p72.ChatBar:CaptureFocus()
				end
			end
		end
	end
end
function v_u_10.ChannelButtonClicked(p78, _, p79) -- name: ChannelButtonClicked
	-- upvalues: (copy) v_u_7
	if p78.ChatWindow then
		if v_u_7.ClickOnChannelNameToSetMainChannel and p78.ChatWindow:GetChannel(p79) then
			p78.ChatBar:ResetCustomState()
			if p78.ChatWindow:GetTargetMessageChannel() ~= p79 then
				p78.ChatWindow:SwitchCurrentChannel(p79)
			end
			p78.ChatBar:ResetText()
			p78.ChatBar:CaptureFocus()
		end
	end
end
function v_u_10.RegisterChatWindow(p80, p81) -- name: RegisterChatWindow
	p80.ChatWindow = p81
	p80.ChatBar = p81:GetChatBar()
end
function v_u_10.GetFromObjectPool(p82, p83) -- name: GetFromObjectPool
	if p82.ObjectPool == nil then
		return Instance.new(p83)
	else
		return p82.ObjectPool:GetInstance(p83)
	end
end
function v_u_10.RegisterObjectPool(p84, p85) -- name: RegisterObjectPool
	p84.ObjectPool = p85
end
function v_u_10.CreateFadeFunctions(_, p_u_86) -- name: CreateFadeFunctions
	local v_u_87 = {}
	for v88, v89 in pairs(p_u_86) do
		v_u_87[v88] = {}
		for v90, v91 in pairs(v89) do
			v_u_87[v88][v90] = {
				["Target"] = nil,
				["Current"] = nil,
				["NormalizedExptValue"] = 1,
				["Target"] = v91.FadedIn,
				["Current"] = v88[v90]
			}
		end
	end
	local function v_u_96() -- name: AnimGuiObjects
		-- upvalues: (copy) v_u_87
		for v92, v93 in pairs(v_u_87) do
			for v94, v95 in pairs(v93) do
				v92[v94] = v95.Current
			end
		end
	end
	return function(p97, p98) -- name: FadeInFunction
		-- upvalues: (copy) v_u_87, (copy) p_u_86
		for v99, v100 in pairs(v_u_87) do
			for v101, v102 in pairs(v100) do
				v102.Target = p_u_86[v99][v101].FadedIn
				v102.NormalizedExptValue = p98:NormalizedDefaultExptValueInSeconds(p97)
			end
		end
	end, function(p103, p104) -- name: FadeOutFunction
		-- upvalues: (copy) v_u_87, (copy) p_u_86
		for v105, v106 in pairs(v_u_87) do
			for v107, v108 in pairs(v106) do
				v108.Target = p_u_86[v105][v107].FadedOut
				v108.NormalizedExptValue = p104:NormalizedDefaultExptValueInSeconds(p103)
			end
		end
	end, function(p109, p110) -- name: UpdateAnimFunction
		-- upvalues: (copy) v_u_87, (copy) v_u_96
		for _, v111 in pairs(v_u_87) do
			for _, v112 in pairs(v111) do
				v112.Current = p110:Expt(v112.Current, v112.Target, v112.NormalizedExptValue, p109)
			end
		end
		v_u_96()
	end
end
function v_u_10.NewBindableEvent(_, p113) -- name: NewBindableEvent
	local v114 = Instance.new("BindableEvent")
	v114.Name = p113
	return v114
end
function v_u_10.RegisterGuiRoot(_) -- name: RegisterGuiRoot end
function v9.new() -- name: new
	-- upvalues: (copy) v_u_10
	local v115 = v_u_10
	local v116 = setmetatable({}, v115)
	v116.ObjectPool = nil
	v116.ChatWindow = nil
	v116.DEFAULT_MESSAGE_CREATOR = "UnknownMessage"
	v116.MESSAGE_CREATOR_MODULES_VERSION = 1
	v116.KEY_MESSAGE_TYPE = "MessageType"
	v116.KEY_CREATOR_FUNCTION = "MessageCreatorFunc"
	v116.KEY_BASE_FRAME = "BaseFrame"
	v116.KEY_BASE_MESSAGE = "BaseMessage"
	v116.KEY_UPDATE_TEXT_FUNC = "UpdateTextFunction"
	v116.KEY_GET_HEIGHT = "GetHeightFunction"
	v116.KEY_FADE_IN = "FadeInFunction"
	v116.KEY_FADE_OUT = "FadeOutFunction"
	v116.KEY_UPDATE_ANIMATION = "UpdateAnimFunction"
	return v116
end
return v9.new()