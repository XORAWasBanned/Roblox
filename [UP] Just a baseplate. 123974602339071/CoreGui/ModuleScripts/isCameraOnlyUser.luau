-- Path: CoreGui.RobloxGui.Modules.Settings.isCameraOnlyUser
local v_u_1 = game:GetService("AvatarChatService")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("VideoCaptureService")
local v4 = game:GetService("CorePackages")
local v_u_5 = require(v4.Packages.Cryo)
local v6 = v2:WaitForChild("RobloxGui")
local v_u_7 = require(v4.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local v_u_8 = require(v6.Modules.Flags.getFFlagUseCameraDevicesListener)
local v_u_9 = require(v6.Modules.Settings.cameraDevicesHelper)
return function()
	-- upvalues: (copy) v_u_7, (copy) v_u_1, (copy) v_u_8, (copy) v_u_9, (copy) v_u_3, (copy) v_u_5
	if v_u_7() then
		local v10 = v_u_1.GetClientFeaturesAsync
		local v11 = v_u_1
		local v12, v13 = pcall(v10, v11)
		if v12 then
			local v14 = v_u_1:IsEnabled(v13, Enum.AvatarChatServiceFeature.PlaceVideo)
			local v15 = v_u_1:IsEnabled(v13, Enum.AvatarChatServiceFeature.UserVideo)
			local v16 = v_u_1:IsEnabled(v13, Enum.AvatarChatServiceFeature.UserVideoEligible)
			local v17 = v_u_1:IsEnabled(v13, Enum.AvatarChatServiceFeature.PlaceAudio)
			local v18 = v_u_1:IsEnabled(v13, Enum.AvatarChatServiceFeature.UserAudio)
			local v19 = v_u_1:IsEnabled(v13, Enum.AvatarChatServiceFeature.UserAudioEligible)
			local v20
			if v_u_8() then
				v20 = v_u_9.GetDevices()
			else
				v20 = v_u_3:GetCameraDevices()
			end
			if v_u_5.isEmpty(v20) then
				return false
			else
				local v21 = v18 and v19
				local v22 = v15 and v16
				if v14 then
					if v17 and v21 then
						return false
					else
						return v22 and true or false
					end
				else
					return false
				end
			end
		else
			warn("Unable to get Client Features from AvatarChatService")
			return false
		end
	else
		return false
	end
end