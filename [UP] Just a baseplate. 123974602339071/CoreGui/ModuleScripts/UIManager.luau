-- Path: CoreGui.RobloxGui.Modules.UIManager.UIManager
local v_u_1 = game:GetService("VRService")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("CorePackages")
local v_u_4 = require(v3.Workspace.Packages.VrCommon).VRHub
local v5 = script.Parent
local v_u_6 = require(v5.Constants)
local v_u_7 = require(v5.Utils)
local v_u_8 = v_u_6.PanelType
local v_u_9 = v_u_6.SpatialUIType
local v_u_10 = require(script.Parent.createCompatPanel)
local v_u_11 = require(script.Parent.createUIGroupDragBar)
require(v5.DragBar)
local v_u_12 = game:GetService("Players")
local v_u_13 = game:DefineFastInt("FIntUIResetDelayInSec", 3)
local v14 = CFrame.Angles(-0.3141592653589793, 0.17453292519943295, 0)
local v15 = CFrame.new(-0.46666666666666673, -0.8, -2.1333333333333333)
local v_u_16 = Vector2.new(2.666666666666667, 1.866666666666667)
local v_u_17 = v15 * v14
local v_u_18 = {}
local v_u_19 = nil
v_u_18.__index = v_u_18
function v_u_18.removeRoactPanel(p20, p21) -- name: removeRoactPanel
	p20.uiElements[p21] = nil
end
function v_u_18.registerRoactPanel(p22, p23, p24) -- name: registerRoactPanel
	p22.uiElements[p23] = p24
	p22:rescaleUIForCurrentHeadScale()
	p22:updateUIGroupsForCurHeadCFrame()
end
function v_u_18.createUI(p25, p26) -- name: createUI
	-- upvalues: (copy) v_u_10
	local v27 = v_u_10(p26)
	if v27 == nil then
		return nil
	end
	p25.uiElements[p26.panelType] = v27
	p25:updatePanelForCurHeadCFrame(p26.panelType)
	return {
		["type"] = v27.uiType,
		["panelObject"] = v27.panelObject
	}
