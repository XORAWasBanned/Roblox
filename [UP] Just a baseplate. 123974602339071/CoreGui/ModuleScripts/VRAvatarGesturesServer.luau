-- Path: CoreGui.RobloxGui.Modules.Server.VR.VRAvatarGesturesServer
local v1 = game:GetService("CorePackages")
game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("VRService")
local v_u_4 = game:GetService("RobloxReplicatedStorage")
local v_u_5 = game:GetService("RbxAnalyticsService")
local v_u_6 = require(v1.Workspace.Packages.CoreScriptsCommon).AvatarUtil
local v_u_7 = require(v1.Workspace.Packages.CoreScriptsCommon).ConnectionUtil
local v_u_8 = game:DefineFastInt("VRAvatarGesturesAnalyticsThrottleHundrethsPercent", 0)
local v_u_9 = game:DefineFastFlag("VRAvatarGesturesUseNilForHandChainRootRebuild", false)
local v_u_10 = game:DefineFastFlag("VRAvatarGesturesFixJointLimits", false)
local v_u_11 = { "UpperArm", "LowerArm", "Hand" }
local v_u_12 = { "Left", "Right" }
local v_u_13 = {}
v_u_13.__index = v_u_13
local function v_u_22(p14, p15, p16) -- name: forEachArmRagdollBallSocket
	-- upvalues: (copy) v_u_11
	for _, v17 in ipairs(v_u_11) do
		local v18 = p14:FindFirstChild(p15 .. v17)
		if not v18 then
			continue
		end
		for _, v19 in ipairs(v18:GetChildren()) do
			local v20 = v19:IsA("BallSocketConstraint")
			if v20 then
				local v21 = v19.Name
				v20 = string.sub(v21, -10) == "BallSocket"
			end
			if not v20 then
				continue
			end
			p16(v19)
		end
	end
end
function v_u_13.new() -- name: new
	-- upvalues: (copy) v_u_13, (copy) v_u_7, (copy) v_u_3
	local v23 = v_u_13
	local v_u_24 = setmetatable({}, v23)
	v_u_24.connections = v_u_7.new()
	v_u_24.VRPlayers = {}
	v_u_24.connections:connect("AvatarGestures", v_u_3:GetPropertyChangedSignal("AvatarGestures"), function()
		-- upvalues: (copy) v_u_24
		v_u_24:onAvatarGesturesChanged()
	end)
	if v_u_3.AvatarGestures then
		v_u_24:onAvatarGesturesChanged()
	end
	return v_u_24
end
function cleanCharacter(p25) -- name: cleanCharacter
	-- upvalues: (copy) v_u_10, (copy) v_u_12, (copy) v_u_22
	if p25.Character then
		if v_u_10 then
			for _, v26 in ipairs(v_u_12) do
				v_u_22(p25.Character, v26, function(p27)
					local v28 = p27:GetAttribute("VRAvatarGesturesPriorLimitsEnabled")
					if v28 ~= nil then
						p27.LimitsEnabled = v28
						p27.TwistLimitsEnabled = p27:GetAttribute("VRAvatarGesturesPriorTwistLimitsEnabled")
						p27:SetAttribute("VRAvatarGesturesPriorLimitsEnabled", nil)
						p27:SetAttribute("VRAvatarGesturesPriorTwistLimitsEnabled", nil)
					end
				end)
			end
		end
		local v29 = p25.Character:FindFirstChild("Humanoid")
		if v29 then
			for _, v30 in pairs({ "TrackedIKLeftHand", "TrackedIKRightHand", "TrackedIKHead" }) do
				local v31 = v29:FindFirstChild(v30)
				if not v31 then
					continue
				end
				v31:Destroy()
			end
		end
		for _, v32 in pairs({ "TrackedLeftHand", "TrackedRightHand", "TrackedHead" }) do
			local v33 = p25.Character:FindFirstChild(v32)
			if not v33 then
				continue
			end
			v33:Destroy()
		end
	end
end
function v_u_13.onPlayerChanged(p_u_34, p35, p36) -- name: onPlayerChanged
	-- upvalues: (copy) v_u_6
	p_u_34.VRPlayers[p35] = p36 or nil
	if p36 then
		if not p_u_34.avatarUtil then
			p_u_34.avatarUtil = v_u_6.new()
		end
		p_u_34.avatarUtil:connectPlayerCharacterChanges(p35, function(p37)
			-- upvalues: (copy) p_u_34
			p_u_34:onCharacterChanged(p37)
		end)
	else
		cleanCharacter(p35)
	end
