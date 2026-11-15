-- Path: CorePackages.Packages._Index.NetworkingUsers.NetworkingUsers.networkRequests.createGetUsernameHistoryFromUserId
local v_u_1 = require(script.Parent.Parent.USERS_URL)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.GET({
		["Name"] = "GetUsernameHistoryFromUserId"
	}, function(p3, p4)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1):path("v1"):path("users"):id(p4):path("username-history")
	end)
end