-- Path: CoreGui.RobloxGui.Modules.VR.VRAvatarHeightScaling
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("VRService")
local v_u_3 = UserSettings():GetService("UserGameSettings")
local v_u_4 = game:GetService("Players")
local v_u_5 = require(v1.Workspace.Packages.CoreScriptsCommon).AvatarUtil
local v_u_6 = {}
v_u_6.__index = v_u_6
function v_u_6.new() -- name: new
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_2, (copy) v_u_3
	local v7 = v_u_6
	local v_u_8 = setmetatable({}, v7)
	v_u_8.avatarUtil = v_u_5.new()
	v_u_2:GetPropertyChangedSignal("AutomaticScaling"):Connect(function()
		-- upvalues: (copy) v_u_8
		v_u_8:onScalingChanged()
	end)
	v_u_3:GetPropertyChangedSignal("PlayerHeight"):Connect(function()
		-- upvalues: (copy) v_u_8
		v_u_8:onPlayerHeightChanged()
	end)
	v_u_2.UserCFrameChanged:Connect(function(p9, _)
		-- upvalues: (copy) v_u_8
		if p9 == Enum.UserCFrame.Floor then
			v_u_8:onPlayerHeightChanged()
		end
	end)
	v_u_8:onScalingChanged()
	return v_u_8
end
function v_u_6.setHeadScale(p10, p11) -- name: setHeadScale
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	if v_u_2.AutomaticScaling == Enum.VRScaling.World then
		local v12 = p10:GetSubjectHeight(p11)
		if v12 and v12 > 0 then
			local v13 = -v_u_2:GetUserCFrame(Enum.UserCFrame.Floor).Position.Y
			local v14
			if v13 < 0.8 * v_u_3.PlayerHeight then
				v14 = v12 / v_u_3.PlayerHeight
			else
				v14 = v12 / v13
			end
			local v15 = workspace.CurrentCamera
			if v15 then
				v15.HeadScale = v14
			end
		else
			return
		end
	else
		return
	end
end
function v_u_6.GetSubjectHeight(_, p16) -- name: GetSubjectHeight
	local v17 = p16:FindFirstChild("Humanoid")
	if not v17 or v17:GetState() ~= Enum.HumanoidStateType.Dead then
		local v18 = v17 and v17.RootPart or p16:FindFirstChild("HumanoidRootPart")
		if not (v18 and v17) then
			return nil
		end
		local v19 = v17.HipHeight
		local v20 = v17.RigType == Enum.HumanoidRigType.R6 and 2 or v19
		if not v17.AutomaticScalingEnabled then
			return v18.Size.Y / 2 + v20 + 2 + v17.CameraOffset.Y
		end
		local v21 = v18.Size.Y / 2 + 0.5
		return v18.Size.Y / 2 + v20 + v21 + v17.CameraOffset.Y
	end
end
function v_u_6.onPlayerHeightChanged(p22) -- name: onPlayerHeightChanged
	-- upvalues: (copy) v_u_4
	if v_u_4.LocalPlayer and v_u_4.LocalPlayer.Character then
		p22:setHeadScale(v_u_4.LocalPlayer.Character)
	end
end
function v_u_6.onScalingChanged(p_u_23) -- name: onScalingChanged
	-- upvalues: (copy) v_u_2
	if v_u_2.AutomaticScaling == Enum.VRScaling.World then
		if not p_u_23.characterChangedConnection then
			p_u_23.characterChangedConnection = p_u_23.avatarUtil:connectLocalCharacterChanges(function(p24)
				-- upvalues: (copy) p_u_23
				p_u_23:setHeadScale(p24)
			end)
			return
		end
	elseif p_u_23.characterChangedConnection then
		p_u_23.characterChangedConnection:Disconnect()
		p_u_23.characterChangedConnection = nil
	end
end
return v_u_6.new()