end
function v_u_13.onPlayerAdded(p38, p39) -- name: onPlayerAdded
	-- upvalues: (copy) v_u_5, (copy) v_u_8
	if next(p38.VRPlayers) ~= nil then
		v_u_5:ReportInfluxSeries("VRAvatarGestures", {
			["placeId"] = nil,
			["calledFrom"] = "ServerPlayerAddedWithVRPlayer",
			["playerUserID"] = nil,
			["placeId"] = game.PlaceId,
			["playerUserID"] = p39.UserId
		}, v_u_8)
	end
end
function v_u_13.onAvatarGesturesChanged(p_u_40) -- name: onAvatarGesturesChanged
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_2
	if v_u_3.AvatarGestures then
		local v41 = v_u_4:FindFirstChild("AvatarGesturesVRPlayer")
		if not v41 then
			v41 = Instance.new("RemoteEvent")
			v41.Name = "AvatarGesturesVRPlayer"
			v41.Parent = v_u_4
		end
		p_u_40.connections:connect("VRPlayerOnServerEvent", v41.OnServerEvent, function(p42, p43)
			-- upvalues: (copy) p_u_40
			p_u_40:onPlayerChanged(p42, p43)
		end)
		p_u_40.connections:connect("PlayerAdded", v_u_2.PlayerAdded, function(p44)
			-- upvalues: (copy) p_u_40
			p_u_40:onPlayerAdded(p44)
		end)
		p_u_40.connections:connect("PlayerRemoving", v_u_2.PlayerRemoving, function(p45)
			-- upvalues: (copy) p_u_40
			p_u_40:onPlayerChanged(p45, false)
		end)
	else
		for v46 in pairs(p_u_40.VRPlayers) do
			p_u_40:onPlayerChanged(v46, false)
		end
		p_u_40.connections:disconnectAll()
		p_u_40.connections:connect("AvatarGestures", v_u_3:GetPropertyChangedSignal("AvatarGestures"), function()
			-- upvalues: (copy) p_u_40
			p_u_40:onAvatarGesturesChanged()
		end)
	end
end
function v_u_13.findOrCreateColliders(_, p47, p48) -- name: findOrCreateColliders
	-- upvalues: (copy) v_u_2
	local v49 = v_u_2:GetPlayerFromCharacter(p48)
	local v50 = "Tracked" .. p47
	local v51 = p48:FindFirstChild(v50)
	if not v51 then
		v51 = Instance.new("Part")
		v51.Name = v50
		v51.Transparency = 1
		v51.CanCollide = false
		v51.Parent = p48
		v51:SetNetworkOwner(v49)
	end
	local v52 = v51:FindFirstChild(v50 .. "Attachment")
	if not v52 then
		v52 = Instance.new("Attachment")
		v52.Name = v50 .. "Attachment"
		v52.Parent = v51
	end
	local v53 = v51:FindFirstChild(v50 .. "AlignPosition")
	if not v53 then
		v53 = Instance.new("AlignPosition")
		v53.Name = v50 .. "AlignPosition"
		v53.Mode = Enum.PositionAlignmentMode.OneAttachment
		v53.Attachment0 = v52
		v53.RigidityEnabled = true
		v53.Parent = v51
	end
	local v54 = v51:FindFirstChild(v50 .. "AlignOrientation")
	if not v54 then
		v54 = Instance.new("AlignOrientation")
		v54.Name = v50 .. "AlignOrientation"
		v54.Mode = Enum.OrientationAlignmentMode.OneAttachment
		v54.Attachment0 = v52
		v54.RigidityEnabled = true
		v54.Parent = v51
	end
	local v55 = p48:FindFirstChild(p47)
	if v55 then
		v51.Size = v55.Size
		v51.CFrame = v55.CFrame
		v53.Position = v55.Position
		v54.CFrame = v55.CFrame
	else
		v51.Size = Vector3.new(1, 1, 1)
		v51.CFrame = p48.WorldPivot
		v53.Position = p48.WorldPivot.Position
		v54.CFrame = p48.WorldPivot
	end
	local v56 = p48:FindFirstChild("Humanoid")
	if v56 then
		local v57 = "TrackedIK" .. p47
		local v58 = v56:FindFirstChild(v57)
		if not v58 then
			v58 = Instance.new("IKControl")
			v58.Name = v57
		end
		v58.SmoothTime = 0.1
		v58.Parent = v56
		v58.Target = v51
	end
