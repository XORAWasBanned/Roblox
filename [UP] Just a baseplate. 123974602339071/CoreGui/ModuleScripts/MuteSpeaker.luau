-- Path: CoreGui.RobloxGui.Modules.Server.ServerChat.DefaultChatModules.MuteSpeaker
local v1 = game:GetService("Chat")
local v2 = v1:WaitForChild("ClientChatModules")
local v3 = v1:WaitForChild("ChatModules")
local v_u_4 = require(v2:WaitForChild("ChatConstants"))
local v_u_5 = require(v2:WaitForChild("ChatSettings"))
local v_u_6 = require(v3.Utility.DisplayNameHelpers)
local v_u_7 = nil
local function v8()
	-- upvalues: (ref) v_u_7
	v_u_7 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end
pcall(v8)
v_u_7 = v_u_7 == nil and {} or v_u_7
if not (v_u_7.FormatMessageToSend and v_u_7.LocalizeFormattedMessage) then
	function v_u_7.FormatMessageToSend(_, _, p9) -- name: FormatMessageToSend
		return p9
	end
end
local v_u_10 = {
	["ChatColor"] = v_u_5.ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
}
return function(p_u_11) -- name: Run
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (ref) v_u_7, (copy) v_u_10, (copy) v_u_4
	local function v_u_22(p12, p13, p14) -- name: DoMuteCommand
		-- upvalues: (copy) p_u_11, (ref) v_u_5, (ref) v_u_6, (ref) v_u_7, (ref) v_u_10
		if string.sub(p13, 1, 1) == "\"" then
			local v15 = string.find(p13, "\"", 2)
			if v15 then
				local v16 = v15 - 1
				p13 = string.sub(p13, 2, v16)
			end
		else
			p13 = string.match(p13, "^[^%s]+") or p13
		end
		local v17 = p_u_11:GetSpeaker(p12)
		if v17 then
			local v18, v19
			if v_u_5.PlayerDisplayNamesEnabled then
				v18, v19 = v_u_6.getUserNameFromChattedName(p13, p12, v17:GetNameForDisplay())
			else
				v18, v19 = v_u_6.getUserNameFromChattedName(p13, p12, nil)
			end
			local v20 = p_u_11:GetSpeaker(v18)
			if v19 == v_u_6.CommandErrorCodes.ChattingToSelf then
				v17:SendSystemMessage(v_u_7:FormatMessageToSend("GameChat_DoMuteCommand_CannotMuteSelf", "You cannot mute yourself."), p14, v_u_10)
				return
			end
			if v19 == v_u_6.CommandErrorCodes.NoMatches then
				v17:SendSystemMessage(v_u_7:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker \'%s\' does not exist.", (tostring(p13))), "RBX_NAME", (tostring(v18))), p14, v_u_10)
				return
			end
			if v19 == v_u_6.CommandErrorCodes.MultipleMatches then
				local v21 = v_u_6.getUsersWithDisplayNameString(p13, p12)
				v17:SendSystemMessage(v_u_7:FormatMessageToSend("InGame.Chat.Response.DisplayNameMultipleMatches", "Warning: The following users have this display name: "), p14, v_u_10)
				v17:SendSystemMessage(v21, p14, v_u_10)
				return
			end
			if v20 then
				v17:AddMutedSpeaker(v20.Name)
				if v_u_5.PlayerDisplayNamesEnabled then
					v18 = v20:GetNameForDisplay()
				end
				v17:SendSystemMessage(v_u_7:FormatMessageToSend("GameChat_ChatMain_SpeakerHasBeenMuted", string.format("Speaker \'%s\' has been muted.", v18), "RBX_NAME", v18), p14)
			end
		end
	end
	local function v_u_33(p23, p24, p25) -- name: DoUnmuteCommand
		-- upvalues: (copy) p_u_11, (ref) v_u_5, (ref) v_u_6, (ref) v_u_7, (ref) v_u_10
		if string.sub(p24, 1, 1) == "\"" then
			local v26 = string.find(p24, "\"", 2)
			if v26 then
				local v27 = v26 - 1
				p24 = string.sub(p24, 2, v27)
			end
		else
			p24 = string.match(p24, "^[^%s]+") or p24
		end
		local v28 = p_u_11:GetSpeaker(p23)
		if v28 then
			local v29, v30
			if v_u_5.PlayerDisplayNamesEnabled then
				v29, v30 = v_u_6.getUserNameFromChattedName(p24, p23, v28:GetNameForDisplay())
			else
				v29, v30 = v_u_6.getUserNameFromChattedName(p24, p23, nil)
			end
			local v31 = p_u_11:GetSpeaker(v29)
			if v30 == v_u_6.CommandErrorCodes.ChattingToSelf then
				v28:SendSystemMessage(v_u_7:FormatMessageToSend("GameChat_DoMuteCommand_CannotMuteSelf", "You cannot mute yourself."), p25, v_u_10)
				return
			end
			if v30 == v_u_6.CommandErrorCodes.NoMatches then
				v28:SendSystemMessage(v_u_7:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker \'%s\' does not exist.", (tostring(v29))), "RBX_NAME", (tostring(v29))), p25, v_u_10)
				return
			end
			if v30 == v_u_6.CommandErrorCodes.MultipleMatches then
				local v32 = v_u_6.getUsersWithDisplayNameString(p24, p23)
				v28:SendSystemMessage(v_u_7:FormatMessageToSend("InGame.Chat.Response.DisplayNameMultipleMatches", "Warning: The following users have this display name: "), p25, v_u_10)
				v28:SendSystemMessage(v32, p25, v_u_10)
				return
			end
			if v31 then
				v28:RemoveMutedSpeaker(v31.Name)
				if v_u_5.PlayerDisplayNamesEnabled then
					v29 = v31:GetNameForDisplay()
				end
				v28:SendSystemMessage(v_u_7:FormatMessageToSend("GameChat_ChatMain_SpeakerHasBeenUnMuted", string.format("Speaker \'%s\' has been unmuted.", v29), "RBX_NAME", v29), p25)
				return
			end
		end
	end
	p_u_11:RegisterProcessCommandsFunction("mute_commands", function(p34, p35, p36) -- name: MuteCommandsFunction
		-- upvalues: (copy) v_u_22, (copy) v_u_33
		local v37 = false
		if string.sub(p35, 1, 6):lower() == "/mute " then
			v_u_22(p34, string.sub(p35, 7), p36)
			return true
		else
			if string.sub(p35, 1, 8):lower() == "/unmute " then
				v_u_33(p34, string.sub(p35, 9), p36)
				v37 = true
			end
			return v37
		end
	end, v_u_4.StandardPriority)
end