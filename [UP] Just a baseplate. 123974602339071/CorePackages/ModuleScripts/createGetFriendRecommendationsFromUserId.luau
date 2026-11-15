-- Path: CorePackages.Packages._Index.NetworkingFriends.NetworkingFriends.networkRequests.createGetFriendRecommendationsFromUserId
local v_u_1 = require(script.Parent.Parent.FRIENDS_URL)
require(script.Parent.Parent.networkingFriendsTypes)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.GET({
		["Name"] = "GetFriendRecommendationsFromUserId"
	}, function(p3, p4)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1):path("v1"):path("users"):id(p4.targetUserId):path("friends"):path("recommendations"):queryArgs({
			["source"] = p4.source
		})
	end)
end