-- Path: CorePackages.Packages._Index.NetworkingFriends.NetworkingFriends.networkRequests.createGetLuobuFriendRequests
local v_u_1 = require(script.Parent.Parent.FRIENDS_URL)
require(script.Parent.Parent.networkingFriendsTypes)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.GET({
		["Name"] = "GetLuobuFriendRequests"
	}, function(p3, p4)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1):path("v1"):path("my"):path("luobu-friends"):path("requests"):queryArgs({
			["userOpenId"] = p4.userOpenId,
			["userAccessToken"] = p4.userAccessToken,
			["type"] = p4.type,
			["appType"] = p4.appType,
			["sortOrder"] = p4.sortOrder,
			["limit"] = p4.limit,
			["cursor"] = p4.cursor
		})
	end)
end