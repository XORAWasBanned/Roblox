-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.ChatMain
local v_u_1 = {
	["Visible"] = nil,
	["IsCoreGuiEnabled"] = nil,
	["TopbarEnabled"] = nil,
	["VisibilityStateChanged"] = nil
}
local v2, v3 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserHandleFriendJoinNotifierOnClient")
end)
if not v2 then
	v3 = false
end
local v4, v5 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
local v_u_6 = v4 and v5
local v7, v8 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserAddBetterConsoleCheckForLegacyChat")
end)
local v9 = v7 and v8
game:GetService("RunService")
local v10 = game:GetService("ReplicatedStorage")
local v_u_11 = game:GetService("Chat")
local v_u_12 = game:GetService("StarterGui")
game:GetService("ContextActionService")
local v_u_13 = v10:WaitForChild("DefaultChatSystemChatEvents")
local v14 = v10:WaitForChild("DefaultChatSystemChatEvents")
local v15 = v_u_11:WaitForChild("ClientChatModules")
local v_u_16 = require(v15:WaitForChild("ChatConstants"))
local v_u_17 = require(v15:WaitForChild("ChatSettings"))
local v18 = v15:WaitForChild("MessageCreatorModules")
local v19 = require(v18:WaitForChild("Util"))
local v_u_20 = nil
local function v21()
	-- upvalues: (ref) v_u_20
	v_u_20 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end
pcall(v21)
local v_u_23 = v_u_20 == nil and {
	["Get"] = function(_, _, p22) -- name: Get
		return p22
	end
} or v_u_20
local v_u_24
if v_u_6 then
	v_u_24 = script:FindFirstChild("ChatTranslationEnabled")
	if v_u_24 == nil then
		local v_u_25 = nil
		v_u_25 = script.ChildAdded:Connect(function(p26)
			-- upvalues: (ref) v_u_24, (ref) v_u_25
			if p26.Name == "ChatTranslationEnabled" then
				v_u_24 = p26
				v_u_25:Disconnect()
			end
		end)
	end
else
	v_u_24 = nil
end
local v_u_27 = 10
local v_u_28 = {
	["OnNewMessage"] = "RemoteEvent",
	["OnMessageDoneFiltering"] = "RemoteEvent",
	["OnNewSystemMessage"] = "RemoteEvent",
	["OnChannelJoined"] = "RemoteEvent",
	["OnChannelLeft"] = "RemoteEvent",
	["OnMuted"] = "RemoteEvent",
	["OnUnmuted"] = "RemoteEvent",
	["OnMainChannelSet"] = "RemoteEvent",
	["SayMessageRequest"] = "RemoteEvent",
	["GetInitDataRequest"] = "RemoteFunction"
}
local v_u_29 = {}
local v_u_30 = Instance.new("BindableEvent")
function TryRemoveChildWithVerifyingIsCorrectType(p31) -- name: TryRemoveChildWithVerifyingIsCorrectType
	-- upvalues: (copy) v_u_28, (copy) v_u_29, (ref) v_u_27
	if v_u_28[p31.Name] and p31:IsA(v_u_28[p31.Name]) then
		v_u_28[p31.Name] = nil
		v_u_29[p31.Name] = p31
		v_u_27 = v_u_27 - 1
	end
end
local v_u_32 = v_u_27
for _, v33 in pairs(v14:GetChildren()) do
	TryRemoveChildWithVerifyingIsCorrectType(v33)
end
if v_u_32 > 0 then
	local v35 = v14.ChildAdded:connect(function(p34)
		-- upvalues: (ref) v_u_32, (copy) v_u_30
		TryRemoveChildWithVerifyingIsCorrectType(p34)
		if v_u_32 < 1 then
			v_u_30:Fire()
		end
	end)
	v_u_30.Event:wait()
	v35:disconnect()
	v_u_30:Destroy()
end
local v_u_36 = game:GetService("UserInputService")
local v_u_37 = game:GetService("RunService")
local v_u_38 = game:GetService("Players")
local v_u_39 = v_u_38.LocalPlayer
while not v_u_39 do
	v_u_38.ChildAdded:wait()
	v_u_39 = v_u_38.LocalPlayer
end
local v_u_40 = true
local v41 = v_u_17.ScreenGuiDisplayOrder == nil and 6 or v_u_17.ScreenGuiDisplayOrder
local v42 = v_u_39:WaitForChild("PlayerGui")
local v_u_43 = Instance.new("ScreenGui")
v_u_43.Name = "Chat"
v_u_43.ResetOnSpawn = false
v_u_43.DisplayOrder = v41
v_u_43.Parent = v42
if v9 and game:GetService("GuiService"):IsTenFootInterface() then
	v_u_43.Enabled = false
