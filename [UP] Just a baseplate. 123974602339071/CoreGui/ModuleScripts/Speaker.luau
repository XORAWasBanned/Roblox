-- Path: CoreGui.RobloxGui.Modules.Server.ServerChat.Speaker
local v1 = {}
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("Chat"):WaitForChild("ClientChatModules")
local v_u_4 = require(v3:WaitForChild("ChatSettings"))
local _ = script.Parent
local v5, v6 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures")
end)
local v_u_7 = v5 and v6
local _, _ = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
local v_u_8 = {}
local v_u_9 = {
	["eDestroyed"] = true,
	["eSaidMessage"] = true,
	["eReceivedMessage"] = true,
	["eReceivedUnfilteredMessage"] = true,
	["eMessageDoneFiltering"] = true,
	["eReceivedSystemMessage"] = true,
	["eChannelJoined"] = true,
	["eChannelLeft"] = true,
	["eMuted"] = true,
	["eUnmuted"] = true,
	["eExtraDataUpdated"] = true,
	["eMainChannelSet"] = true,
	["eChannelNameColorUpdated"] = true
}
local v_u_10 = {
	["Destroyed"] = "eDestroyed",
	["SaidMessage"] = "eSaidMessage",
	["ReceivedMessage"] = "eReceivedMessage",
	["ReceivedUnfilteredMessage"] = "eReceivedUnfilteredMessage",
	["RecievedUnfilteredMessage"] = "eReceivedUnfilteredMessage",
	["MessageDoneFiltering"] = "eMessageDoneFiltering",
	["ReceivedSystemMessage"] = "eReceivedSystemMessage",
	["ChannelJoined"] = "eChannelJoined",
	["ChannelLeft"] = "eChannelLeft",
	["Muted"] = "eMuted",
	["Unmuted"] = "eUnmuted",
	["ExtraDataUpdated"] = "eExtraDataUpdated",
	["MainChannelSet"] = "eMainChannelSet",
	["ChannelNameColorUpdated"] = "eChannelNameColorUpdated"
}
function v_u_8.__index(p11, p12)
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_10
	local v13 = v_u_8
	local v14 = rawget(v13, p12)
	if v14 then
		return v14
	end
	if v_u_9[p12] and not rawget(p11, p12) then
		local v15 = Instance.new
		rawset(p11, p12, v15("BindableEvent"))
	end
	local v16 = v_u_10[p12]
	if v16 and not rawget(p11, p12) then
		local v17 = rawget(p11, v16)
		if not v17 then
			v17 = Instance.new("BindableEvent")
			rawset(p11, v16, v17)
		end
		local v18 = v17.Event
		rawset(p11, p12, v18)
	end
	return rawget(p11, p12)
end
function v_u_8.LazyFire(p19, p20, ...) -- name: LazyFire
	local v21 = rawget(p19, p20)
	if v21 then
		v21:Fire(...)
	end
end
function v_u_8.SayMessage(p_u_22, p23, p_u_24, p25) -- name: SayMessage
	if p_u_22.ChatService:InternalDoProcessCommands(p_u_22.Name, p23, p_u_24) then
		return
	elseif p_u_24 then
		local v26 = p_u_22.Channels[p_u_24:lower()]
		if v26 then
			local v_u_27 = v26:InternalPostMessage(p_u_22, p23, p25)
			if v_u_27 then
				pcall(function()
					-- upvalues: (copy) p_u_22, (copy) v_u_27, (copy) p_u_24
					p_u_22:LazyFire("eSaidMessage", v_u_27, p_u_24)
				end)
			end
			return v_u_27
		end
	end
