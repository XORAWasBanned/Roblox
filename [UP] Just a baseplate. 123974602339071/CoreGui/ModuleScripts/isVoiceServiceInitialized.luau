-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Components.isVoiceServiceInitialized
local v1 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v2 = game:GetService("CorePackages")
require(v2.Packages.Promise)
local v_u_3 = require(v1.Modules.VoiceChat.VoiceChatServiceManager).default
return function()
	-- upvalues: (copy) v_u_3
	return v_u_3:asyncInit()
end