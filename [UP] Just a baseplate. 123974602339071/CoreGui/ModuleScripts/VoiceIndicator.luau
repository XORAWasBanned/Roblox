-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Components.VoiceIndicator
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("HttpService")
local v_u_3 = game:GetService("RunService")
local v4 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v5 = require(v1.Packages.UIBlox)
local v_u_6 = v5.App.SelectionImage.withSelectionCursorProvider
local v_u_7 = v5.App.SelectionImage.CursorKind
local v_u_8 = require(v4.Modules.VoiceChat.Logger)(script.Name)
local v_u_9 = require(v1.Packages.Roact)
local v_u_10 = require(v1.Packages.ReactIs)
local v11 = require(v1.Packages.RoactRodux)
local v12 = require(v1.Packages.t)
local v_u_13 = require(v4.Modules.VoiceChat.Constants)
local v_u_14 = require(v4.Modules.VoiceChat.VoiceChatServiceManager).default
local v15 = v_u_9.PureComponent:extend("VoiceIndicator")
v15.validateProps = v12.strictInterface({
	["onClicked"] = v12.optional(v12.callback),
	["userId"] = v12.string,
	["hideOnError"] = v12.optional(v12.boolean),
	["size"] = v12.optional(v12.UDim2),
	["iconStyle"] = v12.optional(v12.union(v12.literal("MicDark"), v12.literal("MicLight"), v12.literal("SpeakerDark"), v12.literal("SpeakerLight"))),
	["iconTransparency"] = v12.optional(v12.union(v12.number, v12.table)),
	["voiceState"] = v12.string
})
v15.defaultProps = {}
function v15.getIcon(_, p16) -- name: getIcon
	return "rbxasset://textures/ui/VoiceChat/" .. p16 .. ".png"
end
function v15.init(p_u_17) -- name: init
	-- upvalues: (copy) v_u_9, (copy) v_u_2, (copy) v_u_3, (copy) v_u_13, (copy) v_u_14
	local v18, v19 = v_u_9.createBinding(0)
	p_u_17.level = v18
	p_u_17.updateLevel = v19
	local v20, v21 = v_u_9.createBinding(p_u_17.props.voiceState)
	p_u_17.voiceState = v20
	p_u_17.updateVoiceState = v21
	p_u_17.renderStepName = v_u_2:GenerateGUID()
	v_u_3:BindToRenderStep(p_u_17.renderStepName, 1, function()
		-- upvalues: (copy) p_u_17
		p_u_17.updateLevel(math.random())
	end)
	p_u_17.levelIcon = v_u_9.joinBindings({ p_u_17.voiceState, p_u_17.level }):map(function(p22)
		-- upvalues: (ref) v_u_13, (ref) v_u_14, (copy) p_u_17
		local v23 = p22[1]
		local v24 = p22[2]
		if v23 == v_u_13.VOICE_STATE.MUTED or v23 == v_u_13.VOICE_STATE.LOCAL_MUTED then
			return v_u_14:GetIcon("Muted", p_u_17.props.iconStyle)
		end
		if v23 == v_u_13.VOICE_STATE.CONNECTING then
			return v_u_14:GetIcon("Connecting", p_u_17.props.iconStyle)
		end
		if v23 == v_u_13.VOICE_STATE.INACTIVE then
			return v_u_14:GetIcon("Unmuted0", p_u_17.props.iconStyle)
		end
		if v23 ~= v_u_13.VOICE_STATE.TALKING then
			return v_u_14:GetIcon("Error", p_u_17.props.iconStyle)
		end
		local v25 = v24 * 5 + 0.5
		local v26 = math.floor(v25) * 20
		return v_u_14:GetIcon("Unmuted" .. tostring(v26), p_u_17.props.iconStyle)
	end)
end
function v15.renderWithSelectionCursor(p27, p28) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_13, (copy) v_u_10, (copy) v_u_9, (copy) v_u_7
	local v29 = p27.props.voiceState == v_u_13.VOICE_STATE.ERROR and true or p27.props.voiceState == v_u_13.VOICE_STATE.HIDDEN
	if p27.props.hideOnError and (not p27.props.voiceState or v29) then
		return nil
	end
	local v_u_30 = p27.props.voiceState == v_u_13.VOICE_STATE.LOCAL_MUTED and 0.5 or 0
	if p27.props.iconTransparency then
		if v_u_10.isBinding(p27.props.iconTransparency) then
			v_u_30 = p27.props.iconTransparency:map(function(p31)
				-- upvalues: (copy) v_u_30
				return 1 - (1 - p31) * (1 - v_u_30)
			end)
		else
			v_u_30 = 1 - (1 - p27.props.iconTransparency) * (1 - v_u_30)
		end
	end
	return v_u_9.createElement("ImageButton", {
		["Size"] = p27.props.size or UDim2.fromOffset(28, 28),
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Image"] = p27.levelIcon,
		["ImageTransparency"] = v_u_30,
		["SelectionImageObject"] = p28(v_u_7.RoundedRectNoInset),
		[v_u_9.Event.Activated] = p27.props.onClicked
	})
end
function v15.render(p_u_32) -- name: render
	-- upvalues: (copy) v_u_6
	return v_u_6(function(p33)
		-- upvalues: (copy) p_u_32
		return p_u_32:renderWithSelectionCursor(p33)
	end)
end
function v15.didUpdate(p34, p35, _) -- name: didUpdate
	-- upvalues: (copy) v_u_8
	local v36 = v_u_8
	local v37 = p34.props.voiceState
	local v38 = p34.props.userId
	local v39 = tostring(v38)
	v36:trace("Voice state updated to {} for ...{}", v37, (string.sub(v39, -4)))
	if p35.voiceState ~= p34.props.voiceState then
		p34.updateVoiceState(p34.props.voiceState)
	end
end
function v15.willUnmount(p_u_40) -- name: willUnmount
	-- upvalues: (copy) v_u_3
	local function v41()
		-- upvalues: (ref) v_u_3, (copy) p_u_40
		v_u_3:UnbindFromRenderStep(p_u_40.renderStepName)
	end
	pcall(v41)
end
return v11.connect(function(p42, p43) -- name: mapStateToProps
	return {
		["voiceState"] = p42.voiceState[p43.userId]
	}
end)(v15)