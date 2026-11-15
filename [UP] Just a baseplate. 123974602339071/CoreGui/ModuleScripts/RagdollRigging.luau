-- Path: CoreGui.RobloxGui.Modules.Common.RagdollRigging
local v_u_1 = game:GetService("RunService")
local v_u_2 = game:GetEngineFeature("AvatarJointUpgradeFeature")
local v3 = {}
local v4 = {
	["UpperAngle"] = 10,
	["TwistLowerAngle"] = -10,
	["TwistUpperAngle"] = 10,
	["StrengthTorque"] = 400,
	["ReferenceMass"] = 0.43671694397926
}
local v5 = {
	["UpperAngle"] = 20,
	["TwistLowerAngle"] = 5,
	["TwistUpperAngle"] = 120,
	["StrengthTorque"] = 1200,
	["ReferenceMass"] = 0.70196455717087
}
local v6 = {
	["UpperAngle"] = 30,
	["TwistLowerAngle"] = -10,
	["TwistUpperAngle"] = 10,
	["StrengthTorque"] = 400,
	["ReferenceMass"] = 0.69132566452026
}
local v7 = {
	["UpperAngle"] = 5,
	["TwistLowerAngle"] = -120,
	["TwistUpperAngle"] = -5,
	["StrengthTorque"] = 2000,
	["ReferenceMass"] = 0.65389388799667
}
local v8 = {
	["UpperAngle"] = 110,
	["TwistLowerAngle"] = -85,
	["TwistUpperAngle"] = 85,
	["FrictionTorque"] = 600,
	["StrengthTorque"] = 4000,
	["ReferenceMass"] = 0.90918225049973
}
local v9 = {
	["UpperAngle"] = 40,
	["TwistLowerAngle"] = -5,
	["TwistUpperAngle"] = 80,
	["FrictionTorque"] = 600,
	["StrengthTorque"] = 4000,
	["ReferenceMass"] = 1.9175016880035
}
local v10 = {
	["UpperAngle"] = 110,
	["TwistLowerAngle"] = -85,
	["TwistUpperAngle"] = 85
}
local v11 = {
	["UpperAngle"] = 40,
	["TwistLowerAngle"] = -5,
	["TwistUpperAngle"] = 80
}
local v12 = Vector3.new()
local v_u_13 = {
	{
		"UpperTorso",
		"RightShoulderRagdollAttachment",
		CFrame.fromMatrix(v12, Vector3.new(1, 0, 0), Vector3.new(0, 1, 0)),
		"RightShoulderRigAttachment"
	},
	{
		"RightUpperArm",
		"RightShoulderRagdollAttachment",
		CFrame.fromMatrix(v12, Vector3.new(0, -1, 0), Vector3.new(1, 0, 0)),
		"RightShoulderRigAttachment"
	},
	{
		"UpperTorso",
		"LeftShoulderRagdollAttachment",
		CFrame.fromMatrix(v12, Vector3.new(-1, 0, 0), Vector3.new(0, 1, 0)),
		"LeftShoulderRigAttachment"
	},
	{
		"LeftUpperArm",
		"LeftShoulderRagdollAttachment",
		CFrame.fromMatrix(v12, Vector3.new(0, -1, 0), Vector3.new(-1, 0, 0)),
		"LeftShoulderRigAttachment"
	}
}
local v_u_14 = {
	{
		"UpperTorso",
		"Head",
		"NeckRigAttachment",
		{
			["UpperAngle"] = 45,
			["TwistLowerAngle"] = -40,
			["TwistUpperAngle"] = 40,
			["FrictionTorque"] = 400,
			["StrengthTorque"] = 400,
			["ReferenceMass"] = 1.0249234437943
		}
	},
	{
		"LowerTorso",
		"UpperTorso",
		"WaistRigAttachment",
		{
			["UpperAngle"] = 20,
			["TwistLowerAngle"] = -40,
			["TwistUpperAngle"] = 20,
			["FrictionTorque"] = 750,
			["StrengthTorque"] = 5000,
			["ReferenceMass"] = 2.861558675766
		}
	},
	{
		"UpperTorso",
		"LeftUpperArm",
		"LeftShoulderRagdollAttachment",
		v8
	},
	{
		"LeftUpperArm",
		"LeftLowerArm",
		"LeftElbowRigAttachment",
		v5
	},
	{
		"LeftLowerArm",
		"LeftHand",
		"LeftWristRigAttachment",
		v6
	},
	{
		"UpperTorso",
		"RightUpperArm",
		"RightShoulderRagdollAttachment",
		v8
	},
	{
		"RightUpperArm",
		"RightLowerArm",
		"RightElbowRigAttachment",
		v5
	},
	{
		"RightLowerArm",
		"RightHand",
		"RightWristRigAttachment",
		v6
	},
	{
		"LowerTorso",
		"LeftUpperLeg",
		"LeftHipRigAttachment",
		v9
	},
	{
		"LeftUpperLeg",
		"LeftLowerLeg",
		"LeftKneeRigAttachment",
		v7
	},
	{
		"LeftLowerLeg",
		"LeftFoot",
		"LeftAnkleRigAttachment",
		v4
	},
	{
		"LowerTorso",
		"RightUpperLeg",
		"RightHipRigAttachment",
		v9
	},
	{
		"RightUpperLeg",
		"RightLowerLeg",
		"RightKneeRigAttachment",
		v7
	},
	{
		"RightLowerLeg",
		"RightFoot",
		"RightAnkleRigAttachment",
		v4
	}
}
local v_u_15 = {
	{ "LowerTorso", "LeftUpperArm" },
	{ "LeftUpperArm", "LeftHand" },
	{ "LowerTorso", "RightUpperArm" },
	{ "RightUpperArm", "RightHand" },
	{ "LeftUpperLeg", "RightUpperLeg" },
	{ "UpperTorso", "RightUpperLeg" },
	{ "RightUpperLeg", "RightFoot" },
	{ "UpperTorso", "LeftUpperLeg" },
	{ "LeftUpperLeg", "LeftFoot" },
	{ "UpperTorso", "LeftLowerLeg" },
	{ "UpperTorso", "RightLowerLeg" },
	{ "LowerTorso", "LeftLowerLeg" },
	{ "LowerTorso", "RightLowerLeg" },
	{ "UpperTorso", "LeftLowerArm" },
	{ "UpperTorso", "RightLowerArm" },
	{ "Head", "LeftUpperArm" },
	{ "Head", "RightUpperArm" }
}
local v_u_16 = {
	{ "Waist", "UpperTorso" },
	{ "Neck", "Head" },
	{ "LeftShoulder", "LeftUpperArm" },
	{ "LeftElbow", "LeftLowerArm" },
	{ "LeftWrist", "LeftHand" },
	{ "RightShoulder", "RightUpperArm" },
	{ "RightElbow", "RightLowerArm" },
	{ "RightWrist", "RightHand" },
	{ "LeftHip", "LeftUpperLeg" },
	{ "LeftKnee", "LeftLowerLeg" },
	{ "LeftAnkle", "LeftFoot" },
	{ "RightHip", "RightUpperLeg" },
	{ "RightKnee", "RightLowerLeg" },
	{ "RightAnkle", "RightFoot" }
}
local v_u_17 = {
	{ "Head", "NeckAttachment", CFrame.new(0, -0.5, 0) },
	{ "Torso", "RightShoulderRagdollAttachment", CFrame.fromMatrix(Vector3.new(1, 0.5, 0), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0)) },
	{ "Right Arm", "RightShoulderRagdollAttachment", CFrame.fromMatrix(Vector3.new(-0.5, 0.5, 0), Vector3.new(0, -1, 0), Vector3.new(1, 0, 0)) },
	{ "Torso", "LeftShoulderRagdollAttachment", CFrame.fromMatrix(Vector3.new(-1, 0.5, 0), Vector3.new(-1, 0, 0), Vector3.new(0, 1, 0)) },
	{ "Left Arm", "LeftShoulderRagdollAttachment", CFrame.fromMatrix(Vector3.new(0.5, 0.5, 0), Vector3.new(0, -1, 0), Vector3.new(-1, 0, 0)) },
	{ "Torso", "RightHipAttachment", CFrame.new(0.5, -1, 0) },
	{ "Right Leg", "RightHipAttachment", CFrame.new(0, 1, 0) },
	{ "Torso", "LeftHipAttachment", CFrame.new(-0.5, -1, 0) },
	{ "Left Leg", "LeftHipAttachment", CFrame.new(0, 1, 0) }
}
local v_u_18 = {
	{
		"Torso",
		"Head",
		"NeckAttachment",
		{
			["UpperAngle"] = 30,
			["TwistLowerAngle"] = -40,
			["TwistUpperAngle"] = 40
		}
	},
	{
		"Torso",
		"Left Leg",
		"LeftHipAttachment",
		v11
	},
	{
		"Torso",
		"Right Leg",
		"RightHipAttachment",
		v11
	},
	{
		"Torso",
		"Left Arm",
		"LeftShoulderRagdollAttachment",
		v10
	},
	{
		"Torso",
		"Right Arm",
		"RightShoulderRagdollAttachment",
		v10
	}
}
local v_u_19 = {
	{ "Left Leg", "Right Leg" },
	{ "Head", "Right Arm" },
	{ "Head", "Left Arm" }
}
local v_u_20 = {
	{ "Neck", "Torso" },
	{ "Left Shoulder", "Torso" },
	{ "Right Shoulder", "Torso" },
	{ "Left Hip", "Torso" },
	{ "Right Hip", "Torso" }
}
local function v_u_25(p21) -- name: indexParts
	local v22 = {}
	for _, v23 in ipairs(p21:GetChildren()) do
		if not v23:IsA("BasePart") then
			continue
		end
		local v24 = v23.name
		if v22[v24] then
			continue
		end
		v22[v24] = v23
	end
	return v22