end
local v_u_44 = false
local v_u_45 = script
local v46 = require(v_u_45:WaitForChild("ChatWindow"))
local v47 = require(v_u_45:WaitForChild("ChatBar"))
local v48 = require(v_u_45:WaitForChild("ChannelsBar"))
require(v_u_45:WaitForChild("MessageLabelCreator"))
local v_u_49 = require(v_u_45:WaitForChild("MessageLogDisplay"))
require(v_u_45:WaitForChild("ChatChannel"))
local v50 = require(v_u_45:WaitForChild("CommandProcessor"))
local v_u_51 = v46.new()
local v_u_52 = v48.new()
local v_u_53 = v_u_49.new()
local v_u_54 = v50.new()
local v_u_55 = v47.new(v_u_54, v_u_51)
v_u_51:CreateGuiObjects(v_u_43)
v_u_51:RegisterChatBar(v_u_55)
v_u_51:RegisterChannelsBar(v_u_52)
v_u_51:RegisterMessageLogDisplay(v_u_53)
v19:RegisterChatWindow(v_u_51)
local v_u_56 = require(v_u_45:WaitForChild("MessageSender"))
v_u_56:RegisterSayMessageFunction(v_u_29.SayMessageRequest)
if v_u_36.TouchEnabled then
	v_u_55:SetTextLabelText(v_u_23:Get("GameChat_ChatMain_ChatBarTextTouch", "Tap here to chat"))
else
	v_u_55:SetTextLabelText(v_u_23:Get("GameChat_ChatMain_ChatBarText", "To chat click here or press \"/\" key"))
end
spawn(function()
	-- upvalues: (copy) v_u_45, (copy) v_u_17, (copy) v_u_51
	local v57 = require(v_u_45:WaitForChild("CurveUtil"))
	local v58 = 1 / (v_u_17.ChatAnimationFPS or 20)
	local v59 = tick()
	while true do
		local v60 = tick()
		local v61 = v57:DeltaTimeToTimescale(v60 - v59)
		if v61 ~= 0 then
			v_u_51:Update(v61)
		end
		wait(v58)
		v59 = v60
	end
end)
function CheckIfPointIsInSquare(p62, p63, p64) -- name: CheckIfPointIsInSquare
	local v65
	if p63.X <= p62.X and (p62.X <= p64.X and p63.Y <= p62.Y) then
		v65 = p62.Y <= p64.Y
	else
		v65 = false
	end
	return v65
end
local v_u_66 = false
local v_u_67 = false
local v_u_68 = 0
local v_u_69 = 0
local v_u_70 = Instance.new("BindableEvent")
local v_u_71 = Instance.new("BindableEvent")
local v_u_72 = Instance.new("BindableEvent")
function DoBackgroundFadeIn(p73) -- name: DoBackgroundFadeIn
	-- upvalues: (ref) v_u_69, (ref) v_u_66, (copy) v_u_70, (copy) v_u_51, (copy) v_u_17, (copy) v_u_53, (copy) v_u_49
	v_u_69 = tick()
	v_u_66 = false
	v_u_70:Fire()
	v_u_51:FadeInBackground(p73 or v_u_17.ChatDefaultFadeDuration)
	if v_u_51:GetCurrentChannel() then
		local v74 = v_u_53.Scroller
		v74.ScrollingEnabled = true
		v74.ScrollBarThickness = v_u_49.ScrollBarThickness
	end
end
function DoBackgroundFadeOut(p75) -- name: DoBackgroundFadeOut
	-- upvalues: (ref) v_u_69, (ref) v_u_66, (copy) v_u_70, (copy) v_u_51, (copy) v_u_17, (copy) v_u_53
	v_u_69 = tick()
	v_u_66 = true
	v_u_70:Fire()
	v_u_51:FadeOutBackground(p75 or v_u_17.ChatDefaultFadeDuration)
	if v_u_51:GetCurrentChannel() then
		local v76 = v_u_53.Scroller
		v76.ScrollingEnabled = false
		v76.ScrollBarThickness = 0
	end
end
function DoTextFadeIn(p77) -- name: DoTextFadeIn
	-- upvalues: (ref) v_u_68, (ref) v_u_67, (copy) v_u_70, (copy) v_u_51, (copy) v_u_17
	v_u_68 = tick()
	v_u_67 = false
	v_u_70:Fire()
	v_u_51:FadeInText((p77 or v_u_17.ChatDefaultFadeDuration) * 0)
end
function DoTextFadeOut(p78) -- name: DoTextFadeOut
	-- upvalues: (ref) v_u_68, (ref) v_u_67, (copy) v_u_70, (copy) v_u_51, (copy) v_u_17
	v_u_68 = tick()
	v_u_67 = true
	v_u_70:Fire()
	v_u_51:FadeOutText(p78 or v_u_17.ChatDefaultFadeDuration)
end
function DoFadeInFromNewInformation() -- name: DoFadeInFromNewInformation
	-- upvalues: (copy) v_u_17
	DoTextFadeIn()
	if v_u_17.ChatShouldFadeInFromNewInformation then
		DoBackgroundFadeIn()
	end
end
function InstantFadeIn() -- name: InstantFadeIn
	DoBackgroundFadeIn(0)
	DoTextFadeIn(0)
end
function InstantFadeOut() -- name: InstantFadeOut
	DoBackgroundFadeOut(0)
	DoTextFadeOut(0)
end
local v_u_79 = nil
function UpdateFadingForMouseState(p80) -- name: UpdateFadingForMouseState
	-- upvalues: (ref) v_u_79, (copy) v_u_71, (copy) v_u_55
	v_u_79 = p80
	v_u_71:Fire()
	if v_u_55:IsFocused() then
		return
	elseif p80 then
		DoBackgroundFadeIn()
		DoTextFadeIn()
	else
		DoBackgroundFadeIn()
	end
