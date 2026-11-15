-- Path: CoreGui.RobloxGui.Modules.Chrome.Flags.GetShouldShowPlatformChatBasedOnPolicy
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.UniversalAppPolicy)
return function()
	-- upvalues: (copy) v_u_2
	return v_u_2.getAppFeaturePolicies().getCanSeeChatTab()
end