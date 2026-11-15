-- Path: CorePackages.Packages._Index.NetworkingAccountInformation.NetworkingAccountInformation.networkRequests.createGetPhoneInformation
local v1 = script.Parent.Parent
require(v1.Types.networkRequestsTypes)
local v_u_2 = require(v1.ACCOUNT_INFORMATION_URL)
return function(p3)
	-- upvalues: (copy) v_u_2
	return p3.roduxNetworking.GET({
		["Name"] = "GetPhoneInformation"
	}, function(p4)
		-- upvalues: (ref) v_u_2
		return p4(v_u_2):path("v1"):path("phone")
	end)
end