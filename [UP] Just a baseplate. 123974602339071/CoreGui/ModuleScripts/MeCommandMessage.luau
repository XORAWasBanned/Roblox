-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.DefaultClientChatModules.MessageCreatorModules.MeCommandMessage
local v1 = script.Parent.Parent
local v_u_2 = require(v1:WaitForChild("ChatSettings"))
local v3 = require(v1:WaitForChild("ChatConstants"))
local v_u_4 = require(script.Parent:WaitForChild("Util"))
function CreateMeCommandMessageLabel(p_u_5, p6) -- name: CreateMeCommandMessageLabel
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	local _ = p_u_5.Message
	local v7 = p_u_5.ExtraData or {}
	local v8 = v7.Font or Enum.Font.SourceSansItalic
	local v9 = v7.TextSize or v_u_2.ChatWindowTextSize
	local v10 = Color3.new(1, 1, 1)
	local v11 = v7.ChannelColor or v10
	local v_u_12, v_u_13 = v_u_4:CreateBaseMessage("", v8, v9, v10)
	local v_u_14, v15
	if p6 == p_u_5.OriginalChannel then
		v_u_14 = 0
		v15 = nil
	else
		local v16 = string.format("{%s}", p_u_5.OriginalChannel)
		v15 = v_u_4:AddChannelButtonToBaseMessage(v_u_13, v11, v16, p_u_5.OriginalChannel)
		v_u_14 = v_u_4:GetNumberOfSpaces(v16, v8, v9) + 1
	end
	local function v25(p17) -- name: UpdateTextFunction
		-- upvalues: (copy) p_u_5, (copy) v_u_13, (ref) v_u_4, (ref) v_u_14
		if p_u_5.IsFiltered then
			local v18 = v_u_13
			local v19 = v_u_4:CreateLeadingSpaces(v_u_14)
			local v20 = v_u_4
			local v21 = p17.FromSpeaker
			local v22 = p17.Message
			v18.Text = v19 .. v20:SanitizeForRichText(v21 .. " " .. string.sub(v22, 5))
		else
			local v23 = p17.MessageLengthUtf8 or p17.MessageLength
			local v24 = utf8.len(utf8.nfcnormalize(p17.FromSpeaker)) + v23 - 4
			v_u_13.Text = v_u_4:CreateLeadingSpaces(v_u_14) .. string.rep("_", v24)
		end
	end
	v25(p_u_5)
	local function v27(p26) -- name: GetHeightFunction
		-- upvalues: (ref) v_u_4, (copy) v_u_13, (copy) v_u_12
		return v_u_4:GetMessageHeight(v_u_13, v_u_12, p26)
	end
	local v28 = {
		[v_u_13] = {
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
		v28[v15] = {
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
	local v29, v30, v31 = v_u_4:CreateFadeFunctions(v28)
	return {
		[v_u_4.KEY_BASE_FRAME] = v_u_12,
		[v_u_4.KEY_BASE_MESSAGE] = v_u_13,
		[v_u_4.KEY_UPDATE_TEXT_FUNC] = v25,
		[v_u_4.KEY_GET_HEIGHT] = v27,
		[v_u_4.KEY_FADE_IN] = v29,
		[v_u_4.KEY_FADE_OUT] = v30,
		[v_u_4.KEY_UPDATE_ANIMATION] = v31
	}
end
return {
	[v_u_4.KEY_MESSAGE_TYPE] = v3.MessageTypeMeCommand,
	[v_u_4.KEY_CREATOR_FUNCTION] = CreateMeCommandMessageLabel
}