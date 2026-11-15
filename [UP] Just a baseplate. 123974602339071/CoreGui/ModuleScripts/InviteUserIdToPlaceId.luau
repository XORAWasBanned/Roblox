-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Thunks.InviteUserIdToPlaceId
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.Pages.ShareGame
local v_u_3 = require(v2.Thunks.ApiSendGameInvite)
local v_u_4 = require(v1.Workspace.Packages.PlaceInfoRodux).Thunks.ApiFetchPlaceInfos
local v_u_5 = require(v1.Packages.Promise)
local v_u_6 = require(v2.Actions.ReceivedUserInviteStatus)
local v_u_7 = require(v2.Constants).InviteStatus
return function(p_u_8, p_u_9, p_u_10)
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_5, (copy) v_u_4, (copy) v_u_3
	return function(p_u_11)
		-- upvalues: (copy) p_u_10, (ref) v_u_6, (copy) p_u_9, (ref) v_u_7, (ref) v_u_5, (ref) v_u_4, (copy) p_u_8, (ref) v_u_3
		if p_u_10 ~= "0" then
			local v_u_12 = p_u_11:getState()
			return v_u_5.new(function(p13, p14)
				-- upvalues: (copy) v_u_12, (ref) p_u_9, (ref) v_u_7
				local v15 = p_u_9
				if v_u_12.Invites[tostring(v15)] == v_u_7.Pending then
					p14()
				else
					p13()
				end
			end):andThen(function()
				-- upvalues: (copy) v_u_12, (ref) p_u_10, (ref) v_u_5, (copy) p_u_11, (ref) v_u_6, (ref) p_u_9, (ref) v_u_7, (ref) v_u_4, (ref) p_u_8, (ref) v_u_3
				local v_u_16 = v_u_12.PlaceInfos[p_u_10]
				return v_u_5.new(function(p_u_17, p_u_18)
					-- upvalues: (ref) p_u_11, (ref) v_u_6, (ref) p_u_9, (ref) v_u_7, (copy) v_u_16, (ref) v_u_4, (ref) p_u_8, (ref) p_u_10
					p_u_11:dispatch(v_u_6(p_u_9, v_u_7.Pending))
					if v_u_16 then
						p_u_17(v_u_16)
					else
						p_u_11:dispatch(v_u_4(p_u_8, { p_u_10 })):andThen(function(p19)
							-- upvalues: (copy) p_u_17, (copy) p_u_18
							if p19[1] == nil then
								p_u_18()
							else
								p_u_17(p19[1])
							end
						end, function()
							-- upvalues: (copy) p_u_18
							p_u_18()
						end)
					end
				end):andThen(function(p20)
					-- upvalues: (ref) p_u_11, (ref) v_u_3, (ref) p_u_8, (ref) p_u_9
					return p_u_11:dispatch(v_u_3(p_u_8, p_u_9, p20))
				end):andThen(function(p21)
					-- upvalues: (ref) p_u_11, (ref) v_u_6, (ref) p_u_9
					p_u_11:dispatch(v_u_6(p_u_9, p21.resultType))
					return p21
				end, function()
					-- upvalues: (ref) p_u_11, (ref) v_u_6, (ref) p_u_9, (ref) v_u_7
					p_u_11:dispatch(v_u_6(p_u_9, v_u_7.Failed))
				end)
			end)
		end
		warn("Game Invite failed to send. Cannot send invite to unpublished Place.")
		p_u_11:dispatch(v_u_6(p_u_9, v_u_7.Failed))
		return v_u_5.reject()
	end
end