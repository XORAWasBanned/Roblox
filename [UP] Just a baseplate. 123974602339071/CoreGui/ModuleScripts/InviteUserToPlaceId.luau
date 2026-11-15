-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Thunks.InviteUserToPlaceId
local v1 = game:GetService("HttpRbxApiService")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("CorePackages")
local v4 = script.Parent.Parent
local v5 = v4.Network
local v_u_6 = require(v3.Workspace.Packages.AppChatNetworking)
local v7 = require(v5.httpRequest)
local v_u_8 = require(v5.Requests.GetPlaceInfos)
local v_u_9 = require(v4.Utility.constructGameLinkUrl)
local v_u_10 = v7(v1)
local v_u_11 = require(v4.Resources.Constants).InviteStatus
local v_u_12 = require(v4.Actions.ReceivedUserInviteStatus)
return function(p_u_13, p_u_14)
	-- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_2, (copy) v_u_8, (copy) v_u_10, (copy) v_u_9, (copy) v_u_6
	return function(p_u_15)
		-- upvalues: (copy) p_u_13, (ref) v_u_11, (ref) v_u_12, (ref) v_u_2, (ref) v_u_8, (ref) v_u_10, (copy) p_u_14, (ref) v_u_9, (ref) v_u_6
		local v16 = p_u_13
		if p_u_15:getState().invites[tostring(v16)] ~= v_u_11.Pending then
			p_u_15:dispatch(v_u_12(p_u_13, v_u_11.Pending))
			if not v_u_2:IsStudio() then
				return v_u_8(v_u_10, { p_u_14 }):andThen(function(p17)
					local v18 = p17.responseBody[1]
					assert(v18, "Error fetching placeInfos")
					local v19 = v18.placeId
					v18.placeId = tostring(v19)
					local v20 = v18.universeId
					v18.universeId = tostring(v20)
					return v18
				end):andThen(function(p_u_21)
					-- upvalues: (ref) v_u_9, (ref) v_u_6, (ref) p_u_13
					local v22 = string.format("Come join me in %s", p_u_21.name)
					local v23 = p_u_21.universeRootPlaceId
					assert(v23, "Failed to get universe root place id")
					local v_u_24 = v22 .. "\n" .. v_u_9(p_u_21.universeRootPlaceId)
					local v25 = { p_u_13 }
					return v_u_6.http.CreateConversation(nil, "one_to_one", v25):andThen(function(p26)
						-- upvalues: (ref) v_u_6, (ref) v_u_24, (copy) p_u_21
						local v_u_27 = p26.responseBody.conversations[1]
						assert(v_u_27, "Failed to create conversation")
						return v_u_6.http.SendChatTextMessage(nil, v_u_27.id, v_u_24):andThen(function(p28)
							-- upvalues: (copy) v_u_27, (ref) p_u_21
							local v29 = p28.responseBody.messages[1]
							assert(v29, "Failed to send message")
							return {
								["resultType"] = v29.status == "success" and "Success" or "Failed",
								["conversationId"] = v_u_27.id,
								["placeId"] = p_u_21.universeRootPlaceId
							}
						end)
					end):catch(function(p30)
						warn("Failed to send invite: " .. tostring(p30))
					end)
				end):andThen(function(p31)
					-- upvalues: (ref) v_u_11, (copy) p_u_15, (ref) v_u_12, (ref) p_u_13
					local v32, v33 = p31:await()
					local v34 = "Failed to unroll promise after friend invitation: " .. tostring(v33)
					assert(v32, v34)
					p_u_15:dispatch(v_u_12(p_u_13, v_u_11[v33.resultType] or v_u_11.Failed))
					return v33
				end, function(_)
					-- upvalues: (copy) p_u_15, (ref) v_u_12, (ref) p_u_13, (ref) v_u_11
					p_u_15:dispatch(v_u_12(p_u_13, v_u_11.Failed))
				end)
			end
			spawn(function()
				-- upvalues: (copy) p_u_15, (ref) v_u_12, (ref) p_u_13, (ref) v_u_11
				p_u_15:dispatch(v_u_12(p_u_13, v_u_11.Failed))
			end)
		end
	end
end