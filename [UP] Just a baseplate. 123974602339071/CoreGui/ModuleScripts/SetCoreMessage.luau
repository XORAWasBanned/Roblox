-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.DefaultClientChatModules.MessageCreatorModules.SetCoreMessage
local v1 = script.Parent.Parent
local v_u_2 = require(v1:WaitForChild("ChatSettings"))
local v3 = require(v1:WaitForChild("ChatConstants"))
local v_u_4 = require(script.Parent:WaitForChild("Util"))
function CreateSetCoreMessageLabel(p5, _) -- name: CreateSetCoreMessageLabel
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	local v6 = p5.Message
	local v7 = p5.ExtraData or {}
	local v_u_8, v_u_9 = v_u_4:CreateBaseMessage(v6, v7.Font or v_u_2.DefaultFont, v7.TextSize or v_u_2.ChatWindowTextSize, v7.Color or v_u_2.DefaultMessageColor)
	local function v11(p10) -- name: GetHeightFunction
		-- upvalues: (ref) v_u_4, (copy) v_u_9, (copy) v_u_8
		return v_u_4:GetMessageHeight(v_u_9, v_u_8, p10)
	end
	local v12, v13, v14 = v_u_4:CreateFadeFunctions({
		[v_u_9] = {
			["TextTransparency"] = {
				["FadedIn"] = 0,
				["FadedOut"] = 1
			},
			["TextStrokeTransparency"] = {
				["FadedIn"] = 0.75,
				["FadedOut"] = 1
			}
		}
	})
	return {
		[v_u_4.KEY_BASE_FRAME] = v_u_8,
		[v_u_4.KEY_BASE_MESSAGE] = v_u_9,
		[v_u_4.KEY_UPDATE_TEXT_FUNC] = nil,
		[v_u_4.KEY_GET_HEIGHT] = v11,
		[v_u_4.KEY_FADE_IN] = v12,
		[v_u_4.KEY_FADE_OUT] = v13,
		[v_u_4.KEY_UPDATE_ANIMATION] = v14
	}
end
return {
	[v_u_4.KEY_MESSAGE_TYPE] = v3.MessageTypeSetCore,
	[v_u_4.KEY_CREATOR_FUNCTION] = CreateSetCoreMessageLabel
}