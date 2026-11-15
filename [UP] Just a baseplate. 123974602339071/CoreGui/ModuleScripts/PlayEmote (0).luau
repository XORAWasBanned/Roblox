-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.DefaultClientChatModules.CommandModules.PlayEmote
local v_u_1 = game:GetService("Chat")
local v2 = game:GetService("Players")
local v3 = script.Parent
local v_u_4 = require(v3:WaitForChild("Util"))
local v_u_5 = nil
local function v6()
	-- upvalues: (ref) v_u_5, (copy) v_u_1
	v_u_5 = require(v_u_1.ClientChatModules.ChatLocalization)
end
pcall(v6)
v_u_5 = v_u_5 == nil and {
	["Get"] = function(_, _, p7) -- name: Get
		return p7
	end
} or v_u_5
local v_u_8 = v2.LocalPlayer
local v_u_9 = {
	["wave"] = true,
	["point"] = true,
	["dance"] = true,
	["dance2"] = true,
	["dance3"] = true,
	["laugh"] = true,
	["cheer"] = true
}
local v_u_10 = {
	["InGame.Chat.Response.EmotesNotSupported"] = "You can\'t use Emotes here.",
	["InGame.Chat.Response.EmotesWrongAvatarType"] = "Only R15 avatars can use Emotes.",
	["InGame.Chat.ErrorMessageSwitchToR15"] = "Switch to your R15 avatar to play Emote.",
	["InGame.Chat.Response.EmoteNotAvailable"] = "You can\'t use that Emote.",
	["InGame.Chat.Response.EmotesTemporarilyUnavailable"] = "You can\'t use Emotes right now.",
	["InGame.Chat.ErrorMessageAnimationPlaying"] = "You cannot play Emotes during this action."
}
local v_u_11 = Color3.fromRGB(245, 50, 50)
local function v41(p12, p13, _) -- name: ProcessMessage
	-- upvalues: (copy) v_u_9, (copy) v_u_8, (ref) v_u_5, (copy) v_u_10, (copy) v_u_11, (copy) v_u_4
	local v14
	if string.sub(p12, 1, 3) == "/e " then
		v14 = string.sub(p12, 4)
	elseif string.sub(p12, 1, 7) == "/emote " then
		v14 = string.sub(p12, 8)
	else
		v14 = nil
	end
	if not v14 then
		return false
	end
	if v_u_9[v14] then
		return true
	end
	local v_u_15 = p13:GetCurrentChannel()
	if not v_u_15 then
		return true
	end
	local v16 = v_u_8.Character
	if not v16 then
		local v17 = {
			["ChatColor"] = v_u_11
		}
		v_u_4:SendSystemMessageToSelf(v_u_5:Get("InGame.Chat.Response.EmotesTemporarilyUnavailable", v_u_10["InGame.Chat.Response.EmotesTemporarilyUnavailable"]), v_u_15, v17)
		return true
	end
	local v18 = v16:FindFirstChild("Animate")
	if not v18 then
		local v19 = {
			["ChatColor"] = v_u_11
		}
		v_u_4:SendSystemMessageToSelf(v_u_5:Get("InGame.Chat.Response.EmotesNotSupported", v_u_10["InGame.Chat.Response.EmotesNotSupported"]), v_u_15, v19)
		return true
	end
	if not v18:FindFirstChild("PlayEmote") then
		local v20 = {
			["ChatColor"] = v_u_11
		}
		v_u_4:SendSystemMessageToSelf(v_u_5:Get("InGame.Chat.Response.EmotesNotSupported", v_u_10["InGame.Chat.Response.EmotesNotSupported"]), v_u_15, v20)
		return true
	end
	local v_u_21 = v16:FindFirstChildOfClass("Humanoid")
	if not v_u_21 then
		local v22 = {
			["ChatColor"] = v_u_11
		}
		v_u_4:SendSystemMessageToSelf(v_u_5:Get("InGame.Chat.Response.EmotesTemporarilyUnavailable", v_u_10["InGame.Chat.Response.EmotesTemporarilyUnavailable"]), v_u_15, v22)
		return true
	end
	if v_u_21.RigType ~= Enum.HumanoidRigType.R15 then
		local v23 = {
			["ChatColor"] = v_u_11
		}
		v_u_4:SendSystemMessageToSelf(v_u_5:Get("InGame.Chat.Response.EmotesWrongAvatarType", v_u_10["InGame.Chat.Response.EmotesWrongAvatarType"]), v_u_15, v23)
		return true
	end
	local v24 = v_u_21:FindFirstChildOfClass("HumanoidDescription")
	if not v24 then
		local v25 = {
			["ChatColor"] = v_u_11
		}
		v_u_4:SendSystemMessageToSelf(v_u_5:Get("InGame.Chat.Response.EmotesTemporarilyUnavailable", v_u_10["InGame.Chat.Response.EmotesTemporarilyUnavailable"]), v_u_15, v25)
		return true
	end
	local v26 = v24:GetEmotes()
	local v27 = {}
	for v28, _ in pairs(v26) do
		v27[string.lower(v28)] = v28
	end
	local v29 = tonumber(v14)
	if v29 then
		local v30 = v24:GetEquippedEmotes()
		for _, v31 in pairs(v30) do
			if v31.Slot ~= v29 then
				continue
			end
			v14 = v31.Name
		end
	end
	local v_u_32 = v27[string.lower(v14)]
	if v_u_32 then
		spawn(function()
			-- upvalues: (copy) v_u_21, (ref) v_u_32, (copy) v_u_15, (ref) v_u_5, (ref) v_u_10, (ref) v_u_11, (ref) v_u_4
			local function v33()
				-- upvalues: (ref) v_u_21, (ref) v_u_32
				return v_u_21:PlayEmote(v_u_32)
			end
			local v34, v35 = pcall(v33)
			if v34 then
				if not v35 then
					local v36 = v_u_15
					local v37 = {
						["ChatColor"] = v_u_11
					}
					v_u_4:SendSystemMessageToSelf(v_u_5:Get("InGame.Chat.Response.EmotesTemporarilyUnavailable", v_u_10["InGame.Chat.Response.EmotesTemporarilyUnavailable"]), v36, v37)
				end
			else
				local v38 = v_u_15
				local v39 = {
					["ChatColor"] = v_u_11
				}
				v_u_4:SendSystemMessageToSelf(v_u_5:Get("InGame.Chat.Response.EmotesNotSupported", v_u_10["InGame.Chat.Response.EmotesNotSupported"]), v38, v39)
			end
		end)
		return true
	end
	local v40 = {
		["ChatColor"] = v_u_11
	}
	v_u_4:SendSystemMessageToSelf(v_u_5:Get("InGame.Chat.Response.EmoteNotAvailable", v_u_10["InGame.Chat.Response.EmoteNotAvailable"]), v_u_15, v40)
	return true
end
return {
	[v_u_4.KEY_COMMAND_PROCESSOR_TYPE] = v_u_4.COMPLETED_MESSAGE_PROCESSOR,
	[v_u_4.KEY_PROCESSOR_FUNCTION] = v41
}