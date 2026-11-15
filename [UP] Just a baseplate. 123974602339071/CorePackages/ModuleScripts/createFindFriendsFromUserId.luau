-- Path: CorePackages.Packages._Index.NetworkingFriends.NetworkingFriends.networkRequests.createFindFriendsFromUserId
local v_u_1 = require(script.Parent.Parent.FRIENDS_URL)
require(script.Parent.Parent.networkingFriendsTypes)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.GET({
		["Name"] = "FindFriendsFromUserId"
	}, function(p3, p4, p5)
		-- upvalues: (ref) v_u_1
		local v6 = p3(v_u_1):path("v1"):path("users"):id(p4):path("friends"):path("find")
		local v7 = {}
		local v8
		if p5 then
			v8 = p5.userSort
		else
			v8 = nil
		end
		v7.userSort = v8
		local v9
		if p5 then
			v9 = p5.cursor
		else
			v9 = nil
		end
		v7.cursor = v9
		local v10
		if p5 then
			v10 = p5.limit
		else
			v10 = nil
		end
		v7.limit = v10
		return v6:queryArgs(v7)
	end)
end