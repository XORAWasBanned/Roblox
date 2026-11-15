-- Path: CoreGui.RobloxGui.Modules.Server.ServerChat.ChatServiceRunner
local v1 = game:GetService("ReplicatedStorage")
local v2 = script
local v_u_3 = game:GetService("Players")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("Chat")
local v_u_6 = require(v2:WaitForChild("ChatService"))
local v7 = v_u_5:WaitForChild("ClientChatModules")
local v8 = require(v7:WaitForChild("ChatSettings"))
local v_u_9 = nil
local function v10()
	-- upvalues: (ref) v_u_9, (copy) v_u_5
	v_u_9 = require(v_u_5.ClientChatModules.ChatLocalization)
end
pcall(v10)
v_u_9 = v_u_9 or {}
local v_u_11 = v8.MaxChannelNameCheckLength or 50
local v_u_12 = v8.MaximumMessageLength
if not (v_u_9.FormatMessageToSend and v_u_9.LocalizeFormattedMessage) then
	function v_u_9.FormatMessageToSend(_, _, p13) -- name: FormatMessageToSend
		return p13
	end
end
local v14 = {}
local v15 = v1:FindFirstChild("DefaultChatSystemChatEvents")
if not v15 then
	v15 = Instance.new("Folder")
	v15.Name = "DefaultChatSystemChatEvents"
	v15.Archivable = false
	v15.Parent = v1
end
local function v_u_17(p16) -- name: validateMessageLength
	-- upvalues: (copy) v_u_12
	if p16:len() > v_u_12 * 6 then
		return false
	elseif utf8.len(p16) == nil then
		return false
	else
		return v_u_12 >= utf8.len(utf8.nfcnormalize(p16))
	end
end
local function v_u_19(p18) -- name: validateChannelNameLength
	-- upvalues: (copy) v_u_11
	if p18:len() > v_u_11 * 6 then
		return false
	elseif utf8.len(p18) == nil then
		return false
	else
		return v_u_11 >= utf8.len(utf8.nfcnormalize(p18))
	end
end
local function v20() -- name: emptyFunction end
local function v25(p21, p22, p23) -- name: GetObjectWithNameAndType
	for _, v24 in pairs(p21:GetChildren()) do
		if not v24:IsA(p23) or v24.Name ~= p22 then
			continue
		end
		return v24
	end
	return nil
end
local v26 = v25(v15, "OnNewMessage", "RemoteEvent")
if not v26 then
	v26 = Instance.new("RemoteEvent")
	v26.Name = "OnNewMessage"
	v26.Parent = v15
end
v14.OnNewMessage = v26
v26.OnServerEvent:Connect(v20)
local v27 = v25(v15, "OnMessageDoneFiltering", "RemoteEvent")
if not v27 then
	v27 = Instance.new("RemoteEvent")
	v27.Name = "OnMessageDoneFiltering"
	v27.Parent = v15
end
v14.OnMessageDoneFiltering = v27
v27.OnServerEvent:Connect(v20)
local v28 = v25(v15, "OnNewSystemMessage", "RemoteEvent")
if not v28 then
	v28 = Instance.new("RemoteEvent")
	v28.Name = "OnNewSystemMessage"
	v28.Parent = v15
end
v14.OnNewSystemMessage = v28
v28.OnServerEvent:Connect(v20)
local v29 = v25(v15, "OnChannelJoined", "RemoteEvent")
if not v29 then
	v29 = Instance.new("RemoteEvent")
	v29.Name = "OnChannelJoined"
	v29.Parent = v15
end
v14.OnChannelJoined = v29
v29.OnServerEvent:Connect(v20)
local v30 = v25(v15, "OnChannelLeft", "RemoteEvent")
if not v30 then
	v30 = Instance.new("RemoteEvent")
	v30.Name = "OnChannelLeft"
	v30.Parent = v15
end
v14.OnChannelLeft = v30
v30.OnServerEvent:Connect(v20)
local v31 = v25(v15, "OnMuted", "RemoteEvent")
if not v31 then
	v31 = Instance.new("RemoteEvent")
	v31.Name = "OnMuted"
	v31.Parent = v15
end
v14.OnMuted = v31
v31.OnServerEvent:Connect(v20)
local v32 = v25(v15, "OnUnmuted", "RemoteEvent")
if not v32 then
	v32 = Instance.new("RemoteEvent")
	v32.Name = "OnUnmuted"
	v32.Parent = v15
