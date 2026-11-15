-- Path: CorePackages.Packages._Index.NetworkingUsers.NetworkingUsers.networkRequests.createGetDisplayNameValidation
local v_u_1 = require(script.Parent.Parent.USERS_URL)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.GET({
		["Name"] = "GetDisplayNameValidation"
	}, function(p3, p4, p5)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1):path("v1"):path("users"):id(p4):path("display-names"):path("validate"):queryArgs({
			["displayName"] = p5
		})
	end)
end