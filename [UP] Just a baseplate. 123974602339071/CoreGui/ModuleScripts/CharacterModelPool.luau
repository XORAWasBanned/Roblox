-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.CharacterModelPool
local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("RobloxReplicatedStorage")
local v3 = game:GetService("CorePackages")
local v_u_4 = require(v3.Packages.Promise)
local v_u_5 = CFrame.new(Vector3.new(0, 150, 0))
local v_u_6 = game:DefineFastInt("InspectAndBuyClusterCompositionTimeoutMs", 3000)
local v_u_7 = {}
v_u_7.__index = v_u_7
local function v_u_11(p8) -- name: setupCharacterModels
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v9 = v_u_1:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6)
	local v10 = v_u_1:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
	v9.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	v10.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	v9.HumanoidRootPart.Anchored = true
	v10.HumanoidRootPart.Anchored = true
	v9.Parent = v_u_2
	v10.Parent = v_u_2
	v9.HumanoidRootPart.CFrame = CFrame.new(p8)
	v10:SetPrimaryPartCFrame(v9.HumanoidRootPart.CFrame)
	return v9, v10
end
function v_u_7.new(p12, p13, p14, p15) -- name: new
	-- upvalues: (copy) v_u_7, (copy) v_u_11, (copy) v_u_2
	local v16 = {}
	local v17 = v_u_7
	setmetatable(v16, v17)
	v16.mockApplyDescription = p15
	local v18, v19 = v_u_11(p13)
	v16.r6 = v18
	v16.r15current = v19
	v16.r15offScreen = v19:Clone()
	v16.r15offScreen.Parent = v_u_2
	v16.avatarType = p14
	v16.worldModelRef = p12
	v16.inProgressPromise = nil
	v16.waitingPromise = nil
	v16.r6Promise = nil
	v16.destroyed = false
	return v16
end
function v_u_7.setupAnimations(p20, p21, p22) -- name: setupAnimations
	p21.Parent = p20.r6
	p22.Parent = p20.r15current
	p22.Archivable = true
	local v23 = p22:Clone()
	v23.Parent = p20.r15offScreen
	v23.Archivable = false
	p22.Archivable = false
end
function v_u_7.getCurrentCharacter(p24) -- name: getCurrentCharacter
	if p24.avatarType == Enum.HumanoidRigType.R15 then
		return p24.r15current
	else
		return p24.r6
	end
end
function v_u_7.isR15(p25) -- name: isR15
	return p25.avatarType == Enum.HumanoidRigType.R15
end
function v_u_7.syncRotation(_, p26, p27) -- name: syncRotation
	local _, _, _, v28, v29, v30, v31, v32, v33, v34, v35, v36 = p26.HumanoidRootPart.CFrame:components()
	local v37 = p27.HumanoidRootPart.CFrame.p
	p27.HumanoidRootPart.CFrame = CFrame.new(v37.X, v37.Y, v37.Z, v28, v29, v30, v31, v32, v33, v34, v35, v36)
end
local function v_u_45(p38, p39) -- name: hasLayeredAccessoryUpdates
	local v40 = p38:GetAccessories(false)
	local v41 = p39:GetAccessories(false)
	if #v41 == 0 then
		return false
	end
	if #v40 ~= #v41 then
		return true
	end
	local v42 = {}
	for _, v43 in ipairs(v40) do
		v42[v43.AssetId] = true
	end
	for _, v44 in ipairs(v41) do
		if v42[v44.AssetId] then
			continue
		end
		return true
	end
	return false
end
function v_u_7._doUpdateR6(p_u_46, p_u_47) -- name: _doUpdateR6
	-- upvalues: (copy) v_u_4
	return v_u_4.new(function(p48, _)
		-- upvalues: (copy) p_u_46, (copy) p_u_47
		p_u_46.r6.Parent = p_u_46.worldModelRef:getValue()
		if p_u_46.mockApplyDescription then
			p_u_46.mockApplyDescription(p_u_46.r6, p_u_47)
		else
			p_u_46.r6.Humanoid:ApplyDescriptionAsync(p_u_47)
		end
		p48(p_u_46:getCurrentCharacter())
	end)
end
function v_u_7._doSimpleUpdateR15(p_u_49, p_u_50) -- name: _doSimpleUpdateR15
	-- upvalues: (copy) v_u_4
	return v_u_4.new(function(p51, _)
		-- upvalues: (copy) p_u_49, (copy) p_u_50
		p_u_49.r15current.Parent = p_u_49.worldModelRef:getValue()
		if p_u_49.mockApplyDescription then
			p_u_49.mockApplyDescription(p_u_49.r15current, p_u_50)
		else
			p_u_49.r15current.Humanoid:ApplyDescriptionAsync(p_u_50)
		end
		p51(p_u_49.r15current)
	end)
