-- Path: CoreGui.RobloxGui.Modules.Server.ServerChat.ChatChannel
local v1, v2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserShouldMuteUnfilteredMessage")
end)
local v_u_3 = v1 and v2
local v4, v5 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures")
end)
local v_u_6 = v4 and v5
local v7, v8 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
local v_u_9 = v7 and v8
local v10 = {}
local v11 = script.Parent
local v_u_12 = game:GetService("Chat")
local v_u_13 = game:GetService("RunService")
local v14 = v_u_12:WaitForChild("ClientChatModules")
local v_u_15 = require(v14:WaitForChild("ChatSettings"))
local v_u_16 = require(v14:WaitForChild("ChatConstants"))
local v_u_17 = require(v11:WaitForChild("Util"))
local v_u_18 = nil
local function v19()
	-- upvalues: (ref) v_u_18
	v_u_18 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end
pcall(v19)
v_u_18 = v_u_18 or {}
if not (v_u_18.FormatMessageToSend and v_u_18.LocalizeFormattedMessage) then
	function v_u_18.FormatMessageToSend(_, _, p20) -- name: FormatMessageToSend
		return p20
	end
end
local v_u_21 = {}
v_u_21.__index = v_u_21
function v_u_21.SendSystemMessage(p_u_22, p23, p24) -- name: SendSystemMessage
	local v_u_25 = p_u_22:InternalCreateMessageObject(p23, nil, true, p24)
	local v26, v27 = pcall(function()
		-- upvalues: (copy) p_u_22, (copy) v_u_25
		p_u_22.eMessagePosted:Fire(v_u_25)
	end)
	if not v26 and v27 then
		print("Error posting message: " .. v27)
	end
	p_u_22:InternalAddMessageToHistoryLog(v_u_25)
	for _, v28 in pairs(p_u_22.Speakers) do
		v28:InternalSendSystemMessage(v_u_25, p_u_22.Name)
	end
	return v_u_25
end
function v_u_21.SendSystemMessageToSpeaker(p29, p30, p31, p32) -- name: SendSystemMessageToSpeaker
	-- upvalues: (copy) v_u_13
	local v33 = p29.Speakers[p31]
	if v33 then
		v33:InternalSendSystemMessage(p29:InternalCreateMessageObject(p30, nil, true, p32), p29.Name)
	elseif v_u_13:IsStudio() then
		warn(string.format("Speaker \'%s\' is not in channel \'%s\' and cannot be sent a system message", p31, p29.Name))
	end
end
function v_u_21.SendMessageObjToFilters(p34, p35, p36, p37) -- name: SendMessageObjToFilters
	local v38 = p36.Message
	p36.Message = p35
	p34:InternalDoMessageFilter(p37.Name, p36, p34.Name)
	p34.ChatService:InternalDoMessageFilter(p37.Name, p36, p34.Name)
	local v39 = p36.Message
	p36.Message = v38
	return v39
end
function v_u_21.CanCommunicateByUserId(_, p_u_40, p_u_41) -- name: CanCommunicateByUserId
	-- upvalues: (copy) v_u_13, (copy) v_u_12
	if v_u_13:IsStudio() then
		return true
	end
	if p_u_40 == 0 or p_u_41 == 0 then
		return true
	end
	local function v42()
		-- upvalues: (ref) v_u_12, (copy) p_u_40, (copy) p_u_41
		return v_u_12:CanUsersChatAsync(p_u_40, p_u_41)
	end
	local v43, v44 = pcall(v42)
	return v43 and v44
end
function v_u_21.CanCommunicate(p45, p46, p47) -- name: CanCommunicate
	local v48 = p46:GetPlayer()
	local v49 = p47:GetPlayer()
	return not (v48 and v49) and true or p45:CanCommunicateByUserId(v48.UserId, v49.UserId)
