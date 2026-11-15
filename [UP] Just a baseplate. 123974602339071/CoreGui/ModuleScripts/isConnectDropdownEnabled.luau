-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.Connect.isConnectDropdownEnabled
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience
local v_u_4 = require(v1.Flags.GetShouldShowPlatformChatBasedOnPolicy)
return function()
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v5 = v_u_3()
	if v5 then
		v5 = v_u_4()
	end
	return v5
end