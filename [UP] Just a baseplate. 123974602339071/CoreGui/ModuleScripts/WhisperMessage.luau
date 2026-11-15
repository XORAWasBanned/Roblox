-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.DefaultClientChatModules.MessageCreatorModules.WhisperMessage
local v_u_1 = game:GetService("Players")
local v_u_2 = v_u_1.LocalPlayer
while not v_u_2 do
	v_u_1.ChildAdded:wait()
	v_u_2 = v_u_1.LocalPlayer
end
local v3 = script.Parent.Parent
local v_u_4 = require(v3:WaitForChild("ChatSettings"))
local v5 = require(v3:WaitForChild("ChatConstants"))
local v_u_6 = require(script.Parent:WaitForChild("Util"))
local v_u_7 = utf8.char(57344)
local v_u_8 = nil
local function v9()
	-- upvalues: (ref) v_u_8
	v_u_8 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end
pcall(v9)
function IsPlayerVerified(p10) -- name: IsPlayerVerified
	-- upvalues: (copy) v_u_1
	local v_u_11 = v_u_1:GetPlayerByUserId(p10)
	if v_u_11 then
		local v12, v13 = pcall(function()
			-- upvalues: (copy) v_u_11
			return v_u_11.HasVerifiedBadge
		end)
		if v12 then
			return v13
		else
			return false
		end
	else
		return false
	end
end
function AppendVerifiedBadge(p14) -- name: AppendVerifiedBadge
	-- upvalues: (copy) v_u_7
	return p14 .. v_u_7
end
function CreateMessageLabel(p_u_15, p16) -- name: CreateMessageLabel
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (ref) v_u_2, (ref) v_u_8
	local v17 = p_u_15.FromSpeaker
	local v18
	if v_u_4.PlayerDisplayNamesEnabled and p_u_15.SpeakerDisplayName then
		v18 = p_u_15.SpeakerDisplayName
	else
		v18 = v17
	end
	local v19 = p_u_15.SpeakerUserId
	if IsPlayerVerified(v19) then
		v18 = AppendVerifiedBadge(v18)
	end
	local _ = p_u_15.Message
	local v20 = p_u_15.ExtraData or {}
	local v21 = v20.Font or v_u_4.DefaultFont
	local v22 = v20.TextSize or v_u_4.ChatWindowTextSize
	local v23 = v20.NameColor or v_u_4.DefaultNameColor
	local v24 = v20.ChatColor or v_u_4.DefaultMessageColor
	local v25 = v20.ChannelColor or v24
	local v26 = string.format("[%s]:", v18)
	v_u_6:GetStringTextBounds(v26, v21, v22)
	local v_u_27 = v_u_6:GetNumberOfSpaces(v26, v21, v22) + 1
	local v_u_28, v_u_29 = v_u_6:CreateBaseMessage("", v21, v22, v24)
	local v30 = v_u_6:AddNameButtonToBaseMessage(v_u_29, v23, v26, v17)
	local v31
	if p16 == p_u_15.OriginalChannel then
		v31 = nil
	else
		local v32 = p_u_15.OriginalChannel
		if p_u_15.FromSpeaker ~= v_u_2.Name then
			v32 = string.format("From %s", p_u_15.FromSpeaker)
		end
		if v_u_8.tryLocalize then
			v32 = v_u_8:tryLocalize(v32)
		end
		local v33 = string.format("{%s}", v32)
		v31 = v_u_6:AddChannelButtonToBaseMessage(v_u_29, v25, v33, p_u_15.OriginalChannel)
		v30.Position = UDim2.new(0, v31.Size.X.Offset + v_u_6:GetStringTextBounds(" ", v21, v22).X, 0, 0)
		v_u_27 = v_u_27 + v_u_6:GetNumberOfSpaces(v33, v21, v22) + 1
	end
	local function v36(p34) -- name: UpdateTextFunction
		-- upvalues: (copy) p_u_15, (copy) v_u_29, (ref) v_u_6, (ref) v_u_27
		if p_u_15.IsFiltered then
			v_u_29.Text = v_u_6:CreateLeadingSpaces(v_u_27) .. v_u_6:SanitizeForRichText(p34.Message)
		else
			local v35 = p34.MessageLengthUtf8 or p34.MessageLength
			v_u_29.Text = v_u_6:CreateLeadingSpaces(v_u_27) .. string.rep("_", v35)
		end
	end
	v36(p_u_15)
	local function v38(p37) -- name: GetHeightFunction
		-- upvalues: (ref) v_u_6, (copy) v_u_29, (copy) v_u_28
		return v_u_6:GetMessageHeight(v_u_29, v_u_28, p37)
	end
	local v39 = {
		[v30] = {
			["TextTransparency"] = {
				["FadedIn"] = 0,
				["FadedOut"] = 1
			},
			["TextStrokeTransparency"] = {
				["FadedIn"] = 0.75,
				["FadedOut"] = 1
			}
		},
		[v_u_29] = {
			["TextTransparency"] = {
				["FadedIn"] = 0,
				["FadedOut"] = 1
			},
			["TextStrokeTransparency"] = {
				["FadedIn"] = 0.75,
				["FadedOut"] = 1
			}
		}
	}
	if v31 then
		v39[v31] = {
			["TextTransparency"] = {
				["FadedIn"] = 0,
				["FadedOut"] = 1
			},
			["TextStrokeTransparency"] = {
				["FadedIn"] = 0.75,
				["FadedOut"] = 1
			}
		}
	end
	local v40, v41, v42 = v_u_6:CreateFadeFunctions(v39)
	return {
		[v_u_6.KEY_BASE_FRAME] = v_u_28,
		[v_u_6.KEY_BASE_MESSAGE] = v_u_29,
		[v_u_6.KEY_UPDATE_TEXT_FUNC] = v36,
		[v_u_6.KEY_GET_HEIGHT] = v38,
		[v_u_6.KEY_FADE_IN] = v40,
		[v_u_6.KEY_FADE_OUT] = v41,
		[v_u_6.KEY_UPDATE_ANIMATION] = v42
	}
end
return {
	[v_u_6.KEY_MESSAGE_TYPE] = v5.MessageTypeWhisper,
	[v_u_6.KEY_CREATOR_FUNCTION] = CreateMessageLabel
}