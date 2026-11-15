-- Path: CoreGui.RobloxGui.Modules.SelfieView.Components.FaceClone
local v1 = game:GetService("CorePackages")
local v_u_2 = require(script.Parent.Parent.Utils.ModelUtils)
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:FindService("FaceAnimatorService")
local v_u_5 = require(v1.Packages.Thumbnailing).CharacterUtility
local v_u_6 = require(v1.Packages.Thumbnailing).CFrameUtility
local v_u_7 = game:GetEngineFeature("AnimatorAndADFRefactor")
local v_u_8 = game:GetEngineFeature("PlayerViewRemoteEventSupport")
local v_u_9 = nil
local v_u_10 = nil
local v_u_11 = game:DefineFastFlag("SelfViewNewPoseSynchronization", false)
local v_u_12 = game:DefineFastFlag("DebugSelfViewPerfBenchmark", false)
local v_u_13 = require(v1.Workspace.Packages.SharedFlags).GetFFlagSelfViewVisibilityFix
local v_u_14 = game:GetService("RunService")
local v_u_15 = 1.31
local v_u_16 = 0
local v_u_17 = nil
local v_u_18 = nil
local v_u_19 = {}
local v_u_20 = {}
local v_u_21 = nil
local v_u_22 = {}
local v_u_23 = {}
local v_u_24 = nil
local v_u_25 = nil
local v_u_26 = nil
local v_u_27 = nil
local v_u_28 = Vector3.new(1.1721, 1.1811, 1.1578)
local v_u_29 = nil
local v_u_30 = nil
local v_u_31 = nil
local v_u_32 = nil
local v_u_33 = nil
local v_u_34 = nil
local v_u_35 = nil
local v_u_36 = nil
local v_u_37 = nil
local v_u_38 = false
local v_u_39 = 0
local v_u_40 = {}
local v_u_41 = {
	["AnimationPlayed"] = "AnimationPlayed",
	["AnimationPlayedCoreScript"] = "AnimationPlayedCoreScript",
	["DescendantAdded"] = "DescendantAdded",
	["DescendantRemoving"] = "DescendantRemoving",
	["HeadSize"] = "HeadSize",
	["Color"] = "Color",
	["CharacterAdded"] = "CharacterAdded",
	["CharacterRemoving"] = "CharacterRemoving",
	["HumanoidStateChanged"] = "HumanoidStateChanged",
	["FaceControlsChanged"] = "FaceControlsChanged"
}
local v_u_42 = game:GetService("Players")
if not v_u_42.LocalPlayer then
	warn("Players.LocalPlayer does not exist")
end
local v_u_43 = v_u_42.LocalPlayer
local v_u_44 = false
function setCloneDirty(p45) -- name: setCloneDirty
	-- upvalues: (ref) v_u_16
	if p45 then
		v_u_16 = 0.35
	else
		v_u_16 = 0
	end
end
function createCloneAnchor() -- name: createCloneAnchor
	-- upvalues: (ref) v_u_29, (ref) v_u_26
	if v_u_29 ~= nil then
		v_u_29:Destroy()
		v_u_29 = nil
	end
	local v46 = Instance.new("WorldModel")
	v46.Parent = v_u_26
	v_u_29 = v46
end
function clearCloneCharacter() -- name: clearCloneCharacter
	-- upvalues: (ref) v_u_30, (ref) v_u_29
	if v_u_30 then
		v_u_30:Destroy()
		v_u_30 = nil
	end
	if v_u_29 then
		local v47 = v_u_29 ~= nil
		assert(v47)
		local v48 = v_u_29:FindFirstChild("SelfAvatar")
		if v48 then
			v48:Destroy()
		end
		createCloneAnchor()
	else
		warn("cloneAnchor is nil, this shouldn\'t be possible")
	end
end
local function v_u_50() -- name: clearClone
	-- upvalues: (copy) v_u_40, (ref) v_u_22, (ref) v_u_10, (ref) v_u_21
	stopRenderStepped()
	if v_u_40.AnimationPlayed then
		v_u_40.AnimationPlayed:Disconnect()
		v_u_40.AnimationPlayed = nil
	end
	if v_u_40.AnimationPlayedCoreScript then
		v_u_40.AnimationPlayedCoreScript:Disconnect()
		v_u_40.AnimationPlayedCoreScript = nil
	end
	for _, v49 in v_u_22 do
		if not v49 then
			continue
		end
		v49:Stop(0)
	end
	if v_u_10 then
		v_u_10:Stop(0)
		v_u_10 = nil
	end
	v_u_21 = nil
	v_u_22 = {}
	clearCloneCharacter()
