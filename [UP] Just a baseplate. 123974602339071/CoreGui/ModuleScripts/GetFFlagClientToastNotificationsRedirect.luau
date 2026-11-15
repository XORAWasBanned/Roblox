-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagClientToastNotificationsRedirect
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local v_u_3 = game:DefineFastFlag("ClientToastNotificationsRedirect4", false)
local v_u_4 = game:DefineFastFlag("EnableClientToastNotificationsRedirectExperiment", false)
local v_u_5 = game:DefineFastString("ClientToastNotificationsRedirectLayerName", "Notification.Toast")
local v_u_6 = game:DefineFastString("ClientToastNotificationsRedirectLayerValue", "NotificationRedirect")
local v_u_7 = false
local v_u_8 = nil
local v_u_9 = nil
return function()
	-- upvalues: (copy) v_u_4, (ref) v_u_7, (ref) v_u_8, (ref) v_u_9, (copy) v_u_2, (copy) v_u_5, (copy) v_u_3, (copy) v_u_6
	if v_u_4 and not v_u_7 then
		local function v10()
			-- upvalues: (ref) v_u_7, (ref) v_u_2, (ref) v_u_5
			v_u_7 = true
			return v_u_2:GetLayerData(v_u_5)
		end
		local v11, v12 = pcall(v10)
		v_u_8 = v11
		v_u_9 = v12
	end
	local v13 = not v_u_3 and (v_u_8 and v_u_9)
	if v13 then
		v13 = v_u_9[v_u_6]
	end
	return v13
end