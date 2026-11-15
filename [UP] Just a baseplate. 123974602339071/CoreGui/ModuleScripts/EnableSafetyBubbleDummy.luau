-- Path: CoreGui.RobloxGui.Modules.FTUX.Features.EnableSafetyBubbleDummy
local v_u_1 = game:GetService("RunService")
local v_u_2 = game:GetService("VRService")
local v_u_3 = UserSettings():GetService("UserGameSettings")
local v4 = game:GetService("CorePackages")
local v_u_5 = game:GetService("Workspace")
local v_u_6 = require(script.Parent.Parent.Utility.GenerateDummy)
local v_u_7 = workspace.CurrentCamera
local v8 = require(v4.Workspace.Packages.VrCommon).FIntSafetyBubbleRadius
local v_u_9 = require(v4.Workspace.Packages.VrCommon).FIntSafetyBubbleTransparencyPercent * 0.01
local v_u_10 = true
local v11 = v8 * v_u_7.HeadScale
local v_u_12 = math.max(v11, 0.1)
local v_u_13 = nil
function initDummy() -- name: initDummy
	-- upvalues: (ref) v_u_13, (copy) v_u_6, (copy) v_u_5
	v_u_13 = v_u_6(Vector3.new(0, 8.8, -50.5), Vector3.new(0, 180, 0))
	v_u_13.Parent = v_u_5
end
local function v_u_19(_, p14) -- name: calculateTransparency
	-- upvalues: (copy) v_u_2, (copy) v_u_7, (ref) v_u_13, (copy) v_u_12, (copy) v_u_9
	if not p14 then
		return 0
	end
	local v15 = v_u_2:GetUserCFrame(Enum.UserCFrame.Head)
	local v16 = ((v_u_7.CFrame * v15).Position - v_u_13.HumanoidRootPart.Position).Magnitude
	local v17 = v_u_12 * 0.75
	local v18
	if v16 < v17 then
		v18 = v_u_9
	else
		v18 = (1 - (v16 - v17) / (v_u_12 - v17)) * v_u_9
	end
	return math.clamp(v18, 0, 1)
end
function EnableSafetyBubbleDummy() -- name: EnableSafetyBubbleDummy
	-- upvalues: (ref) v_u_13, (copy) v_u_3, (ref) v_u_10, (copy) v_u_19, (copy) v_u_1
	initDummy()
	local function v24() -- name: onStep
		-- upvalues: (ref) v_u_13, (ref) v_u_3, (ref) v_u_10, (ref) v_u_19
		local v20 = v_u_13:GetChildren()
		if v_u_3.VRSafetyBubbleMode == Enum.VRSafetyBubbleMode.Anyone then
			v_u_10 = false
		else
			v_u_10 = true
		end
		for _, v21 in ipairs(game.Players:GetPlayers()) do
			if not v21.Character then
				continue
			end
			local v22 = v_u_19(v21, v_u_10)
			v_u_13.Head.Face.Transparency = v22
			for v23 = 1, #v20 do
				if not v20[v23]:IsA("Part") then
					continue
				end
				v20[v23].Transparency = v22
			end
		end
	end
	v_u_1.Stepped:Connect(v24)
end
return EnableSafetyBubbleDummy