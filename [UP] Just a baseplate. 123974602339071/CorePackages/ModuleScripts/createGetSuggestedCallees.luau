-- Path: CorePackages.Packages._Index.NetworkingCall.NetworkingCall.networkRequests.createGetSuggestedCallees
local v_u_1 = require(script.Parent.Parent.CALL_URL)
require(script.Parent.Parent.networkingCallTypes)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.GET({
		["Name"] = "GetSuggestedCallees"
	}, function(p3)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1):path("call"):path("v1"):path("get-suggested-callees")
	end)
end