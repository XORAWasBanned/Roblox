-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Thunks.ApiSendGameInvite
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
local v3 = require(v1.Workspace.Packages.Http).Requests
local v_u_4 = v3.DEPRECATED_ChatSendMessage
local v_u_5 = v3.DEPRECATED_ChatStartOneToOneConversation
local v_u_6 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_7 = v3.DEPRECATED_ChatSendGameLinkMessage
return function(p_u_8, p_u_9, p_u_10)
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4, (copy) v_u_7
	local v_u_11 = v_u_2.LocalPlayer.UserId
	local v_u_12 = v_u_6:FormatByKey("Feature.SettingsHub.Message.InviteToGameTitle", {
		["PLACENAME"] = p_u_10.name
	})
	return function(_)
		-- upvalues: (ref) v_u_5, (copy) p_u_8, (copy) p_u_9, (copy) v_u_11, (ref) v_u_4, (ref) v_u_12, (copy) p_u_10, (ref) v_u_7
		return v_u_5(p_u_8, p_u_9, v_u_11):andThen(function(p13)
			-- upvalues: (ref) v_u_4, (ref) p_u_8, (ref) v_u_12, (ref) p_u_9, (ref) p_u_10, (ref) v_u_7
			local v_u_14 = p13.responseBody.conversation
			return v_u_4(p_u_8, v_u_14.id, v_u_12, nil, true, p_u_9):andThen(function()
				-- upvalues: (copy) v_u_14, (ref) p_u_10, (ref) v_u_7, (ref) p_u_8, (ref) p_u_9
				local function v16(p15) -- name: handleResult
					-- upvalues: (ref) v_u_14, (ref) p_u_10
					return {
						["resultType"] = p15.responseBody.resultType,
						["conversationId"] = v_u_14.id,
						["placeId"] = p_u_10.universeRootPlaceId
					}
				end
				return v_u_7(p_u_8, v_u_14.id, p_u_10.universeId, nil, true, p_u_9, p_u_10.universeRootPlaceId):andThen(v16)
			end)
		end)
	end
end