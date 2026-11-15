-- Path: CorePackages.Packages._Index.NetworkingFriends.NetworkingFriends.networkRequests.createGetFriendRequests
local v_u_1 = require(script.Parent.Parent.FRIENDS_URL)
require(script.Parent.Parent.networkingFriendsTypes)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.GET({
		["Name"] = "GetFriendRequests"
	}, function(p3, p4)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1, {
			["currentUserId"] = p4.currentUserId
		}):path("v1"):path("my"):path("friends"):path("requests"):queryArgs({
			["fetchMutualFriends"] = p4.fetchMutualFriends,
			["sortOrder"] = p4.sortOrder,
			["limit"] = p4.limit,
			["cursor"] = p4.cursor
		})
	end)
end