end
spawn(function()
	-- upvalues: (copy) v_u_37, (ref) v_u_79, (copy) v_u_55, (copy) v_u_71, (copy) v_u_72, (ref) v_u_66, (ref) v_u_69, (copy) v_u_17, (ref) v_u_67, (ref) v_u_68, (copy) v_u_70
	while true do
		v_u_37.RenderStepped:wait()
		while v_u_79 or v_u_55:IsFocused() do
			if v_u_79 then
				v_u_71.Event:wait()
			end
			if not v_u_55:IsFocused() then
				continue
			end
			v_u_72.Event:wait()
		end
		if v_u_66 then
			if v_u_67 then
				v_u_70.Event:wait()
			else
				if tick() - v_u_68 <= v_u_17.ChatWindowTextFadeOutTime then
					break
				end
				DoTextFadeOut()
			end
		else
			if tick() - v_u_69 <= v_u_17.ChatWindowBackgroundFadeOutTime then
				break
			end
			DoBackgroundFadeOut()
		end
	end
end)
function getClassicChatEnabled() -- name: getClassicChatEnabled
	-- upvalues: (copy) v_u_17, (copy) v_u_38
	if v_u_17.ClassicChatEnabled == nil then
		return v_u_38.ClassicChat
	else
		return v_u_17.ClassicChatEnabled
	end
end
function getBubbleChatEnabled() -- name: getBubbleChatEnabled
	-- upvalues: (copy) v_u_17, (copy) v_u_38
	if v_u_17.BubbleChatEnabled == nil then
		return v_u_38.BubbleChat
	else
		return v_u_17.BubbleChatEnabled
	end
end
function bubbleChatOnly() -- name: bubbleChatOnly
	local v81 = not getClassicChatEnabled()
	if v81 then
		v81 = getBubbleChatEnabled()
	end
	return v81
end
function UpdateMousePosition(p82) -- name: UpdateMousePosition
	-- upvalues: (copy) v_u_1, (copy) v_u_17, (copy) v_u_51, (ref) v_u_79
	if v_u_1.Visible and (v_u_1.IsCoreGuiEnabled and (v_u_1.TopbarEnabled or v_u_17.ChatOnWithTopBarOff)) then
		if not bubbleChatOnly() then
			local v83 = v_u_51.GuiObject.AbsolutePosition
			local v84 = v_u_51.GuiObject.AbsoluteSize
			local v85 = CheckIfPointIsInSquare(p82, v83, v83 + v84)
			if v85 ~= v_u_79 then
				UpdateFadingForMouseState(v85)
			end
		end
	else
		return
	end
