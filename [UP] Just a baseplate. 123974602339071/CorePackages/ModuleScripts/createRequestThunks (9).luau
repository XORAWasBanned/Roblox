-- Path: CorePackages.Packages._Index.NetworkingPresence.NetworkingPresence.createRequestThunks
local v1 = script.Parent.networkRequests
local v_u_2 = require(v1.createGetPresencesFromUserIds)
local v_u_3 = require(v1.createSetInvisibilityStatus)
require(script.Parent.networkingPresenceTypes)
return function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	return {
		["GetPresencesFromUserIds"] = v_u_2(p4),
		["SetInvisibilityStatus"] = v_u_3(p4)
	}
end