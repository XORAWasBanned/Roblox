-- Path: CorePackages.Packages._Index.NetworkingChat.NetworkingChat.networkRequests.createGetMetadata
local v1 = script.Parent.Parent
require(v1.networkingChatTypes)
local v_u_2 = require(v1.CHAT_URL)
return function(p3)
	-- upvalues: (copy) v_u_2
	return p3.roduxNetworking.GET({
		["Name"] = "GetMetadata"
	}, function(p4)
		-- upvalues: (ref) v_u_2
		return p4(v_u_2):path("v2"):path("metadata")
	end)
end