end
function v_u_21.SendMessageToSpeaker(p50, p51, p52, p53, p54) -- name: SendMessageToSpeaker
	-- upvalues: (copy) v_u_13
	local v55 = p50.Speakers[p52]
	local v56 = p50.ChatService:GetSpeaker(p53)
	if v55 and v56 then
		if v55:IsSpeakerMuted(p53) then
			return
		end
		if not p50:CanCommunicate(v55, v56) then
			return
		end
		local v57 = p50:InternalCreateMessageObject(p51, p53, p52 == p53, p54)
		local v58 = p50:SendMessageObjToFilters(p51, v57, p53)
		v55:InternalSendMessage(v57, p50.Name)
		local v59 = p50.Private and Enum.TextFilterContext.PrivateChat or Enum.TextFilterContext.PublicChat
		local v60, v61, v62 = p50.ChatService:InternalApplyRobloxFilterNewAPI(v57.FromSpeaker, v58, v59)
		if v60 then
			v57.FilterResult = v62
			v57.IsFilterResult = v61
			v57.IsFiltered = true
			v55:InternalSendFilteredMessageWithFilterResult(v57, p50.Name)
			return
		end
	elseif v_u_13:IsStudio() then
		warn(string.format("Speaker \'%s\' is not in channel \'%s\' and cannot be sent a message", p52, p50.Name))
	end
end
function v_u_21.KickSpeaker(p63, p64, p65) -- name: KickSpeaker
	local v66 = p63.ChatService:GetSpeaker(p64)
	if not v66 then
		error("Speaker \"" .. p64 .. "\" does not exist!")
	end
	local v67 = v66:GetNameForDisplay()
	local v68, v69
	if p65 then
		v68 = string.format("You were kicked from \'%s\' for the following reason(s): %s", p63.Name, p65)
		v69 = string.format("%s was kicked for the following reason(s): %s", v67, p65)
	else
		v68 = string.format("You were kicked from \'%s\'", p63.Name)
		v69 = string.format("%s was kicked", v67)
	end
	p63:SendSystemMessageToSpeaker(v68, p64)
	v66:LeaveChannel(p63.Name)
	p63:SendSystemMessage(v69)
end
function v_u_21.MuteSpeaker(p_u_70, p_u_71, p_u_72, p_u_73) -- name: MuteSpeaker
	local v74 = p_u_70.ChatService:GetSpeaker(p_u_71)
	if not v74 then
		error("Speaker \"" .. p_u_71 .. "\" does not exist!")
	end
	p_u_70.Mutes[p_u_71:lower()] = (p_u_73 == 0 or p_u_73 == nil) and 0 or os.time() + p_u_73
	if p_u_72 then
		local v75 = v74:GetNameForDisplay()
		p_u_70:SendSystemMessage(string.format("%s was muted for the following reason(s): %s", v75, p_u_72))
	end
	local v76, v77 = pcall(function()
		-- upvalues: (copy) p_u_70, (copy) p_u_71, (copy) p_u_72, (copy) p_u_73
		p_u_70.eSpeakerMuted:Fire(p_u_71, p_u_72, p_u_73)
	end)
	if not v76 and v77 then
		print("Error mutting speaker: " .. v77)
	end
	local v_u_78 = p_u_70.ChatService:GetSpeaker(p_u_71)
	if v_u_78 then
		local v79, v80 = pcall(function()
			-- upvalues: (copy) v_u_78, (copy) p_u_70, (copy) p_u_72, (copy) p_u_73
			v_u_78.eMuted:Fire(p_u_70.Name, p_u_72, p_u_73)
		end)
		if not v79 and v80 then
			print("Error mutting speaker: " .. v80)
		end
	end
end
function v_u_21.UnmuteSpeaker(p_u_81, p_u_82) -- name: UnmuteSpeaker
	if not p_u_81.ChatService:GetSpeaker(p_u_82) then
		error("Speaker \"" .. p_u_82 .. "\" does not exist!")
	end
	p_u_81.Mutes[p_u_82:lower()] = nil
	local v83, v84 = pcall(function()
		-- upvalues: (copy) p_u_81, (copy) p_u_82
		p_u_81.eSpeakerUnmuted:Fire(p_u_82)
	end)
	if not v83 and v84 then
		print("Error unmuting speaker: " .. v84)
	end
	local v_u_85 = p_u_81.ChatService:GetSpeaker(p_u_82)
	if v_u_85 then
		local v86, v87 = pcall(function()
			-- upvalues: (copy) v_u_85, (copy) p_u_81
			v_u_85.eUnmuted:Fire(p_u_81.Name)
		end)
		if not v86 and v87 then
			print("Error unmuting speaker: " .. v87)
		end
	end
end
function v_u_21.IsSpeakerMuted(p88, p89) -- name: IsSpeakerMuted
	return p88.Mutes[p89:lower()] ~= nil
end
function v_u_21.GetSpeakerList(p90) -- name: GetSpeakerList
	local v91 = {}
	for _, v92 in pairs(p90.Speakers) do
		local v93 = v92.Name
		table.insert(v91, v93)
	end
	return v91
