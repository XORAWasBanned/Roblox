-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Network.Requests.DEPRECATED_ChatSendMessage
local v_u_1 = game:GetService("HttpService")
local v2 = script.Parent.Parent.Parent
local v_u_3 = require(v2.Network.Url)
return function(p4, p5, p6, p7)
	-- upvalues: (copy) v_u_1, (copy) v_u_3
	local v8 = {
		["postBody"] = v_u_1:JSONEncode({
			["conversationId"] = p5,
			["message"] = p6,
			["decorators"] = p7
		})
	}
	return p4(string.format("%s/send-message", v_u_3.CHAT_URL), "POST", v8)
end