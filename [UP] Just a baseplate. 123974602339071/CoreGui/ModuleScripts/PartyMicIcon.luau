-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.Party.PartyMicIcon
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("HttpService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = require(v1.Packages.React)
local v6 = require(v1.Packages.UIBlox)
local v7 = require(v1.Workspace.Packages.CrossExperienceVoice)
local v_u_8 = require(v1.Workspace.Packages.VoiceChat)
local v_u_9 = v7.Hooks.useParticipant
local v_u_10 = v7.Hooks.useIsVoiceConnected
local v_u_11 = v7.Hooks.useIsActiveParticipant
local v_u_12 = v7.Hooks.useIsParticipantMuted
local v13 = script.Parent.Parent.Parent
local v_u_14 = require(v1.Workspace.Packages.Chrome).UnibarStyle
local v_u_15 = require(v13.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local v_u_16 = v6.Core.ImageSet.ImageSetLabel
local v_u_17 = game:DefineFastInt("PartyMicVoiceIndicatorFrameBuffer", 3)
local function v_u_23(p18, p19, p20, p21, p22) -- name: getLoadingIndicatorIcon
	-- upvalues: (copy) v_u_8
	if p20 and (p18 and not p19) then
		if p21 then
			return v_u_8.Utils.GetIcon("Unmuted", "MicLight", p22)
		else
			return v_u_8.Utils.GetIcon("Unmuted0", "MicLight")
		end
	else
		return v_u_8.Utils.GetIcon("Muted", "MicLight")
	end
end
function PartyMicIcon(p_u_24) -- name: PartyMicIcon
	-- upvalues: (copy) v_u_2, (copy) v_u_10, (copy) v_u_9, (copy) v_u_11, (copy) v_u_5, (copy) v_u_12, (copy) v_u_3, (copy) v_u_15, (copy) v_u_14, (copy) v_u_17, (copy) v_u_4, (copy) v_u_23, (copy) v_u_16
	local v25 = v_u_2 and (v_u_2.LocalPlayer and v_u_2.LocalPlayer.UserId) or -1
	local v_u_26 = v_u_10()
	local v_u_27 = v_u_9(v25)
	local v_u_28 = v_u_11(v25)
	local v_u_29 = v_u_5.useRef(v_u_28)
	local v_u_30 = v_u_12(v25) == true
	local v_u_31 = v_u_5.useRef(0)
	local v_u_32, v_u_33 = v_u_5.useState(0)
	local v_u_34 = v_u_5.useMemo(function()
		-- upvalues: (ref) v_u_3
		return v_u_3:GenerateGUID()
	end, {})
	local v35 = not v_u_15 and 36 or v_u_14.use().ICON_SIZE
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_27, (copy) p_u_24
		if v_u_27 then
			p_u_24.isLocalPlayerMutedSignal:fire(v_u_27.isMuted)
		end
	end, { v_u_27 })
	v_u_5.useEffect(function()
		-- upvalues: (copy) p_u_24, (copy) v_u_26
		p_u_24.isVoiceConnectedSignal:fire(v_u_26)
	end, { v_u_26 })
	local v_u_36 = v_u_5.useCallback(function()
		-- upvalues: (copy) v_u_29, (copy) v_u_31, (ref) v_u_17, (copy) v_u_33
		if v_u_29.current then
			if v_u_17 < v_u_31.current then
				v_u_33(math.random())
				v_u_31.current = 0
				return
			end
			v_u_31.current = v_u_31.current + 1
		end
	end, {})
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_29, (copy) v_u_28
		v_u_29.current = v_u_28
	end, { v_u_28 })
	v_u_5.useEffect(function()
		-- upvalues: (ref) v_u_4, (copy) v_u_34, (copy) v_u_36
		v_u_4:BindToRenderStep(v_u_34, 1, v_u_36)
		return function()
			-- upvalues: (ref) v_u_4, (ref) v_u_34
			v_u_4:UnbindFromRenderStep(v_u_34)
		end
	end, {})
	local v37 = v_u_5.useMemo(function()
		-- upvalues: (ref) v_u_23, (copy) v_u_27, (copy) v_u_30, (copy) v_u_26, (copy) v_u_28, (copy) v_u_32
		return v_u_23(v_u_27, v_u_30, v_u_26, v_u_28, v_u_32)
	end, {
		v_u_27,
		v_u_30,
		v_u_26,
		v_u_28,
		v_u_32
	})
	return v_u_5.createElement("Frame", {
		["Size"] = nil,
		["BorderSizePixel"] = 0,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(0, v35, 0, v35)
	}, {
		["UICorner"] = v_u_5.createElement("UICorner", {
			["CornerRadius"] = UDim.new(1, 0)
		}),
		["Icon"] = v_u_5.createElement(v_u_16, {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["Size"] = UDim2.fromOffset(v35, v35),
			["Image"] = v37
		}, { v_u_5.createElement("UICorner", {
				["Name"] = "Corner",
				["CornerRadius"] = nil,
				["CornerRadius"] = UDim.new(1, 0)
			}) })
	})
end
return PartyMicIcon