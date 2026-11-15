-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Network.Requests.DEPRECATED_ChatSendGameLinkMessage
local v_u_1 = game:GetService("HttpService")
local v2 = script.Parent.Parent.Parent
local v_u_3 = require(v2.Network.Url)
return function(p4, p5, p6, p7)
	-- upvalues: (copy) v_u_1, (copy) v_u_3
	assert(p4, "requestImpl is required")
	assert(p5, "conversationId is required")
	assert(p6, "universeId is required")
	local v8 = {
		["postBody"] = v_u_1:JSONEncode({
			["conversationId"] = p5,
			["universeId"] = p6,
			["decorators"] = p7
		})
	}
	return p4(string.format("%s/send-game-link-message", v_u_3.CHAT_URL), "POST", v8)
end