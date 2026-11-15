-- Path: CoreGui.RobloxGui.Modules.Settings.getCamMicPermissions
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("RbxAnalyticsService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("VideoCaptureService")
local v_u_6 = require(v1.Packages.Cryo)
local v_u_7 = require(v1.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default
local v_u_8 = require(v2.RobloxGui.Modules.Settings.cameraDevicePermissionGrantedSignal)
local v_u_9 = require(v2.RobloxGui.Modules.Settings.Resources.MicrophoneDevicePermissionsLogging)
local v_u_10 = require(v1.Packages.Promise)
local v11 = v2:WaitForChild("RobloxGui")
local v_u_12 = require(v1.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local v_u_13 = require(v11.Modules.Flags.getFFlagEnableAnalyticsForCameraDevicePermissions)
local v_u_14 = require(v1.Workspace.Packages.SharedFlags).GetFFlagJoinWithoutMicPermissions
local v_u_15 = game:DefineFastFlag("CheckCameraAvailabilityBeforePermissions", false)
local v_u_16 = game:DefineFastFlag("DebugSkipVoicePermissionCheck", false)
local v_u_17
if v_u_12() then
	v_u_17 = game:GetService("AvatarChatService")
else
	v_u_17 = nil
end
local v_u_18 = nil
local v_u_19 = nil
local v_u_20 = {}
local v_u_21 = false
local function v_u_26(p22, p23, p24) -- name: removePermissionsBasedOnUserSetting
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_14, (copy) v_u_16, (copy) v_u_15, (copy) v_u_5
	if not p22.isCameraEnabled and v_u_6.List.find(p23, v_u_7.Permissions.CAMERA_ACCESS) then
		p23 = v_u_6.List.removeValue(p23, v_u_7.Permissions.CAMERA_ACCESS)
	end
	if v_u_14() then
		if not p22.isVoiceEnabled and v_u_6.List.find(p23, v_u_7.Permissions.MICROPHONE_ACCESS) or p24 == nil then
			p23 = v_u_6.List.removeValue(p23, v_u_7.Permissions.MICROPHONE_ACCESS)
		end
	elseif not p22.isVoiceEnabled and v_u_6.List.find(p23, v_u_7.Permissions.MICROPHONE_ACCESS) then
		p23 = v_u_6.List.removeValue(p23, v_u_7.Permissions.MICROPHONE_ACCESS)
	end
	if v_u_16 and v_u_6.List.find(p23, v_u_7.Permissions.MICROPHONE_ACCESS) then
		p23 = v_u_6.List.removeValue(p23, v_u_7.Permissions.MICROPHONE_ACCESS)
	end
	if v_u_15 and v_u_6.List.find(p23, v_u_7.Permissions.CAMERA_ACCESS) then
		local v25 = v_u_5:GetCameraDevices()
		if v_u_6.isEmpty(v25) then
			p23 = v_u_6.List.removeValue(p23, v_u_7.Permissions.CAMERA_ACCESS)
		end
	end
	return p23
end
local function v_u_49(p27, p_u_28, p_u_29, p30, p31, p_u_32) -- name: requestPermissions
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_26, (ref) v_u_21, (copy) v_u_10, (copy) v_u_9, (ref) v_u_18, (ref) v_u_19, (copy) v_u_8, (copy) v_u_13, (copy) v_u_4, (copy) v_u_3
	local v_u_33 = v_u_6.List.find(p30, v_u_7.Permissions.CAMERA_ACCESS) ~= nil
	local v_u_34 = v_u_6.List.find(p30, v_u_7.Permissions.MICROPHONE_ACCESS) ~= nil
	local v_u_35 = v_u_26(p27, p30, p31)
	local v_u_36 = v_u_6.List.find(v_u_35, v_u_7.Permissions.CAMERA_ACCESS) ~= nil
	local v_u_37 = v_u_6.List.find(v_u_35, v_u_7.Permissions.MICROPHONE_ACCESS) ~= nil
	if v_u_35 and #v_u_35 > 0 then
		if p31 == true then
			return v_u_10.new(function(p38, _)
				-- upvalues: (copy) v_u_35, (ref) v_u_7, (copy) p_u_28, (ref) v_u_21, (copy) p_u_29
				local v39 = {}
				for _, v40 in ipairs(v_u_35) do
					local v41, v42 = v_u_7:hasPermissions({ v40 }):await()
					if v41 then
						v39[v40] = v42.status == v_u_7.Status.AUTHORIZED
					else
						v39[v40] = false
					end
				end
				p_u_28({
					["hasCameraPermissions"] = v39[v_u_7.Permissions.CAMERA_ACCESS] or false,
					["hasMicPermissions"] = v39[v_u_7.Permissions.MICROPHONE_ACCESS] or false
				})
				v_u_21 = false
				p_u_29()
				p38(v39)
			end)
		else
			return v_u_7:hasPermissions(v_u_35):andThen(function(p43)
				-- upvalues: (ref) v_u_7, (copy) v_u_36, (copy) v_u_37, (copy) p_u_28, (ref) v_u_21, (copy) p_u_29, (copy) p_u_32, (ref) v_u_9, (copy) v_u_35, (ref) v_u_6, (ref) v_u_18, (copy) v_u_33, (ref) v_u_19, (copy) v_u_34, (ref) v_u_8, (ref) v_u_13, (ref) v_u_4, (ref) v_u_3
				if p43.status ~= v_u_7.Status.AUTHORIZED then
					if v_u_37 and p_u_32 then
						v_u_9:logPromptImpression({
							["didAuthorize"] = false,
							["uiContext"] = nil,
							["uiContext"] = p_u_32
						})
					end
					return v_u_7:requestPermissions(v_u_35):andThen(function(p44)
						-- upvalues: (ref) v_u_36, (ref) v_u_7, (ref) v_u_6, (ref) v_u_37, (ref) v_u_18, (ref) v_u_33, (ref) v_u_19, (ref) v_u_34, (ref) v_u_8, (ref) v_u_13, (ref) v_u_4, (ref) v_u_3, (ref) p_u_32, (ref) v_u_9, (ref) p_u_28, (ref) v_u_21, (ref) p_u_29
						if typeof(p44) == "table" then
							local v45 = v_u_36
							if v45 then
								v45 = p44.status == v_u_7.Status.AUTHORIZED and true or not v_u_6.List.find(p44.missingPermissions, v_u_7.Permissions.CAMERA_ACCESS)
							end
							local v46 = v_u_37
							if v46 then
								v46 = p44.status == v_u_7.Status.AUTHORIZED and true or not v_u_6.List.find(p44.missingPermissions, v_u_7.Permissions.MICROPHONE_ACCESS)
							end
							if not v_u_33 then
								v45 = nil
							end
							v_u_18 = v45
							if not v_u_34 then
								v46 = nil
							end
							v_u_19 = v46
							if v_u_18 then
								v_u_8:fire()
							end
						elseif p44 == v_u_7.Status.AUTHORIZED then
							v_u_8:fire()
							v_u_18 = v_u_36
							v_u_19 = v_u_37
						else
							v_u_18 = false
							v_u_19 = false
						end
						local v47 = {
							["hasCameraPermissions"] = v_u_18 or false,
							["hasMicPermissions"] = v_u_19 or false
						}
						if v_u_13() and v_u_36 then
							local v48 = v_u_18 or false
							v_u_3:SendEventDeferred(v_u_4:IsStudio() and "studio" or "client", "avatarChat", "CameraDevicePermissionPrompted", {
								["didAuthorize"] = v48
							})
						end
						if v_u_37 and p_u_32 then
							v_u_9:logPromptInteraction({
								["didAuthorize"] = v_u_19,
								["uiContext"] = p_u_32
							})
						end
						p_u_28(v47)
						v_u_21 = false
						p_u_29()
						return p44
					end)
				end
				p_u_28({
					["hasCameraPermissions"] = v_u_36,
					["hasMicPermissions"] = v_u_37
				})
				v_u_21 = false
				p_u_29()
				return p43
			end)
		end
	else
		p_u_28({
			["hasCameraPermissions"] = false,
			["hasMicPermissions"] = false
		})
		v_u_21 = false
		p_u_29()
		return
	end
end
local function v_u_53(p50) -- name: tryGetCachedResults
	-- upvalues: (copy) v_u_16, (ref) v_u_19, (ref) v_u_18, (copy) v_u_7
	if v_u_16 then
		v_u_19 = true
	end
	if v_u_18 == nil or v_u_19 == nil then
		return nil
	end
	local v51 = false
	for _, v52 in p50 do
		if v52 == v_u_7.Permissions.MICROPHONE_ACCESS or v52 == v_u_7.Permissions.CAMERA_ACCESS then
			continue
		end
		v51 = true
	end
	return not v51 and {
		["hasCameraPermissions"] = v_u_18 or false,
		["hasMicPermissions"] = v_u_19 or false
	} or nil
end
local function v_u_71(p_u_54, p55, p_u_56, p_u_57, p58) -- name: getCamMicPermissions
	-- upvalues: (copy) v_u_7, (copy) v_u_20, (copy) v_u_71, (copy) v_u_53, (ref) v_u_21, (copy) v_u_12, (copy) v_u_10, (copy) v_u_17, (copy) v_u_49
	local v_u_59 = p55 or { v_u_7.Permissions.MICROPHONE_ACCESS, v_u_7.Permissions.CAMERA_ACCESS }
	local function v_u_61() -- name: invokeNextRequest
		-- upvalues: (ref) v_u_20, (ref) v_u_71
		if v_u_20[1] then
			local v60 = v_u_20[1]
			table.remove(v_u_20, 1)
			v_u_71(v60.callback, v60.permissionsToRequest, v60.shouldNotRequestPerms, v60.context, v60.getRawPermission)
		end
	end
	local v62 = not p58 and v_u_53(v_u_59)
	if v62 then
		p_u_54(v62)
		if v_u_20[1] then
			local v63 = v_u_20[1]
			table.remove(v_u_20, 1)
			v_u_71(v63.callback, v63.permissionsToRequest, v63.shouldNotRequestPerms, v63.context, v63.getRawPermission)
		end
		return
	elseif v_u_21 then
		local v64 = v_u_20
		table.insert(v64, {
			["callback"] = p_u_54,
			["permissionsToRequest"] = p55,
			["shouldNotRequestPerms"] = p_u_56,
			["context"] = p_u_57,
			["getRawPermission"] = p58
		})
		return
	else
		v_u_21 = true
		if p58 then
			return v_u_7:hasPermissions(v_u_59):andThen(function(p65)
				-- upvalues: (copy) p_u_54, (ref) v_u_21, (ref) v_u_20, (ref) v_u_71
				p_u_54(p65)
				v_u_21 = false
				if v_u_20[1] then
					local v66 = v_u_20[1]
					table.remove(v_u_20, 1)
					v_u_71(v66.callback, v66.permissionsToRequest, v66.shouldNotRequestPerms, v66.context, v66.getRawPermission)
				end
			end)
		elseif v_u_12() then
			return v_u_10.new(function(p_u_67, _)
				-- upvalues: (ref) v_u_17
				if v_u_17.ClientFeaturesInitialized then
					p_u_67({
						["isVoiceEnabled"] = v_u_17:IsEnabled(v_u_17.ClientFeatures, Enum.AvatarChatServiceFeature.UserAudio),
						["isCameraEnabled"] = v_u_17:IsEnabled(v_u_17.ClientFeatures, Enum.AvatarChatServiceFeature.UserVideo)
					})
				else
					local v_u_68 = nil
					v_u_68 = v_u_17:GetPropertyChangedSignal("ClientFeatures"):Connect(function()
						-- upvalues: (ref) v_u_68, (ref) v_u_17, (copy) p_u_67
						v_u_68:Disconnect()
						p_u_67({
							["isVoiceEnabled"] = v_u_17:IsEnabled(v_u_17.ClientFeatures, Enum.AvatarChatServiceFeature.UserAudio),
							["isCameraEnabled"] = v_u_17:IsEnabled(v_u_17.ClientFeatures, Enum.AvatarChatServiceFeature.UserVideo)
						})
					end)
				end
			end):andThen(function(p69)
				-- upvalues: (ref) v_u_49, (copy) p_u_54, (copy) v_u_61, (ref) v_u_59, (copy) p_u_56, (copy) p_u_57
				v_u_49(p69, p_u_54, v_u_61, v_u_59, p_u_56, p_u_57)
			end)
		else
			return v_u_10.new(function(p70, _)
				p70({
					["isVoiceEnabled"] = false,
					["isCameraEnabled"] = false
				})
			end)
		end
	end
end
return v_u_71