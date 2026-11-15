-- Path: CoreGui.RobloxGui.Modules.SelfieView.Utils.FaceChatUtils
local v_u_1 = game:GetService("AvatarChatService")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_3 = require(v2.Modules.Settings.getCamMicPermissions)
local v4 = game:GetService("CorePackages")
local v_u_5 = require(v4.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default
local v_u_6 = require(v4.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local v_u_7 = game:DefineFastFlag("DisableCameraOnSelfieViewForLowspecDevices", false)
local v_u_8 = not v_u_7 and function()
	return true
end or require(v2.Modules.Settings.isCamEnabledForUserAndPlace)
local v_u_9 = game:GetService("FaceAnimatorService")
local v_u_10 = nil
local function v_u_16()
	-- upvalues: (ref) v_u_10, (copy) v_u_6, (copy) v_u_1, (copy) v_u_7, (ref) v_u_8
	if v_u_10 ~= nil then
		return v_u_10
	end
	if not v_u_6() or _G.__TESTEZ_RUNNING_TEST__ then
		return {
			["placeCamEnabled"] = false,
			["placeMicEnabled"] = false,
			["userCamEnabled"] = false,
			["userCamEligible"] = false,
			["userMicEnabled"] = false,
			["userMicEligible"] = false
		}
	end
	local v11 = v_u_1.GetClientFeaturesAsync
	local v12 = v_u_1
	local v13, v14 = pcall(v11, v12)
	if not v13 then
		warn("Unable to get Client Features from AvatarChatService")
		return {
			["placeCamEnabled"] = false,
			["placeMicEnabled"] = false,
			["userCamEnabled"] = false,
			["userCamEligible"] = false,
			["userMicEnabled"] = false,
			["userMicEligible"] = false
		}
	end
	local v15 = {
		["placeMicEnabled"] = v_u_1:IsEnabled(v14, Enum.AvatarChatServiceFeature.PlaceAudio),
		["userMicEnabled"] = v_u_1:IsEnabled(v14, Enum.AvatarChatServiceFeature.UserAudio),
		["userMicEligible"] = v_u_1:IsEnabled(v14, Enum.AvatarChatServiceFeature.UserAudioEligible),
		["placeCamEnabled"] = v_u_1:IsEnabled(v14, Enum.AvatarChatServiceFeature.PlaceVideo),
		["userCamEnabled"] = v_u_1:IsEnabled(v14, Enum.AvatarChatServiceFeature.UserVideo),
		["userCamEligible"] = v_u_1:IsEnabled(v14, Enum.AvatarChatServiceFeature.UserVideoEligible)
	}
	if v_u_7 and (v15.placeCamEnabled and (v15.userCamEligible and (v15.userCamEnabled and not v_u_8()))) then
		v15.userCamEnabled = false
	end
	v_u_10 = v15
	return v15
end
local function v_u_17() -- name: getTrackerMode
	-- upvalues: (copy) v_u_9
	if v_u_9.AudioAnimationEnabled and not v_u_9.VideoAnimationEnabled then
		return Enum.TrackerMode.Audio
	elseif v_u_9.AudioAnimationEnabled or not (v_u_9.VideoAnimationEnabled and v_u_9:IsStarted()) then
		if v_u_9.AudioAnimationEnabled and (v_u_9.VideoAnimationEnabled and v_u_9:IsStarted()) then
			return Enum.TrackerMode.AudioVideo
		else
			return Enum.TrackerMode.None
		end
	else
		return Enum.TrackerMode.Video
	end
end
return {
	["getPermissions"] = v_u_16,
	["toggleVideoAnimation"] = function() -- name: toggleVideoAnimation
		-- upvalues: (copy) v_u_9, (copy) v_u_7, (copy) v_u_16, (copy) v_u_3, (copy) v_u_5
		v_u_3(function()
			-- upvalues: (ref) v_u_9, (ref) v_u_7, (ref) v_u_16
			if v_u_9 and v_u_9:IsStarted() then
				if not v_u_7 or v_u_16().userCamEnabled then
					v_u_9.VideoAnimationEnabled = not v_u_9.VideoAnimationEnabled
				end
			end
		end, { v_u_5.Permissions.CAMERA_ACCESS })
	end,
	["getTrackerMode"] = v_u_17,
	["isCameraOn"] = function() -- name: isCameraOn
		-- upvalues: (copy) v_u_17
		local v18 = v_u_17()
		return v18 == Enum.TrackerMode.AudioVideo and true or v18 == Enum.TrackerMode.Video
	end
}