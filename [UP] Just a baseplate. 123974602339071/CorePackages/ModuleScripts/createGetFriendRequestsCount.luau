-- Path: CorePackages.Packages._Index.NetworkingFriends.NetworkingFriends.networkRequests.createGetFriendRequestsCount
local v_u_1 = require(script.Parent.Parent.FRIENDS_URL)
require(script.Parent.Parent.networkingFriendsTypes)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.GET({
		["Name"] = "GetFriendRequestsCount"
	}, function(p3, _)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1):path("v1"):path("user"):path("friend-requests"):path("count")
	end)
end