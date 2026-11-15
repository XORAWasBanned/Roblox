-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Components.getPermissions
local v1 = game:GetService("CoreGui").RobloxGui.Modules
local v_u_2 = require(v1.Settings.getCamMicPermissions)
local v3 = game:GetService("CorePackages")
local v_u_4 = require(v3.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default
return function(p_u_5, p6, p7)
	-- upvalues: (copy) v_u_4, (copy) v_u_2
	local v8 = nil
	if p6 then
		if p6 == "camera" then
			v8 = { v_u_4.Permissions.CAMERA_ACCESS }
		else
			v8 = p6 == "microphone" and { v_u_4.Permissions.MICROPHONE_ACCESS } or v8
		end
	end
	v_u_2(function(p9)
		-- upvalues: (copy) p_u_5
		p_u_5(p9.hasCameraPermissions, p9.hasMicPermissions)
	end, v8, p7, "ExperienceChat.getPermissions")
end