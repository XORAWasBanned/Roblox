-- Path: CoreGui.RobloxGui.Modules.VR.VRAvatarGestures.VRAvatarGesturesClient
local v_u_1 = game:GetService("VRService")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("RobloxReplicatedStorage")
local v5 = game:GetService("CorePackages")
game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_6 = game:GetService("RbxAnalyticsService")
local v7 = require(v5.Workspace.Packages.CoreScriptsCommon)
local v_u_8 = v7.ConnectionUtil
local v_u_9 = v7.AvatarUtil
local v_u_10 = game:DefineFastFlag("DebugImmersionModeNonVR", false)
local v_u_11 = game:DefineFastFlag("VRAvatarGesturesFixFirstPersonHeadScale", false)
local v_u_12 = game:DefineFastInt("VRAvatarGesturesAnalyticsThrottleHundrethsPercent", 0)
local v_u_13 = {}
v_u_13.__index = v_u_13
function v_u_13.new() -- name: new
	-- upvalues: (copy) v_u_13, (copy) v_u_8, (copy) v_u_1
	local v14 = v_u_13
	local v_u_15 = setmetatable({}, v14)
	v_u_15.partCFrameMap = {}
	v_u_15.connections = v_u_8.new()
	v_u_15.analyticsSendEnabled = true
	v_u_15.connections:connect("AvatarGestures", v_u_1:GetPropertyChangedSignal("AvatarGestures"), function()
		-- upvalues: (copy) v_u_15
		v_u_15:onAvatarGesturesChanged()
	end)
	if v_u_1.AvatarGestures then
		v_u_15:onAvatarGesturesChanged()
	end
	return v_u_15
end
function v_u_13.onCharacterChanged(p16, p17) -- name: onCharacterChanged
	-- upvalues: (copy) v_u_11, (copy) v_u_1
	local v_u_18 = p17:FindFirstChild("Humanoid")
	if v_u_18 then
		for _, v19 in pairs({ "TrackedIKLeftHand", "TrackedIKRightHand", "TrackedIKHead" }) do
			local v20 = v_u_18:FindFirstChild(v19)
			if not v20 then
				continue
			end
			v20.SmoothTime = 0
		end
		local v_u_21 = workspace.CurrentCamera
		if v_u_21 then
			local function v_u_27(p22) -- name: updateSeated
				-- upvalues: (copy) v_u_21, (ref) v_u_11, (copy) v_u_18
				local v23 = v_u_21.CameraSubject
				if v23 then
					v23 = v_u_21.CameraSubject:IsA("VehicleSeat")
				end
				local v24 = v_u_21
				local v25 = (not v_u_11 and 5 or 5 * v24.HeadScale) >= (v24.CFrame.Position - v24.Focus.Position).Magnitude
				local v26 = v_u_18:FindFirstChild("TrackedIKHead")
				if v26 then
					if p22 and (not v23 and v25) then
						v26.Type = Enum.IKControlType.Transform
						return
					end
					v26.Type = Enum.IKControlType.Rotation
				end
			end
			v_u_27(v_u_18.Sit)
			p16.connections:connect("Seated", v_u_18.Seated, function(p28)
				-- upvalues: (copy) v_u_27, (copy) v_u_21, (ref) v_u_11, (ref) v_u_1
				v_u_27(p28)
				if p28 then
					local v29 = v_u_21
					if (not v_u_11 and 5 or 5 * v29.HeadScale) >= (v29.CFrame.Position - v29.Focus.Position).Magnitude then
						v_u_1:RecenterUserHeadCFrame()
					end
				end
			end)
		end
	else
		return
	end
end
function v_u_13.onAvatarGesturesChanged(p_u_30) -- name: onAvatarGesturesChanged
	-- upvalues: (copy) v_u_1, (copy) v_u_10, (copy) v_u_4, (copy) v_u_9, (copy) v_u_2, (copy) v_u_6, (copy) v_u_12
	if v_u_1.AvatarGestures then
		if v_u_1.VREnabled or v_u_10 then
			local v31 = v_u_4:WaitForChild("AvatarGesturesVRPlayer", 5)
			if not v31 then
				warn("VRService.AvatarGestures failed to connect to server")
				return
			end
			v31:FireServer(true)
			p_u_30:connectInputCFrames()
			if p_u_30.avatarUtil then
				if v_u_2.LocalPlayer and v_u_2.LocalPlayer.Character then
					p_u_30:onCharacterChanged(v_u_2.LocalPlayer.Character)
				end
			else
				p_u_30.avatarUtil = v_u_9.new()
				p_u_30.avatarUtil:connectLocalCharacterChanges(function(p32)
					-- upvalues: (copy) p_u_30
					p_u_30:onCharacterChanged(p32)
				end)
			end
			if p_u_30.analyticsSendEnabled then
				p_u_30.analyticsSendEnabled = nil
				v_u_6:ReportInfluxSeries("VRAvatarGestures", {
					["placeId"] = nil,
					["calledFrom"] = "ClientJoined",
					["placeId"] = game.PlaceId
				}, v_u_12)
				return
			end
		end
	else
		local v33 = (v_u_1.VREnabled or v_u_10) and v_u_4:FindFirstChild("AvatarGesturesVRPlayer")
		if v33 then
			v33:FireServer(false)
		end
		p_u_30.connections:disconnectAll()
		p_u_30.connections:connect("AvatarGestures", v_u_1:GetPropertyChangedSignal("AvatarGestures"), function()
			-- upvalues: (copy) p_u_30
			p_u_30:onAvatarGesturesChanged()
		end)
	end