end
function v_u_21.RegisterFilterMessageFunction(p94, p95, p96, p97) -- name: RegisterFilterMessageFunction
	if p94.FilterMessageFunctions:HasFunction(p95) then
		error(string.format("FilterMessageFunction \'%s\' already exists", p95))
	end
	p94.FilterMessageFunctions:AddFunction(p95, p96, p97)
end
function v_u_21.FilterMessageFunctionExists(p98, p99) -- name: FilterMessageFunctionExists
	return p98.FilterMessageFunctions:HasFunction(p99)
end
function v_u_21.UnregisterFilterMessageFunction(p100, p101) -- name: UnregisterFilterMessageFunction
	if not p100.FilterMessageFunctions:HasFunction(p101) then
		error(string.format("FilterMessageFunction \'%s\' does not exists", p101))
	end
	p100.FilterMessageFunctions:RemoveFunction(p101)
end
function v_u_21.RegisterProcessCommandsFunction(p102, p103, p104, p105) -- name: RegisterProcessCommandsFunction
	if p102.ProcessCommandsFunctions:HasFunction(p103) then
		error(string.format("ProcessCommandsFunction \'%s\' already exists", p103))
	end
	p102.ProcessCommandsFunctions:AddFunction(p103, p104, p105)
end
function v_u_21.ProcessCommandsFunctionExists(p106, p107) -- name: ProcessCommandsFunctionExists
	return p106.ProcessCommandsFunctions:HasFunction(p107)
end
function v_u_21.UnregisterProcessCommandsFunction(p108, p109) -- name: UnregisterProcessCommandsFunction
	if not p108.ProcessCommandsFunctions:HasFunction(p109) then
		error(string.format("ProcessCommandsFunction \'%s\' does not exist", p109))
	end
	p108.ProcessCommandsFunctions:RemoveFunction(p109)
end
function v_u_21.GetHistoryLog(p110) -- name: GetHistoryLog
	local v111 = p110.ChatHistory
	local v112 = {}
	for v113, v114 in pairs(v111) do
		v112[v113] = v114
	end
	return v112
end
function v_u_21.GetHistoryLogForSpeaker(p115, p116) -- name: GetHistoryLogForSpeaker
	-- upvalues: (copy) v_u_16
	local v117 = p116:GetPlayer()
	local v118 = not v117 and -1 or v117.UserId
	local v119 = {}
	for v120 = 1, #p115.ChatHistory do
		if not p115:CanCommunicateByUserId(v118, p115.ChatHistory[v120].SpeakerUserId) then
			continue
		end
		local v121 = p115.ChatHistory[v120]
		local v122 = {}
		for v123, v124 in pairs(v121) do
			v122[v123] = v124
		end
		if v122.MessageType == v_u_16.MessageTypeDefault or v122.MessageType == v_u_16.MessageTypeMeCommand then
			local v125 = v122.FilterResult
			if v122.IsFilterResult then
				if v117 then
					v122.Message = v125:GetChatForUserAsync(v117.UserId)
				else
					v122.Message = v125:GetNonChatStringForBroadcastAsync()
				end
			else
				v122.Message = v125
			end
		end
		table.insert(v119, v122)
	end
	return v119
end
function v_u_21.InternalDestroy(p126) -- name: InternalDestroy
	for _, v127 in pairs(p126.Speakers) do
		v127:LeaveChannel(p126.Name)
	end
	p126.eDestroyed:Fire()
	p126.eDestroyed:Destroy()
	p126.eMessagePosted:Destroy()
	p126.eSpeakerJoined:Destroy()
	p126.eSpeakerLeft:Destroy()
	p126.eSpeakerMuted:Destroy()
	p126.eSpeakerUnmuted:Destroy()
end
function v_u_21.InternalDoMessageFilter(p128, p_u_129, p_u_130, p_u_131) -- name: InternalDoMessageFilter
	for v132, v_u_133, _ in p128.FilterMessageFunctions:GetIterator() do
		local v134, v135 = pcall(function()
			-- upvalues: (copy) v_u_133, (copy) p_u_129, (copy) p_u_130, (copy) p_u_131
			v_u_133(p_u_129, p_u_130, p_u_131)
		end)
		if v134 then
			continue
		end
		warn(string.format("DoMessageFilter Function \'%s\' failed for reason: %s", v132, v135))
	end
