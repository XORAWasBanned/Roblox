-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Logger
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new("BubbleChatLogger")
return function(p3)
	-- upvalues: (copy) v_u_2
	return v_u_2:new(p3)
end