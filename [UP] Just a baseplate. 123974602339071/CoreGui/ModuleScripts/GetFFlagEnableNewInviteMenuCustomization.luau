-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagEnableNewInviteMenuCustomization
game:GetService("Players")
local v1 = game:GetService("CoreGui").RobloxGui.Modules
local v_u_2 = require(v1.Settings.Pages.ShareGame.NewInviteMenuExperimentManager)
game:DefineFastFlag("EnableNewInviteMenuCustomization2", false)
game:DefineFastFlag("EnableNewInviteMenuCustomizationIXP2", false)
return function()
	-- upvalues: (copy) v_u_2
	local v3 = not game:GetFastFlag("EnableNewInviteMenuCustomization2") and game:GetFastFlag("EnableNewInviteMenuCustomizationIXP2")
	if v3 then
		v3 = v_u_2.default:getCustomizationEnabled()
	end
	return v3
end