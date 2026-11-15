-- Path: CorePackages.Packages._Index.NetworkingPresence.NetworkingPresence.networkRequests.createSetInvisibilityStatus
local v1 = script.Parent.Parent
require(v1.networkingPresenceTypes)
local v_u_2 = require(v1.PRESENCE_URL)
return function(p3)
	-- upvalues: (copy) v_u_2
	return p3.roduxNetworking.POST({
		["Name"] = "SetInvisibilityStatus"
	}, function(p4, p5)
		-- upvalues: (ref) v_u_2
		return p4(v_u_2):path("v1"):path("presence"):path("set-invisibility-status"):body({
			["isInvisible"] = p5
		})
	end)
end