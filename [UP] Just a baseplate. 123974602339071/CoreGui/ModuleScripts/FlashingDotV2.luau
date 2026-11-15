-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.FlashingDotV2
local v_u_1 = game:GetService("RunService")
local v2 = game:GetService("CorePackages")
local v3 = game:GetService("CoreGui")
game:GetService("VideoCaptureService")
local v_u_4 = game:GetService("FaceAnimatorService")
local v_u_5 = require(v2.Packages.Roact)
require(v2.Packages.UIBlox)
local v6 = require(v2.Packages.ReactUtils)
local v7 = require(v2.Packages.t)
local v_u_8 = v6.EventConnection
local v9 = v3.RobloxGui.Modules
local v_u_10 = require(v9.VoiceChat.VoiceChatServiceManager).default
local v_u_11 = require(v3.RobloxGui.Modules.Settings.cameraDevicePermissionGrantedSignal)
local v12 = v_u_5.PureComponent:extend("FlashingDot")
v12.validateProps = v7.strictInterface({})
function v12.init(p_u_13) -- name: init
	-- upvalues: (copy) v_u_5, (copy) v_u_10, (copy) v_u_4, (copy) v_u_11
	p_u_13:setState({
		["Visible"] = false,
		["isUsingMic"] = false
	})
	p_u_13.prevTime = 1.5707963267948966
	p_u_13.prevSinTime = 1
	local v14, v15 = v_u_5.createBinding(0)
	p_u_13.transparencyBinding = v14
	p_u_13.updateTransparencyBinding = v15
	function p_u_13.checkNewVisibility()
		-- upvalues: (ref) v_u_10, (ref) v_u_4, (copy) p_u_13
		local v16
		if v_u_10.localMuted == nil then
			v16 = false
		else
			v16 = not v_u_10.localMuted
		end
		local v17 = v_u_4:IsStarted()
		if v17 then
			v17 = v_u_4.VideoAnimationEnabled
		end
		local v18 = v16 or v17
		if p_u_13.state.Visible ~= v18 then
			p_u_13:setState({
				["Visible"] = v18,
				["isUsingMic"] = v16
			})
		end
	end
	function p_u_13.animationConnection(p19)
		-- upvalues: (copy) p_u_13
		local v20 = p_u_13.prevTime + p19
		local v21 = v20 * 3
		local v22 = math.sin(v21)
		local v23 = p_u_13.prevSinTime
		local v24 = math.abs(v23)
		p_u_13.updateTransparencyBinding(v24 * -0.5 + 0.5)
		p_u_13.prevTime = v20
		p_u_13.prevSinTime = v22
	end
	function p_u_13.teardownCameraPermissionGrantedListener()
		-- upvalues: (copy) p_u_13
		if p_u_13.cameraPermissionGrantedListener then
			p_u_13.cameraPermissionGrantedListener:disconnect()
			p_u_13.cameraPermissionGrantedListener = nil
		end
	end
	p_u_13.cameraPermissionGrantedListener = v_u_11:connect(function()
		-- upvalues: (copy) p_u_13
		p_u_13.checkNewVisibility()
	end)
end
function v12.didMount(p25) -- name: didMount
	p25.checkNewVisibility()
end
function v12.willUnmount(p26) -- name: willUnmount
	if p26.teardownCameraPermissionGrantedListener then
		p26.teardownCameraPermissionGrantedListener()
	end
end
function v12.render(p27) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_10, (copy) v_u_4, (copy) v_u_1
	local v28 = UDim2.fromOffset(4, 4)
	local v29 = v_u_5.createElement
	local v30 = "Frame"
	local v31 = {
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["ZIndex"] = 2,
		["BorderSizePixel"] = 0,
		["BackgroundTransparency"] = 1,
		["Visible"] = nil,
		["AnchorPoint"] = Vector2.new(1, 0),
		["Position"] = UDim2.new(1, -4, 0, 3),
		["Size"] = UDim2.fromOffset(4, 4),
		["Visible"] = p27.state.Visible
	}
	local v32 = {
		["FlashingDot"] = v_u_5.createElement("ImageLabel", {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Image"] = "rbxasset://textures/AnimationEditor/FaceCaptureUI/FlashingDot.png",
			["ImageTransparency"] = nil,
			["LayoutOrder"] = 2,
			["Size"] = v28,
			["ImageTransparency"] = p27.transparencyBinding
		}),
		["MuteChangedEvent"] = v_u_5.createElement(v_u_8, {
			["event"] = v_u_10.muteChanged.Event,
			["callback"] = p27.checkNewVisibility
		}),
		["CameraChangedEvent"] = v_u_5.createElement(v_u_8, {
			["event"] = v_u_4:GetPropertyChangedSignal("VideoAnimationEnabled"),
			["callback"] = p27.checkNewVisibility
		})
	}
	local v33
	if p27.state.Visible then
		v33 = v_u_5.createElement(v_u_8, {
			["event"] = v_u_1.RenderStepped,
			["callback"] = p27.animationConnection
		})
	else
		v33 = nil
	end
	v32.AnimationConnection = v33
	return v29(v30, v31, v32)
end
return v12