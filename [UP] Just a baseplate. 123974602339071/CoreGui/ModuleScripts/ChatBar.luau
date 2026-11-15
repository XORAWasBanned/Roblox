-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.ChatBar
local v_u_1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("Players")
local v_u_4 = game:GetService("TextService")
local v_u_5 = v3.LocalPlayer
local v6 = {}
while not v_u_5 do
	v3.PlayerAdded:wait()
	v_u_5 = v3.LocalPlayer
end
local v_u_7 = game:GetService("Chat")
local v8 = v_u_7:WaitForChild("ClientChatModules")
local v9 = script.Parent
local v_u_10 = require(v8:WaitForChild("ChatSettings"))
local v_u_11 = require(v9:WaitForChild("CurveUtil"))
local v12 = v8:WaitForChild("CommandModules")
local v_u_13 = require(v12:WaitForChild("Whisper"))
require(v9:WaitForChild("MessageSender"))
local v_u_14 = nil
local function v15()
	-- upvalues: (ref) v_u_14
	v_u_14 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end
pcall(v15)
v_u_14 = v_u_14 == nil and {
	["Get"] = function(_, _, p16) -- name: Get
		return p16
	end
} or v_u_14
local v_u_17 = {}
v_u_17.__index = v_u_17
function v_u_17.CreateGuiObjects(p18, p19) -- name: CreateGuiObjects
	-- upvalues: (copy) v_u_10
	p18.ChatBarParentFrame = p19
	local v20 = Instance.new("Frame")
	v20.Selectable = false
	v20.Size = UDim2.new(1, 0, 1, 0)
	v20.BackgroundTransparency = 0.6
	v20.BorderSizePixel = 0
	v20.BackgroundColor3 = v_u_10.ChatBarBackGroundColor
	v20.Parent = p19
	local v21 = Instance.new("Frame")
	v21.Selectable = false
	v21.Name = "BoxFrame"
	v21.BackgroundTransparency = 0.6
	v21.BorderSizePixel = 0
	v21.BackgroundColor3 = v_u_10.ChatBarBoxColor
	v21.Size = UDim2.new(1, -14, 1, -14)
	v21.Position = UDim2.new(0, 7, 0, 7)
	v21.Parent = v20
	local v22 = Instance.new("Frame")
	v22.BackgroundTransparency = 1
	v22.Size = UDim2.new(1, -10, 1, -10)
	v22.Position = UDim2.new(0, 5, 0, 5)
	v22.Parent = v21
	local v23 = Instance.new("TextBox")
	v23.Selectable = v_u_10.GamepadNavigationEnabled
	v23.Name = "ChatBar"
	v23.BackgroundTransparency = 1
	v23.Size = UDim2.new(1, 0, 1, 0)
	v23.Position = UDim2.new(0, 0, 0, 0)
	v23.TextSize = v_u_10.ChatBarTextSize
	v23.Font = v_u_10.ChatBarFont
	v23.TextColor3 = v_u_10.ChatBarTextColor
	v23.TextTransparency = 0.4
	v23.TextStrokeTransparency = 1
	v23.ClearTextOnFocus = false
	v23.TextXAlignment = Enum.TextXAlignment.Left
	v23.TextYAlignment = Enum.TextYAlignment.Top
	v23.TextWrapped = true
	v23.Text = ""
	v23.Parent = v22
	local v24 = Instance.new("TextButton")
	v24.Selectable = false
	v24.Name = "MessageMode"
	v24.BackgroundTransparency = 1
	v24.Position = UDim2.new(0, 0, 0, 0)
	v24.TextSize = v_u_10.ChatBarTextSize
	v24.Font = v_u_10.ChatBarFont
	v24.TextXAlignment = Enum.TextXAlignment.Left
	v24.TextWrapped = true
	v24.Text = ""
	v24.Size = UDim2.new(0, 0, 0, 0)
	v24.TextYAlignment = Enum.TextYAlignment.Center
	v24.TextColor3 = p18:GetDefaultChannelNameColor()
	v24.Visible = true
	v24.Parent = v22
	local v25 = Instance.new("TextLabel")
	v25.Selectable = false
	v25.TextWrapped = true
	v25.BackgroundTransparency = 1
	v25.Size = v23.Size
	v25.Position = v23.Position
	v25.TextSize = v23.TextSize
	v25.Font = v23.Font
	v25.TextColor3 = v23.TextColor3
	v25.TextTransparency = v23.TextTransparency
	v25.TextStrokeTransparency = v23.TextStrokeTransparency
	v25.TextXAlignment = v23.TextXAlignment
	v25.TextYAlignment = v23.TextYAlignment
	v25.Text = "..."
	v25.Parent = v22
	p18.GuiObject = v20
	p18.TextBox = v23
	p18.TextLabel = v25
	p18.GuiObjects.BaseFrame = v20
	p18.GuiObjects.TextBoxFrame = v21
	p18.GuiObjects.TextBox = v23
	p18.GuiObjects.TextLabel = v25
	p18.GuiObjects.MessageModeTextButton = v24
	p18:AnimGuiObjects()
	p18:SetUpTextBoxEvents(v23, v25, v24)
	if p18.UserHasChatOff then
		p18:DoLockChatBar()
	end
	p18.eGuiObjectsChanged:Fire()
