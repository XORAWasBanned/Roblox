-- Path: CoreGui.RobloxGui.Modules.Server.ServerChat.ChatService
local v_u_1 = { 0.05, 0.1, 0.2 }
local v2 = {}
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("Chat")
v_u_4:WaitForChild("ClientChatModules")
local v5 = script.Parent
local v6 = v_u_4:WaitForChild("ClientChatModules")
local v_u_7 = {
	["ChatColor"] = require(v6:WaitForChild("ChatSettings")).ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
}
local v_u_8 = require(v6:WaitForChild("ChatConstants"))
local v_u_9 = require(v5:WaitForChild("ChatChannel"))
local v_u_10 = require(v5:WaitForChild("Speaker"))
local v_u_11 = require(v5:WaitForChild("Util"))
local v_u_12 = nil
local function v13()
	-- upvalues: (ref) v_u_12
	v_u_12 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end
pcall(v13)
v_u_12 = v_u_12 or {}
if not (v_u_12.FormatMessageToSend and v_u_12.LocalizeFormattedMessage) then
	function v_u_12.FormatMessageToSend(_, _, p14) -- name: FormatMessageToSend
		return p14
	end
end
local v_u_15 = {}
v_u_15.__index = v_u_15
function v_u_15.AddChannel(p_u_16, p_u_17, p18) -- name: AddChannel
	-- upvalues: (ref) v_u_12, (copy) v_u_9, (copy) v_u_8
	if p_u_16.ChatChannels[p_u_17:lower()] then
		error(string.format("Channel %q alrady exists.", p_u_17))
	end
	local function v23(p19, p20) -- name: DefaultChannelCommands
		-- upvalues: (copy) p_u_16, (copy) p_u_17, (ref) v_u_12
		if p20:lower() ~= "/leave" then
			return false
		end
		local v21 = p_u_16:GetChannel(p_u_17)
		local v22 = p_u_16:GetSpeaker(p19)
		if v21 and v22 then
			if v21.Leavable then
				v22:LeaveChannel(p_u_17)
				v22:SendSystemMessage(v_u_12:FormatMessageToSend("GameChat_ChatService_YouHaveLeftChannel", string.format("You have left channel \'%s\'", p_u_17), "RBX_NAME", p_u_17), "System")
			else
				v22:SendSystemMessage(v_u_12:FormatMessageToSend("GameChat_ChatService_CannotLeaveChannel", "You cannot leave this channel."), p_u_17)
			end
		end
		return true
	end
	local v24 = v_u_9.new(p_u_16, p_u_17)
	p_u_16.ChatChannels[p_u_17:lower()] = v24
	v24:RegisterProcessCommandsFunction("default_commands", v23, v_u_8.HighPriority)
	local v25, v26 = pcall(function()
		-- upvalues: (copy) p_u_16, (copy) p_u_17
		p_u_16.eChannelAdded:Fire(p_u_17)
	end)
	if not v25 and v26 then
		print("Error addding channel: " .. v26)
	end
	if p18 ~= nil then
		v24.AutoJoin = p18
		if p18 then
			for _, v27 in pairs(p_u_16.Speakers) do
				v27:JoinChannel(p_u_17)
			end
		end
	end
	return v24
end
function v_u_15.RemoveChannel(p_u_28, p29) -- name: RemoveChannel
	if p_u_28.ChatChannels[p29:lower()] then
		local v_u_30 = p_u_28.ChatChannels[p29:lower()].Name
		p_u_28.ChatChannels[p29:lower()]:InternalDestroy()
		p_u_28.ChatChannels[p29:lower()] = nil
		local v31, v32 = pcall(function()
			-- upvalues: (copy) p_u_28, (copy) v_u_30
			p_u_28.eChannelRemoved:Fire(v_u_30)
		end)
		if not v31 and v32 then
			print("Error removing channel: " .. v32)
			return
		end
	else
		warn(string.format("Channel %q does not exist.", p29))
	end
end
function v_u_15.GetChannel(p33, p34) -- name: GetChannel
	return p33.ChatChannels[p34:lower()]