end
function v_u_13.updateCFrames(_, p34, p35) -- name: updateCFrames
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_11
	local v36 = v_u_2.LocalPlayer
	if v_u_2.LocalPlayer then
		local v37 = v36.Character
		if v36.Character then
			local v38 = v37:FindFirstChild(p34)
			if v38 then
				local v39 = workspace.CurrentCamera
				if v39 then
					if v38:FindFirstChild(p34 .. "Attachment") then
						local v40 = v38:FindFirstChild(p34 .. "AlignPosition")
						if v40 then
							local v41 = v38:FindFirstChild(p34 .. "AlignOrientation")
							if v41 then
								if v_u_1.VREnabled then
									local v42 = p35.Rotation + p35.Position * v39.HeadScale
									local v43 = v39.CFrame * v42
									local v44 = v37:FindFirstChild("Head")
									if (not v_u_11 and 5 or 5 * v39.HeadScale) >= (v39.CFrame.Position - v39.Focus.Position).Magnitude or not v44 then
										v40.Position = v43.Position
										if p34 == "TrackedHead" then
											v41.CFrame = v43
										else
											v41.CFrame = v43 * CFrame.Angles(1.5707963267948966, 0, 0)
										end
									else
										local v45 = v_u_1:GetUserCFrame(Enum.UserCFrame.Head)
										local v46 = v45.Rotation + v45.Position * v39.HeadScale
										local v47 = v39.CFrame * v46 * CFrame.new(0, 0, 0.5)
										if p34 == "TrackedHead" then
											local v48 = v37.PrimaryPart.CFrame
											v40.Position = (v48 * CFrame.new(0, v48.Position.Y * 0.25, -v48.Position.Y * 0.125)).Position
											v41.CFrame = v48 * v42
										else
											local v49 = v44.CFrame:ToWorldSpace(v47:ToObjectSpace(v43))
											v40.Position = v49.Position
											v41.CFrame = v49 * CFrame.Angles(1.5707963267948966, 0, 0)
										end
									end
								else
									local v50 = v37:FindFirstChild("HumanoidRootPart")
									local v51
									if p34 == "TrackedHead" then
										v51 = v50.CFrame * p35
									else
										local v52 = v50.CFrame * p35
										local v53 = CFrame.Angles
										local v54 = time() * 30
										v51 = v52 * v53(0, 0, (math.rad(v54))) * CFrame.new(1, 0, -0.5)
									end
									if v50 then
										v40.Position = v51.Position
										v41.CFrame = v51
									end
								end
								v38.CFrame = CFrame.new(v40.Position) * v41.CFrame.Rotation
							end
						else
							return
						end
					else
						return
					end
				else
					return
				end
			else
				return
			end
		else
			return
		end
	else
		return
	end
end
function v_u_13.steppedCframes(p55) -- name: steppedCframes
	for v56, v57 in pairs(p55.partCFrameMap) do
		p55:updateCFrames(v56, v57)
	end
end
function v_u_13.connectInputCFrames(p_u_58) -- name: connectInputCFrames
	-- upvalues: (copy) v_u_1, (copy) v_u_10, (copy) v_u_3
	if v_u_1.VREnabled then
		p_u_58.connections:connect("UserCFrameChanged", v_u_1.UserCFrameChanged, function(p59, p60)
			-- upvalues: (copy) p_u_58
			if p59 == Enum.UserCFrame.LeftHand then
				p_u_58.partCFrameMap.TrackedLeftHand = p60
				return
			elseif p59 == Enum.UserCFrame.RightHand then
				p_u_58.partCFrameMap.TrackedRightHand = p60
			elseif p59 == Enum.UserCFrame.Head then
				p_u_58.partCFrameMap.TrackedHead = p60
			end
		end)
	elseif v_u_10 then
		p_u_58.connections:connect("NonVRSimulateInput", v_u_3.RenderStepped, function(_)
			-- upvalues: (copy) p_u_58
			p_u_58.partCFrameMap.TrackedLeftHand = CFrame.new(-0.5, 0, -0.5)
			p_u_58.partCFrameMap.TrackedRightHand = CFrame.new(0.5, 0, -0.5)
			p_u_58.partCFrameMap.TrackedHead = CFrame.new(0, 1, 0)
		end)
	end
	if v_u_1.VREnabled or v_u_10 then
		p_u_58.connections:connect("RenderStepped", v_u_3.RenderStepped, function(_)
			-- upvalues: (copy) p_u_58
			p_u_58:steppedCframes()
		end)
	end
end
return v_u_13.new()