end
function v_u_17.DoLockChatBar(p_u_26) -- name: DoLockChatBar
	-- upvalues: (ref) v_u_5, (ref) v_u_14
	if p_u_26.TextLabel then
		if v_u_5.UserId > 0 then
			p_u_26.TextLabel.Text = v_u_14:Get("GameChat_ChatMessageValidator_SettingsError", "To chat in game, turn on chat in your Privacy Settings.")
		else
			p_u_26.TextLabel.Text = v_u_14:Get("GameChat_SwallowGuestChat_Message", "Sign up to chat in game.")
		end
		p_u_26:CalculateSize()
	end
	if p_u_26.TextBox then
		p_u_26.TextBox.Active = false
		p_u_26.TextBox.Focused:connect(function()
			-- upvalues: (copy) p_u_26
			p_u_26.TextBox:ReleaseFocus()
		end)
	end
end
function v_u_17.SetUpTextBoxEvents(p_u_27, p_u_28, p_u_29, p_u_30) -- name: SetUpTextBoxEvents
	-- upvalues: (copy) v_u_1, (copy) v_u_10
	for v31, v32 in pairs(p_u_27.TextBoxConnections) do
		v32:disconnect()
		p_u_27.TextBoxConnections[v31] = nil
	end
	p_u_27.TextBoxConnections.UserInputBegan = v_u_1.InputBegan:connect(function(p33, _)
		-- upvalues: (copy) p_u_27, (copy) p_u_28, (ref) v_u_10
		if p33.KeyCode == Enum.KeyCode.Backspace and (p_u_27:IsFocused() and p_u_28.Text == "") then
			p_u_27:SetChannelTarget(v_u_10.GeneralChannelName)
		end
	end)
	p_u_27.TextBoxConnections.TextBoxChanged = p_u_28.Changed:connect(function(p34)
		-- upvalues: (copy) p_u_27, (copy) p_u_28, (ref) v_u_10
		if p34 == "AbsoluteSize" then
			p_u_27:CalculateSize()
			return
		elseif p34 == "Text" then
			p_u_27:CalculateSize()
			if utf8.len(utf8.nfcnormalize(p_u_28.Text)) > v_u_10.MaximumMessageLength then
				p_u_28.Text = p_u_27.PreviousText
			else
				p_u_27.PreviousText = p_u_28.Text
			end
			if p_u_27.InCustomState then
				p_u_27.CustomState:TextUpdated()
			else
				local v35 = p_u_27.CommandProcessor:ProcessInProgressChatMessage(p_u_28.Text, p_u_27.ChatWindow, p_u_27)
				if v35 then
					p_u_27.InCustomState = true
					p_u_27.CustomState = v35
					return
				end
			end
		end
	end)
	p_u_27.TextBoxConnections.MessageModeClick = p_u_30.MouseButton1Click:connect(function()
		-- upvalues: (copy) p_u_30, (copy) p_u_27, (ref) v_u_10
		if p_u_30.Text ~= "" then
			p_u_27:SetChannelTarget(v_u_10.GeneralChannelName)
		end
	end)
	p_u_27.TextBoxConnections.TextBoxFocused = p_u_28.Focused:connect(function()
		-- upvalues: (copy) p_u_27, (copy) p_u_29
		if not p_u_27.UserHasChatOff then
			p_u_27:CalculateSize()
			p_u_29.Visible = false
		end
	end)
	p_u_27.TextBoxConnections.TextBoxFocusLost = p_u_28.FocusLost:connect(function(_, p36)
		-- upvalues: (copy) p_u_27, (copy) p_u_28, (copy) p_u_29
		p_u_27:CalculateSize()
		if p36 and p36.KeyCode == Enum.KeyCode.Escape then
			p_u_28.Text = ""
		end
		if p_u_28.Text == "" then
			p_u_29.Visible = true
		else
			p_u_29.Visible = false
		end
	end)