end
local function v_u_45(p26, p27, p28) -- name: createRigJoints
	if p28 then
		local v29 = Instance.new("AnimationConstraint")
		v29.Name = "Root"
		v29.Attachment0 = p26.HumanoidRootPart.RootRigAttachment
		v29.Attachment1 = p26.LowerTorso.RootRigAttachment
		v29.IsKinematic = true
		p26.LowerTorso.Root:Destroy()
		v29.Parent = p26.LowerTorso
	end
	for _, v30 in ipairs(p27) do
		local v31, v32, v33, v34 = unpack(v30)
		local v35 = p26[v31]
		local v36 = p26[v32]
		if not (v35 and v36) then
			continue
		end
		local v37 = v35:FindFirstChild(v33)
		local v38 = v36:FindFirstChild(v33)
		if not (v37 and (v38 and (v37:IsA("Attachment") and v38:IsA("Attachment")))) then
			continue
		end
		local v39 = v36:FindFirstChild("RagdollBallSocket")
		if not v39 then
			v39 = Instance.new("BallSocketConstraint")
			v39.Name = "RagdollBallSocket"
		end
		v39.Attachment0 = v37
		v39.Attachment1 = v38
		v39.LimitsEnabled = true
		v39.UpperAngle = v34.UpperAngle
		v39.TwistLimitsEnabled = true
		v39.TwistLowerAngle = v34.TwistLowerAngle
		v39.TwistUpperAngle = v34.TwistUpperAngle
		local v40 = workspace.Gravity / 196.2
		if p28 then
			v40 = math.max(v40, 0.2)
		end
		local v41 = v34.ReferenceMass
		local v42 = v41 and (v36:GetMass() / v41 or 1) or 1
		v39.MaxFrictionTorque = (v34.FrictionTorque or 500) * v42 * v40
		if p28 then
			v39.MaxFrictionTorque = v39.MaxFrictionTorque / 100
		end
		v39.Parent = v36
		if not p28 then
			continue
		end
		local v43 = v36:FindFirstChildWhichIsA("Motor6D")
		assert(v43)
		local v44 = Instance.new("AnimationConstraint")
		v44.Name = v43.Name
		v44.Attachment0 = v43.Part0:FindFirstChild(v43.Name .. "RigAttachment")
		v44.Attachment1 = v43.Part1:FindFirstChild(v43.Name .. "RigAttachment")
		v44.IsKinematic = true
		v44.MaxTorque = (v34.StrengthTorque or 500) * v42 * v40
		v44.MaxForce = 0
		v44.Parent = v43.parent
		v43:Destroy()
	end
