-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Thunks.InviteUserIdToPlaceIdCustomized
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.Pages.ShareGame
local v_u_3 = require(v1.Workspace.Packages.GameInvite).GameInviteEvents
local v_u_4 = require(v1.Packages.Promise)
local v_u_5 = require(v2.Actions.ReceivedUserInviteStatus)
local v_u_6 = require(v2.Constants).InviteStatus
local v_u_7 = require(v1.Workspace.Packages.GameInvite).PostSendExperienceInvite
return function(p_u_8, p_u_9, p_u_10, p_u_11, p_u_12, p_u_13, p_u_14)
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_4, (copy) v_u_7, (copy) v_u_3
	return function(p_u_15)
		-- upvalues: (copy) p_u_10, (ref) v_u_5, (copy) p_u_9, (ref) v_u_6, (ref) v_u_4, (ref) v_u_7, (copy) p_u_8, (copy) p_u_12, (copy) p_u_13, (copy) p_u_14, (copy) p_u_11, (ref) v_u_3
		if p_u_10 ~= "0" then
			local v_u_16 = p_u_15:getState()
			return v_u_4.new(function(p17, p18)
				-- upvalues: (copy) v_u_16, (ref) p_u_9, (ref) v_u_6
				if v_u_16.Invites[p_u_9] == v_u_6.Pending then
					p18()
				else
					p17()
				end
			end):andThen(function()
				-- upvalues: (copy) p_u_15, (ref) v_u_5, (ref) p_u_9, (ref) v_u_6, (ref) v_u_7, (ref) p_u_8, (ref) p_u_10, (ref) p_u_12, (ref) p_u_13, (ref) p_u_14
				p_u_15:dispatch(v_u_5(p_u_9, v_u_6.Pending))
				return v_u_7(p_u_8, p_u_9, p_u_10, p_u_12, p_u_13, p_u_14)
			end):andThen(function(p19)
				-- upvalues: (copy) p_u_15, (ref) v_u_5, (ref) p_u_9, (ref) v_u_6
				p_u_15:dispatch(v_u_5(p_u_9, v_u_6.Success))
				return p19
			end, function()
				-- upvalues: (ref) p_u_11, (ref) p_u_12, (ref) v_u_3, (copy) p_u_15, (ref) v_u_5, (ref) p_u_9, (ref) v_u_6
				p_u_11:sendEvent(p_u_12, v_u_3.ErrorShown)
				p_u_15:dispatch(v_u_5(p_u_9, v_u_6.Failed))
			end)
		end
		warn("Game Invite failed to send. Cannot send invite to unpublished Place.")
		p_u_15:dispatch(v_u_5(p_u_9, v_u_6.Failed))
		return v_u_4.reject()
	end
end