end
function v_u_17.GetTextBox(p37) -- name: GetTextBox
	return p37.TextBox
end
function v_u_17.GetMessageModeTextButton(p38) -- name: GetMessageModeTextButton
	return p38.GuiObjects.MessageModeTextButton
end
function v_u_17.GetMessageModeTextLabel(p39) -- name: GetMessageModeTextLabel
	return p39:GetMessageModeTextButton()
end
function v_u_17.IsFocused(p40) -- name: IsFocused
	if p40.UserHasChatOff then
		return false
	else
		return p40:GetTextBox():IsFocused()
	end
end
function v_u_17.GetVisible(p41) -- name: GetVisible
	return p41.GuiObject.Visible
end
function v_u_17.CaptureFocus(p42) -- name: CaptureFocus
	if not p42.UserHasChatOff then
		p42:GetTextBox():CaptureFocus()
	end
end
function v_u_17.ReleaseFocus(p43, p44) -- name: ReleaseFocus
	p43:GetTextBox():ReleaseFocus(p44)
end
function v_u_17.ResetText(p45) -- name: ResetText
	p45:GetTextBox().Text = ""
end
function v_u_17.SetText(p46, p47) -- name: SetText
	p46:GetTextBox().Text = p47
end
function v_u_17.GetEnabled(p48) -- name: GetEnabled
	return p48.GuiObject.Visible
end
function v_u_17.SetEnabled(p49, p50) -- name: SetEnabled
	if p49.UserHasChatOff then
		p49.GuiObject.Visible = true
	else
		p49.GuiObject.Visible = p50
	end
end
function v_u_17.SetTextLabelText(p51, p52) -- name: SetTextLabelText
	if not p51.UserHasChatOff then
		p51.TextLabel.Text = p52
	end
end
function v_u_17.SetTextBoxText(p53, p54) -- name: SetTextBoxText
	p53.TextBox.Text = p54
end
function v_u_17.GetTextBoxText(p55) -- name: GetTextBoxText
	return p55.TextBox.Text
end
function v_u_17.ResetSize(p56) -- name: ResetSize
	p56.TargetYSize = 0
	p56:TweenToTargetYSize()
end
function v_u_17.CalculateSize(p57) -- name: CalculateSize
	-- upvalues: (copy) v_u_4
	if not p57.CalculatingSizeLock then
		p57.CalculatingSizeLock = true
		local v58, v59
		if p57:IsFocused() or p57.TextBox.Text ~= "" then
			v58 = p57.TextBox.TextSize
			local v60 = p57.TextBox
			v59 = v_u_4:GetTextSize(v60.Text, v60.TextSize, v60.Font, Vector2.new(v60.AbsoluteSize.X, 10000)).Y
		else
			v58 = p57.TextLabel.TextSize
			local v61 = p57.TextLabel
			v59 = v_u_4:GetTextSize(v61.Text, v61.TextSize, v61.Font, Vector2.new(v61.AbsoluteSize.X, 10000)).Y
		end
		local v62 = v59 - v58
		if p57.TargetYSize ~= v62 then
			p57.TargetYSize = v62
			p57:TweenToTargetYSize()
		end
		p57.CalculatingSizeLock = false
	end
end
function v_u_17.TweenToTargetYSize(p_u_63) -- name: TweenToTargetYSize
	local v_u_64 = UDim2.new(1, 0, 1, p_u_63.TargetYSize)
	local v65 = p_u_63.GuiObject.Size
	local v66 = p_u_63.GuiObject.AbsoluteSize.Y
	p_u_63.GuiObject.Size = v_u_64
	local v67 = p_u_63.GuiObject.AbsoluteSize.Y
	p_u_63.GuiObject.Size = v65
	local v68 = v67 - v66
	local v69 = math.abs(v68) * (1 / p_u_63.TweenPixelsPerSecond)
	local v_u_70 = math.min(1, v69)
	if not pcall(function()
		-- upvalues: (copy) p_u_63, (copy) v_u_64, (copy) v_u_70
		p_u_63.GuiObject:TweenSize(v_u_64, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, v_u_70, true)
	end) then
		p_u_63.GuiObject.Size = v_u_64
	end
end
function v_u_17.SetTextSize(p71, p72) -- name: SetTextSize
	if not p71:IsInCustomState() then
		if p71.TextBox then
			p71.TextBox.TextSize = p72
		end
		if p71.TextLabel then
			p71.TextLabel.TextSize = p72
		end
	end
end
function v_u_17.GetDefaultChannelNameColor(_) -- name: GetDefaultChannelNameColor
	-- upvalues: (copy) v_u_10
	if v_u_10.DefaultChannelNameColor then
		return v_u_10.DefaultChannelNameColor
	else
		return Color3.fromRGB(35, 76, 142)
	end
