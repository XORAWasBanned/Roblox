-- Path: CoreGui.RobloxGui.Modules.Server.ServerChat.DefaultChatModules.ChatFloodDetector
local v1 = game:GetService("Chat"):WaitForChild("ClientChatModules")
local v_u_2 = require(v1:WaitForChild("ChatConstants"))
local v3, v4 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserAddChatThrottlingToAllChannels")
end)
if not v3 then
	v4 = false
end
local v_u_5 = not v4
local v_u_6 = {}
local v_u_7 = {}
local v_u_8 = nil
local function v9()
	-- upvalues: (ref) v_u_8
	v_u_8 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end
pcall(v9)
v_u_8 = v_u_8 == nil and {} or v_u_8
if not (v_u_8.FormatMessageToSend and v_u_8.LocalizeFormattedMessage) then
	function v_u_8.FormatMessageToSend(_, _, p10) -- name: FormatMessageToSend
		return p10
	end
end
return function(p_u_11) -- name: Run
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (ref) v_u_5, (ref) v_u_8, (copy) v_u_2
	p_u_11:RegisterProcessCommandsFunction("flood_detection", function(p12, _, p13) -- name: FloodDetectionProcessCommandsFunction
		-- upvalues: (ref) v_u_7, (copy) p_u_11, (ref) v_u_6, (ref) v_u_5, (ref) v_u_8
		if v_u_7[p12] then
			return false
		end
		local v14 = p_u_11:GetSpeaker(p12)
		if not v14 then
			return false
		end
		if not v14:GetPlayer() then
			return false
		end
		if not v_u_6[p12] then
			v_u_6[p12] = {}
		end
		local v15
		if v_u_5 then
			if not v_u_6[p12][p13] then
				v_u_6[p12][p13] = {}
			end
			v15 = v_u_6[p12][p13]
		else
			v15 = v_u_6[p12]
		end
		local v16 = tick()
		while #v15 > 0 and v15[1] < v16 do
			table.remove(v15, 1)
		end
		if #v15 < 7 then
			local v17 = tick() + 15
			table.insert(v15, v17)
			return false
		end
		local v18 = v15[1] - v16
		local v19 = math.ceil(v18)
		v14:SendSystemMessage(v_u_8:FormatMessageToSend("GameChat_ChatFloodDetector_MessageDisplaySeconds", string.format("You must wait %d %s before sending another message!", v19, v19 > 1 and "seconds" or "second"), "RBX_NUMBER", (tostring(v19))), p13)
		return true
	end, v_u_2.LowPriority)
	p_u_11.SpeakerRemoved:connect(function(p20)
		-- upvalues: (ref) v_u_6
		v_u_6[p20] = nil
	end)
end