end
function v_u_15.AddSpeaker(p_u_35, p_u_36) -- name: AddSpeaker
	-- upvalues: (copy) v_u_10
	if p_u_35.Speakers[p_u_36:lower()] then
		error("Speaker \"" .. p_u_36 .. "\" already exists!")
	end
	local v37 = v_u_10.new(p_u_35, p_u_36)
	p_u_35.Speakers[p_u_36:lower()] = v37
	local v38, v39 = pcall(function()
		-- upvalues: (copy) p_u_35, (copy) p_u_36
		p_u_35.eSpeakerAdded:Fire(p_u_36)
	end)
	if not v38 and v39 then
		print("Error adding speaker: " .. v39)
	end
	return v37
end
function v_u_15.InternalUnmuteSpeaker(p40, p41) -- name: InternalUnmuteSpeaker
	for _, v42 in pairs(p40.ChatChannels) do
		if not v42:IsSpeakerMuted(p41) then
			continue
		end
		v42:UnmuteSpeaker(p41)
	end
end
function v_u_15.RemoveSpeaker(p_u_43, p44) -- name: RemoveSpeaker
	if p_u_43.Speakers[p44:lower()] then
		local v_u_45 = p_u_43.Speakers[p44:lower()].Name
		p_u_43:InternalUnmuteSpeaker(v_u_45)
		p_u_43.Speakers[p44:lower()]:InternalDestroy()
		p_u_43.Speakers[p44:lower()] = nil
		local v46, v47 = pcall(function()
			-- upvalues: (copy) p_u_43, (copy) v_u_45
			p_u_43.eSpeakerRemoved:Fire(v_u_45)
		end)
		if not v46 and v47 then
			print("Error removing speaker: " .. v47)
			return
		end
	else
		warn("Speaker \"" .. p44 .. "\" does not exist!")
	end
end
function v_u_15.GetSpeaker(p48, p49) -- name: GetSpeaker
	return p48.Speakers[p49:lower()]
end
function v_u_15.GetSpeakerByUserOrDisplayName(p50, p51) -- name: GetSpeakerByUserOrDisplayName
	local v52 = p50.Speakers[p51:lower()]
	if v52 then
		return v52
	end
	for _, v53 in pairs(p50.Speakers) do
		local v54 = v53:GetPlayer()
		if not v54 or v54.DisplayName:lower() ~= p51:lower() then
			continue
		end
		return v53
	end
end
function v_u_15.GetChannelList(p55) -- name: GetChannelList
	local v56 = {}
	for _, v57 in pairs(p55.ChatChannels) do
		if v57.Private then
			continue
		end
		local v58 = v57.Name
		table.insert(v56, v58)
	end
	return v56
end
function v_u_15.GetAutoJoinChannelList(p59) -- name: GetAutoJoinChannelList
	local v60 = {}
	for _, v61 in pairs(p59.ChatChannels) do
		if not v61.AutoJoin then
			continue
		end
		table.insert(v60, v61)
	end
	return v60
end
function v_u_15.GetSpeakerList(p62) -- name: GetSpeakerList
	local v63 = {}
	for _, v64 in pairs(p62.Speakers) do
		local v65 = v64.Name
		table.insert(v63, v65)
	end
	return v63
end
function v_u_15.SendGlobalSystemMessage(p66, p67) -- name: SendGlobalSystemMessage
	for _, v68 in pairs(p66.Speakers) do
		v68:SendSystemMessage(p67, nil)
	end
end
function v_u_15.RegisterFilterMessageFunction(p69, p70, p71, p72) -- name: RegisterFilterMessageFunction
	if p69.FilterMessageFunctions:HasFunction(p70) then
		error(string.format("FilterMessageFunction \'%s\' already exists", p70))
	end
	p69.FilterMessageFunctions:AddFunction(p70, p71, p72)
end
function v_u_15.FilterMessageFunctionExists(p73, p74) -- name: FilterMessageFunctionExists
	return p73.FilterMessageFunctions:HasFunction(p74)
end
function v_u_15.UnregisterFilterMessageFunction(p75, p76) -- name: UnregisterFilterMessageFunction
	if not p75.FilterMessageFunctions:HasFunction(p76) then
		error(string.format("FilterMessageFunction \'%s\' does not exists", p76))
	end
	p75.FilterMessageFunctions:RemoveFunction(p76)
end
function v_u_15.RegisterProcessCommandsFunction(p77, p78, p79, p80) -- name: RegisterProcessCommandsFunction
	if p77.ProcessCommandsFunctions:HasFunction(p78) then
		error(string.format("ProcessCommandsFunction \'%s\' already exists", p78))
	end
	p77.ProcessCommandsFunctions:AddFunction(p78, p79, p80)
