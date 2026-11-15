-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagEnableNewInviteMenu
local v_u_1 = game:GetService("Players")
local v2 = game:GetService("CoreGui").RobloxGui.Modules
local v_u_3 = require(v2.Settings.Pages.ShareGame.NewInviteMenuExperimentManager)
game:DefineFastInt("EnableNewInviteMenuStyleRollout", 0)
game:DefineFastFlag("EnableNewInviteMenuStyle", false)
return function()
	-- upvalues: (copy) v_u_1, (copy) v_u_3
	if not v_u_1.LocalPlayer then
		return false
	end
	if game:GetFastFlag("EnableNewInviteMenuStyle") then
		return true
	end
	local v4 = v_u_1.LocalPlayer
	return game:GetFastInt("EnableNewInviteMenuStyleRollout") > v4.UserId % 100 and true or v_u_3.default:getStyleEnabled()
end