end
v_u_36.InputChanged:connect(function(p86, _)
	if p86.UserInputType == Enum.UserInputType.MouseMovement then
		local v87 = Vector2.new(p86.Position.X, p86.Position.Y)
		UpdateMousePosition(v87)
	end
end)
v_u_36.TouchTap:connect(function(p88, _)
	UpdateMousePosition(p88[1])
end)
v_u_36.TouchMoved:connect(function(p89, _)
	local v90 = Vector2.new(p89.Position.X, p89.Position.Y)
	UpdateMousePosition(v90)
end)
v_u_36.Changed:connect(function(p91)
	-- upvalues: (copy) v_u_36, (copy) v_u_51, (copy) v_u_43
	if p91 == "MouseBehavior" and v_u_36.MouseBehavior == Enum.MouseBehavior.LockCenter then
		local v92 = v_u_51.GuiObject.AbsolutePosition
		local v93 = v_u_51.GuiObject.AbsoluteSize
		local v94 = v_u_43.AbsoluteSize
		if CheckIfPointIsInSquare(v94 / 2, v92, v92 + v93) then
			v_u_36.MouseBehavior = Enum.MouseBehavior.Default
		end
	end
end)
UpdateFadingForMouseState(true)
UpdateFadingForMouseState(false)
local v105 = {
	["Signal"] = function() -- name: Signal
		local v95 = {}
		local v_u_96 = Instance.new("BindableEvent")
		local v_u_97 = nil
		local v_u_98 = nil
		function v95.fire(_, ...) -- name: fire
			-- upvalues: (ref) v_u_97, (ref) v_u_98, (copy) v_u_96
			v_u_97 = { ... }
			v_u_98 = select("#", ...)
			v_u_96:Fire()
		end
		function v95.connect(_, p_u_99) -- name: connect
			-- upvalues: (copy) v_u_96, (ref) v_u_97, (ref) v_u_98
			if not p_u_99 then
				error("connect(nil)", 2)
			end
			return v_u_96.Event:connect(function()
				-- upvalues: (copy) p_u_99, (ref) v_u_97, (ref) v_u_98
				local v100 = v_u_97
				local v101 = v_u_98
				p_u_99(unpack(v100, 1, v101))
			end)
		end
		function v95.wait(_) -- name: wait
			-- upvalues: (copy) v_u_96, (ref) v_u_97, (ref) v_u_98
			v_u_96.Event:wait()
			local v102 = v_u_97
			assert(v102, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
			local v103 = v_u_97
			local v104 = v_u_98
			return unpack(v103, 1, v104)
		end
		return v95
	end
}
function SetVisibility(p106) -- name: SetVisibility
	-- upvalues: (copy) v_u_51, (copy) v_u_1
	v_u_51:SetVisible(p106)
	v_u_1.VisibilityStateChanged:fire(p106)
	v_u_1.Visible = p106
	if v_u_1.IsCoreGuiEnabled then
		if p106 then
			InstantFadeIn()
			return
		end
		InstantFadeOut()
	end
end
local v_u_107 = nil
v_u_1.TopbarEnabled = true
v_u_1.MessageCount = 0
v_u_1.Visible = true
v_u_1.IsCoreGuiEnabled = true
function v_u_1.ToggleVisibility(_) -- name: ToggleVisibility
	-- upvalues: (copy) v_u_51
	SetVisibility(not v_u_51:GetVisible())
end
function v_u_1.SetVisible(_, p108) -- name: SetVisible
	-- upvalues: (copy) v_u_51
	if v_u_51:GetVisible() ~= p108 then
		SetVisibility(p108)
	end
end
function v_u_1.FocusChatBar(_) -- name: FocusChatBar
	-- upvalues: (copy) v_u_55
	v_u_55:CaptureFocus()
end
function v_u_1.EnterWhisperState(_, p109) -- name: EnterWhisperState
	-- upvalues: (copy) v_u_55
	v_u_55:EnterWhisperState(p109)
end
function v_u_1.GetVisibility(_) -- name: GetVisibility
	-- upvalues: (copy) v_u_51
	return v_u_51:GetVisible()
end
function v_u_1.GetMessageCount(p110) -- name: GetMessageCount
	return p110.MessageCount
end
function v_u_1.TopbarEnabledChanged(p111, p112) -- name: TopbarEnabledChanged
	p111.TopbarEnabled = p112
	p111.CoreGuiEnabled:fire(game:GetService("StarterGui"):GetCoreGuiEnabled(Enum.CoreGuiType.Chat))
end
function v_u_1.IsFocused(_, _) -- name: IsFocused
	-- upvalues: (copy) v_u_55
	return v_u_55:IsFocused()
end
v_u_1.ChatBarFocusChanged = v105.Signal()
v_u_1.VisibilityStateChanged = v105.Signal()
v_u_1.MessagesChanged = v105.Signal()
v_u_1.MessagePosted = v105.Signal()
v_u_1.CoreGuiEnabled = v105.Signal()
v_u_1.ChatMakeSystemMessageEvent = v105.Signal()
v_u_1.ChatWindowPositionEvent = v105.Signal()
v_u_1.ChatWindowSizeEvent = v105.Signal()
v_u_1.ChatBarDisabledEvent = v105.Signal()
function v_u_1.fChatWindowPosition(_) -- name: fChatWindowPosition
	-- upvalues: (copy) v_u_51
	return v_u_51.GuiObject.Position
end
function v_u_1.fChatWindowSize(_) -- name: fChatWindowSize
	-- upvalues: (copy) v_u_51
	return v_u_51.GuiObject.Size
end
function v_u_1.fChatBarDisabled(_) -- name: fChatBarDisabled
	-- upvalues: (copy) v_u_55
	return not v_u_55:GetEnabled()
end
function v_u_1.SpecialKeyPressed(_, p113, _) -- name: SpecialKeyPressed
	-- upvalues: (ref) v_u_40, (ref) v_u_107
	if p113 == Enum.SpecialKey.ChatHotkey and v_u_40 then
		v_u_107()
	end
end
v_u_1.CoreGuiEnabled:connect(function(p114)
	-- upvalues: (copy) v_u_1, (copy) v_u_17, (copy) v_u_51, (copy) v_u_55
	v_u_1.IsCoreGuiEnabled = p114
	if p114 then
		p114 = v_u_1.TopbarEnabled or v_u_17.ChatOnWithTopBarOff
	end
	v_u_51:SetCoreGuiEnabled(p114)
	if p114 then
		InstantFadeIn()
	else
		v_u_55:ReleaseFocus()
		InstantFadeOut()
	end
end)
function trimTrailingSpaces(p115) -- name: trimTrailingSpaces
	local v116 = #p115
	while v116 > 0 and p115:find("^%s", v116) do
		v116 = v116 - 1
	end
	return p115:sub(1, v116)
end
v_u_1.ChatMakeSystemMessageEvent:connect(function(p117)
	-- upvalues: (ref) v_u_44, (copy) v_u_17, (copy) v_u_51, (copy) v_u_16, (copy) v_u_52, (copy) v_u_1
	if p117.Text then
		local v118 = p117.Text
		if type(v118) == "string" then
			while not v_u_44 do
				wait()
			end
			local v119 = v_u_17.GeneralChannelName
			local v120 = v_u_51:GetChannel(v119)
			if v120 then
				local v121 = {
					["ID"] = -1,
					["FromSpeaker"] = nil,
					["SpeakerUserId"] = 0,
					["OriginalChannel"] = nil,
					["IsFiltered"] = true,
					["MessageLength"] = nil,
					["MessageLengthUtf8"] = nil,
					["Message"] = nil,
					["MessageType"] = nil,
					["Time"] = nil,
					["ExtraData"] = nil,
					["OriginalChannel"] = v119
				}
				local v122 = p117.Text
				v121.MessageLength = string.len(v122)
				v121.MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(p117.Text))
				v121.Message = trimTrailingSpaces(p117.Text)
				v121.MessageType = v_u_16.MessageTypeSetCore
				v121.Time = os.time()
				v121.ExtraData = p117
				v120:AddMessageToChannel(v121)
				v_u_52:UpdateMessagePostedInChannel(v119)
				v_u_1.MessageCount = v_u_1.MessageCount + 1
				v_u_1.MessagesChanged:fire(v_u_1.MessageCount)
			end
		end
	end
end)
v_u_1.ChatBarDisabledEvent:connect(function(p123)
	-- upvalues: (ref) v_u_40, (copy) v_u_55
	if v_u_40 then
		v_u_55:SetEnabled(not p123)
		if p123 then
			v_u_55:ReleaseFocus()
		end
	end
end)
v_u_1.ChatWindowSizeEvent:connect(function(p124)
	-- upvalues: (copy) v_u_51
	v_u_51.GuiObject.Size = p124
end)
v_u_1.ChatWindowPositionEvent:connect(function(p125)
	-- upvalues: (copy) v_u_51
	v_u_51.GuiObject.Position = p125
end)
v_u_107 = function() -- name: DoChatBarFocus
	-- upvalues: (copy) v_u_51, (copy) v_u_55, (copy) v_u_1
	if v_u_51:GetCoreGuiEnabled() then
		if v_u_55:GetEnabled() then
			if not v_u_55:IsFocused() and v_u_55:GetVisible() then
				v_u_1:SetVisible(true)
				InstantFadeIn()
				v_u_55:CaptureFocus()
				v_u_1.ChatBarFocusChanged:fire(true)
			end
		end
	else
		return
	end
