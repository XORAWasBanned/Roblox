-- Path: CoreGui.RobloxGui.Modules.Server.ServerChat.DefaultChatModules.TeamChat
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
local v_u_7 = {
	["ChatColor"] = v_u_2.ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
}
return function(p_u_8) -- name: Run
	-- upvalues: (ref) v_u_4, (copy) v_u_3, (copy) v_u_7, (copy) v_u_2
	local v9 = game:GetService("Players")
	local v_u_10 = p_u_8:AddChannel("Team")
	v_u_10.WelcomeMessage = v_u_4:FormatMessageToSend("GameChat_TeamChat_WelcomeMessage", "This is a private channel between you and your team members.")
	v_u_10.Joinable = false
	v_u_10.Leavable = false
	v_u_10.AutoJoin = false
	v_u_10.Private = true
	v_u_10:RegisterProcessCommandsFunction("replication_function", function(p11, p12, p13) -- name: TeamChatReplicationFunction
		-- upvalues: (copy) p_u_8
		local v14 = p_u_8:GetSpeaker(p11)
		local v15 = p_u_8:GetChannel(p13)
		local v16 = v14 and (v15 and v14:GetPlayer())
		if v16 then
			for _, v17 in pairs(v15:GetSpeakerList()) do
				local v18 = p_u_8:GetSpeaker(v17)
				if not v18 then
					continue
				end
				local v19 = v18:GetPlayer()
				if not v19 or v16.Team ~= v19.Team then
					continue
				end
				v18:SendMessage(p12, p13, p11, {
					["NameColor"] = v16.TeamColor.Color,
					["ChatColor"] = v16.TeamColor.Color,
					["ChannelColor"] = v16.TeamColor.Color
				})
			end
		end
		return true
	end, v_u_3.LowPriority)
	local function v_u_27(p20, p21, p22) -- name: DoTeamCommand
		-- upvalues: (copy) p_u_8, (ref) v_u_4, (ref) v_u_7
		local v23 = p21 == nil and "" or p21
		local v24 = p_u_8:GetSpeaker(p20)
		local v25 = v24 and v24:GetPlayer()
		if v25 then
			if v25.Team == nil then
				v24:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_TeamChat_CannotTeamChatIfNotInTeam", "You cannot team chat if you are not on a team!"), p22, v_u_7)
				return
			end
			local v26 = p_u_8:GetChannel("Team")
			if v26 then
				if not v24:IsInChannel(v26.Name) then
					v24:JoinChannel(v26.Name)
				end
				if v23 and string.len(v23) > 0 then
					v24:SayMessage(v23, v26.Name)
				end
				v24:SetMainChannel(v26.Name)
			end
		end
	end
	p_u_8:RegisterProcessCommandsFunction("team_commands", function(p28, p29, p30) -- name: TeamCommandsFunction
		-- upvalues: (copy) v_u_27
		local v31 = false
		if p29 == nil then
			error("Message is nil")
		end
		if p30 == "Team" then
			return false
		elseif string.sub(p29, 1, 6):lower() == "/team " or p29:lower() == "/team" then
			v_u_27(p28, string.sub(p29, 7), p30)
			return true
		elseif string.sub(p29, 1, 3):lower() == "/t " or p29:lower() == "/t" then
			v_u_27(p28, string.sub(p29, 4), p30)
			return true
		else
			if string.sub(p29, 1, 2):lower() == "% " or p29:lower() == "%" then
				v_u_27(p28, string.sub(p29, 3), p30)
				v31 = true
			end
			return v31
		end
	end, v_u_3.StandardPriority)
	local function v_u_32() -- name: GetDefaultChannelNameColor
		-- upvalues: (ref) v_u_2
		if v_u_2.DefaultChannelNameColor then
			return v_u_2.DefaultChannelNameColor
		else
			return Color3.fromRGB(35, 76, 142)
		end
	end
	local function v_u_35(p33, p34) -- name: PutSpeakerInCorrectTeamChatState
		-- upvalues: (copy) v_u_10, (copy) v_u_32
		if p34.Neutral or p34.Team == nil then
			p33:UpdateChannelNameColor(v_u_10.Name, v_u_32())
			if p33:IsInChannel(v_u_10.Name) then
				p33:LeaveChannel(v_u_10.Name)
				return
			end
		elseif not p34.Neutral and p34.Team then
			p33:UpdateChannelNameColor(v_u_10.Name, p34.Team.TeamColor.Color)
			if not p33:IsInChannel(v_u_10.Name) then
				p33:JoinChannel(v_u_10.Name)
			end
		end
	end
	p_u_8.SpeakerAdded:connect(function(p36)
		-- upvalues: (copy) p_u_8, (copy) v_u_35
		local v37 = p_u_8:GetSpeaker(p36)
		local v38 = v37 and v37:GetPlayer()
		if v38 then
			v_u_35(v37, v38)
		end
	end)
	local v_u_39 = {}
	v9.PlayerAdded:connect(function(p_u_40)
		-- upvalues: (copy) p_u_8, (copy) v_u_35, (copy) v_u_10, (ref) v_u_4, (copy) v_u_39
		v_u_39[p_u_40] = p_u_40.Changed:connect(function(p41)
			-- upvalues: (ref) p_u_8, (copy) p_u_40, (ref) v_u_35, (ref) v_u_10, (ref) v_u_4
			local v42 = p_u_8:GetSpeaker(p_u_40.Name)
			if v42 then
				if p41 == "Neutral" then
					v_u_35(v42, p_u_40)
					return
				end
				if p41 == "Team" then
					v_u_35(v42, p_u_40)
					if v42:IsInChannel(v_u_10.Name) then
						v42:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_TeamChat_NowInTeam", string.format("You are now on the \'%s\' team.", p_u_40.Team.Name), "RBX_NAME", p_u_40.Team.Name), v_u_10.Name)
					end
				end
			end
		end)
	end)
	v9.PlayerRemoving:connect(function(p43)
		-- upvalues: (copy) v_u_39
		local v44 = v_u_39[p43]
		if v44 then
			v44:Disconnect()
		end
		v_u_39[p43] = nil
	end)
end