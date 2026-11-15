-- Path: CoreGui.RobloxGui.Modules.Server.ServerChat.DefaultChatModules.ChatMessageValidator
local v_u_1 = game:GetService("Chat")
local v_u_2 = game:GetService("RunService")
local v3 = v_u_1:WaitForChild("ClientChatModules")
local v_u_4 = require(v3:WaitForChild("ChatSettings"))
local v_u_5 = require(v3:WaitForChild("ChatConstants"))
local v_u_6 = nil
local function v7()
	-- upvalues: (ref) v_u_6
	v_u_6 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end
pcall(v7)
v_u_6 = v_u_6 == nil and {} or v_u_6
if not (v_u_6.FormatMessageToSend and v_u_6.LocalizeFormattedMessage) then
	function v_u_6.FormatMessageToSend(_, _, p8) -- name: FormatMessageToSend
		return p8
	end
end
local v_u_9 = not v_u_4.DisallowedWhiteSpace and {
	"\n",
	"\r",
	"\t",
	"\11",
	"\f"
} or v_u_4.DisallowedWhiteSpace
local function v_u_11(p10) -- name: isMessageValidServer
	-- upvalues: (copy) v_u_4
	if p10:len() > v_u_4.MaximumMessageLength * 6 then
		return false
	elseif utf8.len(p10) == nil then
		return false
	else
		return utf8.len(utf8.nfcnormalize(p10)) <= v_u_4.MaximumMessageLength
	end
end
return function(p_u_12) -- name: Run
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (ref) v_u_6, (copy) v_u_11, (ref) v_u_9, (copy) v_u_5
	p_u_12:RegisterProcessCommandsFunction("message_validation", function(p13, p14, p15) -- name: ValidateChatFunction
		-- upvalues: (copy) p_u_12, (ref) v_u_2, (ref) v_u_1, (ref) v_u_6, (ref) v_u_11, (ref) v_u_9
		local v16 = p_u_12:GetSpeaker(p13)
		local v_u_17 = v16:GetPlayer()
		if v16 then
			if v_u_17 then
				if v_u_2:IsStudio() or v_u_17.UserId >= 1 then
					local v18
					if v_u_2:IsStudio() then
						v18 = true
					else
						local function v19()
							-- upvalues: (ref) v_u_1, (copy) v_u_17
							return v_u_1:CanUserChatAsync(v_u_17.UserId)
						end
						local v20, v21 = pcall(v19)
						v18 = v20 and v21
					end
					if v18 then
						if v_u_11(p14) then
							for _, v22 in pairs(v_u_9) do
								if not p14:find(v22) then
									continue
								end
								v16:SendSystemMessage(v_u_6:FormatMessageToSend("GameChat_ChatMessageValidator_WhitespaceError", "Your message contains whitespace that is not allowed."), p15)
								return true
							end
							return false
						else
							v16:SendSystemMessage(v_u_6:FormatMessageToSend("GameChat_ChatMessageValidator_MaxLengthError", "Your message exceeds the maximum message length."), p15)
							return true
						end
					else
						v16:SendSystemMessage(v_u_6:FormatMessageToSend("GameChat_ChatMessageValidator_SettingsError", "Your chat settings prevent you from sending messages."), p15)
						return true
					end
				else
					return true
				end
			else
				return false
			end
		else
			return false
		end
	end, v_u_5.VeryHighPriority)
end