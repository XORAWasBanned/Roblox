-- Path: CorePackages.Packages._Index.NetworkingBlocking.NetworkingBlocking.networkRequests.createGetBlockedUsers
local v1 = script.Parent.Parent
local v_u_2 = require(v1.ACCOUNT_SETTINGS_URL)
return function(p3)
	-- upvalues: (copy) v_u_2
	return p3.roduxNetworking.GET({
		["Name"] = "GetBlockedUsers"
	}, function(p4, p5)
		-- upvalues: (ref) v_u_2
		return p4(v_u_2, {
			["currentUserId"] = p5 and p5.currentUserId or nil
		}):path("v1"):path("users"):path("get-detailed-blocked-users")
	end)
end