end
function v_u_21.InternalDoProcessCommands(p136, p_u_137, p_u_138, p_u_139) -- name: InternalDoProcessCommands
	for v140, v_u_141, _ in p136.ProcessCommandsFunctions:GetIterator() do
		local v143, v144 = pcall(function()
			-- upvalues: (copy) v_u_141, (copy) p_u_137, (copy) p_u_138, (copy) p_u_139
			local v142 = v_u_141(p_u_137, p_u_138, p_u_139)
			if type(v142) ~= "boolean" then
				error("Process command functions must return a bool")
			end
			return v142
		end)
		if v143 then
			if not v144 then
				continue
			end
			return true
		end
		warn(string.format("DoProcessCommands Function \'%s\' failed for reason: %s", v140, v144))
	end
	return false
end
function getLanguageCodeFromLocale(p145) -- name: getLanguageCodeFromLocale
	return string.gmatch(p145, "[^-]+")() or "en"
end
function v_u_21.InternalPostMessage(p_u_146, p147, p148, p149) -- name: InternalPostMessage
	-- upvalues: (ref) v_u_18, (copy) v_u_12, (ref) v_u_3, (ref) v_u_9, (ref) v_u_6
	if p_u_146:InternalDoProcessCommands(p147.Name, p148, p_u_146.Name) then
		return false
	end
	if p_u_146.Mutes[p147.Name:lower()] ~= nil then
		local v150 = p_u_146.Mutes[p147.Name:lower()]
		if v150 <= 0 or v150 >= os.time() then
			p_u_146:SendSystemMessageToSpeaker(v_u_18:FormatMessageToSend("GameChat_ChatChannel_MutedInChannel", "You are muted and cannot talk in this channel"), p147.Name)
			return false
		end
		p_u_146:UnmuteSpeaker(p147.Name)
	end
	local v_u_151 = p_u_146:InternalCreateMessageObject(p148, p147.Name, false, p149)
	v_u_151.Message = p148
	local v_u_152 = nil
	local function v153()
		-- upvalues: (ref) v_u_152, (ref) v_u_12, (ref) v_u_151
		v_u_152 = v_u_12:InvokeChatCallback(Enum.ChatCallbackType.OnServerReceivingMessage, v_u_151)
	end
	pcall(v153)
	v_u_151.Message = nil
	if v_u_152 then
		if v_u_152.ShouldDeliver == false then
			return false
		end
		v_u_151 = v_u_152
	end
	local v154 = p_u_146:SendMessageObjToFilters(p148, v_u_151, p147)
	local v155 = {}
	for _, v156 in pairs(p_u_146.Speakers) do
		if v156:IsSpeakerMuted(p147.Name) or not p_u_146:CanCommunicate(p147, v156) then
			continue
		end
		local v157 = v156.Name
		table.insert(v155, v157)
		if v156.Name == p147.Name then
			local v158 = {}
			for v159, v160 in pairs(v_u_151) do
				v158[v159] = v160
			end
			if v_u_3 then
				local v161 = v_u_151.MessageLengthUtf8 or v_u_151.MessageLength
				v158.Message = string.rep("_", v161)
			else
				v158.Message = v154
			end
			v158.IsFiltered = true
			v156:InternalSendMessage(v158, p_u_146.Name)
		else
			v156:InternalSendMessage(v_u_151, p_u_146.Name)
		end
	end
	local v162, v163 = pcall(function()
		-- upvalues: (copy) p_u_146, (ref) v_u_151
		p_u_146.eMessagePosted:Fire(v_u_151)
	end)
	if not v162 and v163 then
		print("Error posting message: " .. v163)
	end
	local v164 = p_u_146.Private and Enum.TextFilterContext.PrivateChat or Enum.TextFilterContext.PublicChat
	local v165 = nil
	if v_u_9 then
		local v166 = {}
		local v167 = {}
		for _, v168 in pairs(p_u_146.Speakers) do
			local v169 = v168:GetPlayer()
			if v169 == nil or v169.LocaleId == nil then
				continue
			end
			v166[getLanguageCodeFromLocale(v169.LocaleId)] = true
		end
		for v170, _ in v166 do
			table.insert(v167, v170)
		end
		local v171, v172, v173 = p_u_146.ChatService:InternalApplyRobloxFilterAndTranslate(v_u_151.FromSpeaker, v167, v154, v164)
		if v171 then
			if v172 then
				v_u_151.FilterResult = v173.SourceText
			else
				v_u_151.FilterResult = v173
			end
			v_u_151.IsFilterResult = v172
			if v172 then
				v165 = v173
			end
		else
			if not v_u_6 then
				return false
			end
			v_u_151.IsFilterResult = false
			v_u_151.FilterResult = ""
			v_u_151.MessageLength = 0
		end
	else
		local v174, v175, v176 = p_u_146.ChatService:InternalApplyRobloxFilterNewAPI(v_u_151.FromSpeaker, v154, v164)
		if v174 then
			v_u_151.FilterResult = v176
			v_u_151.IsFilterResult = v175
		else
			if not v_u_6 then
				return false
			end
			v_u_151.IsFilterResult = false
			v_u_151.FilterResult = ""
			v_u_151.MessageLength = 0
		end
	end
	v_u_151.IsFiltered = true
	p_u_146:InternalAddMessageToHistoryLog(v_u_151)
	for _, v177 in pairs(v155) do
		local v178 = p_u_146.Speakers[v177]
		if not v178 then
			continue
		end
		local v179 = v_u_9
		if v179 then
			if v165 then
				if p147:GetPlayer() == nil or v178:GetPlayer() == nil then
					v179 = false
				else
					v179 = p147:GetPlayer().LocaleId ~= v178:GetPlayer().LocaleId
				end
			else
				v179 = v165
			end
		end
		if v179 then
			v178:InternalSendFilteredMessageWithTranslatedFilterResult(v_u_151, p_u_146.Name, v165)
		else
			v178:InternalSendFilteredMessageWithFilterResult(v_u_151, p_u_146.Name)
		end
	end
	local v180 = {}
	for _, v181 in pairs(p_u_146.Speakers) do
		if v181:IsSpeakerMuted(p147.Name) or not p_u_146:CanCommunicate(p147, v181) then
			continue
		end
		local v182 = false
		for _, v183 in pairs(v155) do
			if v181.Name ~= v183 then
				continue
			end
			v182 = true
		end
		if v182 then
			break
		end
		local v184 = v181.Name
		table.insert(v180, v184)
	end
	for _, v185 in pairs(v180) do
		local v186 = p_u_146.Speakers[v185]
		if not v186 then
			continue
		end
		v186:InternalSendFilteredMessageWithFilterResult(v_u_151, p_u_146.Name)
	end
	return v_u_151
