-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagEnableNewInviteSendEndpoint
game:GetService("Players")
local v1 = game:GetService("CoreGui").RobloxGui.Modules
local v_u_2 = require(v1.Settings.Pages.ShareGame.NewInviteMenuExperimentManager)
game:DefineFastFlag("EnableNewInviteSendEndpoint", false)
game:DefineFastFlag("EnableNewInviteSendEndpointIXP", false)
return function()
	-- upvalues: (copy) v_u_2
	local v3 = not game:GetFastFlag("EnableNewInviteSendEndpoint") and game:GetFastFlag("EnableNewInviteSendEndpointIXP")
	if v3 then
		v3 = v_u_2.default:getCustomizationEnabled()
	end
	return v3
end