-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.DefaultClientChatModules.MessageCreatorModules.SystemMessage
local v1 = script.Parent.Parent
local v_u_2 = require(v1:WaitForChild("ChatSettings"))
local v3 = require(v1:WaitForChild("ChatConstants"))
local v_u_4 = require(script.Parent:WaitForChild("Util"))
local v_u_5 = nil
local function v6()
	-- upvalues: (ref) v_u_5
	v_u_5 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end
pcall(v6)
function CreateSystemMessageLabel(p7, p8) -- name: CreateSystemMessageLabel
	-- upvalues: (ref) v_u_5, (copy) v_u_2, (copy) v_u_4
	local v9 = p7.Message
	if v_u_5 and v_u_5.LocalizeFormattedMessage then
		v9 = v_u_5:LocalizeFormattedMessage(v9)
	end
	local v10 = p7.ExtraData or {}
	local v11 = v10.Font or v_u_2.DefaultFont
	local v12 = v10.TextSize or v_u_2.ChatWindowTextSize
	local v13 = v10.ChatColor or v_u_2.DefaultMessageColor
	local v14 = v10.ChannelColor or v13
	local v_u_15, v_u_16 = v_u_4:CreateBaseMessage(v9, v11, v12, v13)
	v_u_16.AutoLocalize = true
	local v17
	if p8 == p7.OriginalChannel then
		v17 = nil
	else
		local v18
		if v_u_5 and p7.OriginalChannel == "System" then
			local v19 = v_u_5:Get("InGame.Chat.Label.SystemMessagePrefix", "System")
			v18 = string.format("{%s}", v19)
		elseif v_u_5 and p7.OriginalChannel == "Team" then
			local v20 = v_u_5:Get("InGame.Chat.Label.TeamMessagePrefix", "System")
			v18 = string.format("{%s}", v20)
		else
			v18 = string.format("{%s}", p7.OriginalChannel)
		end
		v17 = v_u_4:AddChannelButtonToBaseMessage(v_u_16, v14, v18, p7.OriginalChannel)
		v_u_16.Text = v_u_4:CreateLeadingSpaces(v_u_4:GetNumberOfSpaces(v18, v11, v12) + 1) .. v_u_4:SanitizeForRichText(v9)
	end
	local function v22(p21) -- name: GetHeightFunction
		-- upvalues: (ref) v_u_4, (copy) v_u_16, (copy) v_u_15
		return v_u_4:GetMessageHeight(v_u_16, v_u_15, p21)
	end
	local v23 = {
		[v_u_16] = {
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
	if v17 then
		v23[v17] = {
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
	local v24, v25, v26 = v_u_4:CreateFadeFunctions(v23)
	return {
		[v_u_4.KEY_BASE_FRAME] = v_u_15,
		[v_u_4.KEY_BASE_MESSAGE] = v_u_16,
		[v_u_4.KEY_UPDATE_TEXT_FUNC] = nil,
		[v_u_4.KEY_GET_HEIGHT] = v22,
		[v_u_4.KEY_FADE_IN] = v24,
		[v_u_4.KEY_FADE_OUT] = v25,
		[v_u_4.KEY_UPDATE_ANIMATION] = v26
	}
end
return {
	[v_u_4.KEY_MESSAGE_TYPE] = v3.MessageTypeSystem,
	[v_u_4.KEY_CREATOR_FUNCTION] = CreateSystemMessageLabel
}