end
local function v_u_55(p51, p_u_52) -- name: syncTrack
	-- upvalues: (ref) v_u_10, (ref) v_u_9, (copy) v_u_43, (copy) v_u_19
	if p51 and p_u_52.Animation then
		local v_u_53 = nil
		if not (p_u_52.Animation and p_u_52.Animation:IsA("Animation")) then
			if p_u_52.Animation and p_u_52.Animation:IsA("TrackerStreamAnimation") then
				if v_u_10 then
					v_u_10:Stop(0)
				end
				v_u_9 = Instance.new("TrackerStreamAnimation")
				local v54 = v_u_9 ~= nil
				assert(v54)
				if game:GetEngineFeature("UseNewLoadStreamAnimationAPI") then
					v_u_10 = p51:LoadStreamAnimationV2(v_u_9, v_u_43, false, false)
				else
					v_u_10 = p51:LoadStreamAnimationForSelfieView_deprecated(v_u_9, v_u_43)
				end
				v_u_53 = v_u_10
			else
				warn("No animation to clone in SelfView")
			end
		end
		if v_u_53 then
			v_u_53:Play()
			v_u_53.Priority = p_u_52.Priority
			v_u_19[p_u_52] = p_u_52.Stopped:Connect(function()
				-- upvalues: (ref) v_u_53, (ref) v_u_19, (copy) p_u_52
				v_u_53:Stop(0)
				if v_u_19[p_u_52] then
					v_u_19[p_u_52]:Disconnect()
				end
			end)
		end
	end
