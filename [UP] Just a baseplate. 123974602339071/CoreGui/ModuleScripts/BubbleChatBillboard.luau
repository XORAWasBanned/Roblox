-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Components.BubbleChatBillboard
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("Players")
local v_u_4 = game:GetService("RunService")
local v5 = v1:WaitForChild("RobloxGui")
local v_u_6 = game:GetService("StarterGui")
local v_u_7 = game:GetService("VRService")
local v_u_8 = require(script.Parent.Parent.Logger)(script.Name)
local v_u_9 = require(v2.Packages.Roact)
local v10 = require(v2.Packages.RoactRodux)
local v11 = require(v2.Packages.t)
local v_u_12 = require(v2.Packages.Otter)
local v_u_13 = require(script.Parent.BubbleChatList)
local v_u_14 = require(script.Parent.ChatBubbleDistant)
local v_u_15 = require(script.Parent.VoiceBubble)
local v_u_16 = require(v5.Modules.VoiceChat.Components.VoiceIndicator)
local v17 = require(script.Parent.Parent.Types)
local v_u_18 = require(script.Parent.Parent.Constants)
local v_u_19 = require(script.Parent.Parent.Helpers.getSettingsForMessage)
local v_u_20 = require(v5.Modules.SelfView.selfViewVisibilityUpdatedSignal)
local v_u_21 = require(v2.Workspace.Packages.Chrome).Enabled
local v_u_22 = require(v5.Modules.VoiceChat.Constants)
local v_u_23 = require(v5.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_24 = require(v5.Modules.Flags.GetFFlagMicConnectingToast)
local v_u_25 = require(v5.Modules.Flags.GetFFlagBubbleChatInexistantAdorneeFix)
local v_u_26 = require(v5.Modules.SelfView.publicApi)
local v_u_27 = game:DefineFastInt("BubbleVoiceTimeoutMillis", 1000)
local v_u_28 = game:DefineFastFlag("DebugAllowControlButtonsNoVoiceChat", false)
local v_u_29 = require(v2.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local v_u_30 = game:DefineFastFlag("EasierUnmuting3", false)
local v_u_31 = game:DefineFastFlag("EasierUnmutingBasedOnCamera", false)
local v_u_32 = game:DefineFastFlag("EasierUnmutingHideIfMuted", false)
local v_u_33 = game:DefineFastInt("EasierUnmutingDisplayDistance", 20)
local v_u_34 = game:DefineFastString("EasierUnmutingIXPLayerName", "Voice.UserAgency")
local v_u_35 = game:DefineFastString("EasierUnmutingIXPLayerValue", "VoiceUserAgencyEnabled")
local v36 = v_u_9.PureComponent:extend("BubbleChatBillboard")
local v_u_37 = {
	["dampingRatio"] = 1,
	["frequency"] = 4
}
v36.validateProps = v11.strictInterface({
	["userId"] = v11.string,
	["onFadeOut"] = v11.optional(v11.callback),
	["voiceEnabled"] = v11.optional(v11.boolean),
	["bubbleChatEnabled"] = v11.optional(v11.boolean),
	["chatSettings"] = v17.IChatSettings,
	["messageIds"] = v11.optional(v11.array(v11.string)),
	["lastMessage"] = v11.optional(v17.IMessage),
	["voiceState"] = v11.optional(v11.string)
})
function getEasierUnmutingDistance(p38) -- name: getEasierUnmutingDistance
	-- upvalues: (copy) v_u_3, (copy) v_u_31
	if p38 then
		local v39 = v_u_3.LocalPlayer and v_u_3.LocalPlayer.Character
		if v39 then
			v39 = v_u_3.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		end
		local v40 = v39 and v39.CFrame
		if v40 then
			v40 = v39.CFrame.Position
		end
		local v41 = workspace.CurrentCamera
		if v41 then
			v41 = workspace.CurrentCamera.CFrame.Position
		end
		if v_u_31 or not v40 then
			if v41 then
				return (p38 - v41).Magnitude
			else
				return nil
			end
		else
			return (p38 - v40).Magnitude
		end
	else
		return nil
	end
end
function v36.init(p_u_42) -- name: init
	-- upvalues: (copy) v_u_26, (copy) v_u_6, (copy) v_u_30, (copy) v_u_32, (copy) v_u_9, (copy) v_u_12, (copy) v_u_3, (copy) v_u_18, (copy) v_u_23, (copy) v_u_24, (copy) v_u_22, (copy) v_u_16, (copy) v_u_20, (copy) v_u_29, (copy) v_u_34, (copy) v_u_35
	local v43 = v_u_26.getSelfViewIsOpenAndVisible()
	local v44 = v_u_6:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView)
	local v45 = {
		["adornee"] = nil,
		["isInsideRenderDistance"] = false,
		["isInsideMaximizeDistance"] = false,
		["savedChatSettings"] = nil,
		["voiceTimedOut"] = false,
		["voiceStateCounter"] = 0,
		["lastVoiceState"] = nil,
		["selfViewOpen"] = nil,
		["selfViewEnabled"] = nil,
		["isInsideEasierUnmutingDistance"] = nil,
		["isMuted"] = nil,
		["isInEasierUnmutingTreatment"] = nil,
		["haveLoggedUserExposure"] = nil,
		["savedChatSettings"] = p_u_42.props.chatSettings,
		["selfViewOpen"] = v43,
		["selfViewEnabled"] = v44
	}
	local v46
	if v_u_30 then
		v46 = false
	else
		v46 = nil
	end
	v45.isInsideEasierUnmutingDistance = v46
	local v47
	if v_u_30 and v_u_32 then
		v47 = false
	else
		v47 = nil
	end
	v45.isMuted = v47
	local v48
	if v_u_30 then
		v48 = false
	else
		v48 = nil
	end
	v45.isInEasierUnmutingTreatment = v48
	local v49
	if v_u_30 then
		v49 = false
	else
		v49 = nil
	end
	v45.haveLoggedUserExposure = v49
	p_u_42:setState(v45)
	p_u_42.isMounted = false
	local v50, v51 = v_u_9.createBinding((Vector3.new()))
	p_u_42.offset = v50
	p_u_42.updateOffset = v51
	p_u_42.offsetMotor = v_u_12.createSingleMotor(0)
	p_u_42.offsetMotor:onStep(function(p52)
		-- upvalues: (copy) p_u_42
		p_u_42.updateOffset((Vector3.new(0, p52, 0)))
	end)
	p_u_42.offsetGoal = 0
	function p_u_42.onSelfViewVisibilityUpdated()
		-- upvalues: (copy) p_u_42, (ref) v_u_26
		p_u_42:setState({
			["selfViewOpen"] = v_u_26.getSelfViewIsOpenAndVisible()
		})
	end
	function p_u_42.onLastBubbleFadeOut()
		-- upvalues: (copy) p_u_42
		if p_u_42.props.onFadeOut and not p_u_42.isFadingOut then
			p_u_42.isFadingOut = true
			p_u_42.props.onFadeOut(p_u_42.props.userId)
		end
		if p_u_42.state.hasMessage and p_u_42.isMounted then
			p_u_42:setState({
				["hasMessage"] = false
			})
		end
	end
	if p_u_42.props.voiceEnabled then
		local v53 = p_u_42.props.userId
		local v54 = v_u_3.LocalPlayer.UserId
		local v_u_55
		if v53 == tostring(v54) then
			v_u_55 = function()
				-- upvalues: (copy) p_u_42, (ref) v_u_18, (ref) v_u_23, (ref) v_u_24
				if p_u_42.props.voiceState == v_u_18.VOICE_STATE.ERROR then
					v_u_23:RejoinPreviousChannel()
					return
				elseif v_u_24() and p_u_42.props.voiceState == v_u_18.VOICE_STATE.CONNECTING then
					v_u_23:ShowVoiceChatLoadingMessage()
				else
					v_u_23:ToggleMic("LegacyBubbleChat")
				end
			end
		else
			v_u_55 = function()
				-- upvalues: (ref) v_u_23, (copy) p_u_42, (ref) v_u_22
				local v56 = v_u_23
				local v57 = p_u_42.props.userId
				local v58 = tonumber(v57)
				local v59
				if p_u_42:isShowingDueToEasierUnmuting() then
					v59 = v_u_22.VOICE_CONTEXT_TYPE.EASIER_UNMUTING
				else
					v59 = v_u_22.VOICE_CONTEXT_TYPE.BUBBLE_CHAT
				end
				v56:ToggleMutePlayer(v58, v59)
			end
		end
		local v_u_60 = p_u_42.props.userId
		local v61 = v_u_3.LocalPlayer.UserId
		local v_u_62 = v_u_60 == tostring(v61) and "MicDark" or "SpeakerDark"
		function p_u_42.renderInsert()
			-- upvalues: (ref) v_u_9, (ref) v_u_16, (ref) v_u_55, (copy) v_u_60, (copy) v_u_62
			local v63 = {
				["onClicked"] = v_u_55,
				["userId"] = v_u_60,
				["iconStyle"] = v_u_62
			}
			return v_u_9.createElement(v_u_16, v63)
		end
		p_u_42.insertSize = Vector2.new(28, 28)
	end
	function p_u_42.onCoreGuiChanged()
		-- upvalues: (ref) v_u_6, (copy) p_u_42
		local v64 = v_u_6:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView)
		if p_u_42.state.selfViewOpen ~= v64 then
			p_u_42:setState({
				["selfViewOpen"] = v64
			})
		end
	end
	p_u_42.selfViewVisibilityUpdatedSignal = v_u_20:connect(function()
		-- upvalues: (copy) p_u_42, (ref) v_u_26
		p_u_42:setState({
			["selfViewOpen"] = v_u_26.getSelfViewIsOpenAndVisible()
		})
	end)
	if v_u_30 then
		local function v65()
			-- upvalues: (ref) v_u_29, (ref) v_u_34
			return v_u_29:GetLayerData(v_u_34)
		end
		local v66, v67 = pcall(v65)
		if v66 and (v67 and v67[v_u_35]) then
			p_u_42:setState({
				["isInEasierUnmutingTreatment"] = true
			})
		end
	end
	if v_u_30 and (p_u_42.state.isInEasierUnmutingTreatment and v_u_32) then
		p_u_42.participantsUpdateConnection = v_u_23.participantsUpdate.Event:Connect(function(p68)
			-- upvalues: (copy) p_u_42
			local v69 = p68[p_u_42.props.userId]
			if v69 then
				if v69.isMuted ~= p_u_42.state.isMuted then
					p_u_42:setState({
						["isMuted"] = v69.isMuted
					})
				end
			end
		end)
	end
