-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Thunks.FetchUserFriends
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v3 = v2.Modules.Settings.Pages.ShareGame
local v_u_4 = require(v1.Workspace.Packages.Http).Enum.RetrievalStatus
local v_u_5 = require(v3.Thunks.ApiFetchUsersFriends)
local v_u_6 = require(v3.Constants)
local v_u_7 = require(v2.Modules.Settings.Enum.UserSorts)
local v_u_8 = require(v1.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank
return function(p_u_9, p_u_10)
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_6, (copy) v_u_8, (copy) v_u_7
	return function(p11)
		-- upvalues: (copy) p_u_10, (ref) v_u_4, (ref) v_u_5, (copy) p_u_9, (ref) v_u_6, (ref) v_u_8, (ref) v_u_7
		if p11:getState().Friends.retrievalStatus[p_u_10] ~= v_u_4.Fetching then
			local v12 = v_u_5
			local v13 = p_u_9
			local v14 = p_u_10
			local v15 = v_u_6.ThumbnailRequest.InviteToGame
			local v16
			if v_u_8() then
				v16 = v_u_7.StatusFrequents
			else
				v16 = nil
			end
			p11:dispatch(v12(v13, v14, v15, v16))
		end
	end
end