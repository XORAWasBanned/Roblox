-- Path: CoreGui.RobloxGui.Modules.Server.ServerChat.DefaultChatModules.FriendJoinNotifier
local v1 = game:GetService("Chat")
local v_u_2 = game:GetService("Players")
game:GetService("FriendService")
local v3 = v1:WaitForChild("ClientChatModules")
local v_u_4 = require(v3:WaitForChild("ChatSettings"))
require(v3:WaitForChild("ChatConstants"))
local v5, v_u_6 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserHandleFriendJoinNotifierOnClient")
end)
if not v5 then
	v_u_6 = false
end
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
	["ChatColor"] = Color3.fromRGB(255, 255, 255)
}
return function(p_u_11) -- name: Run
	-- upvalues: (ref) v_u_6, (copy) v_u_4, (ref) v_u_7, (copy) v_u_10, (copy) v_u_2
	local function v_u_16(p12, p13) -- name: SendFriendJoinNotification
		-- upvalues: (copy) p_u_11, (ref) v_u_4, (ref) v_u_7, (ref) v_u_10
		local v14 = p_u_11:GetSpeaker(p12.Name)
		if v14 then
			local v15 = p13.Name
			if v_u_4.PlayerDisplayNamesEnabled then
				v15 = p13.DisplayName
			end
			v14:SendSystemMessage(v_u_7:FormatMessageToSend("GameChat_FriendChatNotifier_JoinMessage", string.format("Your friend %s has joined the game.", v15), "RBX_NAME", v15), "System", v_u_10)
		end
	end
	local v17
	if v_u_6 == false and v_u_4.ShowFriendJoinNotification ~= nil then
		v17 = v_u_4.ShowFriendJoinNotification
	else
		v17 = false
	end
	if v17 then
		v_u_2.PlayerAdded:connect(function(p_u_18)
			-- upvalues: (ref) v_u_2, (copy) v_u_16
			local v19 = v_u_2:GetPlayers()
			for v20 = 1, #v19 do
				local v_u_21 = v19[v20]
				if v_u_21 == p_u_18 then
					continue
				end
				coroutine.wrap(function()
					-- upvalues: (copy) v_u_21, (copy) p_u_18, (ref) v_u_16
					if v_u_21:IsFriendsWith(p_u_18.UserId) then
						v_u_16(v_u_21, p_u_18)
					end
				end)()
			end
		end)
	end
end