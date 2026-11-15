-- Path: CorePackages.Packages._Index.NetworkingFriends.NetworkingFriends.networkRequests.createGetTencentFriendsSuggestion
local v_u_1 = require(script.Parent.Parent.FRIENDS_URL)
require(script.Parent.Parent.networkingFriendsTypes)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.GET({
		["Name"] = "GetTencentFriendsSuggestion"
	}, function(p3, p4)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1):path("v1"):path("tecent-friends-suggestion"):queryArgs({
			["userOpenId"] = p4.userOpenId,
			["userAccessToken"] = p4.userAccessToken,
			["type"] = p4.type,
			["appType"] = p4.appType
		})
	end)
end