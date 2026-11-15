-- Path: CoreGui.RobloxGui.Modules.PlayerList.Reducers.PlayerRelationship
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v_u_3 = require(v1.Packages.Cryo)
local v4 = script.Parent.Parent.Actions
local v5 = require(v4.AddPlayer)
local v6 = require(v4.RemovePlayer)
local v7 = require(v4.SetPlayerIsBlocked)
local v8 = require(v4.SetPlayerFollowRelationship)
local v9 = require(v4.SetPlayerFriendStatus)
local v10 = require(v4.SetPlayerIsFollowing)
return v2.createReducer({}, {
	[v5.name] = function(p11, p12)
		-- upvalues: (copy) v_u_3
		local v13 = v_u_3.Dictionary.join
		local v14 = {
			[p12.userId] = {
				["isBlocked"] = false,
				["friendStatus"] = nil,
				["isFollowing"] = false,
				["isFollower"] = false,
				["friendStatus"] = Enum.FriendStatus.Unknown
			}
		}
		return v13(p11, v14)
	end,
	[v6.name] = function(p15, p16)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p15, {
			[p16.userId] = v_u_3.None
		})
	end,
	[v7.name] = function(p17, p18)
		-- upvalues: (copy) v_u_3
		local v19 = v_u_3.Dictionary.join
		local v20 = {
			[p18.userId] = {
				["isBlocked"] = p18.isBlocked,
				["friendStatus"] = p17[p18.userId].friendStatus,
				["isFollowing"] = p17[p18.userId].isFollowing,
				["isFollower"] = p17[p18.userId].isFollower
			}
		}
		return v19(p17, v20)
	end,
	[v8.name] = function(p21, p22)
		-- upvalues: (copy) v_u_3
		local v23 = v_u_3.Dictionary.join
		local v24 = {
			[p22.userId] = {
				["isBlocked"] = p21[p22.userId].isBlocked,
				["friendStatus"] = p21[p22.userId].friendStatus,
				["isFollowing"] = p22.isFollowing,
				["isFollower"] = p22.isFollower
			}
		}
		return v23(p21, v24)
	end,
	[v10.name] = function(p25, p26)
		-- upvalues: (copy) v_u_3
		local v27 = v_u_3.Dictionary.join
		local v28 = {
			[p26.userId] = {
				["isBlocked"] = p25[p26.userId].isBlocked,
				["friendStatus"] = p25[p26.userId].friendStatus,
				["isFollowing"] = p26.isFollowing,
				["isFollower"] = p25[p26.userId].isFollower
			}
		}
		return v27(p25, v28)
	end,
	[v9.name] = function(p29, p30)
		-- upvalues: (copy) v_u_3
		local v31 = v_u_3.Dictionary.join
		local v32 = {
			[p30.userId] = {
				["isBlocked"] = p29[p30.userId].isBlocked,
				["friendStatus"] = p30.friendStatus,
				["isFollowing"] = p29[p30.userId].isFollowing,
				["isFollower"] = p29[p30.userId].isFollower
			}
		}
		return v31(p29, v32)
	end
})