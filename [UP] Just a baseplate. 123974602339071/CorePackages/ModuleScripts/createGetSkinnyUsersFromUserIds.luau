-- Path: CorePackages.Packages._Index.NetworkingUsers.NetworkingUsers.networkRequests.createGetSkinnyUsersFromUserIds
local v_u_1 = require(script.Parent.Parent.USERS_URL)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.POST({
		["Name"] = "GetSkinnyUsersFromUserIds"
	}, function(p3, p4)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1):path("v1"):path("users"):body({
			["userIds"] = p4
		})
	end)
end