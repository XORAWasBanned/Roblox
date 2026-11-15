-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Components.getIconVoiceIndicator
local v1 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_2 = require(v1.Modules.VoiceChat.VoiceChatServiceManager).default
return function(p3, p4)
	-- upvalues: (copy) v_u_2
	return v_u_2:GetIcon(p3, p4)
end