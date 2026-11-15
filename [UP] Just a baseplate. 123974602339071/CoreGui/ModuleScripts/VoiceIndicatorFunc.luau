-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Components.VoiceIndicatorFunc
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("HttpService")
local v_u_3 = game:GetService("RunService")
local v4 = game:GetService("CoreGui")
local v_u_5 = game:GetService("TweenService")
local v6 = v4:WaitForChild("RobloxGui")
local v_u_7 = require(v1.Packages.Roact)
local v_u_8 = require(v1.Packages.React)
local v_u_9 = require(v1.Packages.ReactIs)
local v10 = require(v1.Packages.UIBlox)
local v_u_11 = v10.App.SelectionImage.useSelectionCursor
local v_u_12 = v10.App.SelectionImage.CursorKind
local v_u_13 = require(v6.Modules.VoiceChat.Hooks.useVoiceState)
local v_u_14 = require(v6.Modules.VoiceChat.Constants)
local v_u_15 = require(v6.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_16 = game:DefineFastInt("MicTalkingUpdateFrequency", 3)
local v_u_17 = UDim2.fromOffset(28, 28)
local v_u_18 = {
	[v_u_14.VOICE_STATE.ERROR] = true,
	[v_u_14.VOICE_STATE.HIDDEN] = true
}
local function v_u_19() -- name: GenerateGUID
	-- upvalues: (copy) v_u_2
	return v_u_2:GenerateGUID()
end
local function v_u_23(p20) -- name: createTweenShimmeringEffect
	-- upvalues: (copy) v_u_5
	local v21 = TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out, -1)
	local v22 = {
		["Offset"] = Vector2.new(1, 0)
	}
	return v_u_5:Create(p20:getValue(), v21, v22)
