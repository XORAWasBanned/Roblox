-- Path: CorePackages.Packages._Index.NetworkingFriends.NetworkingFriends.networkRequests.createGetExtendedFriendshipStatus
local v_u_1 = require(script.Parent.Parent.FRIENDS_URL)
require(script.Parent.Parent.networkingFriendsTypes)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.GET({
		["Name"] = "GetExtendedFriendshipStatus"
	}, function(p3, p4)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1):path("v1"):path("my"):path("friends"):id(p4.targetUserId):path("status")
	end)
end