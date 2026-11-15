-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Network.Requests.DEPRECATED_ChatStartOneToOneConversation
local v_u_1 = game:GetService("HttpService")
local v2 = script.Parent.Parent.Parent
local v_u_3 = require(v2.Network.Url)
return function(p4, p5, _)
	-- upvalues: (copy) v_u_1, (copy) v_u_3
	local v6 = {
		["postBody"] = v_u_1:JSONEncode({
			["participantuserId"] = p5
		})
	}
	return p4(string.format("%s/start-one-to-one-conversation", v_u_3.CHAT_URL), "POST", v6)
end