end
local function v_u_97(p56) -- name: updateClone
	-- upvalues: (copy) v_u_50, (copy) v_u_2, (ref) v_u_30, (copy) v_u_20, (ref) v_u_29, (ref) v_u_27, (copy) v_u_6, (copy) v_u_5, (ref) v_u_28, (ref) v_u_15, (ref) v_u_32, (ref) v_u_33, (ref) v_u_34, (ref) v_u_21, (copy) v_u_7, (copy) v_u_11, (ref) v_u_9, (copy) v_u_55, (copy) v_u_40
	v_u_50()
	if p56 then
		local v57 = p56 ~= nil
		assert(v57)
		startRenderStepped(p56)
		local _ = p56.Character
		if p56 and p56.Character then
			local v58 = p56.Character
			if v58 then
				local v59 = v58 ~= nil
				assert(v59)
				local v60 = v_u_2.getAnimator(v58, 10)
				clearCloneCharacter()
				local v61 = v58.Archivable
				v58.Archivable = true
				local v62 = v_u_2.getHead(v58)
				if v62 then
					v_u_30 = v58:Clone()
					if v_u_30 == nil then
						return
					else
						local v63 = v_u_30 ~= nil
						assert(v63)
						v_u_2.resetPartOrientation(v_u_30)
						v_u_2.updateTransparency(v_u_30, v_u_20)
						v_u_2.removeTags(v_u_30)
						v_u_30.Name = "SelfAvatar"
						v_u_2.removeScripts(v_u_30)
						v_u_2.sanitizeCharacter(v_u_30)
						v58.Archivable = v61
						v_u_30.Parent = v_u_29
						local v64 = v_u_30:FindFirstChild("HumanoidRootPart")
						if v64 then
							v64.CFrame = CFrame.new(Vector3.new(0, 0, 0))
							local v65 = v_u_27 ~= nil
							assert(v65)
							if v62 then
								local v66 = v_u_2.getHead(v_u_30)
								if v66 then
									local v67 = v66 ~= nil
									assert(v67)
									local v68 = v_u_6.CalculateTargetCFrame(v66.CFrame)
									local v69, v70 = v_u_5.CalculateHeadExtents(v_u_30, v68)
									local v71 = v69.X
									local v72 = v69.Y
									local v73 = v69.Z
									local v74 = Vector3.new(v71, v72, v73)
									local v75 = v70.X
									local v76 = v70.Y
									local v77 = v70.Z
									v_u_28 = Vector3.new(v75, v76, v77) - v74
									local v78 = v_u_28 ~= nil
									assert(v78)
									v_u_15 = v66.Size.Y
									local v79 = v_u_28.X
									local v80 = v_u_28.Y
									math.min(v79, v80)
									local v81 = v_u_28.X
									local v82 = v_u_28.Z
									local v83 = math.min(v81, v82)
									local v84 = Instance.new("Model")
									v84.Parent = v_u_30
									local v85 = v_u_2.getHead(v_u_30)
									v58.Archivable = true
									v_u_32 = v85:Clone()
									local v86 = v_u_32 ~= nil
									assert(v86)
									v_u_32.CanCollide = false
									v_u_32.Parent = v84
									v_u_33 = v_u_2.getNeck(v_u_30, v_u_32)
									v_u_34 = v_u_32.CFrame
									v_u_32:Destroy()
									local v87 = v_u_34 ~= nil
									assert(v87)
									local v88 = v_u_34.Position + v_u_34.LookVector * (v83 * 2)
									v_u_27.CFrame = CFrame.lookAt(v88 + Vector3.new(0, 0.105, -0.25), v_u_34.Position)
									v_u_27.Focus = v_u_34
									v58.Archivable = v61
									v84:Destroy()
								end
							else
								local v89 = v64.Position + v64.CFrame.LookVector * 2.5
								v_u_27.CFrame = CFrame.lookAt(v89 + Vector3.new(0, 1.5, 0), v64.Position)
								v_u_27.CFrame = CFrame.new(v_u_27.CFrame.Position) * CFrame.Angles(-0.0006981317007977319, 3.141592653589793, 0)
							end
						end
						if v_u_30 ~= nil then
							local v90 = v_u_30:FindFirstChildWhichIsA("Humanoid")
							if v90 then
								v90.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
							end
							v_u_21 = v_u_2.getAnimator(v_u_30, 0)
							if v_u_21 then
								if not (v_u_7 and v_u_11) then
									local v91 = v_u_21:GetPlayingAnimationTracks()
									local v92 = v_u_21:GetPlayingAnimationTracksCoreScript()
									for _, v93 in ipairs(v91) do
										if v93 == nil then
											continue
										end
										v93:Stop(0)
										v93:Destroy()
									end
									for _, v94 in ipairs(v92) do
										if v94 == nil then
											continue
										end
										v94:Stop(0)
										v94:Destroy()
									end
									if v_u_9 then
										v_u_9:Destroy()
										v_u_9 = nil
									end
								end
								if v60 then
									if v_u_7 and v_u_11 then
										v_u_21:SynchronizeWith(v60)
									else
										for _, v95 in ipairs(v60:GetPlayingAnimationTracksCoreScript()) do
											v_u_55(v_u_21, v95)
										end
										v_u_40.AnimationPlayedCoreScript = v60.AnimationPlayedCoreScript:Connect(function(p96)
											-- upvalues: (ref) v_u_55, (ref) v_u_21
											v_u_55(v_u_21, p96)
										end)
									end
									setCloneDirty(false)
									return
								end
							end
						end
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
function updateCachedHeadColor(p_u_98) -- name: updateCachedHeadColor
	-- upvalues: (ref) v_u_24, (ref) v_u_25
	if p_u_98 ~= nil then
		local v99 = p_u_98 ~= nil
		assert(v99)
		if pcall(function()
			-- upvalues: (copy) p_u_98
			local _ = p_u_98.Color
		end) then
			v_u_24 = p_u_98.Color
			if pcall(function()
				-- upvalues: (copy) p_u_98
				local _ = p_u_98.Size
			end) then
				v_u_25 = p_u_98.Size
			end
		end
	end