end
function v_u_15.ProcessCommandsFunctionExists(p81, p82) -- name: ProcessCommandsFunctionExists
	return p81.ProcessCommandsFunctions:HasFunction(p82)
end
function v_u_15.UnregisterProcessCommandsFunction(p83, p84) -- name: UnregisterProcessCommandsFunction
	if not p83.ProcessCommandsFunctions:HasFunction(p84) then
		error(string.format("ProcessCommandsFunction \'%s\' does not exist", p84))
	end
	p83.ProcessCommandsFunctions:RemoveFunction(p84)
end
local v_u_85 = 0
local v_u_86 = 0
local v_u_87 = 0
function v_u_15.InternalNotifyFilterIssue(p88) -- name: InternalNotifyFilterIssue
	-- upvalues: (ref) v_u_86, (ref) v_u_87, (ref) v_u_85, (ref) v_u_12, (copy) v_u_7
	if tick() - v_u_86 > 60 then
		v_u_87 = 0
	end
	v_u_87 = v_u_87 + 1
	v_u_86 = tick()
	if v_u_87 >= 3 and tick() - v_u_85 > 60 then
		v_u_85 = tick()
		local v89 = p88:GetChannel("System")
		if v89 then
			v89:SendSystemMessage(v_u_12:FormatMessageToSend("GameChat_ChatService_ChatFilterIssues", "The chat filter is currently experiencing issues and messages may be slow to appear."), v_u_7)
		end
	end
end
local v_u_90 = {}
function v_u_15.InternalApplyRobloxFilter(p91, p92, p_u_93, p_u_94) -- name: InternalApplyRobloxFilter
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_1, (copy) v_u_90
	if not v_u_3:IsServer() or v_u_3:IsStudio() then
		if not v_u_90[p_u_93] then
			v_u_90[p_u_93] = true
			wait()
		end
		return p_u_93
	end
	local v95 = p91:GetSpeaker(p92)
	if p_u_94 then
		p_u_94 = p91:GetSpeaker(p_u_94)
	end
	if v95 == nil then
		return nil
	end
	local v_u_96 = v95:GetPlayer()
	if p_u_94 then
		p_u_94 = p_u_94:GetPlayer()
	end
	if v_u_96 == nil then
		return p_u_93
	end
	local v97 = string.gsub(p_u_93, " ", "")
	if string.len(v97) == 0 then
		return p_u_93
	end
	local v98 = tick()
	local v99 = 0
	while true do
		local function v100()
			-- upvalues: (copy) p_u_94, (ref) v_u_4, (copy) p_u_93, (copy) v_u_96
			if p_u_94 then
				return v_u_4:FilterStringAsync(p_u_93, v_u_96, p_u_94)
			else
				return v_u_4:FilterStringForBroadcast(p_u_93, v_u_96)
			end
		end
		local v101, v102 = pcall(v100)
		if v101 then
			break
		end
		warn("Error filtering message:", v102)
		v99 = v99 + 1
		if v99 > 3 or tick() - v98 > 60 then
			p91:InternalNotifyFilterIssue()
			return nil
		end
		local v103 = v_u_1
		local v104 = #v_u_1
		local v105 = v103[math.min(v104, v99)]
		local v106 = v105 + (math.random() * 2 - 1) * v105
		wait(v106)
	end
	return v102
end
function v_u_15.InternalApplyRobloxFilterAndTranslate(p107, p108, p_u_109, p_u_110, p_u_111) -- name: InternalApplyRobloxFilterAndTranslate
	-- upvalues: (copy) v_u_3
	local v112 = v_u_3:IsServer()
	if v112 then
		v112 = not v_u_3:IsStudio()
	end
	if not v112 then
		wait()
		return true, false, p_u_110
	end
	local v113 = p107:GetSpeaker(p108)
	if v113 == nil then
		return false, nil, nil
	end
	local v_u_114 = v113:GetPlayer()
	if v_u_114 == nil then
		return true, false, p_u_110
	end
	local v115 = string.gsub(p_u_110, " ", "")
	if string.len(v115) == 0 then
		return true, false, p_u_110
	end
	local v116, v117 = pcall(function()
		-- upvalues: (copy) p_u_110, (copy) v_u_114, (copy) p_u_109, (copy) p_u_111
		return game:GetService("TextService"):FilterAndTranslateStringAsync(p_u_110, v_u_114.UserId, p_u_109, p_u_111)
	end)
	if v116 then
		return true, true, v117
	end
	warn("Error filtering and translating message", p_u_110, v117)
	p107:InternalNotifyFilterIssue()
	return false, nil, nil