end
v14.OnUnmuted = v32
v32.OnServerEvent:Connect(v20)
local v33 = v25(v15, "OnMainChannelSet", "RemoteEvent")
if not v33 then
	v33 = Instance.new("RemoteEvent")
	v33.Name = "OnMainChannelSet"
	v33.Parent = v15
end
v14.OnMainChannelSet = v33
v33.OnServerEvent:Connect(v20)
local v34 = v25(v15, "ChannelNameColorUpdated", "RemoteEvent")
if not v34 then
	v34 = Instance.new("RemoteEvent")
	v34.Name = "ChannelNameColorUpdated"
	v34.Parent = v15
end
v14.ChannelNameColorUpdated = v34
v34.OnServerEvent:Connect(v20)
local v35 = v25(v15, "SayMessageRequest", "RemoteEvent")
if not v35 then
	v35 = Instance.new("RemoteEvent")
	v35.Name = "SayMessageRequest"
	v35.Parent = v15
end
v14.SayMessageRequest = v35
v35.OnServerEvent:Connect(v20)
local v36 = v25(v15, "SetBlockedUserIdsRequest", "RemoteEvent")
if not v36 then
	v36 = Instance.new("RemoteEvent")
	v36.Name = "SetBlockedUserIdsRequest"
	v36.Parent = v15
end
v14.SetBlockedUserIdsRequest = v36
v36.OnServerEvent:Connect(v20)
local v37 = v25(v15, "GetInitDataRequest", "RemoteFunction")
if not v37 then
	v37 = Instance.new("RemoteFunction")
	v37.Name = "GetInitDataRequest"
	v37.Parent = v15
end
v14.GetInitDataRequest = v37
local v38 = v25(v15, "MutePlayerRequest", "RemoteFunction")
if not v38 then
	v38 = Instance.new("RemoteFunction")
	v38.Name = "MutePlayerRequest"
	v38.Parent = v15
end
v14.MutePlayerRequest = v38
local v39 = v25(v15, "UnMutePlayerRequest", "RemoteFunction")
if not v39 then
	v39 = Instance.new("RemoteFunction")
	v39.Name = "UnMutePlayerRequest"
	v39.Parent = v15
end
v14.UnMutePlayerRequest = v39
local v_u_40 = v14
local function v_u_53(p_u_41) -- name: CreatePlayerSpeakerObject
	-- upvalues: (copy) v_u_6, (ref) v_u_40
	if v_u_6:GetSpeaker(p_u_41.Name) then
		v_u_6:RemoveSpeaker(p_u_41.Name)
	end
	local v_u_42 = v_u_6:InternalAddSpeakerWithPlayerObject(p_u_41.Name, p_u_41, false)
	for _, v43 in pairs(v_u_6:GetAutoJoinChannelList()) do
		v_u_42:JoinChannel(v43.Name)
	end
	v_u_42:InternalAssignEventFolder(v_u_40)
	v_u_42.ChannelJoined:connect(function(p44, p45)
		-- upvalues: (ref) v_u_6, (ref) v_u_42, (ref) v_u_40, (copy) p_u_41
		local v46 = v_u_6:GetChannel(p44)
		local v47, v48
		if v46 then
			v47 = v46:GetHistoryLogForSpeaker(v_u_42)
			v48 = v46.ChannelNameColor
		else
			v47 = nil
			v48 = nil
		end
		v_u_40.OnChannelJoined:FireClient(p_u_41, p44, p45, v47, v48)
	end)
	v_u_42.Muted:connect(function(p49, p50, p51)
		-- upvalues: (ref) v_u_40, (copy) p_u_41
		v_u_40.OnMuted:FireClient(p_u_41, p49, p50, p51)
	end)
	v_u_42.Unmuted:connect(function(p52)
		-- upvalues: (ref) v_u_40, (copy) p_u_41
		v_u_40.OnUnmuted:FireClient(p_u_41, p52)
	end)
	v_u_6:InternalFireSpeakerAdded(v_u_42.Name)