end
local function v_u_109(p_u_100) -- name: characterAdded
	-- upvalues: (ref) v_u_26, (ref) v_u_35, (ref) v_u_31, (copy) v_u_2, (copy) v_u_40, (copy) v_u_41, (ref) v_u_38
	if v_u_26 == nil or v_u_35 == nil then
		return
	elseif p_u_100 then
		v_u_31 = v_u_2.getHead(p_u_100)
		updateCachedHeadColor(v_u_31)
		if v_u_40.DescendantAdded then
			v_u_40.DescendantAdded:Disconnect()
			v_u_40.DescendantAdded = nil
		end
		if v_u_40.DescendantRemoving then
			v_u_40.DescendantRemoving:Disconnect()
			v_u_40.DescendantRemoving = nil
		end
		if v_u_40.HeadSize then
			v_u_40.HeadSize:Disconnect()
			v_u_40.HeadSize = nil
		end
		if v_u_40.Color then
			v_u_40.Color:Disconnect()
			v_u_40.Color = nil
		end
		local v101 = p_u_100:FindFirstChildWhichIsA("Humanoid")
		if v101 and (v101 and not v_u_40[v_u_41.HumanoidStateChanged]) then
			v_u_40[v_u_41.HumanoidStateChanged] = v101.StateChanged:Connect(function(p102, p103)
				if p102 == Enum.HumanoidStateType.PlatformStanding and p103 == Enum.HumanoidStateType.Running then
					setCloneDirty(true)
				end
				if p103 == Enum.HumanoidStateType.GettingUp then
					setCloneDirty(true)
				end
			end)
		end
		local v104 = p_u_100:FindFirstChildWhichIsA("FaceControls", true)
		if v104 and not v_u_40[v_u_41.FaceControlsChanged] then
			v_u_40[v_u_41.FaceControlsChanged] = v104.InternalFacsOverrideChanged:Connect(function()
				setCloneDirty(true)
			end)
		end
		v_u_40.DescendantAdded = p_u_100.DescendantAdded:Connect(function(p105)
			-- upvalues: (ref) v_u_26, (ref) v_u_35, (ref) v_u_31, (ref) v_u_2, (copy) p_u_100, (ref) v_u_40, (ref) v_u_41
			if v_u_26 ~= nil and v_u_35 ~= nil then
				if p105.Name == "Head" then
					v_u_31 = v_u_2.getHead(p_u_100)
					updateCachedHeadColor(v_u_31)
				end
				if p105:IsA("Humanoid") and (p105 and not v_u_40[v_u_41.HumanoidStateChanged]) then
					v_u_40[v_u_41.HumanoidStateChanged] = p105.StateChanged:Connect(function(p106, p107)
						if p106 == Enum.HumanoidStateType.PlatformStanding and p107 == Enum.HumanoidStateType.Running then
							setCloneDirty(true)
						end
						if p107 == Enum.HumanoidStateType.GettingUp then
							setCloneDirty(true)
						end
					end)
				end
				if p105:IsA("FaceControls") and not v_u_40[v_u_41.FaceControlsChanged] then
					v_u_40[v_u_41.FaceControlsChanged] = p105.InternalFacsOverrideChanged:Connect(function()
						setCloneDirty(true)
					end)
				end
				if v_u_2.shouldMarkCloneDirtyForDescendant(p105) then
					setCloneDirty(true)
				end
			end
		end)
		v_u_40.DescendantRemoving = p_u_100.DescendantRemoving:Connect(function(p108)
			-- upvalues: (ref) v_u_26, (ref) v_u_35, (ref) v_u_2
			if v_u_26 ~= nil and v_u_35 ~= nil then
				if p108 and (p108:IsA("MeshPart") or p108:IsA("Accessory")) then
					if p108:IsA("MeshPart") and p108.MeshId == "" then
						return
					end
					if v_u_2.shouldMarkCloneDirtyForDescendant(p108) then
						setCloneDirty(true)
					end
				end
			end
		end)
		setCloneDirty(true)
		v_u_38 = true
	end
end
local function v_u_111() -- name: createViewport
	-- upvalues: (ref) v_u_26, (ref) v_u_35, (ref) v_u_27
	if v_u_26 then
		v_u_26:Destroy()
	end
	v_u_26 = Instance.new("ViewportFrame")
	v_u_26.Position = UDim2.new(0, 0, 0, 0)
	v_u_26.Size = UDim2.new(1, 0, 1, 0)
	v_u_26.BackgroundTransparency = 1
	v_u_26.Parent = v_u_35
	v_u_26.Ambient = Color3.new(0.7529411765, 0.7098039216, 0.7137254902)
	v_u_26.LightColor = Color3.new(1, 0.9960784314, 0.9960784314)
	v_u_26.LightDirection = Vector3.new(9.5, -12, 7.5)
	v_u_26.IsMirrored = true
	Instance.new("UICorner")
	Instance.new("UICorner").Parent = v_u_26
	createCloneAnchor()
	if v_u_35 then
		v_u_35.Destroying:Connect(clearViewportFrame)
	end
	v_u_27 = Instance.new("Camera")
	local v110 = v_u_27 ~= nil
	assert(v110)
	v_u_27.FieldOfView = 70
	v_u_26.CurrentCamera = v_u_27
	v_u_27.Parent = v_u_26
