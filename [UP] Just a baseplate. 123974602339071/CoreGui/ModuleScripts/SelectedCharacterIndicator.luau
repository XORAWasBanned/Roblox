-- Path: CoreGui.RobloxGui.Modules.AvatarContextMenu.SelectedCharacterIndicator
local v_u_1 = {}
v_u_1.__index = v_u_1
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("Workspace")
local v_u_4 = game:GetService("TweenService")
game:GetService("InsertService")
local v_u_5 = v3.CurrentCamera
local function v_u_8(p6) -- name: removeScripts
	for _, v7 in ipairs(p6:GetDescendants()) do
		if not v7:IsA("LuaSourceContainer") then
			continue
		end
		v7:Destroy()
	end
end
local function v_u_18(p9, p10) -- name: ApplyArrow
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_4, (copy) v_u_2
	local v_u_11 = Instance.new("Model")
	v_u_11.Name = "ContextMenuArrow"
	v_u_11.Parent = v_u_5
	local v12 = p9:FindFirstChildOfClass("Humanoid")
	if v12 == nil then
		v12 = p9:WaitForChild("Humanoid", 15)
		if v12 == nil then
			return
		end
	end
	local v_u_13 = p9:WaitForChild("HumanoidRootPart")
	local v_u_14 = p10.SelectedCharacterIndicator:Clone()
	v_u_8(v_u_14)
	v_u_14.Anchored = true
	v_u_14.Transparency = 0
	v_u_14.CanCollide = false
	v_u_14.Parent = v_u_11
	local v_u_15 = v_u_4:Create(v_u_14, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, false), {
		["Orientation"] = Vector3.new(0, 360, 180)
	})
	v_u_15:Play()
	local v_u_16 = false
	local function v17() -- name: kill
		-- upvalues: (ref) v_u_16, (copy) v_u_11, (copy) v_u_15, (ref) v_u_2
		if not v_u_16 then
			v_u_16 = true
			v_u_11:Destroy()
			v_u_15:Destroy()
			v_u_2:UnbindFromRenderStep("ContextActionMenuRenderArrow")
		end
	end
	v12.Died:Connect(v17)
	p9.AncestryChanged:Connect(v17)
	v_u_2:BindToRenderStep("ContextActionMenuRenderArrow", Enum.RenderPriority.Camera.Value + 1, function() -- name: update
		-- upvalues: (copy) v_u_14, (copy) v_u_13
		v_u_14.Position = v_u_13.Position + Vector3.new(0, 5, 0)
	end)
	v_u_11.Parent = v_u_5
	return v17
end
function v_u_1.ChangeSelectedPlayer(p_u_19, p_u_20, p_u_21) -- name: ChangeSelectedPlayer
	-- upvalues: (copy) v_u_18
	coroutine.wrap(function()
		-- upvalues: (copy) p_u_19, (copy) p_u_20, (ref) v_u_18, (copy) p_u_21
		if p_u_19.SelectedPlayer then
			p_u_19.SelectedPlayer = nil
			p_u_19.CharacterAddedConn:Disconnect()
			p_u_19.CharacterAddedConn = nil
			if p_u_19.KillOldRenderFunction then
				p_u_19.KillOldRenderFunction()
				p_u_19.KillOldRenderFunction = nil
			end
		end
		if p_u_20 then
			p_u_19.SelectedPlayer = p_u_20
			p_u_19.CharacterAddedConn = p_u_20.CharacterAdded:Connect(function(p22)
				-- upvalues: (ref) p_u_19, (ref) v_u_18, (ref) p_u_21
				if p_u_19.KillOldRenderFunction then
					p_u_19.KillOldRenderFunction()
				end
				p_u_19.KillOldRenderFunction = v_u_18(p22, p_u_21)
			end)
			if p_u_20.Character then
				p_u_19.KillOldRenderFunction = v_u_18(p_u_20.Character, p_u_21)
			end
		end
	end)()
end
function v_u_1.new() -- name: new
	-- upvalues: (copy) v_u_1
	local v23 = v_u_1
	local v24 = setmetatable({}, v23)
	v24.KillOldRenderFunction = nil
	v24.SelectedPlayer = nil
	v24.CharacterAddedConn = nil
	return v24
end
return v_u_1.new()