end
return function(p_u_24) -- name: VoiceIndicator
	-- upvalues: (copy) v_u_13, (copy) v_u_8, (copy) v_u_7, (copy) v_u_19, (copy) v_u_14, (copy) v_u_23, (copy) v_u_3, (copy) v_u_16, (copy) v_u_18, (copy) v_u_9, (copy) v_u_15, (copy) v_u_11, (copy) v_u_12, (copy) v_u_17
	local v25 = v_u_13(p_u_24.userId, p_u_24.disable or false)
	local v_u_26, v_u_27 = v_u_8.useBinding(0)
	local v28 = p_u_24.selectable == nil and true or p_u_24.selectable
	local v_u_29, v30 = v_u_8.useBinding(v25)
	local v_u_32 = v_u_8.useMemo(function()
		-- upvalues: (ref) v_u_7, (copy) v_u_29, (copy) v_u_26
		local v31 = { v_u_29, v_u_26 }
		return v_u_7.joinBindings(v31)
	end, { v_u_29, v_u_26 })
	local v_u_33 = v_u_8.useRef(v_u_19()).current or ""
	v30(v25)
	local v_u_34 = v25 == v_u_14.VOICE_STATE.CONNECTING
	local v_u_35 = p_u_24.showConnectingShimmer == true
	local v_u_36 = v_u_8.useRef(nil)
	v_u_8.useEffect(function()
		-- upvalues: (copy) v_u_35, (copy) v_u_34, (copy) v_u_36, (ref) v_u_23
		if not (v_u_35 and (v_u_34 and v_u_36.current)) then
			return function() end
		end
		local v_u_37 = v_u_23(v_u_36)
		v_u_37:Play()
		return function()
			-- upvalues: (copy) v_u_37
			v_u_37:Cancel()
		end
	end, { v_u_34, v_u_35 })
	local v_u_38 = v_u_8.useRef(false)
	v_u_38.current = v25 == v_u_14.VOICE_STATE.TALKING
	v_u_8.useEffect(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_33, (copy) v_u_38, (ref) v_u_16, (copy) v_u_27
		local v_u_39 = 0
		v_u_3:BindToRenderStep(v_u_33, 1, function()
			-- upvalues: (ref) v_u_38, (ref) v_u_39, (ref) v_u_16, (ref) v_u_27
			if v_u_38.current then
				v_u_39 = v_u_39 + 1
				if v_u_16 <= v_u_39 then
					v_u_39 = 0
					v_u_27(math.random())
				end
			end
		end)
		return function()
			-- upvalues: (ref) v_u_3, (ref) v_u_33
			v_u_3:UnbindFromRenderStep(v_u_33)
		end
	end, { v_u_33 })
	local v40 = p_u_24.hideOnError
	if v40 then
		v40 = not v25 or v_u_18[v25]
	end
	local v41 = not v40
	local v_u_42 = v25 == v_u_14.VOICE_STATE.LOCAL_MUTED and 0.5 or 0
	if p_u_24.iconTransparency then
		if v_u_9.isBinding(p_u_24.iconTransparency) then
			v_u_42 = p_u_24.iconTransparency:map(function(p43)
				-- upvalues: (copy) v_u_42
				return 1 - (1 - p43) * (1 - v_u_42)
			end)
		else
			v_u_42 = 1 - (1 - p_u_24.iconTransparency) * (1 - v_u_42)
		end
	end
	local v52 = v_u_8.useMemo(function()
		-- upvalues: (copy) v_u_32, (copy) p_u_24, (copy) v_u_35, (ref) v_u_14, (ref) v_u_15
		local v44 = v_u_32
		local v_u_45 = p_u_24.iconStyle
		local v_u_46 = v_u_35
		return v44:map(function(p47)
			-- upvalues: (ref) v_u_14, (ref) v_u_15, (copy) v_u_45, (copy) v_u_46
			local v48 = p47[1]
			local v49 = p47[2]
			if v48 == v_u_14.VOICE_STATE.MUTED or v48 == v_u_14.VOICE_STATE.LOCAL_MUTED then
				return v_u_15:GetIcon("Muted", v_u_45)
			elseif v48 == v_u_14.VOICE_STATE.CONNECTING or v48 == v_u_14.VOICE_STATE.HIDDEN then
				if v_u_46 and v_u_45 == "MicLight" then
					return v_u_15:GetIcon("Connecting", "MicDark")
				else
					return v_u_15:GetIcon("Connecting", v_u_45)
				end
			else
				if v48 == v_u_14.VOICE_STATE.INACTIVE then
					return v_u_15:GetIcon("Unmuted0", v_u_45)
				end
				if v48 ~= v_u_14.VOICE_STATE.TALKING then
					return v_u_15:GetIcon("Error", v_u_45)
				end
				local v50 = 0.5 + 5 * v49
				local v51 = math.floor(v50) * 20
				return v_u_15:GetIcon("Unmuted" .. tostring(v51), v_u_45)
			end
		end)
	end, { p_u_24.iconStyle, v_u_35 })
	local v53 = v_u_11(v_u_12.RoundedRectNoInset)
	local v54 = v_u_7.createElement
	local v55 = "ImageButton"
	local v56 = {
		["Size"] = p_u_24.size or v_u_17,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Image"] = v52,
		["ImageTransparency"] = v_u_42,
		["Selectable"] = v28,
		["SelectionImageObject"] = v53,
		["Visible"] = v41,
		[v_u_7.Event.Activated] = p_u_24.onClicked
	}
	local v57 = {}
	local v58
	if v_u_35 then
		v58 = v_u_7.createElement("UIGradient", {
			["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0.6, 0.6, 0.6)), ColorSequenceKeypoint.new(0.5, Color3.new(0.8, 0.8, 0.8)), ColorSequenceKeypoint.new(1, Color3.new(0.6, 0.6, 0.6)) }),
			["Enabled"] = v_u_34,
			["Rotation"] = -45,
			["Offset"] = Vector2.new(-1, 0),
			[v_u_7.Ref] = v_u_36
		})
	else
		v58 = nil
	end
	v57.ShimmerGradient = v58
	return v54(v55, v56, v57)
end