-- Path: CorePackages.Packages._Index.NetworkingUsers.NetworkingUsers.networkRequests.createGetUserV2FromUserId
local v_u_1 = require(script.Parent.Parent.USERS_URL)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.GET({
		["Name"] = "GetUserV2FromUserId"
	}, function(p3, p4)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1):path("v1"):path("users"):id(p4)
	end)
end