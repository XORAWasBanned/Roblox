-- Path: CoreGui.RobloxGui.Modules.Server.ServerChat.DefaultChatModules.ChatCommandsTeller
local v1 = game:GetService("Chat"):WaitForChild("ClientChatModules")
local v_u_2 = require(v1:WaitForChild("ChatSettings"))
local v_u_3 = require(v1:WaitForChild("ChatConstants"))
local v_u_4 = nil
local function v5()
	-- upvalues: (ref) v_u_4
	v_u_4 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end
pcall(v5)
v_u_4 = v_u_4 == nil and {} or v_u_4
if not (v_u_4.FormatMessageToSend and v_u_4.LocalizeFormattedMessage) then
	function v_u_4.FormatMessageToSend(_, _, p6) -- name: FormatMessageToSend
		return p6
	end
end
return function(p_u_7) -- name: Run
	-- upvalues: (copy) v_u_2, (ref) v_u_4, (copy) v_u_3
	p_u_7:RegisterProcessCommandsFunction("chat_commands_inquiry", function(p8, p9, p10) -- name: ProcessCommandsFunction
		-- upvalues: (copy) p_u_7, (ref) v_u_4, (ref) v_u_2
		if p9:lower() ~= "/?" and p9:lower() ~= "/help" then
			return false
		end
		local v11 = p_u_7:GetSpeaker(p8)
		v11:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_ChatCommandsTeller_Desc", "These are the basic chat commands."), p10)
		if v_u_2.AllowMeCommand then
			v11:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_ChatCommandsTeller_MeCommand", "/me <text> : roleplaying command for doing actions."), p10)
		end
		v11:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_ChatCommandsTeller_SwitchChannelCommand", "/c <channel> : switch channel menu tabs."), p10)
		local v12
		if v_u_2.ShowJoinAndLeaveHelpText == nil then
			v12 = false
		else
			v12 = v_u_2.ShowJoinAndLeaveHelpText
		end
		if v12 then
			v11:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_ChatCommandsTeller_JoinChannelCommand", "/join <channel> or /j <channel> : join channel."), p10)
			v11:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_ChatCommandsTeller_LeaveChannelCommand", "/leave <channel> or /l <channel> : leave channel. (leaves current if none specified)"), p10)
		end
		v11:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_ChatCommandsTeller_WhisperCommand", "/whisper <speaker> or /w <speaker> : open private message channel with speaker."), p10)
		v11:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_ChatCommandsTeller_MuteCommand", "/mute <speaker> : mute a speaker."), p10)
		v11:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_ChatCommandsTeller_UnMuteCommand", "/unmute <speaker> : unmute a speaker."), p10)
		local v13 = v11:GetPlayer()
		if v13 and v13.Team then
			v11:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_ChatCommandsTeller_TeamCommand", "/team <message> or /t <message> : send a team chat to players on your team."), p10)
		end
		return true
	end, v_u_3.StandardPriority)
	local v14 = v_u_2.GeneralChannelName and p_u_7:GetChannel(v_u_2.GeneralChannelName)
	if v14 then
		v14.WelcomeMessage = v_u_4:FormatMessageToSend("GameChat_ChatCommandsTeller_AllChannelWelcomeMessage", "Chat \'/?\' or \'/help\' for a list of chat commands.")
	end
end