-- Path: CorePackages.Packages._Index.NetworkingChat.NetworkingChat.networkRequests.createSendGameLinkMessage
local v1 = script.Parent.Parent
require(v1.networkingChatTypes)
local v_u_2 = require(v1.CHAT_URL)
return function(p3)
	-- upvalues: (copy) v_u_2
	return p3.roduxNetworking.POST({
		["Name"] = "SendGameLinkMessage"
	}, function(p4, p5, p6, p7)
		-- upvalues: (ref) v_u_2
		return p4(v_u_2):path("v2"):path("send-game-link-message"):body({
			["universeId"] = p5,
			["conversationId"] = p6,
			["decorators"] = p7
		}):setStatusIds({ p6 })
	end)
end