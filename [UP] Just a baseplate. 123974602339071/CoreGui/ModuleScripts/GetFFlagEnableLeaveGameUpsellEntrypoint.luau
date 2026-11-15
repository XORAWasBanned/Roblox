-- Path: CoreGui.RobloxGui.Modules.Settings.Flags.GetFFlagEnableLeaveGameUpsellEntrypoint
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints
game:DefineFastFlag("EnableLeaveGameUpsellEntrypoint", false)
return function()
	-- upvalues: (copy) v_u_2
	local v3 = v_u_2()
	if v3 then
		v3 = game:GetFastFlag("EnableLeaveGameUpsellEntrypoint")
	end
	return v3
end