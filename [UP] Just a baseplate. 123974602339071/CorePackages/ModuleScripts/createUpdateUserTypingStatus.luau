-- Path: CorePackages.Packages._Index.NetworkingChat.NetworkingChat.networkRequests.createUpdateUserTypingStatus
local v1 = script.Parent.Parent
require(v1.networkingChatTypes)
local v_u_2 = require(v1.CHAT_URL)
return function(p3)
	-- upvalues: (copy) v_u_2
	return p3.roduxNetworking.POST({
		["Name"] = "UpdateUserTypingStatus"
	}, function(p4, p5, p6)
		-- upvalues: (ref) v_u_2
		return p4(v_u_2):path("v2"):path("update-user-typing-status"):body({
			["conversationId"] = p5,
			["isTyping"] = p6
		}):setStatusIds({ p5 })
	end)
end