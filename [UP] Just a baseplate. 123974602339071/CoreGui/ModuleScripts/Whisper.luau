-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.DefaultClientChatModules.CommandModules.Whisper
local v1 = require(script.Parent:WaitForChild("Util"))
local v_u_2 = require(script.Parent.Parent:WaitForChild("ChatSettings"))
local v_u_3 = game:GetService("Players")
local v_u_4 = nil
local function v5()
	-- upvalues: (ref) v_u_4
	v_u_4 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end
pcall(v5)
local v_u_6 = v_u_3.LocalPlayer
local v_u_7 = v_u_4
while v_u_6 == nil do
	v_u_3.ChildAdded:wait()
	v_u_6 = v_u_3.LocalPlayer
end
local v_u_8 = {}
v_u_8.__index = v_u_8
local v_u_9 = {}
function v_u_8.TrimWhisperCommand(_, p10) -- name: TrimWhisperCommand
	if string.sub(p10, 1, 3):lower() == "/w " then
		return string.sub(p10, 4)
	elseif string.sub(p10, 1, 9):lower() == "/whisper " then
		return string.sub(p10, 10)
	else
		return nil
	end
end
function v_u_8.TrimWhiteSpace(_, p11) -- name: TrimWhiteSpace
	return string.gsub(p11, "%s+", ""), p11[#p11] == " "
end
function v_u_8.ShouldAutoCompleteNames(_) -- name: ShouldAutoCompleteNames
	-- upvalues: (copy) v_u_2
	return v_u_2.WhisperCommandAutoCompletePlayerNames == nil and true or v_u_2.WhisperCommandAutoCompletePlayerNames
end
function v_u_8.GetWhisperingPlayer(p12, p13) -- name: GetWhisperingPlayer
	-- upvalues: (copy) v_u_3, (ref) v_u_6, (copy) v_u_2
	local v14 = p12:TrimWhisperCommand((p13:lower()))
	if v14 then
		local v15, v16 = p12:TrimWhiteSpace(v14)
		local v17 = v_u_3:GetPlayers()
		local v18 = {}
		local v19 = {}
		for v20 = 1, #v17 do
			if v17[v20] == v_u_6 then
				continue
			end
			local v21 = v17[v20].Name:lower()
			local v22 = string.len(v15)
			if string.sub(v21, 1, v22) == v15 then
				v18[v17[v20]] = v17[v20].Name:lower()
			end
			if not v_u_2.WhisperByDisplayName then
				continue
			end
			local v23 = v17[v20].DisplayName:lower()
			local v24 = string.len(v15)
			if string.sub(v23, 1, v24) ~= v15 then
				continue
			end
			v19[v17[v20]] = v23
		end
		local v25 = 0
		local v26 = nil
		local v27 = nil
		for v28, v29 in pairs(v18) do
			v25 = v25 + 1
			if v29 == v15 and v16 then
				return v28
			end
			v27 = v29
			v26 = v28
		end
		if v_u_2.WhisperByDisplayName then
			for v30, v31 in pairs(v19) do
				if v26 == v30 then
					continue
				end
				v25 = v25 + 1
				v27 = v31
				v26 = v30
			end
		end
		if v25 == 1 then
			if p12:ShouldAutoCompleteNames() then
				return v26
			end
			if v27 == v15 then
				return v26
			end
		end
	end
	return nil
end
function v_u_8.GetWhisperChanneNameColor(p32) -- name: GetWhisperChanneNameColor
	if p32.ChatSettings.WhisperChannelNameColor then
		return p32.ChatSettings.WhisperChannelNameColor
	else
		return Color3.fromRGB(102, 14, 102)
	end
end
function v_u_8.EnterWhisperState(p33, p34) -- name: EnterWhisperState
	-- upvalues: (copy) v_u_2, (ref) v_u_7
	p33.PlayerNameEntered = true
	p33.PlayerName = p34.Name
	p33.PlayerDisplayName = p34.DisplayName
	p33.MessageModeButton.Size = UDim2.new(0, 1000, 1, 0)
	local v35
	if v_u_2.PlayerDisplayNamesEnabled and v_u_2.WhisperByDisplayName then
		v35 = string.format("[To %s]", p34.DisplayName)
	else
		v35 = string.format("[To %s]", p34.Name)
	end
	if v_u_7.tryLocalize then
		v35 = v_u_7:tryLocalize(v35)
	end
	p33.MessageModeButton.Text = v35
	p33.MessageModeButton.TextColor3 = p33:GetWhisperChanneNameColor()
	local v36 = p33.MessageModeButton.TextBounds.X
	local v37 = math.ceil(v36)
	p33.MessageModeButton.Size = UDim2.new(0, v37, 1, 0)
	p33.TextBox.Size = UDim2.new(1, -v37, 1, 0)
	p33.TextBox.Position = UDim2.new(0, v37, 0, 0)
	p33.TextBox.Text = " "
end
function v_u_8.TextUpdated(p38) -- name: TextUpdated
	local v39 = p38.TextBox.Text
	if p38.PlayerNameEntered then
		if v39 == "" then
			p38.MessageModeButton.Text = ""
			p38.MessageModeButton.Size = UDim2.new(0, 0, 0, 0)
			p38.TextBox.Size = UDim2.new(1, 0, 1, 0)
			p38.TextBox.Position = UDim2.new(0, 0, 0, 0)
			p38.TextBox.Text = ""
			p38.PlayerNameEntered = false
			p38.ChatBar:ResetCustomState()
			p38.ChatBar:CaptureFocus()
		end
	else
		local v40 = p38:GetWhisperingPlayer(v39)
		if v40 then
			p38:EnterWhisperState(v40)
			return
		end
	end
end
function v_u_8.GetMessage(p41) -- name: GetMessage
	if p41.PlayerNameEntered then
		return "/w " .. p41.PlayerName .. " " .. p41.TextBox.Text
	else
		return p41.TextBox.Text
	end
end
function v_u_8.ProcessCompletedMessage(_) -- name: ProcessCompletedMessage
	return false
end
function v_u_8.Destroy(p42) -- name: Destroy
	p42.MessageModeConnection:disconnect()
	p42.Destroyed = true
end
function v_u_9.new(p43, p44, p45, p46) -- name: new
	-- upvalues: (copy) v_u_8
	local v47 = v_u_8
	local v_u_48 = setmetatable({}, v47)
	v_u_48.Destroyed = false
	v_u_48.ChatWindow = p43
	v_u_48.ChatBar = p44
	v_u_48.ChatSettings = p45
	v_u_48.TextBox = p44:GetTextBox()
	v_u_48.MessageModeButton = p44:GetMessageModeTextButton()
	v_u_48.OriginalWhisperText = ""
	v_u_48.PlayerNameEntered = false
	v_u_48.MessageModeConnection = v_u_48.MessageModeButton.MouseButton1Click:connect(function()
		-- upvalues: (copy) v_u_48
		local v49 = v_u_48.TextBox.Text
		if string.sub(v49, 1, 1) == " " then
			v49 = string.sub(v49, 2)
		end
		v_u_48.ChatBar:ResetCustomState()
		v_u_48.ChatBar:SetTextBoxText(v49)
		v_u_48.ChatBar:CaptureFocus()
	end)
	if p46 then
		v_u_48:EnterWhisperState(p46)
		return v_u_48
	else
		v_u_48:TextUpdated()
		return v_u_48
	end
end
function ProcessMessage(p50, p51, p52, p53) -- name: ProcessMessage
	-- upvalues: (copy) v_u_9
	if string.sub(p50, 1, 3):lower() == "/w " or string.sub(p50, 1, 9):lower() == "/whisper " then
		return v_u_9.new(p51, p52, p53)
	else
		return nil
	end
end
function CreateCustomState(p54, p55, p56, p57) -- name: CreateCustomState
	-- upvalues: (copy) v_u_9
	return v_u_9.new(p55, p56, p57, p54)
end
return {
	[v1.KEY_COMMAND_PROCESSOR_TYPE] = v1.IN_PROGRESS_MESSAGE_PROCESSOR,
	[v1.KEY_PROCESSOR_FUNCTION] = ProcessMessage,
	["CustomStateCreator"] = CreateCustomState
}