end
function v_u_15.InternalApplyRobloxFilterNewAPI(p118, p119, p_u_120, p_u_121) -- name: InternalApplyRobloxFilterNewAPI
	-- upvalues: (copy) v_u_3
	local v122 = v_u_3:IsServer()
	if v122 then
		v122 = not v_u_3:IsStudio()
	end
	if not v122 then
		wait()
		return true, false, p_u_120
	end
	local v123 = p118:GetSpeaker(p119)
	if v123 == nil then
		return false, nil, nil
	end
	local v_u_124 = v123:GetPlayer()
	if v_u_124 == nil then
		return true, false, p_u_120
	end
	local v125 = string.gsub(p_u_120, " ", "")
	if string.len(v125) == 0 then
		return true, false, p_u_120
	end
	local v126, v127 = pcall(function()
		-- upvalues: (copy) p_u_120, (copy) v_u_124, (copy) p_u_121
		return game:GetService("TextService"):FilterStringAsync(p_u_120, v_u_124.UserId, p_u_121)
	end)
	if v126 then
		return true, true, v127
	end
	warn("Error filtering message:", p_u_120, v127)
	p118:InternalNotifyFilterIssue()
	return false, nil, nil
end
function v_u_15.InternalDoMessageFilter(p128, p_u_129, p_u_130, p_u_131) -- name: InternalDoMessageFilter
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
function v_u_15.InternalDoProcessCommands(p136, p_u_137, p_u_138, p_u_139) -- name: InternalDoProcessCommands
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
function v_u_15.InternalGetUniqueMessageId(p145) -- name: InternalGetUniqueMessageId
	local v146 = p145.MessageIdCounter
	p145.MessageIdCounter = v146 + 1
	return v146
end
function v_u_15.InternalAddSpeakerWithPlayerObject(p_u_147, p_u_148, p149, p150) -- name: InternalAddSpeakerWithPlayerObject
	-- upvalues: (copy) v_u_10
	if p_u_147.Speakers[p_u_148:lower()] then
		error("Speaker \"" .. p_u_148 .. "\" already exists!")
	end
	local v151 = v_u_10.new(p_u_147, p_u_148)
	v151:InternalAssignPlayerObject(p149)
	p_u_147.Speakers[p_u_148:lower()] = v151
	if p150 then
		local v152, v153 = pcall(function()
			-- upvalues: (copy) p_u_147, (copy) p_u_148
			p_u_147.eSpeakerAdded:Fire(p_u_148)
		end)
		if not v152 and v153 then
			print("Error adding speaker: " .. v153)
		end
	end
	return v151
end
function v_u_15.InternalFireSpeakerAdded(p_u_154, p_u_155) -- name: InternalFireSpeakerAdded
	local v156, v157 = pcall(function()
		-- upvalues: (copy) p_u_154, (copy) p_u_155
		p_u_154.eSpeakerAdded:Fire(p_u_155)
	end)
	if not v156 and v157 then
		print("Error firing speaker added: " .. v157)
	end
end
function v2.new() -- name: new
	-- upvalues: (copy) v_u_15, (copy) v_u_11
	local v158 = v_u_15
	local v159 = setmetatable({}, v158)
	v159.MessageIdCounter = 0
	v159.ChatChannels = {}
	v159.Speakers = {}
	v159.FilterMessageFunctions = v_u_11:NewSortedFunctionContainer()
	v159.ProcessCommandsFunctions = v_u_11:NewSortedFunctionContainer()
	v159.eChannelAdded = Instance.new("BindableEvent")
	v159.eChannelRemoved = Instance.new("BindableEvent")
	v159.eSpeakerAdded = Instance.new("BindableEvent")
	v159.eSpeakerRemoved = Instance.new("BindableEvent")
	v159.ChannelAdded = v159.eChannelAdded.Event
	v159.ChannelRemoved = v159.eChannelRemoved.Event
	v159.SpeakerAdded = v159.eSpeakerAdded.Event
	v159.SpeakerRemoved = v159.eSpeakerRemoved.Event
	v159.ChatServiceMajorVersion = 0
	v159.ChatServiceMinorVersion = 5
	return v159
end
return v2.new()