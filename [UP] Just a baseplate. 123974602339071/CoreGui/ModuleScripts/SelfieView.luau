-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.SelfieView
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v_u_4 = require(v1.Service)
local v5 = require(v1.ChromeShared.Service.ChromeUtils)
local v6 = game:GetService("VideoCaptureService")
local v7 = game:GetService("FaceAnimatorService")
local v8 = game:GetService("SocialService")
local v_u_9 = game:GetService("StarterGui")
local v_u_10 = require(v1.Integrations.CommonIcon)
local v11 = v5.MappedSignal
local v12 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v13 = v12.Modules.TopBar
local v_u_14 = require(v13.Constants)
local v_u_15 = v_u_14.ApplyDisplayScale(v_u_14.TopBarHeight)
local v16 = v1.Parent.SelfieView
local v_u_17 = require(v1.Flags.GetFFlagChromeSelfViewIgnoreCoreGui)
local v18 = require(v2.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local v_u_19 = require(v1.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local v20 = require(v2.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local v_u_21 = require(v16)
local v_u_22 = require(v16.Utils.FaceChatUtils)
local v_u_23 = require(v16.Utils.SizingUtils)
local v24 = require(v16.Utils.SelfieViewPolicy)
local v25 = require(v1.ChromeShared.Service.ChromeUtils).AvailabilitySignalState
local v26 = require(v1.ChromeShared.Service.WindowSizeSignal)
local v_u_27 = require(v2.Workspace.Packages.Chrome).UnibarStyle
local v_u_28 = require(v1.ChromeShared.Service.ViewportUtil)
local v29 = v_u_23.getSize(v_u_28.screenSize:get(), false)
local v_u_30 = v26.new(v29.X, v29.Y)
local v_u_31 = require(v1.ChromeShared.Unibar.Constants)
local v32 = require(v12.Modules.SelfView.Analytics).new()
local v_u_33 = v_u_31.SELFIE_VIEW_ID
local v_u_34 = v11.new(v_u_4:onIntegrationStatusChanged(), function()
	-- upvalues: (copy) v_u_4, (copy) v_u_33
	return v_u_4:isWindowOpen(v_u_33)
end)
local v35 = nil
local v36 = nil
local v_u_48 = v_u_4:register({
	["id"] = nil,
	["label"] = "CoreScripts.TopBar.SelfViewLabel",
	["sideSheetPlacement"] = nil,
	["windowSize"] = nil,
	["windowDefaultOpen"] = false,
	["initialAvailability"] = nil,
	["persistWindowState"] = true,
	["activated"] = nil,
	["isActivated"] = nil,
	["draggable"] = true,
	["cachePosition"] = true,
	["components"] = nil,
	["id"] = v_u_33,
	["sideSheetPlacement"] = v18.BelowFold,
	["windowSize"] = v_u_30,
	["initialAvailability"] = v25.Unavailable,
	["activated"] = function() -- name: activated
		-- upvalues: (copy) v_u_4, (copy) v_u_33
		v_u_4:toggleWindow(v_u_33)
	end,
	["isActivated"] = v_u_34,
	["components"] = {
		["Icon"] = function(_) -- name: Icon
			-- upvalues: (copy) v_u_19, (copy) v_u_27, (copy) v_u_31, (copy) v_u_3, (copy) v_u_10, (copy) v_u_34, (copy) v_u_21, (copy) v_u_4, (copy) v_u_33
			local v37
			if v_u_19 then
				v37 = v_u_27.use().ICON_SIZE
			else
				v37 = v_u_31.ICON_SIZE
			end
			local v38 = v_u_3.createElement
			local v39 = "Frame"
			local v40 = {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(0, v37, 0, v37)
			}
			local v41 = { (v_u_10("icons/controls/selfieOff", "icons/controls/selfie", v_u_34)) }
			local v42
			if v_u_21.useCameraOn() and not v_u_4:isWindowOpen(v_u_33) then
				v42 = v_u_3.createElement(v_u_21.CameraStatusDot, {
					["Position"] = nil,
					["ZIndex"] = 2,
					["Position"] = UDim2.fromScale(0.8, 0.7)
				})
			else
				v42 = nil
			end
			v41.CameraStatusDot = v42
			return v38(v39, v40, v41, {})
		end,
		["Window"] = function(_) -- name: Window
			-- upvalues: (copy) v_u_4, (copy) v_u_33, (copy) v_u_3, (copy) v_u_21, (copy) v_u_30
			local v43 = v_u_4:dragConnection(v_u_33)
			local v44 = v_u_3.createElement
			local v45 = v_u_21.Window
			local v46 = {
				["id"] = v_u_33,
				["windowSize"] = v_u_30
			}
			local v47
			if v43 == nil then
				v47 = false
			else
				v47 = v43.connection ~= nil
			end
			v46.isDraggedOut = v47
			return v44(v45, v46, {})
		end
	}
})
v_u_28.screenSize:connect(function(p49)
	-- upvalues: (copy) v_u_4, (copy) v_u_33, (copy) v_u_23, (copy) v_u_30
	if not v_u_4:isWindowOpen(v_u_33) then
		local v50 = v_u_23.getSize(p49, v_u_30:getIsLarge())
		v_u_30:requestSize(v50.X, v50.Y)
	end
end, true)
local function v53()
	-- upvalues: (copy) v_u_9, (copy) v_u_17, (copy) v_u_22, (copy) v_u_48
	local v51 = v_u_9:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView)
	if v_u_17() or v51 then
		local v52 = v_u_22.getPermissions()
		if (v52.placeCamEnabled or v52.placeMicEnabled) and (v52.userCamEligible or v52.userMicEligible) then
			v_u_48.availability:available()
		else
			v_u_48.availability:unavailable()
		end
	else
		if v_u_22.isCameraOn() then
			v_u_22.toggleVideoAnimation()
		end
		v_u_48.availability:unavailable()
		return
	end
end
if v20 then
	local v54 = v24.PolicyImplementation.read()
	local v55
	if v54 then
		v55 = v24.Mapper(v54).eligibleForSelfieViewFeature()
	else
		v55 = false
	end
	if not v55 then
		v_u_48.availability:forceUnavailable()
	end
end
if game:GetEngineFeature("VideoCaptureService") then
	v53()
	v6.Started:Connect(v53)
	v6.Stopped:Connect(v53)
	v6.DevicesChanged:Connect(v53)
	v7:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(v53)
	v7:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(v53)
	local v56 = v_u_22.getPermissions()
	v32:reportExperienceSettings(true, v56.placeCamEnabled, v56.placeMicEnabled)
	v32:reportUserAccountSettings(v56.userCamEnabled, v56.userMicEnabled)
end
v_u_9.CoreGuiChangedSignal:Connect(v53)
if game:GetEngineFeature("EnableSelfViewToggleApi") then
	if v35 then
		v35:Disconnect()
	end
	if v36 then
		v36:Disconnect()
	end
	v8.SelfViewVisible:Connect(function(p57)
		-- upvalues: (copy) v_u_14, (copy) v_u_4, (copy) v_u_33, (copy) v_u_30, (copy) v_u_28, (copy) v_u_31, (copy) v_u_15
		local v58 = v_u_14.ApplyDisplayScale(v_u_14.ScreenSideOffset)
		if not v_u_4:isWindowOpen(v_u_33) then
			local v59 = v_u_30:get()
			local v60 = v_u_28.screenSize:get()
			local v61 = nil
			if p57 == Enum.SelfViewPosition.TopLeft then
				v61 = UDim2.fromOffset(v58, v_u_31.WINDOW_DEFAULT_PADDING)
			elseif p57 == Enum.SelfViewPosition.TopRight then
				v61 = UDim2.fromOffset(v60.X - (v59.X.Offset + v58), v_u_31.WINDOW_DEFAULT_PADDING)
			elseif p57 == Enum.SelfViewPosition.BottomLeft then
				v61 = UDim2.fromOffset(v58, v60.Y - (v_u_15 + v59.Y.Offset + v_u_31.WINDOW_DEFAULT_PADDING))
			elseif p57 == Enum.SelfViewPosition.BottomRight then
				v61 = UDim2.fromOffset(v60.X - (v59.X.Offset + v58), v60.Y - (v_u_15 + v59.Y.Offset + v_u_31.WINDOW_DEFAULT_PADDING))
			end
			v_u_4:toggleWindow(v_u_33)
			if v61 then
				v_u_4:updateWindowPosition(v_u_33, v61)
			end
		end
	end)
	v8.SelfViewHidden:Connect(function()
		-- upvalues: (copy) v_u_4, (copy) v_u_33
		if v_u_4:isWindowOpen(v_u_33) then
			v_u_4:toggleWindow(v_u_33)
		end
	end)
end
return v_u_48