end
v_u_72.Event:connect(function(p126)
	-- upvalues: (copy) v_u_1
	v_u_1.ChatBarFocusChanged:fire(p126)
end)
function DoSwitchCurrentChannel(p127) -- name: DoSwitchCurrentChannel
	-- upvalues: (copy) v_u_51
	if v_u_51:GetChannel(p127) then
		v_u_51:SwitchCurrentChannel(p127)
	end
end
function SendMessageToSelfInTargetChannel(p128, p129, p130) -- name: SendMessageToSelfInTargetChannel
	-- upvalues: (copy) v_u_51, (copy) v_u_16
	local v131 = v_u_51:GetChannel(p129)
	if v131 then
		v131:AddMessageToChannel({
			["ID"] = -1,
			["FromSpeaker"] = nil,
			["SpeakerUserId"] = 0,
			["OriginalChannel"] = nil,
			["IsFiltered"] = true,
			["MessageLength"] = nil,
			["MessageLengthUtf8"] = nil,
			["Message"] = nil,
			["MessageType"] = nil,
			["Time"] = nil,
			["ExtraData"] = nil,
			["OriginalChannel"] = p129,
			["MessageLength"] = string.len(p128),
			["MessageLengthUtf8"] = utf8.len(utf8.nfcnormalize(p128)),
			["Message"] = trimTrailingSpaces(p128),
			["MessageType"] = v_u_16.MessageTypeSystem,
			["Time"] = os.time(),
			["ExtraData"] = p130
		})
	end
end
function chatBarFocused() -- name: chatBarFocused
	-- upvalues: (ref) v_u_79, (ref) v_u_67, (copy) v_u_72
	if not v_u_79 then
		DoBackgroundFadeIn()
		if v_u_67 then
			DoTextFadeIn()
		end
	end
	v_u_72:Fire(true)
end
function chatBarFocusLost(p132, _) -- name: chatBarFocusLost
	-- upvalues: (copy) v_u_72, (copy) v_u_55, (copy) v_u_1, (copy) v_u_54, (copy) v_u_51, (copy) v_u_17, (copy) v_u_56
	DoBackgroundFadeIn()
	v_u_72:Fire(false)
	if p132 then
		local v133 = v_u_55:GetTextBox().Text
		if v_u_55:IsInCustomState() then
			v133 = v_u_55:GetCustomMessage() or v133
			local v134 = v_u_55:CustomStateProcessCompletedMessage(v133)
			v_u_55:ResetCustomState()
			if v134 then
				return
			end
		end
		v_u_55:GetTextBox().Text = ""
		if v133 ~= "" then
			v_u_1.MessagePosted:fire(v133)
			if not v_u_54:ProcessCompletedChatMessage(v133, v_u_51) then
				if v_u_17.DisallowedWhiteSpace then
					for v135 = 1, #v_u_17.DisallowedWhiteSpace do
						if v_u_17.DisallowedWhiteSpace[v135] == "\t" then
							v133 = string.gsub(v133, v_u_17.DisallowedWhiteSpace[v135], " ")
						else
							v133 = string.gsub(v133, v_u_17.DisallowedWhiteSpace[v135], "")
						end
					end
				end
				local v136 = string.gsub(v133, "\n", "")
				local v137 = string.gsub(v136, "[ ]+", " ")
				local v138 = v_u_51:GetTargetMessageChannel()
				if v138 then
					v_u_56:SendMessage(v137, v138)
					return
				end
				v_u_56:SendMessage(v137, nil)
			end
		end
	end
