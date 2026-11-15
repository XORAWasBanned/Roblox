-- Path: CorePackages.Packages._Index.MomentScenes.MomentScenes.Builders._Utils.avatarRig
local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("Workspace")
local v_u_5 = require(script.Parent.loadAsset)
local function v_u_13(p6, p7, p_u_8) -- name: staged
	local v9 = p6.Parent
	local v10 = Instance.new("Folder")
	v10.Name = "MomentScenesStaging"
	v10.Parent = p7
	p6.Parent = v10
	local v11, v12 = pcall(function()
		-- upvalues: (copy) p_u_8
		p_u_8()
		return nil
	end)
	p6.Parent = v9
	v10:Destroy()
	if not v11 then
		error(v12)
	end
end
local function v_u_20(p14) -- name: emoteAnimationId
	-- upvalues: (copy) v_u_5
	local v15 = ("rbxassetid://%*"):format(p14)
	local v16 = v_u_5.loadAsset
	local v17, v18 = pcall(v16, p14)
	if not v17 or (v18 == nil or typeof(v18) ~= "Instance") then
		return v15
	end
	local v19 = v18:FindFirstChildWhichIsA("Animation")
	if v19 ~= nil and v19.AnimationId ~= "" then
		v15 = v19.AnimationId
	end
	v18:Destroy()
	return v15
end
return {
	["createAvatar"] = function(p_u_21, p_u_22) -- name: createAvatar
		-- upvalues: (copy) v_u_1, (copy) v_u_13, (copy) v_u_4
		local function v23()
			-- upvalues: (ref) v_u_1, (copy) p_u_21, (copy) p_u_22
			return v_u_1:CreateHumanoidModelFromDescriptionAsync(p_u_21, p_u_22)
		end
		local v24, v_u_25 = pcall(v23)
		if not v24 or v_u_25 == nil then
			error((("avatarRig.createAvatar: CreateHumanoidModelFromDescriptionAsync failed: %*"):format(v_u_25)))
		end
		local v26 = v_u_25:FindFirstChild("HumanoidRootPart")
		if v26 ~= nil and v26:IsA("BasePart") then
			v26.Anchored = true
			v_u_25.PrimaryPart = v26
		end
		v_u_13(v_u_25, v_u_4, function()
			-- upvalues: (copy) v_u_25
			for _, v27 in v_u_25:GetDescendants() do
				if not v27:IsA("BasePart") then
					continue
				end
				local _ = v27.CFrame
			end
		end)
		return v_u_25
	end,
	["solveJoints"] = function(p_u_28) -- name: solveJoints
		-- upvalues: (copy) v_u_13, (copy) v_u_4
		v_u_13(p_u_28, v_u_4, function()
			-- upvalues: (copy) p_u_28
			for _, v29 in p_u_28:GetDescendants() do
				if not v29:IsA("BasePart") then
					continue
				end
				local _ = v29.CFrame
			end
		end)
	end,
	["playEmote"] = function(p30, p31) -- name: playEmote
		-- upvalues: (copy) v_u_20, (copy) v_u_13, (copy) v_u_2, (copy) v_u_3
		local v32 = p30:FindFirstChildOfClass("Humanoid")
		if v32 == nil then
			return nil
		end
		local v_u_33 = v32:FindFirstChildOfClass("Animator")
		if v_u_33 == nil then
			v_u_33 = Instance.new("Animator")
			v_u_33.Parent = v32
		end
		local v_u_34 = Instance.new("Animation")
		v_u_34.Name = "Live3DEmote"
		v_u_34.AnimationId = v_u_20(p31)
		v_u_34.Parent = p30
		local v_u_35 = nil
		v_u_13(p30, v_u_2, function()
			-- upvalues: (ref) v_u_33, (copy) v_u_34, (ref) v_u_3, (ref) v_u_35
			local function v36()
				-- upvalues: (ref) v_u_33, (ref) v_u_34
				return v_u_33:LoadAnimation(v_u_34)
			end
			local v37, v38 = pcall(v36)
			if v37 and v38 ~= nil then
				v38.Looped = true
				v38:Play(0)
				local v39 = os.clock()
				if v38.Length == 0 then
					if v_u_3:IsRunning() then
						task.wait()
					else
						wait(0)
					end
					if os.clock() - v39 <= 2 then
						continue
					end
				end
				v38:AdjustSpeed(0)
				v_u_35 = v38
			end
		end)
		return v_u_35
	end,
	["emoteAnimationId"] = v_u_20
}