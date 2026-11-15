-- Path: CorePackages.Packages._Index.NetworkingChat.NetworkingChat.networkRequests.createResetConversationUniverse
local v1 = script.Parent.Parent
require(v1.networkingChatTypes)
local v_u_2 = require(v1.CHAT_URL)
return function(p3)
	-- upvalues: (copy) v_u_2
	return p3.roduxNetworking.POST({
		["Name"] = "ResetConversationUniverse"
	}, function(p4, p5)
		-- upvalues: (ref) v_u_2
		return p4(v_u_2):path("v2"):path("reset-conversation-universe"):body({
			["conversationId"] = p5
		}):setStatusIds({ p5 })
	end)
end