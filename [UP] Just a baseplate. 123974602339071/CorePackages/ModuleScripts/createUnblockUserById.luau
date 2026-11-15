-- Path: CorePackages.Packages._Index.NetworkingBlocking.NetworkingBlocking.networkRequests.createUnblockUserById
local v1 = script.Parent.Parent
local v_u_2 = require(v1.ACCOUNT_SETTINGS_URL)
return function(p3)
	-- upvalues: (copy) v_u_2
	return p3.roduxNetworking.POST({
		["Name"] = "UnblockUserById"
	}, function(p4, p5)
		-- upvalues: (ref) v_u_2
		return p4(v_u_2, {
			["params"] = p5.currentUserId
		}):path("v1"):path("users"):id(p5.userId):path("unblock"):body({})
	end)
end