end
function v_u_21.InternalAddSpeaker(p_u_187, p_u_188) -- name: InternalAddSpeaker
	if p_u_187.Speakers[p_u_188.Name] then
		warn("Speaker \"" .. p_u_188.name .. "\" is already in the channel!")
	else
		p_u_187.Speakers[p_u_188.Name] = p_u_188
		local v189, v190 = pcall(function()
			-- upvalues: (copy) p_u_187, (copy) p_u_188
			p_u_187.eSpeakerJoined:Fire(p_u_188.Name)
		end)
		if not v189 and v190 then
			print("Error removing channel: " .. v190)
		end
	end
end
function v_u_21.InternalRemoveSpeaker(p_u_191, p_u_192) -- name: InternalRemoveSpeaker
	if p_u_191.Speakers[p_u_192.Name] then
		p_u_191.Speakers[p_u_192.Name] = nil
		local v193, v194 = pcall(function()
			-- upvalues: (copy) p_u_191, (copy) p_u_192
			p_u_191.eSpeakerLeft:Fire(p_u_192.Name)
		end)
		if not v193 and v194 then
			print("Error removing speaker: " .. v194)
		end
	else
		warn("Speaker \"" .. p_u_192.name .. "\" is not in the channel!")
	end
end
function v_u_21.InternalRemoveExcessMessagesFromLog(p195) -- name: InternalRemoveExcessMessagesFromLog
	local v196 = table.remove
	while #p195.ChatHistory > p195.MaxHistory do
		v196(p195.ChatHistory, 1)
	end
end
function v_u_21.InternalAddMessageToHistoryLog(p197, p198) -- name: InternalAddMessageToHistoryLog
	local v199 = p197.ChatHistory
	table.insert(v199, p198)
	p197:InternalRemoveExcessMessagesFromLog()
end
function v_u_21.GetMessageType(_, _, p200) -- name: GetMessageType
	-- upvalues: (copy) v_u_16
	if p200 == nil then
		return v_u_16.MessageTypeSystem
	else
		return v_u_16.MessageTypeDefault
	end
