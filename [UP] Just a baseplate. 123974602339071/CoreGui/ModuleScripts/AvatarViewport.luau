-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.AvatarViewport
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("ContextActionService")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("RunService")
local v5 = script.Parent.Parent
local v_u_6 = require(v1.Packages.Roact)
local v7 = require(v1.Packages.RoactRodux)
local v_u_8 = require(v1.Packages.Cryo)
local v_u_9 = require(v5.Colors)
local v_u_10 = require(v5.CharacterModelPool)
local v_u_11 = require(v5.Components.InspectAndBuyContext)
local v_u_12 = require(v5.Flags.FFlagEnableNewAvatarViewportProps)
local v_u_13 = require(v1.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v_u_14 = require(v1.Workspace.Packages.SharedFlags).FFlagEnableInExperienceUIPCVRFix
local v_u_15 = require(v1.Workspace.Packages.SharedFlags).FFlagEnableInspectAndBuyV2RootFlag
local v_u_16 = require(v1.Workspace.Packages.AppCommonLib).isSpatial
local v_u_17 = v_u_6.PureComponent:extend("AvatarViewport")
function v_u_17.init(p18) -- name: init
	-- upvalues: (copy) v_u_6
	p18.viewportFrameRef = v_u_6.createRef()
	p18.worldModelRef = v_u_6.createRef()
	p18.connections = {}
	p18.xRotation = 0
	p18.yRotation = 0
	p18.rotationDeltaX = 0
	p18.rotationDeltaY = 0
	p18.mouseOrTouchDown = false
	p18.delta = 0
	p18.keys = {}
	p18.lastPosition = Vector3.new(0, 0, 0)
	p18.viewportCamera = Instance.new("Camera")
	p18.viewportCamera.CameraType = Enum.CameraType.Scriptable
	p18.model = p18.props.model
	p18.lastInputTime = 2
	local v19
	if p18.props.model == nil then
		v19 = nil
	else
		v19 = p18.props.model.HumanoidRootPart.Position or nil
	end
	p18.initialHrpPosition = v19
end
function v_u_17.didMount(p20) -- name: didMount
	-- upvalues: (copy) v_u_10
	if p20.props.humanoidDescription and p20.model then
		p20.viewportCamera.Parent = p20.viewportFrameRef.current
		p20.viewportFrameRef.current.CurrentCamera = p20.viewportCamera
		p20:setRotation()
		local v21 = p20.model.Humanoid.RigType
		p20.characterModelPool = v_u_10.new(p20.worldModelRef, p20.initialHrpPosition, v21)
	end
	p20.isMounted = true
	p20:handleSpin()
	p20:setUpGamepad()
end
function v_u_17.didUpdate(p_u_22, p23, _) -- name: didUpdate
	-- upvalues: (copy) v_u_12
	if p_u_22.props.visible and (p_u_22.props.humanoidDescription ~= p23.humanoidDescription and p_u_22.model) then
		if v_u_12 and p_u_22.props.resetCameraAndAutoRotationOnModelChange then
			p_u_22.xRotation = 0
			p_u_22.yRotation = 0
			if not p_u_22.props.disableAutoRotation then
				p_u_22.lastInputTime = tick()
			end
		end
		coroutine.wrap(function()
			-- upvalues: (copy) p_u_22
			p_u_22.characterModelPool:maybeUpdateCharacter(p_u_22.props.humanoidDescription)
		end)()
	end
	p_u_22.gamepadRotating = false
	p_u_22.viewportCamera.Parent = p_u_22.viewportFrameRef.current
	p_u_22.viewportFrameRef.current.CurrentCamera = p_u_22.viewportCamera
	if p_u_22.props.gamepadEnabled ~= p23.gamepadEnabled then
		if p_u_22.props.gamepadEnabled then
			p_u_22:setUpGamepad()
			return
		end
		p_u_22:unbindActions()
	end
end
function v_u_17.setRotation(p24) -- name: setRotation
	-- upvalues: (copy) v_u_12
	local v25 = p24.model
	if v25 then
		local v26 = v25.HumanoidRootPart
		local v27 = p24.initialHrpPosition or v26.Position
		local v28
		if v_u_12 and p24.props.offsetOptions then
			v28 = p24.props.offsetOptions.defaultCameraOffset
			if p24.model:FindFirstChildOfClass("Tool") then
				v28 = p24.props.offsetOptions.toolOffset
			end
		else
			local v29 = p24.props.view
			local v30 = p24.props.views[v29]
			v28 = v30.DefaultCameraOffset
			if p24.model:FindFirstChildOfClass("Tool") then
				v28 = v30.ToolOffset
			end
		end
		local v31 = (CFrame.new(v27) * CFrame.Angles(0, -p24.yRotation, 0) * CFrame.Angles(p24.xRotation, 0, 0) * v28).p
		p24.viewportCamera.CFrame = CFrame.new(v31, v27)
		if v_u_12 and p24.props.cameraFieldOfView then
			p24.viewportCamera.FieldOfView = p24.props.cameraFieldOfView
		end
	end
end
function v_u_17.render(p_u_32) -- name: render
	-- upvalues: (copy) v_u_6, (copy) v_u_9, (copy) v_u_12, (copy) v_u_3
	local v33 = p_u_32.props.size
	local v34 = p_u_32.props.position
	local v35 = p_u_32.props.visible
	local v36 = p_u_32.props.backgroundTransparency
	local v_u_37 = p_u_32.props.setScrollingEnabled
	local v38 = v_u_6.createElement
	local v47 = {
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = v34,
		["Size"] = v33,
		["BackgroundTransparency"] = v36,
		["BackgroundColor3"] = v_u_9.Graphite,
		["BorderSizePixel"] = 0,
		["Active"] = true,
		["Visible"] = v35,
		[v_u_6.Ref] = p_u_32.viewportFrameRef,
		[v_u_6.Event.InputBegan] = function(_, p39)
			-- upvalues: (copy) p_u_32, (ref) v_u_12, (copy) v_u_37, (ref) v_u_3
			if p39.UserInputState == Enum.UserInputState.Begin then
				p_u_32.mouseOrTouchDown = true
				p_u_32.lastPosition = p39.Position
				if v_u_12 then
					if v_u_37 then
						v_u_37(false)
					end
				else
					v_u_37(false)
				end
				local v42 = v_u_3.InputChanged:connect(function(p40, _)
					-- upvalues: (ref) p_u_32
					if p40.UserInputType == Enum.UserInputType.MouseMovement and p_u_32.mouseOrTouchDown or p40.UserInputType == Enum.UserInputType.Touch then
						local v41 = p40.Position - p_u_32.lastPosition
						p_u_32.lastPosition = p40.Position
						p_u_32.yRotation = p_u_32.yRotation + v41.x * 0.0065
						p_u_32.xRotation = p_u_32.xRotation + v41.y * 0.0065
						p_u_32.lastInputTime = tick()
					end
				end)
				local v44 = v_u_3.InputEnded:connect(function(p43, _)
					-- upvalues: (ref) p_u_32, (ref) v_u_12, (ref) v_u_37
					if p43.UserInputType == Enum.UserInputType.MouseButton1 or p43.UserInputType == Enum.UserInputType.Touch then
						if p_u_32.mouseOrTouchDown then
							p_u_32.mouseOrTouchDown = false
							p_u_32.lastInputTime = tick()
							p_u_32:removeConnections()
						end
						if v_u_12 then
							if v_u_37 then
								v_u_37(true)
								return
							end
						else
							v_u_37(true)
						end
					end
				end)
				local v45 = p_u_32.connections
				table.insert(v45, v42)
				local v46 = p_u_32.connections
				table.insert(v46, v44)
			end
		end
	}
	local v48 = {
		["WorldModel"] = v_u_6.createElement("WorldModel", {
			[v_u_6.Ref] = p_u_32.worldModelRef
		})
	}
	return v38("ViewportFrame", v47, v48)
end
function v_u_17.handleSpin(p_u_49) -- name: handleSpin
	-- upvalues: (copy) v_u_12, (copy) v_u_4
	local v_u_50 = false
	spawn(function()
		-- upvalues: (copy) p_u_49, (ref) v_u_12, (ref) v_u_50, (ref) v_u_4
		while p_u_49.isMounted do
			if tick() - p_u_49.lastInputTime > 2 and not (p_u_49.mouseOrTouchDown or p_u_49.gamepadRotating) then
				if not (v_u_12 and p_u_49.props.disableAutoRotation) then
					v_u_50 = true
				end
			else
				v_u_50 = false
			end
			if v_u_50 then
				local v51 = p_u_49
				local v52 = p_u_49.xRotation % 6.283185307179586
				local v53
				if v52 > 3.141592653589793 then
					v53 = v52 + 0.03490658503988659
					if v53 > 6.283185307179586 then
						v53 = 0
					end
				else
					v53 = v52 - 0.03490658503988659
					if v53 < 0 then
						v53 = 0
					end
				end
				v51.xRotation = v53
				p_u_49.yRotation = p_u_49.yRotation + 0.012217304763960306
			elseif p_u_49.gamepadRotating then
				p_u_49.yRotation = p_u_49.yRotation + p_u_49.delta * p_u_49.rotationDeltaY
				p_u_49.xRotation = p_u_49.xRotation + p_u_49.delta * p_u_49.rotationDeltaX
			end
			p_u_49:setRotation()
			p_u_49.delta = v_u_4.RenderStepped:wait()
		end
	end)
end
function v_u_17.setUpGamepad(p_u_54) -- name: setUpGamepad
	-- upvalues: (copy) v_u_13, (copy) v_u_14, (copy) v_u_16, (copy) v_u_15, (copy) v_u_3, (copy) v_u_2
	if not (v_u_13 and (v_u_14 and (v_u_16() and v_u_15))) then
		if v_u_3.GamepadEnabled then
			local v_u_55 = Vector2.new(0, 0)
			v_u_2:UnbindCoreAction("RotateModel")
			v_u_2:BindCoreAction("RotateModel", function(_, p56, p57)
				-- upvalues: (ref) v_u_55, (copy) p_u_54
				if p56 ~= Enum.UserInputState.Change then
					return Enum.ContextActionResult.Sink
				end
				v_u_55 = p57.Position or v_u_55
				v_u_55 = Vector2.new(v_u_55.X, v_u_55.Y)
				local v58 = v_u_55.X
				if math.abs(v58) > 0.2 then
					p_u_54.lastInputTime = tick()
					p_u_54.gamepadRotating = true
					p_u_54.rotationDeltaY = 3 * v_u_55.X
					p_u_54.rotationDeltaX = 3 * v_u_55.Y
				else
					local v59 = v_u_55.Y
					if math.abs(v59) <= 0.2 then
						p_u_54.gamepadRotating = false
						return Enum.ContextActionResult.Sink
					end
					p_u_54.lastInputTime = tick()
					p_u_54.gamepadRotating = true
					p_u_54.rotationDeltaY = 3 * v_u_55.X
					p_u_54.rotationDeltaX = 3 * v_u_55.Y
				end
				return Enum.ContextActionResult.Sink
			end, false, Enum.KeyCode.Thumbstick2, Enum.KeyCode.ButtonA)
		end
	end
end
function v_u_17.unbindActions(_) -- name: unbindActions
	-- upvalues: (copy) v_u_2
	v_u_2:UnbindCoreAction("RotateModel")
end
function v_u_17.removeConnections(p60) -- name: removeConnections
	for _, v61 in pairs(p60.connections) do
		v61:disconnect()
	end
end
function v_u_17.willUnmount(p62) -- name: willUnmount
	p62.isMounted = false
	if p62.characterModelPool then
		p62.characterModelPool:onDestroy()
	end
	p62:unbindActions()
	p62:removeConnections()
end
return v7.UNSTABLE_connect2(function(p63, _)
	return {
		["view"] = p63.view,
		["tryingOnInfo"] = p63.tryingOnInfo,
		["gamepadEnabled"] = p63.gamepadEnabled
	}
end)(function(p_u_64) -- name: AvatarViewportWrapper
	-- upvalues: (copy) v_u_6, (copy) v_u_11, (copy) v_u_8, (copy) v_u_17
	local v67 = {
		["render"] = function(p65) -- name: render
			-- upvalues: (ref) v_u_8, (copy) p_u_64, (ref) v_u_6, (ref) v_u_17
			local v66 = v_u_8.Dictionary.join(p_u_64, {
				["views"] = p65
			})
			return v_u_6.createElement(v_u_17, v66)
		end
	}
	return v_u_6.createElement(v_u_11.Consumer, v67)
end)