-- Path: CorePackages.Packages._Index.NetworkingChat.NetworkingChat.networkRequests.createGetUserConversations
local v1 = script.Parent.Parent
require(v1.networkingChatTypes)
local v_u_2 = require(v1.CHAT_URL)
return function(p3)
	-- upvalues: (copy) v_u_2
	return p3.roduxNetworking.GET({
		["Name"] = "GetUserConversations"
	}, function(p4, p5, p6)
		-- upvalues: (ref) v_u_2
		return p4(v_u_2):path("v2"):path("get-user-conversations"):queryArgs({
			["pageNumber"] = p5,
			["pageSize"] = p6
		}):setStatusIds({ p5 })
	end)
end