end
function v36.isShowingDueToEasierUnmuting(p70) -- name: isShowingDueToEasierUnmuting
	-- upvalues: (copy) v_u_30, (copy) v_u_18, (copy) v_u_32
	local v71 = v_u_30 and (p70.state.isInEasierUnmutingTreatment and (p70.props.voiceState == v_u_18.VOICE_STATE.LOCAL_MUTED and p70.state.isInsideEasierUnmutingDistance))
	if v71 then
		local v72 = v_u_32
		if v72 then
			v72 = p70.state.isMuted
		end
		v71 = not v72
	end
	return v71
end
function v36.checkCounterForTimeout(p_u_73, p74) -- name: checkCounterForTimeout
	-- upvalues: (copy) v_u_3, (copy) v_u_18, (copy) v_u_27
	local v75 = p_u_73.props.userId
	local v76 = v_u_3.LocalPlayer.UserId
	if v75 ~= tostring(v76) and (p_u_73.state.lastVoiceState ~= v_u_18.VOICE_STATE.TALKING and p_u_73.state.voiceStateCounter ~= p74) then
		local v_u_77 = p_u_73.state.voiceStateCounter
		delay(v_u_27 / 1000, function()
			-- upvalues: (copy) p_u_73, (copy) v_u_77
			if p_u_73.state.voiceStateCounter == v_u_77 and p_u_73.isMounted then
				p_u_73:setState({
					["voiceTimedOut"] = true
				})
			end
		end)
	end