end
function v_u_13.createHandCollider(p59, p60, p61) -- name: createHandCollider
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_22
	p59:findOrCreateColliders(p60 .. "Hand", p61)
	local v62 = p61:FindFirstChild(p60 .. "Hand")
	local v63 = p61:FindFirstChild("Humanoid")
	local v_u_64 = v63 and v63:FindFirstChild("TrackedIK" .. p60 .. "Hand")
	if v_u_64 then
		v_u_64.Type = Enum.IKControlType.Transform
		local v_u_65 = p61:FindFirstChild(p60 .. "UpperArm")
		if v_u_65 then
			if v_u_9 then
				v_u_64.ChainRoot = nil
			else
				v_u_64.ChainRoot = v62
			end
			coroutine.wrap(function()
				-- upvalues: (copy) v_u_64, (copy) v_u_65
				task.wait(0.1)
				v_u_64.ChainRoot = v_u_65
			end)()
		end
		if v62 then
			v_u_64.EndEffector = v62
		end
		v_u_64.Priority = 1
	end
	if v_u_10 then
		v_u_22(p61, p60, function(p66)
			if p66:GetAttribute("VRAvatarGesturesPriorLimitsEnabled") == nil then
				p66:SetAttribute("VRAvatarGesturesPriorLimitsEnabled", p66.LimitsEnabled)
				p66:SetAttribute("VRAvatarGesturesPriorTwistLimitsEnabled", p66.TwistLimitsEnabled)
			end
			p66.LimitsEnabled = false
			p66.TwistLimitsEnabled = false
		end)
	else
		local v67 = v62 and v62:FindFirstChild("RagdollBallSocket")
		if v67 then
			v67.LimitsEnabled = false
		end
	end
end
function v_u_13.createHeadCollider(p68, p69) -- name: createHeadCollider
	p68:findOrCreateColliders("Head", p69)
	local v70 = p69:FindFirstChild("Head")
	local v71 = p69:FindFirstChild("Humanoid")
	local v72 = v71 and v71:FindFirstChild("TrackedIKHead")
	if v72 then
		v72.Type = Enum.IKControlType.Rotation
		local v73 = p69:FindFirstChild("UpperTorso")
		if v73 then
			v72.ChainRoot = v73
		end
		if v70 then
			v72.EndEffector = v70
		end
	end
end
function v_u_13.onCharacterChanged(p74, p75) -- name: onCharacterChanged
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v76 = v_u_2:GetPlayerFromCharacter(p75)
	if p74.VRPlayers[v76] and v_u_3.AvatarGestures then
		p74:createHandCollider("Left", p75)
		p74:createHandCollider("Right", p75)
		p74:createHeadCollider(p75)
	end
end
function v_u_13._suppressArmRagdollLimits(p77, p78) -- name: suppressArmRagdollLimits
	-- upvalues: (copy) v_u_22
	v_u_22(p77, p78, function(p79)
		if p79:GetAttribute("VRAvatarGesturesPriorLimitsEnabled") == nil then
			p79:SetAttribute("VRAvatarGesturesPriorLimitsEnabled", p79.LimitsEnabled)
			p79:SetAttribute("VRAvatarGesturesPriorTwistLimitsEnabled", p79.TwistLimitsEnabled)
		end
		p79.LimitsEnabled = false
		p79.TwistLimitsEnabled = false
	end)
end
function v_u_13._restoreArmRagdollLimits(p80, p81) -- name: restoreArmRagdollLimits
	-- upvalues: (copy) v_u_22
	v_u_22(p80, p81, function(p82)
		local v83 = p82:GetAttribute("VRAvatarGesturesPriorLimitsEnabled")
		if v83 ~= nil then
			p82.LimitsEnabled = v83
			p82.TwistLimitsEnabled = p82:GetAttribute("VRAvatarGesturesPriorTwistLimitsEnabled")
			p82:SetAttribute("VRAvatarGesturesPriorLimitsEnabled", nil)
			p82:SetAttribute("VRAvatarGesturesPriorTwistLimitsEnabled", nil)
		end
	end)
end
return v_u_13