end
function ReInit(p112) -- name: ReInit
	-- upvalues: (copy) v_u_13, (ref) v_u_37, (ref) v_u_44, (ref) v_u_31, (copy) v_u_2, (copy) v_u_40, (copy) v_u_50, (copy) v_u_111
	local v113 = p112.Character ~= nil
	assert(v113)
	if v_u_13() and (v_u_37 and not v_u_37.Visible) then
		v_u_44 = false
	else
		v_u_31 = v_u_2.getHead(p112.Character)
		updateCachedHeadColor(v_u_31)
		setCloneDirty(false)
		if v_u_40.CharacterAdded then
			v_u_40.CharacterAdded:Disconnect()
			v_u_40.CharacterAdded = nil
		end
		if v_u_40.CharacterRemoving then
			v_u_40.CharacterRemoving:Disconnect()
			v_u_40.CharacterRemoving = nil
		end
		v_u_50()
		v_u_111()
		playerAdded(p112)
		startRenderStepped(p112)
	end
end
local function v_u_118(p114) -- name: onCharacterAdded
	-- upvalues: (ref) v_u_18, (ref) v_u_38, (copy) v_u_109, (copy) v_u_43, (copy) v_u_40, (copy) v_u_41
	if v_u_18 then
		v_u_18:Disconnect()
	end
	if v_u_38 then
		ReInit(v_u_43)
	else
		v_u_109(p114)
	end
	if v_u_40.HumanoidStateChanged then
		v_u_40.HumanoidStateChanged:Disconnect()
		v_u_40.HumanoidStateChanged = nil
	end
	local v115 = p114:FindFirstChildWhichIsA("Humanoid")
	if v115 then
		if not v115 then
			return
		end
		if not v_u_40[v_u_41.HumanoidStateChanged] then
			v_u_40[v_u_41.HumanoidStateChanged] = v115.StateChanged:Connect(function(p116, p117)
				if p116 == Enum.HumanoidStateType.PlatformStanding and p117 == Enum.HumanoidStateType.Running then
					setCloneDirty(true)
				end
				if p117 == Enum.HumanoidStateType.GettingUp then
					setCloneDirty(true)
				end
			end)
		end
	end
end
function clearViewportFrame() -- name: clearViewportFrame
	-- upvalues: (ref) v_u_26, (ref) v_u_35
	if v_u_26 then
		v_u_26:Destroy()
	end
	v_u_35 = nil
	stopRenderStepped()
end
local function v_u_119() -- name: onOuterContainerVisibilityChanged
	-- upvalues: (ref) v_u_37, (ref) v_u_38, (ref) v_u_44
	if v_u_37 then
		if v_u_37.Visible then
			if v_u_38 then
				v_u_44 = true
			end
		end
		v_u_44 = false
	end
end
function playerAdded(p120) -- name: playerAdded
	-- upvalues: (copy) v_u_43, (ref) v_u_18, (copy) v_u_40, (copy) v_u_118, (copy) v_u_109, (copy) v_u_50
	if p120 ~= nil and p120 == v_u_43 then
		if v_u_18 ~= nil then
			v_u_18:Disconnect()
			v_u_18 = nil
			if v_u_40.CharacterAdded then
				v_u_40.CharacterAdded:Disconnect()
				v_u_40.CharacterAdded = nil
			end
		end
		local _ = p120.Character
		local v121 = p120.Character
		v_u_18 = p120.CharacterAdded:Connect(v_u_118)
		if v121 then
			v_u_109(v121)
		end
		v_u_40.CharacterAdded = p120.CharacterAdded:Connect(v_u_109)
		v_u_40.CharacterRemoving = p120.CharacterRemoving:Connect(function()
			-- upvalues: (ref) v_u_40, (ref) v_u_50
			if v_u_40.DescendantAdded then
				v_u_40.DescendantAdded:Disconnect()
				v_u_40.DescendantAdded = nil
			end
			if v_u_40.DescendantRemoving then
				v_u_40.DescendantRemoving:Disconnect()
				v_u_40.DescendantRemoving = nil
			end
			if v_u_40.HeadSize then
				v_u_40.HeadSize:Disconnect()
				v_u_40.HeadSize = nil
			end
			if v_u_40.Color then
				v_u_40.Color:Disconnect()
				v_u_40.Color = nil
			end
			v_u_50()
			if v_u_40.CharacterRemoving then
				v_u_40.CharacterRemoving:Disconnect()
				v_u_40.CharacterRemoving = nil
			end
		end)
	end