end
function v36.checkCounterForTimeoutWithEasierUnmuting(p_u_78, p79) -- name: checkCounterForTimeoutWithEasierUnmuting
	-- upvalues: (copy) v_u_30, (copy) v_u_3, (copy) v_u_18, (copy) v_u_27
	local v80
	if p79 then
		v80 = p79.voiceStateCounter
	else
		v80 = nil
	end
	if not (v_u_30 and p_u_78.state.isInEasierUnmutingTreatment) then
		return p_u_78:checkCounterForTimeout(v80)
	end
	local v81 = p_u_78.props.userId
	local v82 = v_u_3.LocalPlayer.UserId
	local v83 = v81 ~= tostring(v82)
	local v84 = p_u_78.state.voiceStateCounter ~= v80
	local v85
	if p_u_78.state.lastVoiceState == v_u_18.VOICE_STATE.TALKING then
		v85 = false
	else
		v85 = p_u_78.state.lastVoiceState ~= v_u_18.VOICE_STATE.LOCAL_MUTED
	end
	if v83 and (v84 and v85) then
		local v_u_86 = p_u_78.state.voiceStateCounter
		delay(v_u_27 / 1000, function()
			-- upvalues: (copy) p_u_78, (copy) v_u_86
			if p_u_78.state.voiceStateCounter == v_u_86 and p_u_78.isMounted then
				p_u_78:setState({
					["voiceTimedOut"] = true
				})
			end
		end)
	end
