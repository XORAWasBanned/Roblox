-- Path: CorePackages.Packages._Index.NetworkingAccountSettings.NetworkingAccountSettings.createRequestThunks
local v1 = script.Parent
local v2 = v1.networkRequests
local v_u_3 = require(v2.createGetEmailSettings)
require(v1.Types.networkRequestsTypes)
return function(p4)
	-- upvalues: (copy) v_u_3
	return {
		["GetEmailSettings"] = v_u_3(p4)
	}
end