end
local function v_u_57(p46, p47) -- name: createAdditionalAttachments
	for _, v48 in ipairs(p47) do
		local v49, v50, v51, v52 = unpack(v48)
		local v53 = p46[v49]
		if not v53 then
			continue
		end
		local v54 = v53:FindFirstChild(v50)
		if v54 and not v54:IsA("Attachment") then
			continue
		end
		if v52 then
			local v55 = v53:FindFirstChild(v52)
			if v55 and v55:IsA("Attachment") then
				v51 = v55.CFrame * v51
			end
		end
		if v54 then
			v54.CFrame = v51
		else
			local v56 = Instance.new("Attachment")
			v56.Name = v50
			v56.CFrame = v51
			v56.Parent = v53
		end
	end
end
local function v_u_78(p58, p59) -- name: createNoCollides
	local v60 = {}
	for _, v61 in ipairs(p59) do
		local v62, v63 = unpack(v61)
		local v64 = p58[v62]
		local v65 = p58[v63]
		if not (v64 and v65) then
			continue
		end
		local v66 = v60[v65]
		if not v66 then
			v66 = {}
			v60[v65] = v66
		end
		v66[v64] = true
	end
	local v67 = {}
	for v68, v69 in pairs(v60) do
		local v70 = {}
		for _, v71 in ipairs(v68:GetChildren()) do
			if not v71:IsA("NoCollisionConstraint") or v71.Name ~= "RagdollNoCollision" then
				continue
			end
			local v72 = v71.Part0
			if v71.Part1 == v68 and v69[v72] then
				v69[v72] = nil
			else
				table.insert(v70, v71)
			end
		end
		v67[v68] = v70
	end
	for v73, v74 in pairs(v60) do
		local v75 = v67[v73]
		for v76, _ in pairs(v74) do
			local v77 = table.remove(v75) or Instance.new("NoCollisionConstraint")
			v77.Name = "RagdollNoCollision"
			v77.Part0 = v76
			v77.Part1 = v73
			v77.Parent = v73
		end
	end