end
v_u_40.SayMessageRequest.OnServerEvent:connect(function(p54, p55, p56)
	-- upvalues: (copy) v_u_17, (copy) v_u_19, (copy) v_u_6
	if type(p55) == "string" then
		if v_u_17(p55) then
			if type(p56) == "string" then
				if v_u_19(p56) then
					local v57 = v_u_6:GetSpeaker(p54.Name)
					if v57 then
						return v57:SayMessage(p55, p56)
					else
						return nil
					end
				else
					return
				end
			else
				return
			end
		else
			return
		end
	else
		return
	end
end)
function v_u_40.MutePlayerRequest.OnServerInvoke(p58, p59)
	-- upvalues: (copy) v_u_6
	if type(p59) == "string" then
		local v60 = v_u_6:GetSpeaker(p58.Name)
		local v61 = v60 and v_u_6:GetSpeaker(p59)
		if not v61 then
			return false
		end
		v60:AddMutedSpeaker(v61.Name)
		return true
	end
end
function v_u_40.UnMutePlayerRequest.OnServerInvoke(p62, p63)
	-- upvalues: (copy) v_u_6
	if type(p63) == "string" then
		local v64 = v_u_6:GetSpeaker(p62.Name)
		local v65 = v64 and v_u_6:GetSpeaker(p63)
		if not v65 then
			return false
		end
		v64:RemoveMutedSpeaker(v65.Name)
		return true
	end
end
local v_u_66 = {}
v_u_3.PlayerAdded:connect(function(p67)
	-- upvalues: (copy) v_u_66, (copy) v_u_6
	for v68, v69 in pairs(v_u_66) do
		local v70 = v_u_6:GetSpeaker(v68.Name)
		if not v70 then
			continue
		end
		for v71 = 1, #v69 do
			if v69[v71] ~= p67.UserId then
				continue
			end
			v70:AddMutedSpeaker(p67.Name)
		end
	end
end)
v_u_3.PlayerRemoving:connect(function(p72)
	-- upvalues: (copy) v_u_66
	v_u_66[p72] = nil
end)
v_u_40.SetBlockedUserIdsRequest.OnServerEvent:Connect(function(p73, p74)
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_66
	if type(p74) == "table" then
		local v75 = {}
		local v76 = v_u_6:GetSpeaker(p73.Name)
		if v76 then
			local v77 = #p74
			for v78 = 1, math.min(v77, 50) do
				local v79 = p74[v78]
				if type(v79) ~= "number" then
					continue
				end
				local v80 = p74[v78]
				table.insert(v75, v80)
				local v81 = v_u_3:GetPlayerByUserId(p74[v78])
				if not v81 then
					continue
				end
				v76:AddMutedSpeaker(v81.Name)
			end
			v_u_66[p73] = v75
		end
	end
end)
function v_u_40.GetInitDataRequest.OnServerInvoke(p82)
	-- upvalues: (copy) v_u_6, (copy) v_u_53
	local v83 = v_u_6:GetSpeaker(p82.Name)
	if not (v83 and v83:GetPlayer()) then
		v_u_53(p82)
		v83 = v_u_6:GetSpeaker(p82.Name)
	end
	local v84 = {
		["Channels"] = {},
		["SpeakerExtraData"] = {}
	}
	for _, v85 in pairs(v83:GetChannelList()) do
		local v86 = v_u_6:GetChannel(v85)
		if not v86 then
			continue
		end
		local v87 = {
			v85,
			v86:GetWelcomeMessageForSpeaker(v83),
			v86:GetHistoryLogForSpeaker(v83),
			v86.ChannelNameColor
		}
		local v88 = v84.Channels
		table.insert(v88, v87)
	end
	for _, v89 in pairs(v_u_6:GetSpeakerList()) do
		local v90 = v_u_6:GetSpeaker(v89)
		v84.SpeakerExtraData[v89] = v90.ExtraData
	end
	return v84
end
local function v_u_96(p91, p92, p93) -- name: DoJoinCommand
	-- upvalues: (copy) v_u_6, (ref) v_u_9
	local v94 = v_u_6:GetSpeaker(p91)
	local v95 = v_u_6:GetChannel(p92)
	if v94 then
		if v95 then
			if v95.Joinable then
				if v94:IsInChannel(v95.Name) then
					v94:SetMainChannel(v95.Name)
					v94:SendSystemMessage(v_u_9:FormatMessageToSend("GameChat_SwitchChannel_NowInChannel", string.format("You are now chatting in channel: \'%s\'", v95.Name), "RBX_NAME", v95.Name), v95.Name)
				else
					v94:JoinChannel(v95.Name)
				end
			else
				v94:SendSystemMessage(v_u_9:FormatMessageToSend("GameChat_ChatServiceRunner_YouCannotJoinChannel", "You cannot join channel \'" .. p92 .. "\'.", "RBX_NAME", p92), p93)
				return
			end
		end
		v94:SendSystemMessage(v_u_9:FormatMessageToSend("GameChat_ChatServiceRunner_ChannelDoesNotExist", "Channel \'" .. p92 .. "\' does not exist.", "RBX_NAME", p92), p93)
	end