end
local v_u_139 = {}
function setupChatBarConnections() -- name: setupChatBarConnections
	-- upvalues: (ref) v_u_139, (copy) v_u_55
	for v140 = 1, #v_u_139 do
		v_u_139[v140]:Disconnect()
	end
	v_u_139 = {}
	local v141 = v_u_55:GetTextBox().FocusLost:connect(chatBarFocusLost)
	local v142 = v_u_139
	table.insert(v142, v141)
	local v143 = v_u_55:GetTextBox().Focused:connect(chatBarFocused)
	local v144 = v_u_139
	table.insert(v144, v143)
end
setupChatBarConnections()
v_u_55.GuiObjectsChanged:connect(setupChatBarConnections)
function getEchoMessagesInGeneral() -- name: getEchoMessagesInGeneral
	-- upvalues: (copy) v_u_17
	return v_u_17.EchoMessagesInGeneralChannel == nil and true or v_u_17.EchoMessagesInGeneralChannel
end
v_u_29.OnMessageDoneFiltering.OnClientEvent:connect(function(p145)
	-- upvalues: (copy) v_u_17, (ref) v_u_39, (copy) v_u_51
	if v_u_17.ShowUserOwnFilteredMessage or p145.FromSpeaker ~= v_u_39.Name then
		local v146 = p145.OriginalChannel
		local v147 = v_u_51:GetChannel(v146)
		if v147 then
			v147:UpdateMessageFiltered(p145)
		end
		local v148 = getEchoMessagesInGeneral() and v_u_17.GeneralChannelName and (v146 ~= v_u_17.GeneralChannelName and v_u_51:GetChannel(v_u_17.GeneralChannelName))
		if v148 then
			v148:UpdateMessageFiltered(p145)
		end
	end
end)
v_u_29.OnNewMessage.OnClientEvent:connect(function(p149, p150)
	-- upvalues: (copy) v_u_51, (ref) v_u_39, (copy) v_u_52, (copy) v_u_17, (copy) v_u_1
	local v151 = v_u_51:GetChannel(p150)
	if v151 then
		v151:AddMessageToChannel(p149)
		if p149.FromSpeaker ~= v_u_39.Name then
			v_u_52:UpdateMessagePostedInChannel(p150)
		end
		local v152 = getEchoMessagesInGeneral() and v_u_17.GeneralChannelName and (p150 ~= v_u_17.GeneralChannelName and v_u_51:GetChannel(v_u_17.GeneralChannelName))
		if v152 then
			v152:AddMessageToChannel(p149)
		end
		v_u_1.MessageCount = v_u_1.MessageCount + 1
		v_u_1.MessagesChanged:fire(v_u_1.MessageCount)
		DoFadeInFromNewInformation()
	end
end)
v_u_29.OnNewSystemMessage.OnClientEvent:connect(function(p153, p154)
	-- upvalues: (copy) v_u_51, (copy) v_u_52, (copy) v_u_1, (copy) v_u_17
	local v155 = p154 or "System"
	local v156 = v_u_51:GetChannel(v155)
	if v156 then
		v156:AddMessageToChannel(p153)
		v_u_52:UpdateMessagePostedInChannel(v155)
		v_u_1.MessageCount = v_u_1.MessageCount + 1
		v_u_1.MessagesChanged:fire(v_u_1.MessageCount)
		DoFadeInFromNewInformation()
		local v157 = getEchoMessagesInGeneral() and v_u_17.GeneralChannelName and (v155 ~= v_u_17.GeneralChannelName and v_u_51:GetChannel(v_u_17.GeneralChannelName))
		if v157 then
			v157:AddMessageToChannel(p153)
			return
		end
	else
		warn(string.format("Just received system message for channel I\'m not in [%s]", v155))
	end
end)
function HandleChannelJoined(p158, p159, p160, p161, p162, p163) -- name: HandleChannelJoined
	-- upvalues: (copy) v_u_51, (copy) v_u_17, (ref) v_u_44, (copy) v_u_55, (copy) v_u_16, (ref) v_u_23, (ref) v_u_6, (ref) v_u_24
	if v_u_51:GetChannel(p158) then
		v_u_51:RemoveChannel(p158)
	end
	if p158 == v_u_17.GeneralChannelName then
		v_u_44 = true
	end
	if p161 then
		v_u_55:SetChannelNameColor(p158, p161)
	end
	local v164 = v_u_51:AddChannel(p158)
	if v164 then
		if p158 == v_u_17.GeneralChannelName then
			DoSwitchCurrentChannel(p158)
		end
		if p160 then
			local v165 = #p160 <= v_u_17.MessageHistoryLengthPerChannel and 1 or #p160 - v_u_17.MessageHistoryLengthPerChannel
			for v166 = v165, #p160 do
				v164:AddMessageToChannel(p160[v166])
			end
			if getEchoMessagesInGeneral() and (p162 and (v_u_17.GeneralChannelName and p158 ~= v_u_17.GeneralChannelName)) then
				local v167 = v_u_51:GetChannel(v_u_17.GeneralChannelName)
				if v167 then
					v167:AddMessagesToChannelByTimeStamp(p160, v165)
				end
			end
		end
		if p159 ~= "" then
			local v168 = {
				["ID"] = -1,
				["FromSpeaker"] = nil,
				["SpeakerUserId"] = 0,
				["OriginalChannel"] = nil,
				["IsFiltered"] = true,
				["MessageLength"] = nil,
				["MessageLengthUtf8"] = nil,
				["Message"] = nil,
				["MessageType"] = nil,
				["Time"] = nil,
				["ExtraData"] = nil,
				["OriginalChannel"] = p158,
				["MessageLength"] = string.len(p159),
				["MessageLengthUtf8"] = utf8.len(utf8.nfcnormalize(p159)),
				["Message"] = trimTrailingSpaces(p159),
				["MessageType"] = v_u_16.MessageTypeWelcome,
				["Time"] = os.time()
			}
			v164:AddMessageToChannel(v168)
			local v169 = getEchoMessagesInGeneral() and (p163 and (not v_u_17.ShowChannelsBar and p158 ~= v_u_17.GeneralChannelName)) and v_u_51:GetChannel(v_u_17.GeneralChannelName)
			if v169 then
				v169:AddMessageToChannel(v168)
			end
		end
		local v170 = v_u_23:Get("GameChat_ChatMain_ChatTranslationOnboarding", "Text chat will be translated into your language. Tap the symbol in front of the message to see the original. You can turn off translations in the Settings menu.")
		if v_u_6 and (v170 ~= "" and (p158 == v_u_17.GeneralChannelName and (v_u_24 ~= nil and v_u_24.Value))) then
			v164:AddMessageToChannel({
				["ID"] = -2,
				["FromSpeaker"] = nil,
				["SpeakerUserId"] = 0,
				["OriginalChannel"] = nil,
				["IsFiltered"] = true,
				["MessageLength"] = nil,
				["MessageLengthUtf8"] = nil,
				["Message"] = nil,
				["MessageType"] = nil,
				["Time"] = nil,
				["ExtraData"] = nil,
				["OriginalChannel"] = p158,
				["MessageLength"] = string.len(v170),
				["MessageLengthUtf8"] = utf8.len(utf8.nfcnormalize(v170)),
				["Message"] = trimTrailingSpaces(v170),
				["MessageType"] = v_u_16.MessageTypeWelcome,
				["Time"] = os.time()
			})
		end
		DoFadeInFromNewInformation()
	end
