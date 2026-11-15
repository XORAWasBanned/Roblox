-- Path: CoreGui.RobloxGui.Modules.Settings.isCamEnabledForUserAndPlace
local v_u_1 = game:GetService("AvatarChatService")
local v_u_2 = game:GetService("AppStorageService")
local v3 = game:GetService("CoreGui")
local v4 = game:GetService("CorePackages")
local v_u_5 = game:GetService("VideoCaptureService")
local v_u_6 = require(v4.Packages.Cryo)
local v7 = v3:WaitForChild("RobloxGui")
local v_u_8 = game:GetService("IXPService")
local v_u_9 = game:GetService("MemStorageService")
local v_u_10 = require(v4.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local v_u_11 = require(v7.Modules.Flags.getFFlagUseCameraDevicesListener)
local v_u_12 = require(v7.Modules.Settings.cameraDevicesHelper)
local v_u_13 = require(v7.Modules.Tracker.TrackerMenu)
local v_u_14 = require(v7.Modules.Tracker.TrackerPromptType)
local v_u_15 = game:DefineFastFlag("DisableCameraOnLowSpecDevices2", false)
local v_u_16 = game:DefineFastString("DisableCameraOnLowSpecDevicesIXPLayer", "AvatarChat.DisableOnLowSpecAndroid")
local v_u_17 = game:DefineFastString("DisableCameraOnLowSpecDevicesIXPField", "DisableOnAndroid")
local v_u_18 = game:DefineFastFlag("OnlyShowToastOnce2", false)
local v_u_19 = game:DefineFastFlag("DebugAlwaysShowDisableCameraToast", false)
local v_u_20 = game:DefineFastFlag("OnlyShowToastOnceInLifetime2", false)
local v_u_21 = game:GetEngineFeature("DisableCameraToastShownStorageKey")
local function v_u_25() -- name: ShouldCheckDeviceSpecs
	-- upvalues: (copy) v_u_15, (copy) v_u_8, (copy) v_u_16, (copy) v_u_17
	if not v_u_15 then
		return false
	end
	local function v22()
		-- upvalues: (ref) v_u_8, (ref) v_u_16
		return v_u_8:GetUserLayerVariables(v_u_16)
	end
	local v23, v24 = pcall(v22)
	if not v23 or (not v24 or v24[v_u_17] == nil) then
		return false
	end
	v_u_8:LogUserLayerExposure(v_u_16)
	return v24[v_u_17]
end
return function()
	-- upvalues: (copy) v_u_10, (copy) v_u_1, (copy) v_u_15, (copy) v_u_25, (copy) v_u_20, (copy) v_u_21, (copy) v_u_2, (copy) v_u_19, (copy) v_u_13, (copy) v_u_14, (copy) v_u_18, (copy) v_u_9, (copy) v_u_11, (copy) v_u_12, (copy) v_u_5, (copy) v_u_6
	if not v_u_10() or _G.__TESTEZ_RUNNING_TEST__ then
		return false
	end
	local v26 = v_u_1.GetClientFeaturesAsync
	local v27 = v_u_1
	local v28, v29 = pcall(v26, v27)
	if not v28 then
		warn("Unable to get Client Features from AvatarChatService")
		return false
	end
	local v30 = v_u_1:IsEnabled(v29, Enum.AvatarChatServiceFeature.PlaceVideo)
	local v31 = v_u_1:IsEnabled(v29, Enum.AvatarChatServiceFeature.UserVideo)
	local v32 = v_u_1:IsEnabled(v29, Enum.AvatarChatServiceFeature.UserVideoEligible)
	if v_u_15 and (v30 and (v31 and (v32 and (not v_u_1:deviceMeetsRequirementsForFeature(Enum.DeviceFeatureType.DeviceCapture) and v_u_25())))) then
		if v_u_20 and v_u_21 then
			local function v33()
				-- upvalues: (ref) v_u_2
				return v_u_2:GetItem("DisableCameraToastShown")
			end
			local v34, v35 = pcall(v33)
			if not v34 or (v35 ~= "true" or v_u_19) then
				v_u_13:showPrompt(v_u_14.CameraUnavailable)
				local function v36()
					-- upvalues: (ref) v_u_2
					v_u_2:SetItem("DisableCameraToastShown", "true")
					v_u_2:Flush()
				end
				pcall(v36)
			end
		elseif v_u_18 then
			if v_u_9:GetItem("DisableCameraToastShown") ~= "true" or v_u_19 then
				v_u_13:showPrompt(v_u_14.CameraUnavailable)
				v_u_9:SetItem("DisableCameraToastShown", "true")
			end
		else
			v_u_13:showPrompt(v_u_14.CameraUnavailable)
		end
		return false
	end
	local v37
	if v_u_11() then
		v37 = v_u_12.GetDevices()
	else
		v37 = v_u_5:GetCameraDevices()
	end
	local v38 = not v_u_6.isEmpty(v37)
	if v30 then
		if v32 then
			if not v31 then
				v38 = v31
			end
		else
			v38 = v32
		end
	else
		v38 = v30
	end
	return v38
end