end
function v36.didMount(p_u_87) -- name: didMount
	-- upvalues: (copy) v_u_12, (copy) v_u_3, (copy) v_u_4, (copy) v_u_30, (copy) v_u_33, (copy) v_u_18, (copy) v_u_37
	p_u_87.isMounted = true
	local v88 = p_u_87.props.lastMessage
	if v88 then
		v88 = p_u_87.props.lastMessage.adornee
	end
	p_u_87:setState({
		["adornee"] = v88
	})
	local v89 = p_u_87:getVerticalOffset(v88)
	p_u_87.offsetGoal = v89
	p_u_87.offsetMotor:setGoal(v_u_12.instant(v89))
	local v_u_90 = nil
	if v88 then
		v_u_90 = v_u_3:GetPlayerFromCharacter(v88)
	else
		local v91 = p_u_87.props.userId
		if tonumber(v91) then
			v_u_90 = v_u_3:GetPlayerByUserId(p_u_87.props.userId)
		end
	end
	if v_u_90 then
		if v_u_90.Character then
			coroutine.wrap(function()
				-- upvalues: (copy) p_u_87, (ref) v_u_90
				p_u_87:onCharacterAdded(v_u_90, v_u_90.Character)
			end)()
		end
		p_u_87.characterConn = v_u_90.CharacterAdded:Connect(function(p92)
			-- upvalues: (copy) p_u_87, (ref) v_u_90
			p_u_87:onCharacterAdded(v_u_90, p92)
		end)
	end
	p_u_87.heartbeatConn = v_u_4.Heartbeat:Connect(function()
		-- upvalues: (copy) p_u_87, (ref) v_u_30, (ref) v_u_33, (ref) v_u_18, (ref) v_u_12, (ref) v_u_37
		local v93 = p_u_87:getAdorneeInstance(p_u_87.state.adornee)
		if workspace.CurrentCamera and v93 then
			local v94 = v93:IsA("Attachment") and v93.WorldPosition or v93.Position
			local v95 = (workspace.CurrentCamera.CFrame.Position - v94).Magnitude
			local v96 = v95 < p_u_87.state.savedChatSettings.MaxDistance
			local v97 = v95 < p_u_87.state.savedChatSettings.MinimizeDistance
			local v98 = false
			if v_u_30 and p_u_87.state.isInEasierUnmutingTreatment then
				local v99 = getEasierUnmutingDistance(v94)
				if v99 ~= nil then
					v98 = v99 < v_u_33
				end
			end
			if v97 ~= p_u_87.state.isInsideMaximizeDistance or (v96 ~= p_u_87.state.isInsideRenderDistance or v_u_30 and (p_u_87.state.isInEasierUnmutingTreatment and v98 ~= p_u_87.state.isInsideEasierUnmutingDistance)) then
				p_u_87:setState({
					["isInsideRenderDistance"] = v96,
					["isInsideMaximizeDistance"] = v97,
					["isInsideEasierUnmutingDistance"] = v98
				})
			end
		end
		local v100 = p_u_87:getVerticalOffset(p_u_87.state.adornee)
		local v101 = v100 - p_u_87.offsetGoal
		if math.abs(v101) > v_u_18.BILLBOARD_OFFSET_EPSILON then
			p_u_87.offsetGoal = v100
			p_u_87.offsetMotor:setGoal(v_u_12.spring(v100, v_u_37))
		end
	end)
	if v_u_30 and p_u_87.state.isInEasierUnmutingTreatment then
		p_u_87:checkCounterForTimeoutWithEasierUnmuting(nil)
	else
		p_u_87:checkCounterForTimeout(nil)
	end
