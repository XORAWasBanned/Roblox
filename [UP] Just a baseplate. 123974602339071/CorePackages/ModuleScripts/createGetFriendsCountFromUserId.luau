-- Path: CorePackages.Packages._Index.NetworkingFriends.NetworkingFriends.networkRequests.createGetFriendsCountFromUserId
local v_u_1 = require(script.Parent.Parent.FRIENDS_URL)
require(script.Parent.Parent.networkingFriendsTypes)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.GET({
		["Name"] = "GetFriendsCountFromUserId"
	}, function(p3, p4)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1):path("v1"):path("users"):id(p4):path("friends"):path("count")
	end)
end