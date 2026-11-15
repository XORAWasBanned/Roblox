-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.ChatChannel
local v1, v2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFlagRemoveMessageFromMessageLog")
end)
local v_u_3 = v1 and v2
local v4, v5 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
local v_u_6 = v4 and v5
local v7 = {}
local v8 = game:GetService("Chat"):WaitForChild("ClientChatModules")
local v9 = script.Parent
local v_u_10 = require(v8:WaitForChild("ChatSettings"))
local v_u_11
if v_u_6 then
	v_u_11 = v9:FindFirstChild("ChatTranslationEnabled")
	if v_u_11 == nil then
		local v_u_12 = nil
		v_u_12 = v9.ChildAdded:Connect(function(p13)
			-- upvalues: (ref) v_u_11, (ref) v_u_12
			if p13.Name == "ChatTranslationEnabled" then
				v_u_11 = p13
				v_u_12:Disconnect()
			end
		end)
	end
else
	v_u_11 = nil
end
local v_u_14 = {}
v_u_14.__index = v_u_14
function v_u_14.Destroy(p15) -- name: Destroy
	p15.Destroyed = true
end
function v_u_14.SetActive(p16, p17) -- name: SetActive
	if p17 ~= p16.Active then
		if p17 == false then
			p16.MessageLogDisplay:Clear()
		else
			p16.MessageLogDisplay:SetCurrentChannelName(p16.Name)
			for v18 = 1, #p16.MessageLog do
				p16.MessageLogDisplay:AddMessage(p16.MessageLog[v18])
			end
		end
		p16.Active = p17
	end
end
function v_u_14.UpdateMessageFiltered(p19, p20) -- name: UpdateMessageFiltered
	-- upvalues: (ref) v_u_6, (ref) v_u_11, (ref) v_u_3
	local v21 = p19.MessageLog
	local v22 = 1
	local v23 = nil
	while true do
		if v22 > #v21 then
			v24 = v23
			break
		end
		local v24 = v21[v22]
		if v24.ID == p20.ID then
			break
		end
		v22 = v22 + 1
	end
	if v24 then
		v24.Message = p20.Message
		v24.IsFiltered = true
		if v_u_6 and (v_u_11 ~= nil and v_u_11.Value) then
			v24.TranslatedMessage = p20.TranslatedMessage
			v24.ShowTranslated = true
		end
		if p19.Active then
			if v_u_3 and v24.Message == "" then
				table.remove(p19.MessageLog, v22)
			end
			p19.MessageLogDisplay:UpdateMessageFiltered(v24)
			return
		end
	else
		p19:AddMessageToChannelByTimeStamp(p20)
	end
end
function v_u_14.AddMessageToChannel(p25, p26) -- name: AddMessageToChannel
	-- upvalues: (copy) v_u_10
	local v27 = p25.MessageLog
	table.insert(v27, p26)
	if p25.Active then
		p25.MessageLogDisplay:AddMessage(p26)
	end
	if #p25.MessageLog > v_u_10.MessageHistoryLengthPerChannel then
		p25:RemoveLastMessageFromChannel()
	end
end
function v_u_14.InternalAddMessageAtTimeStamp(p28, p29) -- name: InternalAddMessageAtTimeStamp
	for v30 = 1, #p28.MessageLog do
		if p29.Time >= p28.MessageLog[v30].Time then
			continue
		end
		local v31 = p28.MessageLog
		table.insert(v31, v30, p29)
		return
	end
	local v32 = p28.MessageLog
	table.insert(v32, p29)
end
function v_u_14.AddMessagesToChannelByTimeStamp(p33, p34, p35) -- name: AddMessagesToChannelByTimeStamp
	-- upvalues: (copy) v_u_10
	for v36 = p35, #p34 do
		p33:InternalAddMessageAtTimeStamp(p34[v36])
	end
	while #p33.MessageLog > v_u_10.MessageHistoryLengthPerChannel do
		table.remove(p33.MessageLog, 1)
	end
	if p33.Active then
		p33.MessageLogDisplay:Clear()
		for v37 = 1, #p33.MessageLog do
			p33.MessageLogDisplay:AddMessage(p33.MessageLog[v37])
		end
	end
end
function v_u_14.AddMessageToChannelByTimeStamp(p38, p39) -- name: AddMessageToChannelByTimeStamp
	-- upvalues: (copy) v_u_10
	if #p38.MessageLog >= 1 then
		if p38.MessageLog[1].Time > p39.Time then
			return
		elseif p39.Time >= p38.MessageLog[#p38.MessageLog].Time then
			p38:AddMessageToChannel(p39)
		else
			for v40 = 1, #p38.MessageLog do
				if p39.Time >= p38.MessageLog[v40].Time then
					continue
				end
				local v41 = p38.MessageLog
				table.insert(v41, v40, p39)
				if #p38.MessageLog > v_u_10.MessageHistoryLengthPerChannel then
					p38:RemoveLastMessageFromChannel()
				end
				if p38.Active then
					p38.MessageLogDisplay:AddMessageAtIndex(p39, v40)
				end
				return
			end
		end
	else
		p38:AddMessageToChannel(p39)
		return
	end
end
function v_u_14.RemoveLastMessageFromChannel(p42) -- name: RemoveLastMessageFromChannel
	table.remove(p42.MessageLog, 1)
	if p42.Active then
		p42.MessageLogDisplay:RemoveLastMessage()
	end
end
function v_u_14.ClearMessageLog(p43) -- name: ClearMessageLog
	p43.MessageLog = {}
	if p43.Active then
		p43.MessageLogDisplay:Clear()
	end
end
function v_u_14.RegisterChannelTab(p44, p45) -- name: RegisterChannelTab
	p44.ChannelTab = p45
end
function v7.new(p46, p47) -- name: new
	-- upvalues: (copy) v_u_14
	local v48 = v_u_14
	local v49 = setmetatable({}, v48)
	v49.Destroyed = false
	v49.Active = false
	v49.MessageLog = {}
	v49.MessageLogDisplay = p47
	v49.ChannelTab = nil
	v49.Name = p46
	return v49
end
return v7