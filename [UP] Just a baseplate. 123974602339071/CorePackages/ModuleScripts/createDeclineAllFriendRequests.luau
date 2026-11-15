-- Path: CorePackages.Packages._Index.NetworkingFriends.NetworkingFriends.networkRequests.createDeclineAllFriendRequests
local v_u_1 = require(script.Parent.Parent.FRIENDS_URL)
require(script.Parent.Parent.networkingFriendsTypes)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.POST({
		["Name"] = "DeclineAllFriendRequests"
	}, function(p3, p4)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1, {
			["currentUserId"] = p4.currentUserId
		}):path("v1"):path("user"):path("friend-requests"):path("decline-all"):body({})
	end)
end