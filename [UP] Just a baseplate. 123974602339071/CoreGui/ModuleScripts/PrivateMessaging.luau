-- Path: CoreGui.RobloxGui.Modules.Server.ServerChat.DefaultChatModules.PrivateMessaging
local v_u_1 = game:GetService("Chat")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("TextChatService")
local v4 = v_u_1:WaitForChild("ClientChatModules")
local v5 = v_u_1:WaitForChild("ChatModules")
local v_u_6 = require(v4:WaitForChild("ChatConstants"))
local v_u_7 = require(v4:WaitForChild("ChatSettings"))
local v_u_8 = require(v5.Utility.DisplayNameHelpers)
local v_u_9 = nil
local function v10()
	-- upvalues: (ref) v_u_9
	v_u_9 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end
pcall(v10)
v_u_9 = v_u_9 == nil and {} or v_u_9
if not (v_u_9.FormatMessageToSend and v_u_9.LocalizeFormattedMessage) then
	function v_u_9.FormatMessageToSend(_, _, p11) -- name: FormatMessageToSend
		return p11
	end
end
local v_u_12 = {
	["ChatColor"] = v_u_7.ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
}
local v13, v_u_14 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserUseNewDirectChatAPI")
end)
if not v13 then
	v_u_14 = false
end
return function(p_u_15) -- name: Run
	-- upvalues: (copy) v_u_2, (ref) v_u_14, (copy) v_u_3, (copy) v_u_1, (copy) v_u_7, (copy) v_u_8, (ref) v_u_9, (copy) v_u_12, (copy) v_u_6
	local function v_u_26(p16, p17) -- name: CanCommunicate
		-- upvalues: (ref) v_u_2, (ref) v_u_14, (ref) v_u_3, (ref) v_u_1
		if v_u_2:IsStudio() then
			return true
		end
		local v_u_18 = p16:GetPlayer()
		local v_u_19 = p17:GetPlayer()
		if not (v_u_18 and v_u_19) then
			return false
		end
		if not v_u_14 then
			local function v20()
				-- upvalues: (ref) v_u_1, (copy) v_u_18, (copy) v_u_19
				return v_u_1:CanUsersChatAsync(v_u_18.UserId, v_u_19.UserId)
			end
			local v21, v22 = pcall(v20)
			return v21 and v22
		end
		local function v23()
			-- upvalues: (ref) v_u_3, (copy) v_u_18, (copy) v_u_19
			return v_u_3:CanUsersDirectChatAsync(v_u_18.UserId, { v_u_19.UserId })
		end
		local v24, v25 = pcall(v23)
		if v24 then
			v24 = #v25 > 0
		end
		return v24
	end
	local function v_u_42(p27, p28, p29) -- name: DoWhisperCommand
		-- upvalues: (copy) p_u_15, (ref) v_u_7, (ref) v_u_8, (ref) v_u_9, (ref) v_u_12, (ref) v_u_6, (copy) v_u_26
		local v30 = p_u_15:GetSpeaker(p27)
		local v31 = nil
		local v32
		if string.sub(p28, 1, 1) == "\"" then
			local v33 = string.find(p28, "\"", 2)
			if v33 then
				local v34 = v33 - 1
				v32 = string.sub(p28, 2, v34)
				local v35 = v33 + 2
				v31 = string.sub(p28, v35)
			else
				v32 = p28
			end
		else
			v32 = string.match(p28, "^[^%s]+")
			if v32 then
				local v36 = string.len(v32) + 2
				v31 = string.sub(p28, v36)
			else
				v32 = p28
			end
		end
		local v37, v38
		if v_u_7.PlayerDisplayNamesEnabled and v_u_7.WhisperByDisplayNameEnabled then
			v37, v38 = v_u_8.getUserNameFromChattedName(v32, p27, v30:GetNameForDisplay())
		else
			v37, v38 = v_u_8.getUserNameFromChattedName(v32, p27, nil)
		end
		local v39 = p_u_15:GetSpeaker(v37)
		if v38 == v_u_8.CommandErrorCodes.ChattingToSelf then
			v30:SendSystemMessage(v_u_9:FormatMessageToSend("GameChat_PrivateMessaging_CannotWhisperToSelf", "You cannot whisper to yourself."), p29, v_u_12)
			return
		elseif v38 == v_u_8.CommandErrorCodes.NoMatches then
			v30:SendSystemMessage(v_u_9:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker \'%s\' does not exist.", (tostring(v32))), "RBX_NAME", (tostring(v37))), p29, v_u_12)
			return
		elseif v38 == v_u_8.CommandErrorCodes.MultipleMatches then
			local v40 = v_u_8.getUsersWithDisplayNameString(v32, p27)
			v30:SendSystemMessage(v_u_9:FormatMessageToSend("InGame.Chat.Response.DisplayNameMultipleMatches", "Warning: The following users have this display name: "), p29, v_u_12)
			v30:SendSystemMessage(v40, p29, v_u_12)
		elseif v39 then
			local v41 = p_u_15:GetChannel((not v_u_6.WhisperChannelPrefix and "To " or v_u_6.WhisperChannelPrefix) .. v37)
			if v41 then
				if v_u_26(v30, v39) then
					if not v30:IsInChannel(v41.Name) then
						v30:JoinChannel(v41.Name)
					end
					if v31 and string.len(v31) > 0 then
						v30:SayMessage(v31, v41.Name)
					end
					v30:SetMainChannel(v41.Name)
				else
					v30:SendSystemMessage(v_u_9:FormatMessageToSend("GameChat_PrivateMessaging_CannotChat", "You are not able to chat with this player."), p29, v_u_12)
				end
			end
			v30:SendSystemMessage(v_u_9:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker \'%s\' does not exist.", (tostring(v32))), "RBX_NAME", (tostring(v37))), p29, v_u_12)
		end
	end
	local function v_u_50(p43, p44, p45) -- name: PrivateMessageReplicationFunction
		-- upvalues: (copy) p_u_15, (ref) v_u_6
		local v46 = p_u_15:GetSpeaker(p43)
		local v47 = v46.ExtraData
		v46:SendMessage(p44, p45, p43, v47)
		local v48 = p_u_15:GetSpeaker((string.sub(p45, 4)))
		local v49 = (not v_u_6.WhisperChannelPrefix and "To " or v_u_6.WhisperChannelPrefix) .. p43
		if v48 then
			if not v48:IsInChannel(v49) then
				v48:JoinChannel(v49)
			end
			v48:SendMessage(p44, v49, p43, v47)
		end
		return true
	end
	local function v_u_52(_, p51, _) -- name: PrivateMessageAddTypeFunction
		-- upvalues: (ref) v_u_6
		if v_u_6.MessageTypeWhisper then
			p51.MessageType = v_u_6.MessageTypeWhisper
		end
	end
	p_u_15:RegisterProcessCommandsFunction("whisper_commands", function(p53, p54, p55) -- name: WhisperCommandsFunction
		-- upvalues: (copy) v_u_42
		local v56 = false
		if string.sub(p54, 1, 3):lower() == "/w " then
			v_u_42(p53, string.sub(p54, 4), p55)
			return true
		else
			if string.sub(p54, 1, 9):lower() == "/whisper " then
				v_u_42(p53, string.sub(p54, 10), p55)
				v56 = true
			end
			return v56
		end
	end, v_u_6.StandardPriority)
	p_u_15.SpeakerAdded:connect(function(p57)
		-- upvalues: (copy) p_u_15, (ref) v_u_7, (ref) v_u_6, (ref) v_u_9, (copy) v_u_50, (copy) v_u_52
		local v58 = p_u_15:GetSpeaker(p57)
		local v59
		if v_u_7.PlayerDisplayNamesEnabled and v58:GetPlayer() then
			v59 = v58:GetNameForDisplay() .. "(@" .. p57 .. ")"
		else
			v59 = p57
		end
		local v60 = (not v_u_6.WhisperChannelPrefix and "To " or v_u_6.WhisperChannelPrefix) .. p57
		if p_u_15:GetChannel(v60) then
			p_u_15:RemoveChannel(v60)
		end
		local v61 = p_u_15:AddChannel(v60)
		v61.Joinable = false
		v61.Leavable = true
		v61.AutoJoin = false
		v61.Private = true
		v61.WelcomeMessage = v_u_9:FormatMessageToSend("GameChat_PrivateMessaging_NowChattingWith", "You are now privately chatting with " .. v59 .. ".", "RBX_NAME", (tostring(v59)))
		local v62
		if v_u_7.WhisperChannelNameColor then
			v62 = v_u_7.WhisperChannelNameColor
		else
			v62 = Color3.fromRGB(102, 14, 102)
		end
		v61.ChannelNameColor = v62
		v61:RegisterProcessCommandsFunction("replication_function", v_u_50, v_u_6.LowPriority)
		v61:RegisterFilterMessageFunction("message_type_function", v_u_52)
	end)
	p_u_15.SpeakerRemoved:connect(function(p63)
		-- upvalues: (ref) v_u_6, (copy) p_u_15
		local v64 = (not v_u_6.WhisperChannelPrefix and "To " or v_u_6.WhisperChannelPrefix) .. p63
		if p_u_15:GetChannel(v64) then
			p_u_15:RemoveChannel(v64)
		end
	end)
end