end
function v_u_8.JoinChannel(p_u_28, p29) -- name: JoinChannel
	if p_u_28.Channels[p29:lower()] then
		warn("Speaker is already in channel \"" .. p29 .. "\"")
	else
		local v_u_30 = p_u_28.ChatService:GetChannel(p29)
		if not v_u_30 then
			error("Channel \"" .. p29 .. "\" does not exist!")
		end
		p_u_28.Channels[p29:lower()] = v_u_30
		v_u_30:InternalAddSpeaker(p_u_28)
		local v31, v32 = pcall(function()
			-- upvalues: (copy) p_u_28, (copy) v_u_30
			p_u_28.eChannelJoined:Fire(v_u_30.Name, v_u_30:GetWelcomeMessageForSpeaker(p_u_28))
		end)
		if not v31 and v32 then
			print("Error joining channel: " .. v32)
		end
	end
end
function v_u_8.LeaveChannel(p_u_33, p34) -- name: LeaveChannel
	if p_u_33.Channels[p34:lower()] then
		local v_u_35 = p_u_33.Channels[p34:lower()]
		p_u_33.Channels[p34:lower()] = nil
		v_u_35:InternalRemoveSpeaker(p_u_33)
		local v36, v37 = pcall(function()
			-- upvalues: (copy) p_u_33, (copy) v_u_35
			p_u_33:LazyFire("eChannelLeft", v_u_35.Name)
			if p_u_33.PlayerObj then
				p_u_33.EventFolder.OnChannelLeft:FireClient(p_u_33.PlayerObj, v_u_35.Name)
			end
		end)
		if not v36 and v37 then
			print("Error leaving channel: " .. v37)
		end
	else
		warn("Speaker is not in channel \"" .. p34 .. "\"")
	end
end
function v_u_8.IsInChannel(p38, p39) -- name: IsInChannel
	return p38.Channels[p39:lower()] ~= nil
end
function v_u_8.GetChannelList(p40) -- name: GetChannelList
	local v41 = {}
	for _, v42 in pairs(p40.Channels) do
		local v43 = v42.Name
		table.insert(v41, v43)
	end
	return v41
end
function v_u_8.SendMessage(p44, p45, p46, p47, p48) -- name: SendMessage
	-- upvalues: (copy) v_u_2
	local v49 = p44.Channels[p46:lower()]
	if v49 then
		v49:SendMessageToSpeaker(p45, p44.Name, p47, p48)
	elseif v_u_2:IsStudio() then
		warn(string.format("Speaker \'%s\' is not in channel \'%s\' and cannot receive a message in it.", p44.Name, p46))
	end
end
function v_u_8.SendSystemMessage(p50, p51, p52, p53) -- name: SendSystemMessage
	-- upvalues: (copy) v_u_2
	local v54 = p50.Channels[p52:lower()]
	if v54 then
		v54:SendSystemMessageToSpeaker(p51, p50.Name, p53)
	elseif v_u_2:IsStudio() then
		warn(string.format("Speaker \'%s\' is not in channel \'%s\' and cannot receive a system message in it.", p50.Name, p52))
	end
end
function v_u_8.GetPlayer(p55) -- name: GetPlayer
	return p55.PlayerObj
end
function v_u_8.GetNameForDisplay(p56) -- name: GetNameForDisplay
	-- upvalues: (copy) v_u_4
	if v_u_4.PlayerDisplayNamesEnabled then
		local v57 = p56:GetPlayer()
		if v57 then
			return v57.DisplayName
		else
			return p56.Name
		end
	else
		return p56.Name
	end
end
function v_u_8.SetExtraData(p58, p59, p60) -- name: SetExtraData
	p58.ExtraData[p59] = p60
	p58:LazyFire("eExtraDataUpdated", p59, p60)
end
function v_u_8.GetExtraData(p61, p62) -- name: GetExtraData
	return p61.ExtraData[p62]
end
function v_u_8.SetMainChannel(p_u_63, p_u_64) -- name: SetMainChannel
	local v65, v66 = pcall(function()
		-- upvalues: (copy) p_u_63, (copy) p_u_64
		p_u_63:LazyFire("eMainChannelSet", p_u_64)
		if p_u_63.PlayerObj then
			p_u_63.EventFolder.OnMainChannelSet:FireClient(p_u_63.PlayerObj, p_u_64)
		end
	end)
	if not v65 and v66 then
		print("Error setting main channel: " .. v66)
	end