end
function v_u_17.SetChannelTarget(p73, p74) -- name: SetChannelTarget
	-- upvalues: (copy) v_u_10, (ref) v_u_14
	local v75 = p73.GuiObjects.MessageModeTextButton
	local v76 = p73.TextBox
	local v77 = p73.TextLabel
	p73.TargetChannel = p74
	if not p73:IsInCustomState() then
		if p74 ~= v_u_10.GeneralChannelName then
			v75.Size = UDim2.new(0, 1000, 1, 0)
			local v78
			if v_u_14.tryLocalize then
				v78 = v_u_14:tryLocalize(p74)
			else
				v78 = p74
			end
			v75.Text = string.format("[%s] ", v78)
			local v79 = p73:GetChannelNameColor(p74)
			if v79 then
				v75.TextColor3 = v79
			else
				v75.TextColor3 = p73:GetDefaultChannelNameColor()
			end
			local v80 = v75.TextBounds.X
			v75.Size = UDim2.new(0, v80, 1, 0)
			v76.Size = UDim2.new(1, -v80, 1, 0)
			v76.Position = UDim2.new(0, v80, 0, 0)
			v77.Size = UDim2.new(1, -v80, 1, 0)
			v77.Position = UDim2.new(0, v80, 0, 0)
			return
		end
		v75.Text = ""
		v75.Size = UDim2.new(0, 0, 0, 0)
		v76.Size = UDim2.new(1, 0, 1, 0)
		v76.Position = UDim2.new(0, 0, 0, 0)
		v77.Size = UDim2.new(1, 0, 1, 0)
		v77.Position = UDim2.new(0, 0, 0, 0)
	end
end
function v_u_17.IsInCustomState(p81) -- name: IsInCustomState
	return p81.InCustomState
end
function v_u_17.ResetCustomState(p82) -- name: ResetCustomState
	-- upvalues: (ref) v_u_14
	if p82.InCustomState then
		p82.CustomState:Destroy()
		p82.CustomState = nil
		p82.InCustomState = false
		p82.ChatBarParentFrame:ClearAllChildren()
		p82:CreateGuiObjects(p82.ChatBarParentFrame)
		p82:SetTextLabelText(v_u_14:Get("GameChat_ChatMain_ChatBarText", "To chat click here or press \"/\" key"))
	end
end
function v_u_17.EnterWhisperState(p83, p84) -- name: EnterWhisperState
	-- upvalues: (copy) v_u_13, (copy) v_u_10
	p83:ResetCustomState()
	if v_u_13.CustomStateCreator then
		p83.CustomState = v_u_13.CustomStateCreator(p84, p83.ChatWindow, p83, v_u_10)
		p83.InCustomState = true
	else
		local v85
		if v_u_10.PlayerDisplayNamesEnabled then
			v85 = p84.DisplayName
		else
			v85 = p84.Name
		end
		p83:SetText("/w " .. v85)
	end
	p83:CaptureFocus()
end
function v_u_17.GetCustomMessage(p86) -- name: GetCustomMessage
	if p86.InCustomState then
		return p86.CustomState:GetMessage()
	else
		return nil
	end
end
function v_u_17.CustomStateProcessCompletedMessage(p87, _) -- name: CustomStateProcessCompletedMessage
	if p87.InCustomState then
		return p87.CustomState:ProcessCompletedMessage()
	else
		return false
	end
end
function v_u_17.FadeOutBackground(p88, p89) -- name: FadeOutBackground
	-- upvalues: (copy) v_u_11
	p88.AnimParams.Background_TargetTransparency = 1
	p88.AnimParams.Background_NormalizedExptValue = v_u_11:NormalizedDefaultExptValueInSeconds(p89)
	p88:FadeOutText(p89)
end
function v_u_17.FadeInBackground(p90, p91) -- name: FadeInBackground
	-- upvalues: (copy) v_u_11
	p90.AnimParams.Background_TargetTransparency = 0.6
	p90.AnimParams.Background_NormalizedExptValue = v_u_11:NormalizedDefaultExptValueInSeconds(p91)
	p90:FadeInText(p91)
end
function v_u_17.FadeOutText(p92, p93) -- name: FadeOutText
	-- upvalues: (copy) v_u_11
	p92.AnimParams.Text_TargetTransparency = 1
	p92.AnimParams.Text_NormalizedExptValue = v_u_11:NormalizedDefaultExptValueInSeconds(p93)
