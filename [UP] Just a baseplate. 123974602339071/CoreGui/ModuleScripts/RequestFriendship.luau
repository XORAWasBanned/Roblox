-- Path: CoreGui.RobloxGui.Modules.PlayerList.Thunks.RequestFriendship
local v1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("RbxAnalyticsService")
local v_u_3 = game:GetService("Players")
local v4 = game:GetService("CorePackages")
local v_u_5 = v_u_3.LocalPlayer
local v6 = v1:WaitForChild("RobloxGui")
local v_u_7 = require(v4.Workspace.Packages.RobloxTranslator)
local v_u_8 = require(v6.Modules.FriendingUtility)
local v_u_9 = v6:WaitForChild("SendNotificationInfo")
local v_u_10 = require(v6.Modules.Flags.FFlagRemoveHardCodedFriendLimitPrompt)
return function(p_u_11, p_u_12) -- name: RequestFriendship
	-- upvalues: (copy) v_u_10, (copy) v_u_2, (copy) v_u_3, (copy) v_u_5, (copy) v_u_8, (copy) v_u_9, (copy) v_u_7
	return function()
		-- upvalues: (ref) v_u_10, (ref) v_u_2, (copy) p_u_11, (ref) v_u_3, (ref) v_u_5, (ref) v_u_8, (copy) p_u_12, (ref) v_u_9, (ref) v_u_7
		coroutine.wrap(function()
			-- upvalues: (ref) v_u_10, (ref) v_u_2, (ref) p_u_11, (ref) v_u_3, (ref) v_u_5, (ref) v_u_8, (ref) p_u_12, (ref) v_u_9, (ref) v_u_7
			if v_u_10 then
				v_u_2:ReportCounter("PlayerDropDown-RequestFriendship")
				v_u_2:TrackEvent("Game", "RequestFriendship", "PlayerDropDown")
				if p_u_11.Parent == v_u_3 then
					v_u_5:RequestFriendship(p_u_11)
					return
				end
			else
				local v13 = v_u_8:GetFriendCountAsync(p_u_11.UserId)
				local v14 = v_u_8:GetFriendCountAsync(v_u_5.UserId)
				if not (v14 and v13) then
					return
				end
				if v14 < 200 and v13 < 200 then
					v_u_2:ReportCounter("PlayerDropDown-RequestFriendship")
					v_u_2:TrackEvent("Game", "RequestFriendship", "PlayerDropDown")
					if p_u_11.Parent == v_u_3 then
						v_u_5:RequestFriendship(p_u_11)
						return
					end
				else
					if v14 >= 200 then
						v_u_9:Fire({
							["Title"] = nil,
							["Text"] = "You are at the max friends limit.",
							["Duration"] = 5,
							["Title"] = p_u_12 and "Cannot accept friend request" or "Cannot send friend request"
						})
						return
					end
					if v13 >= 200 then
						v_u_9:Fire({
							["Title"] = nil,
							["Text"] = nil,
							["Duration"] = 5,
							["Title"] = p_u_12 and "Cannot accept friend request" or "Cannot send friend request",
							["Text"] = v_u_7:FormatByKey("InGame.PlayerDropDown.OtherPlayerFriendLimit", {
								["RBX_NAME"] = p_u_11.Name
							})
						})
					end
				end
			end
		end)()
	end
end