end
v_u_29.OnChannelJoined.OnClientEvent:connect(function(p171, p172, p173, p174)
	HandleChannelJoined(p171, p172, p173, p174, false, true)
end)
v_u_29.OnChannelLeft.OnClientEvent:connect(function(p175)
	-- upvalues: (copy) v_u_51
	v_u_51:RemoveChannel(p175)
	DoFadeInFromNewInformation()
end)
v_u_29.OnMuted.OnClientEvent:connect(function(_) end)
v_u_29.OnUnmuted.OnClientEvent:connect(function(_) end)
v_u_29.OnMainChannelSet.OnClientEvent:connect(function(p176)
	DoSwitchCurrentChannel(p176)
end)
coroutine.wrap(function()
	-- upvalues: (copy) v_u_13, (copy) v_u_55
	local v177 = v_u_13:WaitForChild("ChannelNameColorUpdated", 5)
	if v177 then
		v177.OnClientEvent:connect(function(p178, p179)
			-- upvalues: (ref) v_u_55
			v_u_55:SetChannelNameColor(p178, p179)
		end)
	end
end)()
local v_u_180 = nil
local v_u_181 = nil
local v_u_182 = nil
local v_u_183 = nil
local function v184()
	-- upvalues: (ref) v_u_180, (copy) v_u_12, (ref) v_u_181, (ref) v_u_182, (ref) v_u_183
	v_u_180 = v_u_12:GetCore("PlayerBlockedEvent")
	v_u_181 = v_u_12:GetCore("PlayerMutedEvent")
	v_u_182 = v_u_12:GetCore("PlayerUnblockedEvent")
	v_u_183 = v_u_12:GetCore("PlayerUnmutedEvent")
end
pcall(v184)
function SendSystemMessageToSelf(p185) -- name: SendSystemMessageToSelf
	-- upvalues: (copy) v_u_51, (copy) v_u_16
	local v186 = v_u_51:GetCurrentChannel()
	if v186 then
		v186:AddMessageToChannel({
			["ID"] = -1,
			["FromSpeaker"] = nil,
			["SpeakerUserId"] = 0,
			["OriginalChannel"] = nil,
			["IsFiltered"] = true,
			["MessageLength"] = nil,
			["MessageLengthUtf8"] = nil,
			["Message"] = nil,
			["MessageType"] = nil,
			["Time"] = nil,
			["ExtraData"] = nil,
			["OriginalChannel"] = v186.Name,
			["MessageLength"] = string.len(p185),
			["MessageLengthUtf8"] = utf8.len(utf8.nfcnormalize(p185)),
			["Message"] = trimTrailingSpaces(p185),
			["MessageType"] = v_u_16.MessageTypeSystem,
			["Time"] = os.time()
		})
	end
end
function MutePlayer(p187) -- name: MutePlayer
	-- upvalues: (copy) v_u_13
	local v188 = v_u_13:FindFirstChild("MutePlayerRequest")
	if v188 then
		return v188:InvokeServer(p187.Name)
	else
		return false
	end