end
function v_u_17.FadeInText(p94, p95) -- name: FadeInText
	-- upvalues: (copy) v_u_11
	p94.AnimParams.Text_TargetTransparency = 0.4
	p94.AnimParams.Text_NormalizedExptValue = v_u_11:NormalizedDefaultExptValueInSeconds(p95)
end
function v_u_17.AnimGuiObjects(p96) -- name: AnimGuiObjects
	p96.GuiObject.BackgroundTransparency = p96.AnimParams.Background_CurrentTransparency
	p96.GuiObjects.TextBoxFrame.BackgroundTransparency = p96.AnimParams.Background_CurrentTransparency
	p96.GuiObjects.TextLabel.TextTransparency = p96.AnimParams.Text_CurrentTransparency
	p96.GuiObjects.TextBox.TextTransparency = p96.AnimParams.Text_CurrentTransparency
	p96.GuiObjects.MessageModeTextButton.TextTransparency = p96.AnimParams.Text_CurrentTransparency
end
function v_u_17.InitializeAnimParams(p97) -- name: InitializeAnimParams
	p97.AnimParams.Text_TargetTransparency = 0.4
	p97.AnimParams.Text_CurrentTransparency = 0.4
	p97.AnimParams.Text_NormalizedExptValue = 1
	p97.AnimParams.Background_TargetTransparency = 0.6
	p97.AnimParams.Background_CurrentTransparency = 0.6
	p97.AnimParams.Background_NormalizedExptValue = 1
end
function v_u_17.Update(p98, p99) -- name: Update
	-- upvalues: (copy) v_u_11
	p98.AnimParams.Text_CurrentTransparency = v_u_11:Expt(p98.AnimParams.Text_CurrentTransparency, p98.AnimParams.Text_TargetTransparency, p98.AnimParams.Text_NormalizedExptValue, p99)
	p98.AnimParams.Background_CurrentTransparency = v_u_11:Expt(p98.AnimParams.Background_CurrentTransparency, p98.AnimParams.Background_TargetTransparency, p98.AnimParams.Background_NormalizedExptValue, p99)
	p98:AnimGuiObjects()
end
function v_u_17.SetChannelNameColor(p100, p101, p102) -- name: SetChannelNameColor
	p100.ChannelNameColors[p101] = p102
	if p100.GuiObjects.MessageModeTextButton.Text == p101 then
		p100.GuiObjects.MessageModeTextButton.TextColor3 = p102
	end
end
function v_u_17.GetChannelNameColor(p103, p104) -- name: GetChannelNameColor
	return p103.ChannelNameColors[p104]
end
function v6.new(p105, p106) -- name: new
	-- upvalues: (copy) v_u_17, (copy) v_u_10, (copy) v_u_7, (ref) v_u_5, (copy) v_u_2
	local v107 = v_u_17
	local v_u_108 = setmetatable({}, v107)
	v_u_108.GuiObject = nil
	v_u_108.ChatBarParentFrame = nil
	v_u_108.TextBox = nil
	v_u_108.TextLabel = nil
	v_u_108.GuiObjects = {}
	v_u_108.eGuiObjectsChanged = Instance.new("BindableEvent")
	v_u_108.GuiObjectsChanged = v_u_108.eGuiObjectsChanged.Event
	v_u_108.TextBoxConnections = {}
	v_u_108.PreviousText = ""
	v_u_108.InCustomState = false
	v_u_108.CustomState = nil
	v_u_108.TargetChannel = nil
	v_u_108.CommandProcessor = p105
	v_u_108.ChatWindow = p106
	v_u_108.TweenPixelsPerSecond = 500
	v_u_108.TargetYSize = 0
	v_u_108.AnimParams = {}
	v_u_108.CalculatingSizeLock = false
	v_u_108.ChannelNameColors = {}
	v_u_108.UserHasChatOff = false
	v_u_108:InitializeAnimParams()
	v_u_10.SettingsChanged:connect(function(p109, p110)
		-- upvalues: (copy) v_u_108
		if p109 == "ChatBarTextSize" then
			v_u_108:SetTextSize(p110)
		end
	end)
	coroutine.wrap(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_5, (ref) v_u_2, (copy) v_u_108
		local function v111()
			-- upvalues: (ref) v_u_7, (ref) v_u_5
			return v_u_7:CanUserChatAsync(v_u_5.UserId)
		end
		local v112, v113 = pcall(v111)
		if v112 then
			v112 = v_u_2:IsStudio() or v113
		end
		if v112 == false then
			v_u_108.UserHasChatOff = true
			v_u_108:DoLockChatBar()
		end
	end)()
	return v_u_108
end
return v6