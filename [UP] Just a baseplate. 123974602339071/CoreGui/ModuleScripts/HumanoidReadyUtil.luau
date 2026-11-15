-- Path: CoreGui.RobloxGui.Modules.Common.HumanoidReadyUtil
local v_u_1 = game:GetService("Players")
local function v_u_7(...) -- name: waitForFirst
	local v_u_2 = Instance.new("BindableEvent")
	local v_u_3 = { ... }
	local function v5(...) -- name: fire
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		for v4 = 1, #v_u_3 do
			v_u_3[v4]:Disconnect()
		end
		return v_u_2:Fire(...)
	end
	for v6 = 1, #v_u_3 do
		v_u_3[v6] = v_u_3[v6]:Connect(v5)
	end
	return v_u_2.Event:Wait()
end
return {
	["registerHumanoidReady"] = function(p_u_8) -- name: registerHumanoidReady
		-- upvalues: (copy) v_u_7, (copy) v_u_1
		local function v_u_13(p9, p10) -- name: characterAdded
			-- upvalues: (ref) v_u_7, (copy) p_u_8
			if not p10.Parent then
				v_u_7(p10.AncestryChanged, p9.CharacterAdded)
			end
			if p9.Character == p10 and p10.Parent then
				local v11 = p10:FindFirstChildOfClass("Humanoid")
				while p10:IsDescendantOf(game) and not v11 do
					v_u_7(p10.ChildAdded, p10.AncestryChanged, p9.CharacterAdded)
					v11 = p10:FindFirstChildOfClass("Humanoid")
				end
				if p9.Character == p10 and p10:IsDescendantOf(game) then
					local v12 = p10:FindFirstChild("HumanoidRootPart")
					while p10:IsDescendantOf(game) and not v12 do
						v_u_7(p10.ChildAdded, p10.AncestryChanged, v11.AncestryChanged, p9.CharacterAdded)
						v12 = p10:FindFirstChild("HumanoidRootPart")
					end
					if v12 and (v11:IsDescendantOf(game) and (p10:IsDescendantOf(game) and p9.Character == p10)) then
						p_u_8(p9, p10, v11)
					end
				end
			else
				return
			end
		end
		local function v20(p_u_14) -- name: playerAdded
			-- upvalues: (copy) v_u_13
			local v_u_16 = p_u_14.CharacterAdded:Connect(function(p15)
				-- upvalues: (ref) v_u_13, (copy) p_u_14
				v_u_13(p_u_14, p15)
			end)
			local v_u_17 = nil
			v_u_17 = p_u_14.AncestryChanged:Connect(function(_, p18)
				-- upvalues: (ref) v_u_17, (copy) v_u_16
				if not game:IsAncestorOf(p18) then
					v_u_17:Disconnect()
					v_u_16:Disconnect()
				end
			end)
			local v19 = p_u_14.Character
			if v19 then
				v_u_13(p_u_14, v19)
			end
		end
		v_u_1.PlayerAdded:Connect(v20)
		for _, v21 in pairs(v_u_1:GetPlayers()) do
			v20(v21)
		end
	end
}