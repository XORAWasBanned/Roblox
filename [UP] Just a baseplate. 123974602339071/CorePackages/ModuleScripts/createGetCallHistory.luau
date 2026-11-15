-- Path: CorePackages.Packages._Index.NetworkingCall.NetworkingCall.networkRequests.createGetCallHistory
local v_u_1 = require(script.Parent.Parent.CALL_URL)
require(script.Parent.Parent.networkingCallTypes)
return function(p2)
	-- upvalues: (copy) v_u_1
	return p2.roduxNetworking.GET({
		["Name"] = "GetCallHistory"
	}, function(p3, p4)
		-- upvalues: (ref) v_u_1
		local v5 = p3(v_u_1):path("call"):path("v1"):path("get-call-history")
		local v6 = {}
		local v7
		if p4 then
			v7 = p4.universeId
		else
			v7 = nil
		end
		v6.universeId = v7
		local v8
		if p4 then
			v8 = p4.limit
		else
			v8 = nil
		end
		v6.limit = v8
		local v9
		if p4 then
			v9 = p4.cursor
		else
			v9 = nil
		end
		v6.cursor = v9
		return v5:queryArgs(v6)
	end)
end