end
function v36.willUnmount(p102) -- name: willUnmount
	-- upvalues: (copy) v_u_8, (copy) v_u_30, (copy) v_u_32
	v_u_8:trace("Unmounting billboards for {}", p102.state.shortId)
	p102.isMounted = false
	if p102.characterConn then
		p102.characterConn:Disconnect()
		p102.characterConn = nil
	end
	if p102.heartbeatConn then
		p102.heartbeatConn:Disconnect()
		p102.heartbeatConn = nil
	end
	if p102.humanoidDiedConn then
		p102.humanoidDiedConn:Disconnect()
		p102.humanoidDiedConn = nil
	end
	p102.offsetMotor:destroy()
	if p102.selfViewVisibilityUpdatedSignal then
		p102.selfViewVisibilityUpdatedSignal:disconnect()
		p102.selfViewVisibilityUpdatedSignal = nil
	end
	if v_u_30 and (p102.state.isInEasierUnmutingTreatment and (v_u_32 and p102.participantsUpdateConnection)) then
		p102.participantsUpdateConnection:Disconnect()
		p102.participantsUpdateConnection = nil
	end
end
local function v_u_108(...) -- name: waitForFirst
	local v_u_103 = Instance.new("BindableEvent")
	local v_u_104 = { ... }
	local function v106(...) -- name: fire
		-- upvalues: (copy) v_u_104, (copy) v_u_103
		for v105 = 1, #v_u_104 do
			v_u_104[v105]:Disconnect()
		end
		return v_u_103:Fire(...)
	end
	for v107 = 1, #v_u_104 do
		v_u_104[v107] = v_u_104[v107]:Connect(v106)
	end
	return v_u_103.Event:Wait()
end
local function v_u_113(p109, p110, p111) -- name: findFirstChildByNameAndClass
	for _, v112 in ipairs(p109:GetChildren()) do
		if v112.Name ~= p110 or not v112:IsA(p111) then
			continue
		end
		return v112
	end
end
function v36.onCharacterAdded(p_u_114, p115, p_u_116) -- name: onCharacterAdded
	-- upvalues: (copy) v_u_108, (copy) v_u_8, (copy) v_u_25, (copy) v_u_113
	if not p_u_116.Parent then
		v_u_108(p_u_116.AncestryChanged, p115.CharacterAdded)
	end
	if p115.Character == p_u_116 and p_u_116.Parent then
		local v117 = p_u_116:FindFirstChildOfClass("Humanoid")
		while p_u_116:IsDescendantOf(game) and not v117 do
			v_u_108(p_u_116.ChildAdded, p_u_116.AncestryChanged, p115.CharacterAdded)
			v117 = p_u_116:FindFirstChildOfClass("Humanoid")
		end
		if p115.Character == p_u_116 and p_u_116:IsDescendantOf(game) then
			local v118
			if v_u_25() then
				v118 = p_u_116.PrimaryPart
			else
				v118 = p_u_116:FindFirstChild("HumanoidRootPart")
			end
			while p_u_116:IsDescendantOf(game) and not v118 do
				v_u_108(p_u_116.ChildAdded, p_u_116.AncestryChanged, p115.CharacterAdded)
				if v_u_25() then
					v118 = p_u_116.PrimaryPart
				else
					v118 = p_u_116:FindFirstChild("HumanoidRootPart")
				end
			end
			if v118 and (p_u_116:IsDescendantOf(game) and (p115.Character == p_u_116 and p_u_114.isMounted)) then
				local v119 = v_u_113(p_u_116, "Head", "BasePart")
				p_u_114:setState({
					["adornee"] = v117.Health == 0 and v119 and v119 or p_u_116
				})
				if p_u_114.humanoidDiedConn then
					p_u_114.humanoidDiedConn:Disconnect()
					p_u_114.humanoidDiedConn = nil
				end
				p_u_114.humanoidDiedConn = v117.Died:Connect(function()
					-- upvalues: (copy) p_u_114, (ref) v_u_113, (copy) p_u_116
					p_u_114:setState({
						["adornee"] = v_u_113(p_u_116, "Head", "BasePart") or p_u_116
					})
				end)
			end
		else
			v_u_8:debug("Mismatched or unparented character in onCharacterAdded for {}", p_u_114.state.shortId)
		end
	else
		v_u_8:debug("Mismatched or unparented character in onCharacterAdded for {}", p_u_114.state.shortId)
		return
	end
end
function v36.getVerticalOffset(p120, p121) -- name: getVerticalOffset
	if not (p121 and p121:IsA("Model")) then
		return not (p121 and p121:IsA("BasePart")) and 0 or p121.Size.Y / 2
	end
	local v122, v123 = p121:GetBoundingBox()
	local v124 = p120:getAdorneeInstance(p121)
	if not v124 then
		return v123.Y / 2
	end
	if not v124:IsA("BasePart") then
		return 0
	end
	local v125 = v122:PointToObjectSpace(v124.Position)
	return v123.Y / 2 - v125.Y