end
local function v_u_102(p97, p98, p99) -- name: DoLeaveCommand
	-- upvalues: (copy) v_u_6, (ref) v_u_9
	local v100 = v_u_6:GetSpeaker(p97)
	local v101 = v_u_6:GetChannel(p98)
	if v100 then
		if v100:IsInChannel(p98) then
			if v101.Leavable then
				v100:LeaveChannel(v101.Name)
				v100:SendSystemMessage(v_u_9:FormatMessageToSend("GameChat_ChatService_YouHaveLeftChannel", string.format("You have left channel \'%s\'", p98), "RBX_NAME", v101.Name), "System")
			else
				v100:SendSystemMessage(v_u_9:FormatMessageToSend("GameChat_ChatServiceRunner_YouCannotLeaveChannel", "You cannot leave channel \'" .. p98 .. "\'.", "RBX_NAME", p98), p99)
			end
		end
		v100:SendSystemMessage(v_u_9:FormatMessageToSend("GameChat_ChatServiceRunner_YouAreNotInChannel", "You are not in channel \'" .. p98 .. "\'.", "RBX_NAME", p98), p99)
	end
end
v_u_6:RegisterProcessCommandsFunction("default_commands", function(p103, p104, p105)
	-- upvalues: (copy) v_u_96, (copy) v_u_102
	if string.sub(p104, 1, 6):lower() == "/join " then
		v_u_96(p103, string.sub(p104, 7), p105)
		return true
	end
	if string.sub(p104, 1, 3):lower() == "/j " then
		v_u_96(p103, string.sub(p104, 4), p105)
		return true
	end
	if string.sub(p104, 1, 7):lower() == "/leave " then
		v_u_102(p103, string.sub(p104, 8), p105)
		return true
	end
	if string.sub(p104, 1, 3):lower() ~= "/l " then
		return false
	end
	v_u_102(p103, string.sub(p104, 4), p105)
	return true
end)
if v8.GeneralChannelName and v8.GeneralChannelName ~= "" then
	local v106 = v_u_6:AddChannel(v8.GeneralChannelName)
	v106.Leavable = false
	v106.AutoJoin = true
	v106:RegisterGetWelcomeMessageFunction(function(p107)
		-- upvalues: (copy) v_u_4, (copy) v_u_5
		if v_u_4:IsStudio() then
			return nil
		end
		local v_u_108 = p107:GetPlayer()
		if v_u_108 then
			local function v109()
				-- upvalues: (ref) v_u_5, (copy) v_u_108
				return v_u_5:CanUserChatAsync(v_u_108.UserId)
			end
			local v110, v111 = pcall(v109)
			if v110 and not v111 then
				return ""
			end
		end
	end)
end
local v_u_112 = v_u_6:AddChannel("System")
v_u_112.Leavable = false
v_u_112.AutoJoin = true
v_u_112.WelcomeMessage = v_u_9:FormatMessageToSend("GameChat_ChatServiceRunner_SystemChannelWelcomeMessage", "This channel is for system and game notifications.")
v_u_112.SpeakerJoined:connect(function(p113)
	-- upvalues: (copy) v_u_112
	v_u_112:MuteSpeaker(p113)
end)
local function v_u_116(p114) -- name: TryRunModule
	-- upvalues: (copy) v_u_6
	if p114:IsA("ModuleScript") then
		local v115 = require(p114)
		if type(v115) == "function" then
			v115(v_u_6)
		end
	end
end
local v117 = v_u_5:WaitForChild("ChatModules")
v117.ChildAdded:connect(function(p118)
	-- upvalues: (copy) v_u_116
	local v119 = v_u_116
	local v120, v121 = pcall(v119, p118)
	if not v120 and v121 then
		print("Error running module " .. p118.Name .. ": " .. v121)
	end
end)
for _, v122 in pairs(v117:GetChildren()) do
	local v123, v124 = pcall(v_u_116, v122)
	if v123 or not v124 then
		continue
	end
	print("Error running module " .. v122.Name .. ": " .. v124)
end
v_u_3.PlayerRemoving:connect(function(p125)
	-- upvalues: (copy) v_u_6
	if v_u_6:GetSpeaker(p125.Name) then
		v_u_6:RemoveSpeaker(p125.Name)
	end
end)