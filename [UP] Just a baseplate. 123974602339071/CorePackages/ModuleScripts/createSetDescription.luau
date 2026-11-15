-- Path: CorePackages.Packages._Index.NetworkingUsers.NetworkingUsers.networkRequests.createSetDescription
local v_u_1 = require(script.Parent.Parent.USERS_URL)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.POST({
		["Name"] = "SetDescription"
	}, function(p3, p4, p5)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1, {
			["LocalUserId"] = p4
		}):path("v1"):path("description"):body({
			["description"] = p5
		})
	end)
end