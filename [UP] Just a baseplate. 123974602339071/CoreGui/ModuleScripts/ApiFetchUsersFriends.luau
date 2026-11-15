-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Thunks.ApiFetchUsersFriends
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.Http).Requests
local v_u_3 = require(v1.Packages.Promise)
local v_u_4 = require(v1.Workspace.Packages.UserLib).Thunks.ApiFetchUsersPresences
local v_u_5 = v2.DEPRECATED_UsersGetFriends
local v_u_6 = require(v1.Workspace.Packages.LegacyFriendsRodux).Actions.FetchUserFriendsStarted
local v_u_7 = require(v1.Workspace.Packages.LegacyFriendsRodux).Actions.FetchUserFriendsFailed
local v_u_8 = require(v1.Workspace.Packages.LegacyFriendsRodux).Actions.FetchUserFriendsCompleted
local v_u_9 = require(v1.Workspace.Packages.UserLib).Models.UserModel
local v_u_10 = require(v1.Workspace.Packages.UserLib).Thunks.UpdateUsers
local v_u_11 = require(v1.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank
return function(p_u_12, p_u_13, _, p_u_14)
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_11, (copy) v_u_9, (copy) v_u_10, (copy) v_u_4, (copy) v_u_8, (copy) v_u_3, (copy) v_u_7
	return function(p_u_15)
		-- upvalues: (ref) v_u_6, (copy) p_u_13, (ref) v_u_5, (copy) p_u_12, (copy) p_u_14, (ref) v_u_11, (ref) v_u_9, (ref) v_u_10, (ref) v_u_4, (ref) v_u_8, (ref) v_u_3, (ref) v_u_7
		p_u_15:dispatch(v_u_6(p_u_13))
		return v_u_5(p_u_12, p_u_13, p_u_14):andThen(function(p16)
			-- upvalues: (ref) v_u_11, (ref) v_u_9, (copy) p_u_15, (ref) v_u_10
			local v17 = p16.responseBody
			local v18 = {}
			local v19 = {}
			for v20, v21 in pairs(v17.data) do
				local v22 = v21.id
				local v23 = tostring(v22)
				v21.isFriend = true
				if v_u_11() then
					v21.friendRank = v20
				end
				local v24 = v_u_9.fromDataTable(v21)
				table.insert(v18, v23)
				v19[v24.id] = v24
			end
			p_u_15:dispatch(v_u_10(v19))
			return v18
		end):andThen(function(p25)
			-- upvalues: (copy) p_u_15, (ref) v_u_4, (ref) p_u_12
			return p_u_15:dispatch(v_u_4(p_u_12, p25))
		end):andThen(function(p26)
			-- upvalues: (copy) p_u_15, (ref) v_u_8, (ref) p_u_13, (ref) v_u_3
			p_u_15:dispatch(v_u_8(p_u_13))
			return v_u_3.resolve(p26)
		end, function(p27)
			-- upvalues: (copy) p_u_15, (ref) v_u_7, (ref) p_u_13, (ref) v_u_3
			p_u_15:dispatch(v_u_7(p_u_13, p27))
			return v_u_3.reject(p27)
		end)
	end
end