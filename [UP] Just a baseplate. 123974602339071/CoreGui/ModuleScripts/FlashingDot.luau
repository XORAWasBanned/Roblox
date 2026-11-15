-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.FlashingDot
local v_u_1 = game:GetService("RunService")
local v2 = game:GetService("CorePackages")
local v3 = game:GetService("CoreGui")
local v_u_4 = game:GetService("VideoCaptureService")
local v_u_5 = game:GetService("FaceAnimatorService")
local v_u_6 = require(v2.Packages.Roact)
local v7 = require(v2.Packages.ReactUtils)
local v8 = require(v2.Packages.t)
local v_u_9 = v7.EventConnection
local v10 = v3.RobloxGui.Modules
local v_u_11 = require(v10.VoiceChat.VoiceChatServiceManager).default
local v_u_12 = require(v10.Settings.getCamMicPermissions)
local v13 = v_u_6.PureComponent:extend("FlashingDot")
v13.validateProps = v8.strictInterface({})
function v13.init(p_u_14) -- name: init
	-- upvalues: (copy) v_u_6, (copy) v_u_11, (copy) v_u_5, (copy) v_u_4
	p_u_14:setState({
		["Visible"] = false,
		["isUsingMic"] = false,
		["hasMicPermissions"] = false,
		["hasCameraPermissions"] = false
	})
	p_u_14.prevTime = 1.5707963267948966
	p_u_14.prevSinTime = 1
	local v15, v16 = v_u_6.createBinding(0)
	p_u_14.transparencyBinding = v15
	p_u_14.updateTransparencyBinding = v16
	function p_u_14.checkNewVisibility()
		-- upvalues: (copy) p_u_14, (ref) v_u_11, (ref) v_u_5, (ref) v_u_4
		local v17 = p_u_14.state.hasMicPermissions
		if v17 then
			if v_u_11.localMuted == nil then
				v17 = false
			else
				v17 = not v_u_11.localMuted
			end
		end
		local v18 = p_u_14.state.hasCameraPermissions and v_u_5.VideoAnimationEnabled
		if v18 then
			v18 = v_u_4.Active
		end
		local v19 = v17 or v18
		if p_u_14.state.Visible ~= v19 then
			p_u_14:setState({
				["Visible"] = v19,
				["isUsingMic"] = v17
			})
		end
	end
	function p_u_14.animationConnection(p20)
		-- upvalues: (copy) p_u_14
		local v21 = p_u_14.prevTime + p20
		local v22 = v21 * 3
		local v23 = math.sin(v22)
		local v24 = p_u_14.prevSinTime
		local v25 = math.abs(v24)
		p_u_14.updateTransparencyBinding(v25 * -0.5 + 0.5)
		p_u_14.prevTime = v21
		p_u_14.prevSinTime = v23
	end
end
function v13.didMount(p_u_26) -- name: didMount
	-- upvalues: (copy) v_u_12
	p_u_26.isMounted = true
	v_u_12(function(p27)
		-- upvalues: (copy) p_u_26
		if p_u_26.isMounted then
			p_u_26:setState({
				["hasCameraPermissions"] = p27.hasCameraPermissions,
				["hasMicPermissions"] = p27.hasMicPermissions
			})
		end
	end, nil, nil, "FlashingDot.didMount")
	p_u_26.checkNewVisibility()
end
function v13.didUpdate(p28, p29, _) -- name: didUpdate
	if p28.state.hasMicPermissions ~= p29.hasMicPermissions or p28.state.hasCameraPermissions ~= p29.hasCameraPermissions then
		p28.checkNewVisibility()
	end
end
function v13.render(p30) -- name: render
	-- upvalues: (copy) v_u_6, (copy) v_u_9, (copy) v_u_11, (copy) v_u_5, (copy) v_u_1
	local v31 = UDim2.fromOffset(4, 4)
	local v32 = v_u_6.createElement
	local v33 = "Frame"
	local v34 = {
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
		["Visible"] = p30.state.Visible
	}
	local v35 = {
		["FlashingDot"] = v_u_6.createElement("ImageLabel", {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Image"] = "rbxasset://textures/AnimationEditor/FaceCaptureUI/FlashingDot.png",
			["ImageTransparency"] = nil,
			["LayoutOrder"] = 2,
			["Size"] = v31,
			["ImageTransparency"] = p30.transparencyBinding
		}),
		["MuteChangedEvent"] = v_u_6.createElement(v_u_9, {
			["event"] = v_u_11.muteChanged.Event,
			["callback"] = p30.checkNewVisibility
		}),
		["CameraChangedEvent"] = v_u_6.createElement(v_u_9, {
			["event"] = v_u_5:GetPropertyChangedSignal("VideoAnimationEnabled"),
			["callback"] = p30.checkNewVisibility
		})
	}
	local v36
	if p30.state.Visible then
		v36 = v_u_6.createElement(v_u_9, {
			["event"] = v_u_1.RenderStepped,
			["callback"] = p30.animationConnection
		})
	else
		v36 = nil
	end
	v35.AnimationConnection = v36
	return v32(v33, v34, v35)
end
function v13.willUnmount(p37) -- name: willUnmount
	p37.isMounted = false
end
return v13