end
function v_u_21.InternalCreateMessageObject(p201, p202, p203, p204, p205) -- name: InternalCreateMessageObject
	-- upvalues: (copy) v_u_15
	local v206 = p201:GetMessageType(p202, p203)
	local v207 = -1
	local v208 = nil
	local v209
	if p203 then
		v209 = p201.ChatService:GetSpeaker(p203)
		if v209 then
			local v210 = v209:GetPlayer()
			if v210 then
				v207 = v210.UserId
				if v_u_15.PlayerDisplayNamesEnabled then
					v208 = v209:GetNameForDisplay()
				end
			else
				v207 = 0
			end
		end
	else
		v209 = nil
	end
	local v211 = {
		["ID"] = p201.ChatService:InternalGetUniqueMessageId(),
		["FromSpeaker"] = p203,
		["SpeakerDisplayName"] = v208,
		["SpeakerUserId"] = v207,
		["OriginalChannel"] = p201.Name,
		["MessageLength"] = string.len(p202),
		["MessageLengthUtf8"] = utf8.len(utf8.nfcnormalize(p202)),
		["MessageType"] = v206,
		["IsFiltered"] = p204,
		["Message"] = p204 and p202 and p202 or nil,
		["Time"] = os.time(),
		["ExtraData"] = {}
	}
	if v209 then
		for v212, v213 in pairs(v209.ExtraData) do
			v211.ExtraData[v212] = v213
		end
	end
	if p205 then
		for v214, v215 in pairs(p205) do
			v211.ExtraData[v214] = v215
		end
	end
	return v211
end
function v_u_21.SetChannelNameColor(p216, p217) -- name: SetChannelNameColor
	p216.ChannelNameColor = p217
	for _, v218 in pairs(p216.Speakers) do
		v218:UpdateChannelNameColor(p216.Name, p217)
	end
end
function v_u_21.GetWelcomeMessageForSpeaker(p219, p220) -- name: GetWelcomeMessageForSpeaker
	return p219.GetWelcomeMessageFunction and p219.GetWelcomeMessageFunction(p220) or p219.WelcomeMessage
end
function v_u_21.RegisterGetWelcomeMessageFunction(p221, p222) -- name: RegisterGetWelcomeMessageFunction
	if type(p222) ~= "function" then
		error("RegisterGetWelcomeMessageFunction must be called with a function.")
	end
	p221.GetWelcomeMessageFunction = p222
end
function v_u_21.UnRegisterGetWelcomeMessageFunction(p223) -- name: UnRegisterGetWelcomeMessageFunction
	p223.GetWelcomeMessageFunction = nil
end
function v10.new(p224, p225, p226, p227) -- name: new
	-- upvalues: (copy) v_u_21, (copy) v_u_17
	local v228 = v_u_21
	local v229 = setmetatable({}, v228)
	v229.ChatService = p224
	v229.Name = p225
	v229.WelcomeMessage = p226 or ""
	v229.GetWelcomeMessageFunction = nil
	v229.ChannelNameColor = p227
	v229.Joinable = true
	v229.Leavable = true
	v229.AutoJoin = false
	v229.Private = false
	v229.Speakers = {}
	v229.Mutes = {}
	v229.MaxHistory = 200
	v229.HistoryIndex = 0
	v229.ChatHistory = {}
	v229.FilterMessageFunctions = v_u_17:NewSortedFunctionContainer()
	v229.ProcessCommandsFunctions = v_u_17:NewSortedFunctionContainer()
	v229.eDestroyed = Instance.new("BindableEvent")
	v229.eMessagePosted = Instance.new("BindableEvent")
	v229.eSpeakerJoined = Instance.new("BindableEvent")
	v229.eSpeakerLeft = Instance.new("BindableEvent")
	v229.eSpeakerMuted = Instance.new("BindableEvent")
	v229.eSpeakerUnmuted = Instance.new("BindableEvent")
	v229.MessagePosted = v229.eMessagePosted.Event
	v229.SpeakerJoined = v229.eSpeakerJoined.Event
	v229.SpeakerLeft = v229.eSpeakerLeft.Event
	v229.SpeakerMuted = v229.eSpeakerMuted.Event
	v229.SpeakerUnmuted = v229.eSpeakerUnmuted.Event
	v229.Destroyed = v229.eDestroyed.Event
	return v229
end
return v10