end
local function v_u_85(p79, p80) -- name: hasValidConstraint
	for _, v81 in ipairs(p80:GetChildren()) do
		if not v81:IsA("BallSocketConstraint") then
			continue
		end
		local v82 = v81.Attachment0
		local v83 = v81.Attachment1
		local v84
		if v82 and v82.Parent == p79 and (v83 and v83.Parent == p80) then
			v84 = true
		elseif v82 and v82.Parent == p80 and true or false then
			v84 = v83 and v83.Parent == p79 and true or false
		else
			v84 = false
		end
		if not v84 then
			continue
		end
		return true
	end
	return false
end
local function v_u_89(p86) -- name: hasRagdollJoint
	-- upvalues: (copy) v_u_2, (copy) v_u_85
	if v_u_2 and not (p86:IsA("Motor6D") or p86:IsA("AnimationConstraint")) then
		return false
	else
		local v87 = nil
		local v88 = nil
		if p86:IsA("Motor6D") then
			v87 = p86.Part0
			v88 = p86.Part1
		elseif v_u_2 and p86:IsA("AnimationConstraint") then
			v87 = p86.Attachment0
			v88 = p86.Attachment1
			if v87 then
				v87 = v87.Parent
			end
			if v88 then
				v88 = v88.Parent
			end
		end
		if v87 and v88 then
			return v_u_85(v87, v88) and true or (v_u_85(v88, v87) and true or false)
		else
			return false
		end
	end
end
local function v_u_96(p90, p91) -- name: disableMotorSet
	-- upvalues: (copy) v_u_2, (copy) v_u_89
	local v92 = {}
	for _, v93 in ipairs(p91) do
		local v94 = p90:FindFirstChild(v93[2])
		if not v94 then
			continue
		end
		local v95 = v94:FindFirstChild(v93[1])
		if not (v95 and (v_u_2 or v95:IsA("Motor6D")) and v_u_89(v95)) then
			continue
		end
		table.insert(v92, v95)
		v95.Enabled = false
	end
	return v92
end
function v3.createRagdollJoints(p97, p98, p99) -- name: createRagdollJoints
	-- upvalues: (copy) v_u_25, (copy) v_u_57, (copy) v_u_17, (copy) v_u_45, (copy) v_u_18, (copy) v_u_78, (copy) v_u_19, (copy) v_u_13, (copy) v_u_14, (copy) v_u_15
	local v100 = v_u_25(p97)
	if p98 == Enum.HumanoidRigType.R6 then
		v_u_57(v100, v_u_17)
		v_u_45(v100, v_u_18, false)
		v_u_78(v100, v_u_19)
		return
	elseif p98 == Enum.HumanoidRigType.R15 then
		v_u_57(v100, v_u_13)
		v_u_45(v100, v_u_14, p99)
		v_u_78(v100, v_u_15)
	else
		error("unknown rig type", 2)
	end