end
function v_u_8.AddMutedSpeaker(p67, p68) -- name: AddMutedSpeaker
	p67.MutedSpeakers[p68:lower()] = true
end
function v_u_8.RemoveMutedSpeaker(p69, p70) -- name: RemoveMutedSpeaker
	p69.MutedSpeakers[p70:lower()] = false
end
function v_u_8.IsSpeakerMuted(p71, p72) -- name: IsSpeakerMuted
	return p71.MutedSpeakers[p72:lower()]
end
function v_u_8.InternalDestroy(p73) -- name: InternalDestroy
	for _, v74 in pairs(p73.Channels) do
		v74:InternalRemoveSpeaker(p73)
	end
	p73.eDestroyed:Fire()
	p73.EventFolder = nil
	p73.eDestroyed:Destroy()
	p73.eSaidMessage:Destroy()
	p73.eReceivedMessage:Destroy()
	p73.eReceivedUnfilteredMessage:Destroy()
	p73.eMessageDoneFiltering:Destroy()
	p73.eReceivedSystemMessage:Destroy()
	p73.eChannelJoined:Destroy()
	p73.eChannelLeft:Destroy()
	p73.eMuted:Destroy()
	p73.eUnmuted:Destroy()
	p73.eExtraDataUpdated:Destroy()
	p73.eMainChannelSet:Destroy()
	p73.eChannelNameColorUpdated:Destroy()
end
function v_u_8.InternalAssignPlayerObject(p75, p76) -- name: InternalAssignPlayerObject
	p75.PlayerObj = p76
end
function v_u_8.InternalAssignEventFolder(p77, p78) -- name: InternalAssignEventFolder
	p77.EventFolder = p78
end
function v_u_8.InternalSendMessage(p_u_79, p_u_80, p_u_81) -- name: InternalSendMessage
	local v82, v83 = pcall(function()
		-- upvalues: (copy) p_u_79, (copy) p_u_80, (copy) p_u_81
		p_u_79:LazyFire("eReceivedUnfilteredMessage", p_u_80, p_u_81)
		if p_u_79.PlayerObj then
			p_u_79.EventFolder.OnNewMessage:FireClient(p_u_79.PlayerObj, p_u_80, p_u_81)
		end
	end)
	if not v82 and v83 then
		print("Error sending internal message: " .. v83)
	end
end
function v_u_8.InternalSendFilteredMessage(p_u_84, p_u_85, p_u_86) -- name: InternalSendFilteredMessage
	local v87, v88 = pcall(function()
		-- upvalues: (copy) p_u_84, (copy) p_u_85, (copy) p_u_86
		p_u_84:LazyFire("eReceivedMessage", p_u_85, p_u_86)
		p_u_84:LazyFire("eMessageDoneFiltering", p_u_85, p_u_86)
		if p_u_84.PlayerObj then
			p_u_84.EventFolder.OnMessageDoneFiltering:FireClient(p_u_84.PlayerObj, p_u_85, p_u_86)
		end
	end)
	if not v87 and v88 then
		print("Error sending internal filtered message: " .. v88)
	end
