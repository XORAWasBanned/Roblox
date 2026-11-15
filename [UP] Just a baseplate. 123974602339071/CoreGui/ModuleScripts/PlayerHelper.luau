-- Path: CoreGui.RobloxGui.Modules.ProximityPromptsTests.PlayerHelper
local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("GuiService")
local v_u_38 = {
	["initStarted"] = false,
	["TestModel"] = nil,
	["hrp"] = nil,
	["humanoid"] = nil,
	["player"] = nil,
	["Init"] = function() -- name: Init
		-- upvalues: (copy) v_u_38, (copy) v_u_1, (copy) v_u_2
		if not v_u_38.initStarted then
			v_u_38.initStarted = true
			local v_u_4 = v_u_38.WaitForExpression(function()
				-- upvalues: (ref) v_u_1
				return v_u_1.LocalPlayer
			end, 10, "Players.LocalPlayer not found")
			v_u_38.player = v_u_4
			if v_u_4.Character == nil and v_u_2:IsServer() then
				v_u_4:LoadCharacterAsync()
			end
			v_u_38.WaitForExpression(function()
				-- upvalues: (copy) v_u_4
				return v_u_4.Character
			end, 10, "LocalPlayer.Character not found")
			v_u_38.hrp = v_u_4.Character:WaitForChild("HumanoidRootPart")
			v_u_38.humanoid = v_u_4.Character:WaitForChild("Humanoid")
			if v_u_38.TestModel == nil then
				v_u_38.TestModel = Instance.new("Model")
				v_u_38.TestModel.Name = "_TestContainer"
				v_u_38.TestModel.Parent = workspace
			end
			v_u_38.PlayerGui = v_u_1.LocalPlayer:WaitForChild("PlayerGui")
		end
	end,
	["AddInstance"] = function(p5) -- name: AddInstance
		-- upvalues: (copy) v_u_38
		local v6 = Instance.new(p5)
		v6.Parent = v_u_38.TestModel
		return v6
	end,
	["CleanUpAfterTest"] = function() -- name: CleanUpAfterTest
		-- upvalues: (copy) v_u_38
		v_u_38.TestModel:ClearAllChildren()
	end,
	["SetCameraFOV"] = function(p7) -- name: SetCameraFOV
		workspace.CurrentCamera.FieldOfView = p7
	end,
	["IsPartOnscreen"] = function(p8) -- name: IsPartOnscreen
		local _, v9 = workspace.CurrentCamera:WorldToViewportPoint(p8.Position)
		return v9
	end,
	["GetPartViewportPixelPosition"] = function(p10) -- name: GetPartViewportPixelPosition
		local v11, _ = workspace.CurrentCamera:WorldToViewportPoint(p10.Position)
		return Vector2.new(v11.x, v11.y)
	end,
	["MovePlayerToPosition"] = function(p12) -- name: MovePlayerToPosition
		-- upvalues: (copy) v_u_38
		if v_u_38.hrp ~= nil then
			local v13 = CFrame.new() + p12
			local v14 = 1 + v_u_38.humanoid.HipHeight
			local v15 = v13 + Vector3.new(0, v14, 0)
			v_u_38.hrp.CFrame = v15
		end
	end,
	["SetPlayerCamera"] = function(p16, p17) -- name: SetPlayerCamera
		-- upvalues: (copy) v_u_38
		local v18 = v_u_38.player.Character:WaitForChild("Head", 10)
		local v19 = CFrame.new(Vector3.new(), p16) + v18.Position - p17 * p16.Unit
		local v20 = workspace.CurrentCamera
		v20.CameraType = Enum.CameraType.Scriptable
		v20.CFrame = v19
	end,
	["WaitNFrames"] = function(p21) -- name: WaitNFrames
		-- upvalues: (copy) v_u_2
		for _ = 1, p21 do
			v_u_2.RenderStepped:Wait()
		end
	end,
	["WaitWallTime"] = function(p22) -- name: WaitWallTime
		-- upvalues: (copy) v_u_38
		local v23 = tick()
		if p22 > 2 then
			warn("Requested wait time too long, waiting 2s")
			p22 = 2
		end
		while p22 >= tick() - v23 do
			v_u_38.WaitNFrames(1)
		end
	end,
	["WaitGameTime"] = function(p24) -- name: WaitGameTime
		-- upvalues: (copy) v_u_2
		local v25, _ = v_u_2.Stepped:Wait()
		local v26 = v25
		while v25 - v26 < p24 do
			local v27
			v25, v27 = v_u_2.Stepped:Wait()
		end
	end,
	["WaitForExpression"] = function(p28, p29, p30) -- name: WaitForExpression
		-- upvalues: (copy) v_u_38
		local v31 = tick()
		local v32 = p28()
		while not v32 and tick() - v31 < p29 do
			v_u_38.WaitNFrames(1)
			v32 = p28()
		end
		if not v32 then
			error(p30)
		end
		return v32
	end,
	["GetCornersOfBillboardGui"] = function(p33) -- name: GetCornersOfBillboardGui
		-- upvalues: (copy) v_u_38, (copy) v_u_3
		local v34 = v_u_38.GetPartViewportPixelPosition(p33.Adornee)
		local v35 = Vector2.new(p33.SizeOffset.x * p33.AbsoluteSize.x, p33.SizeOffset.y * p33.AbsoluteSize.y)
		local v36 = v34 - v_u_3:GetGuiInset() + v35
		local v37 = p33.AbsoluteSize
		return {
			["center"] = v36,
			["topLeft"] = v36 - v37 / 2 + Vector2.new(1, 1),
			["topRight"] = v36 + Vector2.new(v37.x / 2 - 1, -v37.y / 2 + 1),
			["bottomRight"] = v36 + Vector2.new(v37.x / 2 - 1, v37.y / 2 - 1),
			["bottomLeft"] = v36 + Vector2.new(-v37.x / 2 + 1, v37.y / 2 - 1)
		}
	end
}
return v_u_38