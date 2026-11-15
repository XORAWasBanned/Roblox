-- Path: CorePackages.Packages._Index.NetworkingCall.NetworkingCall.createRequestThunks
require(script.Parent.networkingCallTypes)
local v1 = script.Parent.networkRequests
local v_u_2 = require(v1.createGetCallHistory)
local v_u_3 = require(v1.createGetSuggestedCallees)
return function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	return {
		["GetCallHistory"] = v_u_2(p4),
		["GetSuggestedCallees"] = v_u_3(p4)
	}
end