end
function v_u_8.InternalSendFilteredMessageWithTranslatedFilterResult(p89, p90, p91, p92) -- name: InternalSendFilteredMessageWithTranslatedFilterResult
	-- upvalues: (ref) v_u_7
	local v_u_93 = {}
	for v94, v95 in pairs(p90) do
		v_u_93[v94] = v95
	end
	local v_u_96 = v_u_93.FilterResult
	local v_u_97 = p89:GetPlayer()
	local v_u_98
	if v_u_97 == nil then
		v_u_98 = nil
	else
		v_u_98 = p92:GetTranslationForLocale(v_u_97.LocaleId)
	end
	local v_u_99 = ""
	local v_u_100 = nil
	local function v101()
		-- upvalues: (copy) v_u_93, (copy) v_u_97, (ref) v_u_99, (copy) v_u_96, (copy) v_u_98, (ref) v_u_100
		if v_u_93.IsFilterResult then
			if v_u_97 then
				v_u_99 = v_u_96:GetChatForUserAsync(v_u_97.UserId)
				if v_u_98 then
					v_u_100 = v_u_98:GetChatForUserAsync(v_u_97.UserId)
					return
				end
			else
				v_u_99 = v_u_96:GetNonChatStringForBroadcastAsync()
				if v_u_98 then
					v_u_100 = v_u_98:GetNonChatStringForBroadcastAsync()
					return
				end
			end
		else
			v_u_99 = v_u_96
		end
	end
	pcall(v101)
	if v_u_7 then
		v_u_93.Message = v_u_99
		if v_u_100 then
			v_u_93.TranslatedMessage = v_u_100
		end
		v_u_93.FilterResult = nil
		p89:InternalSendFilteredMessage(v_u_93, p91)
	elseif #v_u_99 > 0 then
		v_u_93.Message = v_u_99
		if v_u_100 then
			v_u_93.TranslatedMessage = v_u_100
		end
		v_u_93.FilterResult = nil
		p89:InternalSendFilteredMessage(v_u_93, p91)
	end
end
function v_u_8.InternalSendFilteredMessageWithFilterResult(p102, p103, p104) -- name: InternalSendFilteredMessageWithFilterResult
	-- upvalues: (ref) v_u_7
	local v_u_105 = {}
	for v106, v107 in pairs(p103) do
		v_u_105[v106] = v107
	end
	local v_u_108 = v_u_105.FilterResult
	local v_u_109 = p102:GetPlayer()
	local v_u_110 = ""
	local function v111()
		-- upvalues: (copy) v_u_105, (copy) v_u_109, (ref) v_u_110, (copy) v_u_108
		if v_u_105.IsFilterResult then
			if v_u_109 then
				v_u_110 = v_u_108:GetChatForUserAsync(v_u_109.UserId)
			else
				v_u_110 = v_u_108:GetNonChatStringForBroadcastAsync()
			end
		else
			v_u_110 = v_u_108
			return
		end
	end
	pcall(v111)
	if v_u_7 then
		v_u_105.Message = v_u_110
		v_u_105.FilterResult = nil
		p102:InternalSendFilteredMessage(v_u_105, p104)
	elseif #v_u_110 > 0 then
		v_u_105.Message = v_u_110
		v_u_105.FilterResult = nil
		p102:InternalSendFilteredMessage(v_u_105, p104)
	end
end
function v_u_8.InternalSendSystemMessage(p_u_112, p_u_113, p_u_114) -- name: InternalSendSystemMessage
	local v115, v116 = pcall(function()
		-- upvalues: (copy) p_u_112, (copy) p_u_113, (copy) p_u_114
		p_u_112:LazyFire("eReceivedSystemMessage", p_u_113, p_u_114)
		if p_u_112.PlayerObj then
			p_u_112.EventFolder.OnNewSystemMessage:FireClient(p_u_112.PlayerObj, p_u_113, p_u_114)
		end
	end)
	if not v115 and v116 then
		print("Error sending internal system message: " .. v116)
	end
end
function v_u_8.UpdateChannelNameColor(p117, p118, p119) -- name: UpdateChannelNameColor
	p117:LazyFire("eChannelNameColorUpdated", p118, p119)
	if p117.PlayerObj then
		p117.EventFolder.ChannelNameColorUpdated:FireClient(p117.PlayerObj, p118, p119)
	end
end
function v1.new(p120, p121) -- name: new
	-- upvalues: (copy) v_u_8
	local v122 = v_u_8
	local v123 = setmetatable({}, v122)
	v123.ChatService = p120
	v123.PlayerObj = nil
	v123.Name = p121
	v123.ExtraData = {}
	v123.Channels = {}
	v123.MutedSpeakers = {}
	v123.EventFolder = nil
	return v123
end
return v1