end
function v_u_18.updateUIGroupForCurHeadCFrame(p28, p29, p30) -- name: updateUIGroupForCurHeadCFrame
	-- upvalues: (copy) v_u_1
	local v31 = p28.uiGroups[p29]
	local v32 = v31.positionProps.uiGroupHeadRotation
	local v33 = workspace.CurrentCamera.CFrame
	local v34 = (v33 * v_u_1:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(v32)
	local v35, v36, _ = v34:ToOrientation()
	local v37 = v33:ToObjectSpace(CFrame.new(v34.Position) * CFrame.fromOrientation(v35, v36, 0))
	v31.positionProps.uiGroupCameraOffSet = v37
	if v31.draggable and (v31.dragBar and (not p30 and true or false)) then
		v31.dragBar:setCFrame(workspace.CurrentCamera.CFrame * v37:ToWorldSpace(v31.dragBarOffset))
	end
	p28:updatePanelsInUIGroupForCurHeadCFrame(p29)
end
function v_u_18.updateUIGroupsForCurHeadCFrame(p38) -- name: updateUIGroupsForCurHeadCFrame
	for v39, _ in pairs(p38.uiGroups) do
		p38:updateUIGroupForCurHeadCFrame(v39)
	end
end
function v_u_18.updatePanelForCurHeadCFrame(p40, p41) -- name: updatePanelForCurHeadCFrame
	-- upvalues: (copy) v_u_9, (copy) v_u_1
	local v42 = p40.uiElements[p41]
	local v43
	if v42 == nil or v42.panelObject == nil then
		v43 = false
	else
		v43 = v42.uiType ~= v_u_9.ScreenUI
	end
	if v43 and (v42.panelPositionProps and v42.panelPositionProps.cameraFixedPanelProp) then
		local v44 = v42.panelPositionProps
		local v45 = v44.cameraFixedPanelProp
		local v46 = p40.uiGroups[v44.uiGroup].positionProps.uiGroupHeadRotation
		local v47 = workspace.CurrentCamera.CFrame
		local v48 = (v47 * v_u_1:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(v46)
		local v49, v50, _ = v48:ToOrientation()
		local v51 = v47:ToObjectSpace(CFrame.new(v48.Position) * CFrame.fromOrientation(v49, v50, 0))
		local v52
		if v42.uiType == v_u_9.SpatialUI or v42.uiType == v_u_9.SpatialUIRoact then
			v52 = v42.panelObject.Adornee
		elseif v42.uiType == v_u_9.SpatialUIPartOnly then
			v52 = v42.panelObject
		else
			v52 = nil
		end
		if v52 == nil then
			return
		end
		v52.CFrame = workspace.CurrentCamera.CFrame * v51
		v52.CFrame = v52.CFrame:ToWorldSpace(v45.uiGroupElementOffset)
	end
end
function v_u_18.updatePanelsInUIGroupForCurHeadCFrame(p53, p54) -- name: updatePanelsInUIGroupForCurHeadCFrame
	for v55, v56 in pairs(p53.uiElements) do
		if not v56.panelPositionProps or v56.panelPositionProps.uiGroup ~= p54 then
			continue
		end
		p53:updatePanelForCurHeadCFrame(v55)
	end
end
function v_u_18.updatePanelsForCurHeadCFrame(p57) -- name: updatePanelsForCurHeadCFrame
	for v58, _ in pairs(p57.uiElements) do
		p57:updatePanelForCurHeadCFrame(v58)
	end
end
function v_u_18.dragUiGroupStart(p59, p60) -- name: dragUiGroupStart
	if p59.uiGroups[p60].draggable ~= false then
		local v61 = p59.uiGroups[p60].dragBar
		local v62 = workspace.CurrentCamera.CFrame:ToWorldSpace(p59.uiGroups[p60].positionProps.uiGroupCameraOffSet)
		v61:startDrag((v61:getCFrame():ToObjectSpace(v62)))
	end
end
function v_u_18.dragUiGroupEnd(p63, p64) -- name: dragUiGroupEnd
	if p63.uiGroups[p64].draggable ~= false then
		p63.uiGroups[p64].dragBar:dragEnd()
	end
end
function v_u_18.dragUiGroupStep(p65, p66) -- name: dragUiGroupStep
	-- upvalues: (copy) v_u_1
	if p65.uiGroups[p66].draggable ~= false then
		local v67 = p65.uiGroups[p66].dragBar
		local v68 = workspace.CurrentCamera.CFrame * v_u_1:GetUserCFrame(Enum.UserCFrame.Head)
		local v69 = v67:getCFrame()
		local v70 = v68.Position.X
		local v71 = v68.Position.Y - 0.6666666666666667
		local v72 = v68.Position.Z
		local v73 = Vector3.new(v70, v71, v72)
		local v74, v75, _ = (CFrame.lookAt(v69.Position, v73) * CFrame.Angles(0, 3.141592653589793, 0)):ToEulerAnglesXYZ()
		local _, _, v76 = v69:ToEulerAnglesXYZ()
		local v77 = CFrame.new(v69.Position) * CFrame.Angles(v74, v75, v76)
		local v78, v79, _ = v77:ToOrientation()
		v67:setCFrame(CFrame.new(v77.Position) * CFrame.fromOrientation(v78, v79, 0))
		local v80 = v67:getCFrame():ToWorldSpace(v67.uiGroupOffSet)
		p65.uiGroups[p66].positionProps.uiGroupHeadRotation = v68:ToObjectSpace(v80)
		p65:updateUIGroupForCurHeadCFrame(p66, true)
	end
end
function v_u_18.setUpUiGroups(p_u_81) -- name: setUpUiGroups
	-- upvalues: (copy) v_u_11, (copy) v_u_6, (copy) v_u_17, (copy) v_u_1, (copy) v_u_16, (copy) v_u_8
	local v82 = v_u_11({
		["name"] = "MainUIGroup",
		["dragFunction"] = nil,
		["dragStartFunction"] = nil,
		["dragEndFunction"] = nil,
		["dragFunction"] = function(_, _, _, _, _) -- name: dragFunction
			-- upvalues: (copy) p_u_81, (ref) v_u_6
			p_u_81:dragUiGroupStep(v_u_6.SpatialUIGroupType.MainUIGroup)
		end,
		["dragStartFunction"] = function(_, _, _, _, _, _, _) -- name: dragStartFunction
			-- upvalues: (copy) p_u_81, (ref) v_u_6
			p_u_81:dragUiGroupStart(v_u_6.SpatialUIGroupType.MainUIGroup)
		end,
		["dragEndFunction"] = function(_) -- name: dragEndFunction
			-- upvalues: (copy) p_u_81, (ref) v_u_6
			p_u_81:dragUiGroupEnd(v_u_6.SpatialUIGroupType.MainUIGroup)
		end
	})
	local v83 = {
		["positionProps"] = nil,
		["uiContainerSize"] = nil,
		["draggable"] = true,
		["dragBar"] = nil,
		["dragBarOffset"] = nil,
		["headScale"] = 1
	}
	local v84 = {
		["uiGroupHeadRotation"] = v_u_17
	}
	local v85 = v_u_17
	local v86 = workspace.CurrentCamera.CFrame
	local v87 = (v86 * v_u_1:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(v85)
	local v88, v89, _ = v87:ToOrientation()
	v84.uiGroupCameraOffSet = v86:ToObjectSpace(CFrame.new(v87.Position) * CFrame.fromOrientation(v88, v89, 0))
	v84.defaultGroupHeadRotation = v_u_17
	v83.positionProps = v84
	v83.uiContainerSize = v_u_16
	v83.dragBar = v82
	v83.dragBarOffset = CFrame.new(0, v_u_6.ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP[v_u_8.BottomBar].Y - 0.075 - 0.06666666666666667, 0)
	p_u_81.uiGroups[v_u_6.SpatialUIGroupType.MainUIGroup] = v83
end
function v_u_18.step(p90) -- name: step
	-- upvalues: (copy) v_u_1, (copy) v_u_9, (copy) v_u_8, (copy) v_u_13
	if not v_u_1.VREnabled then
		return
	end
	for v91, v92 in pairs(p90.uiElements) do
		local v93
		if v92 == nil or v92.panelObject == nil then
			v93 = false
		else
			v93 = v92.uiType ~= v_u_9.ScreenUI
		end
		if not v93 or v91 ~= v_u_8.RobloxGui then
			continue
		end
		local v94
		if v92.uiType == v_u_9.SpatialUI then
			v94 = v92.panelObject.Adornee
		else
			v94 = v92.panelObject
		end
		local v95, v96, _ = v94.CFrame:ToOrientation()
		local v97, v98, _ = (workspace.CurrentCamera.CFrame * v_u_1:GetUserCFrame(Enum.UserCFrame.Head)):ToOrientation()
		local v99 = v96 - v98
		if math.abs(v99) > 1.7453292519943295 then
			if p90.uiGroupsOutOfViewTimeStamp then
				if v_u_13 > os.clock() - p90.uiGroupsOutOfViewTimeStamp then
					continue
				end
				p90:updateUIGroupsForCurHeadCFrame()
				p90.uiGroupsOutOfViewTimeStamp = nil
			else
				p90.uiGroupsOutOfViewTimeStamp = os.clock()
			end
		else
			local v100 = v95 - v97
			if math.abs(v100) > 1.7453292519943295 then
				if p90.uiGroupsOutOfViewTimeStamp then
					if v_u_13 > os.clock() - p90.uiGroupsOutOfViewTimeStamp then
						continue
					end
					p90:updateUIGroupsForCurHeadCFrame()
					p90.uiGroupsOutOfViewTimeStamp = nil
				else
					p90.uiGroupsOutOfViewTimeStamp = os.clock()
				end
			else
				p90.uiGroupsOutOfViewTimeStamp = nil
			end
		end
	end
end
function v_u_18.onShowTopBarChanged(p101) -- name: onShowTopBarChanged
	-- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_9
	if v_u_1.VREnabled then
		if v_u_4.ShowTopBar then
			for _, v102 in pairs(p101.uiGroups) do
				if not (v102.draggable and v102.dragBar) then
					continue
				end
				v102.dragBar:show()
			end
			for _, v103 in pairs(p101.uiElements) do
				if v103.uiType == v_u_9.SpatialUI or v103.uiType == v_u_9.SpatialUIRoact then
					local v104 = v103.panelObject
					v104.Enabled = true
					v104.Adornee.Parent = workspace
				else
					if v103.uiType ~= v_u_9.SpatialUIPartOnly then
						continue
					end
					v103.panelObject.Parent = workspace
				end
			end
		else
			for _, v105 in pairs(p101.uiGroups) do
				if not (v105.draggable and v105.dragBar) then
					continue
				end
				v105.dragBar:hide()
			end
			for _, v106 in pairs(p101.uiElements) do
				if v106.uiType == v_u_9.SpatialUI or v106.uiType == v_u_9.SpatialUIRoact then
					local v107 = v106.panelObject
					v107.Enabled = false
					v107.Adornee.Parent = nil
				else
					if v106.uiType ~= v_u_9.SpatialUIPartOnly then
						continue
					end
					v106.panelObject.Parent = nil
				end
			end
		end
	else
		return
	end
end
function v_u_18.updateUIGroupsForCurCamera(p108) -- name: updateUIGroupsForCurCamera
	-- upvalues: (copy) v_u_1, (copy) v_u_9
	if v_u_1.VREnabled then
		for _, v109 in pairs(p108.uiGroups) do
			if not v109.draggable then
				continue
			end
			v109.dragBar:setCFrame(workspace.CurrentCamera.CFrame * v109.positionProps.uiGroupCameraOffSet:ToWorldSpace(v109.dragBarOffset))
		end
		for _, v110 in pairs(p108.uiElements) do
			local v111
			if v110 == nil or v110.panelObject == nil then
				v111 = false
			else
				v111 = v110.uiType ~= v_u_9.ScreenUI
			end
			if not (v111 and (v110.panelPositionProps and v110.panelPositionProps.cameraFixedPanelProp)) then
				continue
			end
			local v112 = v110.panelPositionProps
			local v113 = v112.cameraFixedPanelProp
			local v114
			if v110.uiType == v_u_9.SpatialUI or v110.uiType == v_u_9.SpatialUIRoact then
				v114 = v110.panelObject.Adornee
			elseif v110.uiType == v_u_9.SpatialUIPartOnly then
				v114 = v110.panelObject
			else
				v114 = nil
			end
			if v114 == nil then
				return
			end
			v114.CFrame = workspace.CurrentCamera.CFrame * p108.uiGroups[v112.uiGroup].positionProps.uiGroupCameraOffSet:ToWorldSpace(v113.uiGroupElementOffset)
		end
	end
end
function v_u_18.onMouseTargetChanged(p115, p116) -- name: onMouseTargetChanged
	for _, v117 in pairs(p115.uiGroups) do
		if not v117.draggable then
			continue
		end
		if v117.dragBar and v117.dragBar.part == p116 then
			v117.dragBar:startHover()
		else
			if not v117.dragBar or v117.dragBar.part == p116 then
				continue
			end
			v117.dragBar:hoverEnd()
		end
	end
end
function v_u_18.rescaleUIForCurrentHeadScale(p118) -- name: rescaleUIForCurrentHeadScale
	-- upvalues: (copy) v_u_7, (copy) v_u_9
	local v119 = workspace.CurrentCamera.HeadScale
	for _, v120 in pairs(p118.uiGroups) do
		local v121 = v119 / v120.headScale
		v120.positionProps.uiGroupHeadRotation = v_u_7.rescaleCFramePosition(v120.positionProps.uiGroupHeadRotation, v121)
		v120.positionProps.uiGroupCameraOffSet = v_u_7.rescaleCFramePosition(v120.positionProps.uiGroupCameraOffSet, v121)
		v120.positionProps.defaultGroupHeadRotation = v_u_7.rescaleCFramePosition(v120.positionProps.defaultGroupHeadRotation, v121)
		if v120.draggable then
			v120.dragBarOffset = v_u_7.rescaleCFramePosition(v120.dragBarOffset, v121)
			v120.dragBar:rescale(v121)
		end
		v120.headScale = v119
	end
	for _, v122 in pairs(p118.uiElements) do
		local v123 = v119 / v122.headScale
		if v122.uiType ~= v_u_9.SpatialUIRoact then
			local v124
			if v122.uiType == v_u_9.SpatialUI or v122.uiType == v_u_9.SpatialUIRoact then
				v124 = v122.panelObject.Adornee
			elseif v122.uiType == v_u_9.SpatialUIPartOnly then
				v124 = v122.panelObject
			else
				v124 = nil
			end
			if v124 ~= nil then
				v124.Size = v124.Size * v123
			end
		end
		local v125 = v122.panelPositionProps
		if v125 and v125.cameraFixedPanelProp then
			v125.cameraFixedPanelProp.uiGroupElementOffset = v_u_7.rescaleCFramePosition(v125.cameraFixedPanelProp.uiGroupElementOffset, v123)
		end
		v122.headScale = v119
	end
end
function v_u_18.new() -- name: new
	-- upvalues: (copy) v_u_18, (copy) v_u_2, (copy) v_u_4, (copy) v_u_12
	local v_u_126 = {
		["currentMouseTarget"] = nil,
		["uiGroupsOutOfViewTimeStamp"] = nil,
		["uiElements"] = nil,
		["uiGroups"] = nil,
		["uiElements"] = {},
		["uiGroups"] = {}
	}
	local v127 = v_u_18
	setmetatable(v_u_126, v127)
	v_u_126:setUpUiGroups()
	v_u_126:rescaleUIForCurrentHeadScale()
	v_u_126:updateUIGroupsForCurCamera()
	v_u_2:BindToRenderStep("UIManagerRenderStep", Enum.RenderPriority.Last.Value, function()
		-- upvalues: (copy) v_u_126
		v_u_126:step()
	end)
	v_u_4.ShowTopBarChanged.Event:connect(function()
		-- upvalues: (copy) v_u_126
		v_u_126:onShowTopBarChanged()
	end)
	local v128 = workspace.CurrentCamera
	v128:GetPropertyChangedSignal("CFrame"):Connect(function()
		-- upvalues: (copy) v_u_126
		v_u_126:updateUIGroupsForCurCamera()
	end)
	v128:GetPropertyChangedSignal("HeadScale"):Connect(function()
		-- upvalues: (copy) v_u_126
		v_u_126:rescaleUIForCurrentHeadScale()
		v_u_126:updateUIGroupsForCurHeadCFrame()
	end)
	local v129 = v_u_12.LocalPlayer:GetMouse()
	if v129 then
		v129.Move:Connect(function()
			-- upvalues: (ref) v_u_12, (copy) v_u_126
			local v130 = v_u_12.LocalPlayer:GetMouse()
			if v130.Target ~= v_u_126.currentMouseTarget then
				v_u_126:onMouseTargetChanged(v130.Target)
				v_u_126.currentMouseTarget = v130.Target
			end
		end)
	end
	return v_u_126
end
function v_u_18.getInstance() -- name: getInstance
	-- upvalues: (ref) v_u_19, (copy) v_u_18
	if v_u_19 == nil then
		v_u_19 = v_u_18.new()
	end
	return v_u_19
end
return v_u_18