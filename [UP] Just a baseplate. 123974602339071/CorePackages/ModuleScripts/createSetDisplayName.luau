-- Path: CorePackages.Packages._Index.NetworkingUsers.NetworkingUsers.networkRequests.createSetDisplayName
local v_u_1 = require(script.Parent.Parent.USERS_URL)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.PATCH({
		["Name"] = "SetDisplayName"
	}, function(p3, p4, p5)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1):path("v1"):path("users"):id(p4):path("display-names"):body({
			["newDisplayName"] = p5
		})
	end)
end