end
function stopRenderStepped() -- name: stopRenderStepped
	-- upvalues: (ref) v_u_17
	if v_u_17 then
		v_u_17:Disconnect()
		v_u_17 = nil
	end
end
function updateClonePartsColor(p122) -- name: updateClonePartsColor
	-- upvalues: (ref) v_u_31, (ref) v_u_24, (copy) v_u_43, (ref) v_u_30
	local function v123()
		-- upvalues: (ref) v_u_31
		local _ = v_u_31.Color
	end
	if pcall(v123) and (v_u_31 and v_u_31.Color ~= v_u_24) then
		local v124 = v_u_43.Character
		if not v124 then
			return
		end
		local v125 = v124 ~= nil
		assert(v125)
		if not v_u_30 then
			return
		end
		local v126 = v_u_30 ~= nil
		assert(v126)
		for _, v127 in pairs(v124:GetChildren()) do
			if not v127:IsA("MeshPart") then
				continue
			end
			local v128 = v_u_30:FindFirstChild(v127.Name)
			if not (v128 and (v128:IsA("MeshPart") and (v128.Color and v127.Color))) then
				continue
			end
			v128.Color = v127.Color
		end
	end
	v_u_24 = p122
end
function startRenderStepped(p_u_129) -- name: startRenderStepped
	-- upvalues: (copy) v_u_12, (copy) v_u_14, (ref) v_u_17, (copy) v_u_13, (ref) v_u_30, (ref) v_u_37, (ref) v_u_44, (ref) v_u_21, (copy) v_u_43, (ref) v_u_31, (copy) v_u_2, (ref) v_u_23, (ref) v_u_22, (copy) v_u_3, (ref) v_u_39, (ref) v_u_32, (ref) v_u_33, (ref) v_u_34, (ref) v_u_27, (ref) v_u_28, (copy) v_u_4, (copy) v_u_8, (ref) v_u_15, (ref) v_u_25, (ref) v_u_24, (ref) v_u_16, (copy) v_u_97
	stopRenderStepped()
	local v130
	if v_u_12 then
		v130 = v_u_14.Heartbeat
	else
		v130 = v_u_14.RenderStepped
	end
	v_u_17 = v130:Connect(function(p131)
		-- upvalues: (ref) v_u_12, (ref) v_u_13, (ref) v_u_30, (ref) v_u_37, (ref) v_u_44, (ref) v_u_21, (ref) v_u_43, (ref) v_u_31, (ref) v_u_2, (ref) v_u_23, (ref) v_u_22, (ref) v_u_3, (ref) v_u_39, (ref) v_u_32, (ref) v_u_33, (ref) v_u_34, (ref) v_u_27, (ref) v_u_28, (ref) v_u_4, (ref) v_u_8, (ref) v_u_15, (ref) v_u_25, (ref) v_u_24, (ref) v_u_16, (ref) v_u_97, (copy) p_u_129
		if v_u_12 then
			debug.profilebegin("faceclone")
		end
		if v_u_13() and (v_u_30 and (v_u_37 and not v_u_44)) then
			if v_u_21 ~= nil then
				local v132 = v_u_21:GetPlayingAnimationTracks()
				for _, v133 in pairs(v132) do
					if v133 == nil then
						continue
					end
					v133:Stop(0)
				end
			end
		else
			if v_u_43 then
				local v134 = v_u_43.Character
				if not v134 or v134.Parent == nil then
					return
				end
				local v135 = v134 ~= nil
				assert(v135)
				if v_u_31 == nil or v_u_31.Parent ~= v134 then
					v_u_31 = v_u_2.getHead(v134)
				end
				if v_u_31 then
					local v136 = v_u_2.getAnimator(v134, 0)
					if v_u_21 ~= nil and v136 ~= nil then
						local v137 = v_u_21 ~= nil
						assert(v137)
						local v138 = v_u_21:GetPlayingAnimationTracks()
						for _, v139 in pairs(v138) do
							if v139 == nil then
								continue
							end
							v139:Stop(0)
						end
						local v140 = v136:GetPlayingAnimationTracks()
						v_u_23 = {}
						for _, v141 in ipairs(v140) do
							local v142 = v141.Animation
							if not v142 or (not v142:IsA("Animation") or v142.AnimationId == "") then
								continue
							end
							v_u_23[v142.AnimationId] = v141
							if not v_u_22[v142.AnimationId] then
								v_u_22[v142.AnimationId] = v_u_21:LoadAnimation(v142)
							end
							local v143 = v_u_22[v142.AnimationId]
							local v144 = v143 ~= nil
							assert(v144)
							v143:Play()
							v143.TimePosition = v141.TimePosition
							v143.Priority = v141.Priority
							v143:AdjustWeight(v141.WeightCurrent, 0.1)
						end
						for v145 in v_u_22 do
							local v146 = v_u_22[v145]
							if not v146 then
								continue
							end
							local v147 = v146.Animation
							if not v147 or v_u_23[v147.AnimationId] then
								continue
							end
							local v148 = v_u_22[v147.AnimationId]
							if v148 ~= nil then
								v148:Stop(0)
							end
							v_u_22[v147.AnimationId] = nil
						end
						for _, v149 in ipairs(v136:GetPlayingAnimationTracksCoreScript()) do
							local v150 = v_u_21:GetPlayingAnimationTracksCoreScript()
							for _, v151 in pairs(v150) do
								if not v151.Animation:IsA("TrackerStreamAnimation") then
									continue
								end
								v151.Priority = v149.Priority
								v151:AdjustWeight(v149.WeightCurrent, 0)
							end
						end
					end
				end
				local v152 = nil
				local v153 = v_u_3:GetPlatform()
				if (v153 == Enum.Platform.IOS or v153 == Enum.Platform.Android) and v_u_21 ~= nil then
					local v154 = v_u_21:GetPlayingAnimationTracksCoreScript()
					for _, v155 in pairs(v154) do
						if not v155.Animation:IsA("TrackerStreamAnimation") then
							continue
						end
						local v156, v157
						v156, v152, v157 = v155:GetTrackerData()
					end
				end
				v_u_39 = v_u_39 + 1
				if v_u_39 == 1 then
					v_u_39 = 0
					if v_u_30 then
						v_u_32 = not v_u_32 and v_u_2.getHead(v_u_30)
						if v_u_32 then
							v_u_33 = v_u_2.getNeck(v_u_30, v_u_32)
						end
						if v_u_32 then
							v_u_34 = v_u_32.CFrame
						end
					end
					if v_u_27 and v_u_32 then
						local v158 = v_u_32.Position
						local v159 = v_u_32.Position
						local _ = v_u_32.CFrame
						if v_u_33 then
							local v160 = v_u_33.Part0
							local _ = v_u_33.Part1
							local v161 = v_u_33.C0
							local v162 = v_u_33.C1
							local v163 = v_u_33.Transform
							if v160 and v161 then
								local v164 = v160.CFrame * v161 * v163 * v162:Inverse()
								local v165 = v164.Position.X * 0.25
								local v166 = (v_u_32.CFrame.Position.Y + v164.Position.Y + v164.Position.Y * 0.75) * 0.33333
								local v167 = v164.Position.Z
								v159 = Vector3.new(v165, v166, v167)
								local v168 = v164.Position.X * 0.6
								local v169 = (v_u_32.CFrame.Position.Y + v164.Position.Y + v164.Position.Y * 0.75) * 0.33333
								local v170 = v164.Position.Z
								v158 = Vector3.new(v168, v169, v170)
							end
						end
						if not v_u_28 then
							warn("boundsSize is nil, this shouldn\'t be possible")
						end
						local v171 = v_u_28 ~= nil
						assert(v171)
						if v_u_4 and (v_u_4.VideoAnimationEnabled and (v152 ~= nil or v_u_8)) then
							if v_u_8 then
								local v172 = game:GetService("PlayerViewService"):GetDeviceCameraCFrameForSelfView()
								local v173 = v172.Position
								local v174, v175, v176 = v172:ToEulerAnglesYXZ()
								local v177 = CFrame.fromEulerAnglesYXZ(v174, v175, v176)
								local v178
								if v173.Z > 0 then
									local v179 = 0.5 - v173.Z * 3
									v178 = math.clamp(v179, -0.5, 0.5)
								else
									v178 = 0
								end
								local v180 = -(v_u_28.Z + 1)
								local v181 = (v180 + v178 * v180) * 100
								local v182 = math.floor(v181) / 100
								local v183 = Vector3.new(0, 0.105, v182)
								v_u_27.CFrame = v_u_27.CFrame:Lerp(CFrame.lookAt(v177 * (v158 + v183), v159), 0.5)
							elseif v152 then
								local v184 = -(v_u_28.Z + 1)
								local v185 = Vector3.new(0, 0.105, v184)
								local v186, v187, v188 = v152:ToEulerAnglesXYZ()
								local v189 = CFrame.Angles(-v186 * 0.5, -v187 * 0.5, -v188 * 0.5)
								v_u_27.CFrame = CFrame.lookAt(v189 * (v158 + v185), v159)
							end
						else
							local v190 = v_u_15 * 0.25 - 1.25
							local v191 = -(v_u_28.Z + 1) + 0.125
							local v192 = Vector3.new(0, v190, v191)
							if v134 then
								local v193 = v134:FindFirstChild("Head")
								local v194 = v193 and v134:FindFirstChild("HumanoidRootPart")
								if v194 then
									local v195 = v194.CFrame:Inverse() * v193.CFrame
									local v196 = v195.Position.X * 0.15 + 0.125
									local v197 = v195.Position.Y
									local v198 = v195.Position.Z * 0.05
									local v199 = Vector3.new(v196, v197, v198)
									v_u_27.CFrame = CFrame.lookAt(v158 + v192 + v199, v159)
									v_u_27.Focus = v_u_32.CFrame
								end
							end
						end
					end
				end
				if v_u_31 then
					if v_u_31.Size ~= v_u_25 then
						v_u_25 = v_u_31.Size
						setCloneDirty(true)
					end
					local function v200()
						-- upvalues: (ref) v_u_31
						local _ = v_u_31.Color
					end
					if pcall(v200) and v_u_31.Color ~= v_u_24 then
						updateClonePartsColor(v_u_31.Color)
					end
				end
			end
			if v_u_16 > 0 then
				v_u_16 = v_u_16 - p131
				if v_u_16 <= 0 then
					v_u_97(p_u_129)
					v_u_16 = 0
				end
			end
			if v_u_12 then
				debug.profileend()
			end
		end
	end)