end
function v_u_7._updateOffscreenR15(p_u_52, p_u_53) -- name: _updateOffscreenR15
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	return v_u_4.new(function(p54, _)
		-- upvalues: (copy) p_u_52, (ref) v_u_5, (copy) p_u_53
		p_u_52.r15offScreen.HumanoidRootPart.CFrame = v_u_5
		p_u_52.r15offScreen.Parent = p_u_52.worldModelRef:getValue()
		if p_u_52.mockApplyDescription then
			p_u_52.mockApplyDescription(p_u_52.r15offScreen, p_u_53)
		else
			p_u_52.r15offScreen.Humanoid:ApplyDescriptionAsync(p_u_53)
		end
		p54(p_u_52.r15offScreen)
	end)
end
local function v_u_56(p55) -- name: waitForClusterCompositionFinished
	-- upvalues: (copy) v_u_4, (copy) v_u_6
	if p55:FindFirstChildWhichIsA("WrapLayer", true) ~= nil then
		return v_u_4.race({ v_u_4.fromEvent(p55.Humanoid.ClusterCompositionFinished), v_u_4.delay(v_u_6 * 0.001) }):andThen(function()
			return true
		end)
	else
		return v_u_4.resolve(false)
	end
end
function v_u_7._completeUpdate(p57) -- name: _completeUpdate
	-- upvalues: (copy) v_u_5, (copy) v_u_2
	local v58 = p57.r15current.HumanoidRootPart.CFrame
	p57.r15offScreen.HumanoidRootPart.CFrame = v58
	p57.r15current.HumanoidRootPart.CFrame = v_u_5
	p57.r15current.Parent = v_u_2
	local v59 = p57.r15current
	local v60 = p57.r15offScreen
	p57.r15offScreen = v59
	p57.r15current = v60
	return p57.r15current
end
function v_u_7._doUpdateR15(p_u_61, p62) -- name: _doUpdateR15
	-- upvalues: (copy) v_u_45, (copy) v_u_56
	if not v_u_45(p_u_61.r15current.Humanoid:GetAppliedDescription(), p62) then
		return p_u_61:_doSimpleUpdateR15(p62)
	end
	p_u_61.inProgressPromise = p_u_61:_updateOffscreenR15(p62):andThen(v_u_56):andThen(function()
		-- upvalues: (copy) p_u_61
		return p_u_61:_completeUpdate()
	end)
	return p_u_61.inProgressPromise
end
function v_u_7.maybeUpdateCharacter(p_u_63, p_u_64) -- name: maybeUpdateCharacter
	-- upvalues: (copy) v_u_4
	if p_u_63.avatarType == Enum.HumanoidRigType.R6 then
		p_u_63.r6Promise = p_u_63:_doUpdateR6(p_u_64)
		return p_u_63.r6Promise
	end
	if not p_u_63.inProgressPromise or p_u_63.inProgressPromise:getStatus() ~= v_u_4.Status.Started then
		return p_u_63:_doUpdateR15(p_u_64)
	end
	local v65 = p_u_63.waitingPromise
	p_u_63.waitingPromise = p_u_63.inProgressPromise:andThen(function()
		-- upvalues: (copy) p_u_63, (copy) p_u_64
		return p_u_63:_doUpdateR15(p_u_64)
	end)
	if v65 then
		v65:cancel()
	end
	return p_u_63.waitingPromise
end
function v_u_7.switchAvatarType(p66, p67) -- name: switchAvatarType
	-- upvalues: (copy) v_u_2
	if p67 == p66.avatarType then
		return p66:getCurrentCharacter()
	end
	p66:_cancelPromises()
	p66.avatarType = p67
	local v68, v69
	if p67 == Enum.HumanoidRigType.R6 then
		v68 = p66.r6
		v69 = p66.r15current
	else
		v68 = p66.r15current
		v69 = p66.r6
	end
	v69.Parent = v_u_2
	v69.Humanoid:UnequipTools()
	p66:syncRotation(v69, v68)
	return v68
end
function v_u_7.start(_) -- name: start end
function v_u_7._cancelPromises(p70) -- name: _cancelPromises
	local v71 = p70.inProgressPromise
	if v71 then
		v71:cancel()
	end
	local v72 = p70.waitingPromise
	if v72 then
		v72:cancel()
	end
	local v73 = p70.r6Promise
	if v73 then
		v73:cancel()
	end
	p70.inProgressPromise = nil
	p70.waitingPromise = nil
	p70.r6Promise = nil
end
function v_u_7.stop(p74) -- name: stop
	-- upvalues: (copy) v_u_2
	p74.r6.Parent = v_u_2
	p74.r15current.Parent = v_u_2
	p74.r15offScreen.Parent = v_u_2
	p74:_cancelPromises()
end
function v_u_7.onDestroy(p75) -- name: onDestroy
	p75:_cancelPromises()
	p75.r6:Destroy()
	p75.r15current:Destroy()
	p75.r15offScreen:Destroy()
end
return v_u_7