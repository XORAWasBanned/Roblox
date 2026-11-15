-- Path: CoreGui.RobloxGui.Modules.VR.VRBottomBar.VRBarVoiceIcon
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("HttpService")
local v_u_3 = game:GetService("RunService")
local v4 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_5 = require(v1.Packages.Roact)
local v_u_6 = require(v1.Packages.React)
local v_u_7 = require(v4.Modules.VoiceChat.Hooks.useVoiceState)
local v_u_8 = require(v4.Modules.VoiceChat.Constants)
local v_u_9 = require(v4.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_10 = UDim2.fromOffset(36, 36)
local function v_u_11() -- name: GenerateGUID
	-- upvalues: (copy) v_u_2
	return v_u_2:GenerateGUID()
end
return function(p_u_12) -- name: VRBarVoiceIcon
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_5, (copy) v_u_11, (copy) v_u_8, (copy) v_u_3, (copy) v_u_9, (copy) v_u_10
	local v13 = v_u_7(p_u_12.userId, p_u_12.disable or false)
	local v14, v_u_15 = v_u_6.useBinding(0)
	local v16, v17 = v_u_6.useBinding(v13)
	local v_u_18 = { v16, v14 }
	local v_u_19 = v_u_6.useMemo(function()
		-- upvalues: (ref) v_u_5, (copy) v_u_18
		return v_u_5.joinBindings(v_u_18)
	end, {})
	local v_u_20 = v_u_6.useRef(v_u_11()).current or ""
	v17(v13)
	local v_u_21 = v13 == v_u_8.VOICE_STATE.TALKING
	v_u_6.useEffect(function()
		-- upvalues: (copy) v_u_21, (ref) v_u_3, (copy) v_u_20, (copy) v_u_15
		if v_u_21 then
			v_u_3:BindToRenderStep(v_u_20, 1, function()
				-- upvalues: (ref) v_u_15
				v_u_15(math.random())
			end)
		end
		return function()
			-- upvalues: (ref) v_u_21, (ref) v_u_3, (ref) v_u_20
			if v_u_21 then
				v_u_3:UnbindFromRenderStep(v_u_20)
			end
		end
	end, { v_u_21 })
	local v29 = v_u_6.useMemo(function()
		-- upvalues: (copy) v_u_19, (copy) p_u_12, (ref) v_u_8, (ref) v_u_9
		local v22 = v_u_19
		local v_u_23 = p_u_12.iconStyle
		return v22:map(function(p24)
			-- upvalues: (ref) v_u_8, (ref) v_u_9, (copy) v_u_23
			local v25 = p24[1]
			local v26 = p24[2]
			if v25 == v_u_8.VOICE_STATE.MUTED or v25 == v_u_8.VOICE_STATE.LOCAL_MUTED then
				return v_u_9:GetIcon("Muted", v_u_23)
			end
			if v25 == v_u_8.VOICE_STATE.CONNECTING then
				return v_u_9:GetIcon("Connecting", v_u_23)
			end
			if v25 == v_u_8.VOICE_STATE.INACTIVE then
				return v_u_9:GetIcon("Unmuted0", v_u_23)
			end
			if v25 ~= v_u_8.VOICE_STATE.TALKING then
				return v_u_9:GetIcon("Error", v_u_23)
			end
			local v27 = 0.5 + 5 * v26
			local v28 = math.floor(v27) * 20
			return v_u_9:GetIcon("Unmuted" .. tostring(v28), v_u_23)
		end)
	end, { p_u_12.iconStyle })
	return v_u_5.createElement("ImageLabel", {
		["BackgroundTransparency"] = p_u_12.BackgroundTransparency or 1,
		["Image"] = v29,
		["ImageColor3"] = p_u_12.ImageColor3,
		["ImageTransparency"] = p_u_12.ImageTransparency,
		["Position"] = p_u_12.Position,
		["Size"] = p_u_12.Size or v_u_10,
		[v_u_5.Children] = p_u_12[v_u_5.Children]
	})
end