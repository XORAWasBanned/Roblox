-- Path: CorePackages.Packages._Index.NetworkingFriends.NetworkingFriends.networkRequests.createRequestFriendshipFromUserId
local v_u_1 = require(script.Parent.Parent.FRIENDS_URL)
require(script.Parent.Parent.networkingFriendsTypes)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.POST({
		["Name"] = "RequestFriendshipFromUserId"
	}, function(p3, p4)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1, {
			["currentUserId"] = p4.currentUserId
		}):path("v1"):path("users"):id(p4.targetUserId):path("request-friendship"):body({
			["friendshipOriginSourceType"] = p4.friendshipOriginSourceType,
			["senderNickname"] = p4.senderNickname
		})
	end)
end