end
if v_u_180 then
	v_u_180.Event:connect(function(p189)
		-- upvalues: (copy) v_u_17, (ref) v_u_23
		if MutePlayer(p189) then
			local v190
			if v_u_17.PlayerDisplayNamesEnabled then
				v190 = p189.DisplayName
			else
				v190 = p189.Name
			end
			SendSystemMessageToSelf(v_u_23:Get("GameChat_ChatMain_SpeakerHasBeenBlocked", string.format("Speaker \'%s\' has been blocked.", v190), {
				["RBX_NAME"] = v190
			}))
		end
	end)
end
if v3 then
	local v191
	if v_u_17.ShowFriendJoinNotification == nil then
		v191 = false
	else
		v191 = v_u_17.ShowFriendJoinNotification
	end
	if v191 then
		v_u_38.PlayerAdded:Connect(function(p_u_192)
			-- upvalues: (ref) v_u_39, (copy) v_u_17, (ref) v_u_23
			local function v193()
				-- upvalues: (copy) p_u_192, (ref) v_u_39
				return p_u_192:IsFriendsWith(v_u_39.UserId)
			end
			local v194, v195 = pcall(v193)
			if v194 and v195 then
				local v196 = p_u_192.Name
				if v_u_17.PlayerDisplayNamesEnabled then
					v196 = p_u_192.DisplayName
				end
				local v197 = v_u_23:FormatMessageToSend("GameChat_FriendChatNotifier_JoinMessage", string.format("Your friend %s has joined the game.", v196), "RBX_NAME", v196)
				SendSystemMessageToSelf(v197)
			end
		end)
	end
end
if v_u_181 then
	v_u_181.Event:connect(function(p198)
		-- upvalues: (copy) v_u_17, (ref) v_u_23
		if MutePlayer(p198) then
			local v199
			if v_u_17.PlayerDisplayNamesEnabled then
				v199 = p198.DisplayName
			else
				v199 = p198.Name
			end
			SendSystemMessageToSelf(v_u_23:Get("GameChat_ChatMain_SpeakerHasBeenMuted", string.format("Speaker \'%s\' has been muted.", v199), {
				["RBX_NAME"] = v199
			}))
		end
	end)
end
function UnmutePlayer(p200) -- name: UnmutePlayer
	-- upvalues: (copy) v_u_13
	local v201 = v_u_13:FindFirstChild("UnMutePlayerRequest")
	if v201 then
		return v201:InvokeServer(p200.Name)
	else
		return false
	end
end
if v_u_182 then
	v_u_182.Event:connect(function(p202)
		-- upvalues: (copy) v_u_17, (ref) v_u_23
		if UnmutePlayer(p202) then
			local v203
			if v_u_17.PlayerDisplayNamesEnabled then
				v203 = p202.DisplayName
			else
				v203 = p202.Name
			end
			SendSystemMessageToSelf(v_u_23:Get("GameChat_ChatMain_SpeakerHasBeenUnBlocked", string.format("Speaker \'%s\' has been unblocked.", v203), {
				["RBX_NAME"] = v203
			}))
		end
	end)
end
if v_u_183 then
	v_u_183.Event:connect(function(p204)
		-- upvalues: (copy) v_u_17, (ref) v_u_23
		if UnmutePlayer(p204) then
			local v205
			if v_u_17.PlayerDisplayNamesEnabled then
				v205 = p204.DisplayName
			else
				v205 = p204.Name
			end
			SendSystemMessageToSelf(v_u_23:Get("GameChat_ChatMain_SpeakerHasBeenUnMuted", string.format("Speaker \'%s\' has been unmuted.", v205), {
				["RBX_NAME"] = v205
			}))
		end
	end)
end
spawn(function()
	-- upvalues: (ref) v_u_39, (copy) v_u_12, (copy) v_u_13
	if v_u_39.UserId > 0 then
		local function v208()
			-- upvalues: (ref) v_u_12, (ref) v_u_13
			local v206 = v_u_12:GetCore("GetBlockedUserIds")
			local v207 = #v206 > 0 and v_u_13:FindFirstChild("SetBlockedUserIdsRequest")
			if v207 then
				v207:FireServer(v206)
			end
		end
		pcall(v208)
	end
end)
spawn(function()
	-- upvalues: (copy) v_u_11, (ref) v_u_39, (ref) v_u_40, (copy) v_u_37
	local function v209()
		-- upvalues: (ref) v_u_11, (ref) v_u_39
		return v_u_11:CanUserChatAsync(v_u_39.UserId)
	end
	local v210, v211 = pcall(v209)
	if v210 then
		v_u_40 = v_u_37:IsStudio() or v211
	end
end)
local v212 = v_u_29.GetInitDataRequest:InvokeServer()
for _, v213 in pairs(v212.Channels) do
	if v213[1] ~= v_u_17.GeneralChannelName then
		continue
	end
	HandleChannelJoined(v213[1], v213[2], v213[3], v213[4], true, false)
end
for _, v214 in pairs(v212.Channels) do
	if v214[1] == v_u_17.GeneralChannelName then
		continue
	end
	HandleChannelJoined(v214[1], v214[2], v214[3], v214[4], true, false)
end
return v_u_1