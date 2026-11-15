-- Path: CorePackages.Packages._Index.NetworkingFriends.NetworkingFriends.networkRequests.createGetLuobuFriendsFromUserId
local v_u_1 = require(script.Parent.Parent.FRIENDS_URL)
require(script.Parent.Parent.networkingFriendsTypes)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.GET({
		["Name"] = "GetLuobuFriendsFromUserId"
	}, function(p3, p4, p5)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1):path("v1"):path("users"):id(p4):path("luobu-friends"):queryArgs({
			["userOpenId"] = p5.userOpenId,
			["userAccessToken"] = p5.userAccessToken,
			["type"] = p5.type,
			["appType"] = p5.appType
		})
	end)
end