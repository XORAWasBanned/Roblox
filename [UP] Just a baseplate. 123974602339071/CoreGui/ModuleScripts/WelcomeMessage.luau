-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.DefaultClientChatModules.MessageCreatorModules.WelcomeMessage
local v1 = script.Parent.Parent
local v_u_2 = require(v1:WaitForChild("ChatSettings"))
local v3 = require(v1:WaitForChild("ChatConstants"))
local v_u_4 = require(script.Parent:WaitForChild("Util"))
pcall(function()
	ChatLocalization = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
function CreateWelcomeMessageLabel(p5, p6) -- name: CreateWelcomeMessageLabel
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	local v7 = p5.Message
	if ChatLocalization and ChatLocalization.LocalizeFormattedMessage then
		v7 = ChatLocalization:LocalizeFormattedMessage(v7)
	end
	local v8 = p5.ExtraData or {}
	local v9 = v8.Font or v_u_2.DefaultFont
	local v10 = v8.FontSize or v_u_2.ChatWindowTextSize
	local v11 = v8.ChatColor or v_u_2.DefaultMessageColor
	local v12 = v8.ChannelColor or v11
	local v_u_13, v_u_14 = v_u_4:CreateBaseMessage(v7, v9, v10, v11)
	local v15
	if p6 == p5.OriginalChannel then
		v15 = nil
	else
		local v16 = p5.OriginalChannel
		if ChatLocalization.tryLocalize then
			v16 = ChatLocalization:tryLocalize(p5.OriginalChannel)
		end
		local v17 = string.format("{%s}", v16)
		v15 = v_u_4:AddChannelButtonToBaseMessage(v_u_14, v12, v17, p5.OriginalChannel)
		v_u_14.Text = v_u_4:CreateLeadingSpaces(v_u_4:GetNumberOfSpaces(v17, v9, v10) + 1) .. v_u_4:SanitizeForRichText(v7)
	end
	local function v19(p18) -- name: GetHeightFunction
		-- upvalues: (ref) v_u_4, (copy) v_u_14, (copy) v_u_13
		return v_u_4:GetMessageHeight(v_u_14, v_u_13, p18)
	end
	local v20 = {
		[v_u_14] = {
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
	if v15 then
		v20[v15] = {
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
	local v21, v22, v23 = v_u_4:CreateFadeFunctions(v20)
	return {
		[v_u_4.KEY_BASE_FRAME] = v_u_13,
		[v_u_4.KEY_BASE_MESSAGE] = v_u_14,
		[v_u_4.KEY_UPDATE_TEXT_FUNC] = nil,
		[v_u_4.KEY_GET_HEIGHT] = v19,
		[v_u_4.KEY_FADE_IN] = v21,
		[v_u_4.KEY_FADE_OUT] = v22,
		[v_u_4.KEY_UPDATE_ANIMATION] = v23
	}
end
return {
	[v_u_4.KEY_MESSAGE_TYPE] = v3.MessageTypeWelcome,
	[v_u_4.KEY_CREATOR_FUNCTION] = CreateWelcomeMessageLabel
}