end
return function(p201, p202, p203) -- name: Initialize
	-- upvalues: (ref) v_u_35, (copy) v_u_13, (ref) v_u_36, (ref) v_u_37, (copy) v_u_119, (copy) v_u_111, (copy) v_u_42, (copy) v_u_43, (copy) v_u_40, (copy) v_u_50
	if p202 then
		v_u_35 = p202
		if v_u_13() and p203 then
			v_u_36 = p203
			local v204 = v_u_36
			local v205
			if v204 and v_u_35 then
				local v206 = v_u_35 ~= nil
				assert(v206, "Wrapper Frame cannot be nil")
				local v207 = v204 ~= nil
				assert(v207, "Frame name cannot be nil ")
				v205 = v_u_35:FindFirstAncestor(v204)
			else
				v205 = nil
			end
			v_u_37 = v205
			if v_u_37 then
				v_u_37:GetPropertyChangedSignal("Visible"):Connect(v_u_119)
			end
		end
		v_u_111()
		playerAdded(p201)
		v_u_42.PlayerAdded:Connect(playerAdded)
		v_u_42.PlayerRemoving:Connect(function(p208)
			-- upvalues: (ref) v_u_43, (ref) v_u_40, (ref) v_u_50
			if p208 == v_u_43 then
				if v_u_40.HumanoidStateChanged then
					v_u_40.HumanoidStateChanged:Disconnect()
					v_u_40.HumanoidStateChanged = nil
				end
				if v_u_40.CharacterAdded then
					v_u_40.CharacterAdded:Disconnect()
					v_u_40.CharacterAdded = nil
				end
				if v_u_40.CharacterRemoving then
					v_u_40.CharacterRemoving:Disconnect()
					v_u_40.CharacterRemoving = nil
				end
				if v_u_40.FaceControlsChanged then
					v_u_40.FaceControlsChanged:Disconnect()
					v_u_40.FaceControlsChanged = nil
				end
				v_u_50()
			end
		end)
		startRenderStepped(p201)
		return v_u_50
	end
end