-- Path: CorePackages.Packages._Index.NetworkingPremiumFeatures.NetworkingPremiumFeatures
local v1 = script.networkRequests
local v_u_2 = require(v1.createGetUserPremiumMembershipStatus)
return {
	["config"] = function(p3) -- name: createRequestThunks
		-- upvalues: (copy) v_u_2
		return {
			["GetUserPremiumMembershipStatus"] = v_u_2(p3)
		}
	end
}