end
function v36.getAdorneeInstance(p126, p127) -- name: getAdorneeInstance
	-- upvalues: (copy) v_u_25
	if p127 then
		if p127:IsA("Model") then
			local v128 = p127:FindFirstChild(p126.state.savedChatSettings.AdorneeName, true)
			if v_u_25() then
				v128 = v128 or p127.PrimaryPart
			end
			if not v128 or (v128:IsA("BasePart") or v128:IsA("Attachment")) then
				return v128
			end
		elseif p127:IsA("BasePart") or p127:IsA("Attachment") then
			return p127
		end
	end
end
function v36.getRenderVoiceAndCameraBubble(p129) -- name: getRenderVoiceAndCameraBubble
	-- upvalues: (copy) v_u_28, (copy) v_u_3, (copy) v_u_7, (copy) v_u_21
	if p129.props.voiceEnabled or v_u_28 then
		local v130 = p129.props.userId
		local v131 = v_u_3.LocalPlayer.UserId
		if v130 == tostring(v131) then
			if v_u_7.VREnabled or v_u_21() then
				return false
			else
				return not p129.state.selfViewOpen
			end
		else
			local v132 = p129.props.voiceEnabled
			if v132 then
				v132 = not p129.state.voiceTimedOut
			end
			return v132
		end
	else
		return false
	end
end
function v36.shouldRenderCarat(p133) -- name: shouldRenderCarat
	local v134 = p133.props.chatSettings.TailVisible
	if v134 then
		v134 = not p133:getRenderVoiceAndCameraBubble()
	end
	return v134
