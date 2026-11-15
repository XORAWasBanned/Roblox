-- Path: CorePackages.Packages._Index.NetworkingFriends.NetworkingFriends.networkRequests.createGetFollowingExists
local v_u_1 = require(script.Parent.Parent.FRIENDS_URL)
require(script.Parent.Parent.networkingFriendsTypes)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.POST({
		["Name"] = "GetFollowingExists"
	}, function(p3, p4)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1):path("v1"):path("user"):path("following-exists"):body({
			["targetUserIds"] = p4.targetUserIds
		})
	end)
end