end
function v3.disableMotors(p101, p102) -- name: disableMotors
	-- upvalues: (copy) v_u_96, (copy) v_u_20, (copy) v_u_16
	local v103 = nil
	if p102 == Enum.HumanoidRigType.R6 then
		v103 = v_u_96(p101, v_u_20)
	elseif p102 == Enum.HumanoidRigType.R15 then
		v103 = v_u_96(p101, v_u_16)
	else
		error("unknown rig type", 2)
	end
	local v104 = p101.PrimaryPart or p101:FindFirstChild("HumanoidRootPart")
	if v104 and v104:IsA("BasePart") then
		v104.CanCollide = false
	end
	local v105 = p101:FindFirstChild("Head")
	if v105 and v105:IsA("BasePart") then
		v105.CanCollide = true
	end
	return v103
end
function v3.disableParticleEmittersAndFadeOut(p106, p107) -- name: disableParticleEmittersAndFadeOut
	-- upvalues: (copy) v_u_1
	if v_u_1:IsServer() then
		error("disableParticleEmittersAndFadeOut should not be called on the server.", 2)
	end
	local v108 = p106:GetDescendants()
	local v109 = {}
	for _, v110 in pairs(v108) do
		if v110:IsA("BasePart") or v110:IsA("Decal") then
			v109[v110] = v110.Transparency
		else
			if not v110:IsA("ParticleEmitter") then
				continue
			end
			v110.Enabled = false
		end
	end
	local v111 = 0
	while v111 < p107 do
		v111 = v111 + v_u_1.Heartbeat:Wait()
		local v112 = v111 / p107
		local v113 = math.min(v112, 1)
		for v114, v115 in pairs(v109) do
			v114.Transparency = (1 - v113) * v115 + v113
		end
	end
end
function v3.easeNongraphicJointFriction(p116, p117) -- name: easeNongraphicJointFriction
	-- upvalues: (copy) v_u_1
	local v118 = p116:GetDescendants()
	local v119 = {}
	for _, v120 in pairs(v118) do
		if not v120:IsA("BallSocketConstraint") or v120.Name ~= "RagdollBallSocket" then
			continue
		end
		v120.MaxFrictionTorque = v120.MaxFrictionTorque * 100
		local v121 = v120.MaxFrictionTorque
		local v122 = v120.Parent.Name
		v119[v120] = { v120, v121, v121 * ((v122 == "UpperTorso" or v122 == "Head") and 0.5 or 0.05) }
	end
	local v123 = 0
	while v123 < p117 do
		local _, v124 = v_u_1.Stepped:Wait()
		v123 = v123 + v124
		local v125 = v123 / p117
		local v126 = math.min(v125, 1)
		for _, v127 in pairs(v119) do
			local v128, v129, v130 = unpack(v127)
			v128.MaxFrictionTorque = (1 - v126) * v129 + v126 * v130
		end
	end
end
function v3.easeJointFriction_OLD(p131, p132) -- name: easeJointFriction_OLD
	-- upvalues: (copy) v_u_1
	local v133 = p131:GetDescendants()
	local v134 = {}
	for _, v135 in pairs(v133) do
		if not v135:IsA("BallSocketConstraint") or v135.Name ~= "RagdollBallSocket" then
			continue
		end
		local v136 = v135.MaxFrictionTorque
		local v137 = v135.Parent.Name
		v134[v135] = { v135, v136, v136 * ((v137 == "UpperTorso" or v137 == "Head") and 0.5 or 0.05) }
	end
	local v138 = 0
	while v138 < p132 do
		local _, v139 = v_u_1.Stepped:Wait()
		v138 = v138 + v139
		local v140 = v138 / p132
		local v141 = math.min(v140, 1)
		for _, v142 in pairs(v134) do
			local v143, v144, v145 = unpack(v142)
			v143.MaxFrictionTorque = (1 - v141) * v144 + v141 * v145
		end
	end
end
return v3