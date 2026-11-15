-- Path: CorePackages.Packages._Index.NetworkingPremiumFeatures.NetworkingPremiumFeatures.networkRequests.createGetUserPremiumMembershipStatus
local v_u_1 = require(script.Parent.Parent.PREMIUM_FEATURES_URL)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.GET({
		["Name"] = "GetUserPremiumMembershipStatus"
	}, function(p3, p4)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1):path("v1"):path("users"):id(p4):path("validate-membership")
	end)
end