end
function v36.render(p135) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_8, (copy) v_u_30, (copy) v_u_18, (copy) v_u_32, (copy) v_u_7, (copy) v_u_21, (copy) v_u_9, (copy) v_u_15, (copy) v_u_13, (copy) v_u_14
	local v136 = p135:getAdorneeInstance(p135.state.adornee)
	local v137 = p135.props.userId
	local v138 = v_u_3.LocalPlayer.UserId
	local v139 = v137 == tostring(v138)
	local v140 = p135.state.savedChatSettings
	if v136 then
		if p135.state.isInsideRenderDistance then
			if not v_u_30 or (not p135.state.isInEasierUnmutingTreatment or (p135.props.voiceState ~= v_u_18.VOICE_STATE.LOCAL_MUTED or p135.state.isInsideEasierUnmutingDistance and not (v_u_32 and p135.state.isMuted))) then
				local v141 = {}
				local v142 = p135.props.voiceEnabled
				if v142 then
					v142 = not p135.state.voiceTimedOut
				end
				if v_u_7.VREnabled or v_u_21() then
					if v139 then
						v142 = false
					end
				end
				if v142 and (not p135.props.bubbleChatEnabled or (not p135.props.messageIds or #p135.props.messageIds == 0)) then
					v141.VoiceBubble = v_u_9.createElement(v_u_15, {
						["chatSettings"] = v140,
						["renderInsert"] = p135.renderInsert,
						["insertSize"] = p135.insertSize,
						["isDistant"] = not p135.state.isInsideMaximizeDistance
					})
				end
				if p135.state.hasMessage then
					if p135.state.isInsideMaximizeDistance then
						local v143 = v_u_9.createElement
						local v144 = v_u_13
						local v145 = {
							["userId"] = p135.props.userId,
							["isVisible"] = p135.state.isInsideMaximizeDistance,
							["onLastBubbleFadeOut"] = p135.onLastBubbleFadeOut,
							["chatSettings"] = v140
						}
						local v146
						if v142 then
							v146 = p135.renderInsert
						else
							v146 = nil
						end
						v145.renderFirstInsert = v146
						v145.insertSize = p135.insertSize
						v145.showCarat = p135:shouldRenderCarat()
						v141.BubbleChatList = v143(v144, v145)
					else
						local v147 = v_u_9.createElement
						local v148 = v_u_14
						local v149 = {
							["fadingOut"] = not p135.props.messageIds or #p135.props.messageIds == 0,
							["onFadeOut"] = p135.onLastBubbleFadeOut,
							["chatSettings"] = v140
						}
						local v150
						if v142 then
							v150 = p135.renderInsert
						else
							v150 = v142
						end
						v149.renderInsert = v150
						v149.insertSize = p135.insertSize
						v141.DistantBubble = v147(v148, v149)
					end
				end
				local v151 = v139 and (v140.LocalPlayerStudsOffset or Vector3.new(0, 1, 0.1)) or Vector3.new(0, 1, 0.1)
				local v152 = v_u_9.createElement
				local v153 = {
					["Adornee"] = nil,
					["Active"] = nil,
					["Size"] = nil,
					["SizeOffset"] = nil,
					["StudsOffset"] = nil,
					["StudsOffsetWorldSpace"] = nil,
					["ResetOnSpawn"] = false,
					["Adornee"] = v136,
					["Active"] = v142,
					["Size"] = UDim2.fromOffset(500, 200),
					["SizeOffset"] = Vector2.new(0, 0.5)
				}
				local v154 = v140.VerticalStudsOffset
				v153.StudsOffset = v151 + Vector3.new(0, v154, 0)
				v153.StudsOffsetWorldSpace = p135.offset
				return v152("BillboardGui", v153, v141)
			end
			v_u_8:trace("Unmute toggle not applicable for {}", p135.state.shortId)
		else
			v_u_8:trace("Not in range for {}", p135.state.shortId)
		end
	else
		v_u_8:trace("No adornee for {}", p135.state.shortId)
		return
	end
end
function v36.didUpdate(p155, _, p156) -- name: didUpdate
	-- upvalues: (copy) v_u_30, (copy) v_u_3, (copy) v_u_18, (copy) v_u_29, (copy) v_u_34
	if (not p155.props.messageIds or #p155.props.messageIds == 0) and not p155.state.isInsideRenderDistance then
		p155.onLastBubbleFadeOut()
	end
	if p155.props.messageIds and #p155.props.messageIds > 0 then
		p155.isFadingOut = false
	end
	if v_u_30 and p155.state.isInEasierUnmutingTreatment then
		p155:checkCounterForTimeoutWithEasierUnmuting(p156)
	else
		p155:checkCounterForTimeout(p156.voiceStateCounter)
	end
	local v157 = p155.props.userId
	local v158 = v_u_3.LocalPlayer.UserId
	if v_u_30 and (v157 == tostring(v158) and (not p155.state.haveLoggedUserExposure and (p155.props.voiceState == v_u_18.VOICE_STATE.INACTIVE or (p155.props.voiceState == v_u_18.VOICE_STATE.TALKING or p155.props.voiceState == v_u_18.VOICE_STATE.MUTED)))) then
		v_u_29:LogUserLayerExposure(v_u_34)
		p155:setState({
			["haveLoggedUserExposure"] = true
		})
	end
end
function v36.getDerivedStateFromProps(p159, p160) -- name: getDerivedStateFromProps
	local v161 = p159.userId
	local v162 = tostring(v161)
	local v163 = "..." .. string.sub(v162, -4)
	local v164 = not p160.hasMessage and p159.messageIds
	if v164 then
		v164 = #p159.messageIds > 0
	end
	local v165, v166, v167
	if p160.lastVoiceState == p159.voiceState then
		v165 = nil
		v166 = nil
		v167 = nil
	else
		v165 = (p160.voiceStateCounter or 0) + 1
		v167 = p159.voiceState
		v166 = false
	end
	local v168 = {
		["hasMessage"] = v164 or nil
	}
	local v169 = p159.lastMessage
	if v169 then
		v169 = p159.chatSettings
	end
	v168.savedChatSettings = v169
	v168.shortId = v163
	v168.voiceStateCounter = v165
	v168.voiceTimedOut = v166
	v168.lastVoiceState = v167
	return v168
end
return v10.connect(function(p170, p171) -- name: mapStateToProps
	-- upvalues: (copy) v_u_19
	local v172 = p170.userMessages[p171.userId]
	local v173
	if v172 then
		if #v172 >= 1 then
			v173 = v172[#v172]
		else
			v173 = false
		end
	else
		v173 = v172
	end
	if v173 then
		v173 = p170.messages[v173]
	end
	local v174 = p170.voiceState[p171.userId]
	return {
		["chatSettings"] = v_u_19(p170.chatSettings, v173),
		["messageIds"] = v172,
		["lastMessage"] = v173,
		["voiceState"] = v174
	}
end)(v36)