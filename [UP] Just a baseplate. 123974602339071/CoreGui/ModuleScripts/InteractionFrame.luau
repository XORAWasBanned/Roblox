-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.Common.InteractionFrame
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = require(v1.Packages.Cryo)
local v_u_5 = require(v1.Packages.Roact)
local v6 = require(v1.Packages.t)
local v7 = v_u_5.PureComponent:extend("InteractionFrame")
v7.defaultProps = {
	["Visible"] = true
}
v7.validateProps = v6.interface({
	["panByPixels"] = v6.callback,
	["rotateByPixels"] = v6.callback,
	["setAngularVelocityByPixels"] = v6.callback,
	["zoomToPoint"] = v6.callback,
	["doubleTap"] = v6.optional(v6.callback),
	["Size"] = v6.optional(v6.UDim2),
	["Position"] = v6.optional(v6.UDim2),
	["Visible"] = v6.optional(v6.boolean),
	["ZIndex"] = v6.optional(v6.number)
})
function v7.disconnectEvents(p8) -- name: disconnectEvents
	p8.inputChangedConnection:Disconnect()
	p8.inputEndedConnection:Disconnect()
	p8.renderSteppedConnection:Disconnect()
	p8.inputChangedConnection = nil
	p8.inputEndedConnection = nil
	p8.renderSteppedConnection = nil
end
function v7.getActiveInput(p9, p10) -- name: getActiveInput
	local v11 = p10.UserInputType == Enum.UserInputType.Touch
	local v12 = p10.UserInputType == Enum.UserInputType.MouseButton1
	local v13 = p10.UserInputType == Enum.UserInputType.MouseButton2
	local v14 = p10.UserInputType == Enum.UserInputType.MouseMovement or (v12 or v13)
	if v14 or v11 then
		local v15 = nil
		if v14 then
			return p9.activeMouseInput
		end
		if v11 then
			v15 = p9.activeTouchInputs[p10]
		end
		return v15
	end
end
function v7.removeActivePointerInput(p16, p17, p18) -- name: removeActivePointerInput
	-- upvalues: (copy) v_u_3
	if p18 then
		if v_u_3:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or v_u_3:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
			return
		end
		p16.activeMouseInput = nil
	else
		p16.activeTouchInputs[p17] = nil
		p16.numActiveTouchInputs = p16.numActiveTouchInputs - 1
	end
	p16.numActiveInputs = p16.numActiveInputs - 1
	if p16.numActiveInputs == 0 then
		p16:disconnectEvents()
	end
end
function v7.handleDoubleTap(p19, p20, p21) -- name: handleDoubleTap
	if p19.lastPrimaryPointerInputBeganPosition then
		local v22 = p19.lastPrimaryPointerInputBeganPosition - p20.Position
		local v23 = p21 - p19.lastPrimaryPointerInputBeganTime
		if p19.props.doubleTap and (v22.Magnitude < 30 and v23 < 0.25) then
			p19.props.doubleTap()
		end
	end
	p19.lastPrimaryPointerInputBeganPosition = p20.Position
	p19.lastPrimaryPointerInputBeganTime = p21
end
function v7.addActivePointerInput(p24, p25, p26, p27) -- name: addActivePointerInput
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_2
	if not p24:getActiveInput(p25) then
		local v28 = {
			["lastPosition"] = p25.Position,
			["lastTime"] = p27
		}
		if p26 then
			p24.activeMouseInput = v28
		else
			p24.activeTouchInputs[p25] = v_u_4.Dictionary.join(v28, {
				["lastDeltaTime"] = 0,
				["lastDeltaPosition"] = Vector3.new(0, 0, 0)
			})
			p24.numActiveTouchInputs = p24.numActiveTouchInputs + 1
		end
		p24.numActiveInputs = p24.numActiveInputs + 1
		if p24.numActiveInputs == 1 then
			p24.props.setAngularVelocityByPixels(0)
			p24.inputChangedConnection = v_u_3.InputChanged:Connect(p24.onInputChanged)
			p24.inputEndedConnection = v_u_3.InputEnded:Connect(p24.onInputEnded)
			p24.renderSteppedConnection = v_u_2.RenderStepped:Connect(p24.setInputNotChanged)
		end
	end
end
function v7.init(p_u_29) -- name: init
	-- upvalues: (copy) v_u_3
	p_u_29.inputChangedConnection = nil
	p_u_29.inputEndedConnection = nil
	p_u_29.lastPinchDistance = 1
	p_u_29.lastPanTime = 0
	p_u_29.lastPrimaryPointerInputBeganTime = 0
	p_u_29.lastPrimaryPointerInputBeganPosition = nil
	p_u_29.activeTouchInputs = {}
	p_u_29.numActiveTouchInputs = 0
	p_u_29.activeMouseInput = nil
	p_u_29.numActiveInputs = 0
	function p_u_29.handleScroll(_, p30)
		-- upvalues: (copy) p_u_29, (ref) v_u_3
		if p30.UserInputType == Enum.UserInputType.MouseWheel then
			local v31 = -p30.Position.Z
			p_u_29.props.zoomToPoint(v31, v_u_3:GetMouseLocation())
		end
	end
	function p_u_29.setInputNotChanged(_)
		-- upvalues: (copy) p_u_29
		for _, v32 in p_u_29.activeTouchInputs do
			v32.changedThisFrame = false
		end
	end
	function p_u_29.onInputChanged(p33, _)
		-- upvalues: (copy) p_u_29, (ref) v_u_3
		local v34 = p33.UserInputType == Enum.UserInputType.MouseMovement
		local v35 = p33.UserInputType == Enum.UserInputType.Touch
		if v34 or v35 then
			local v36 = p_u_29:getActiveInput(p33)
			if v36 then
				local v37 = tick()
				local v38 = v37 - v36.lastTime
				local v39 = p33.Position - v36.lastPosition
				local v40 = Vector2.new(v39.X, v39.Y) * Vector2.new(-1, 1)
				local v41 = v_u_3:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
				local v42 = v_u_3:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
				local v43 = v37 - p_u_29.lastPanTime > 0.1
				if (v34 and v41 or v35 and p_u_29.numActiveTouchInputs == 1) and v43 then
					p_u_29.props.rotateByPixels(-v40)
				end
				if v34 and v42 or v35 and p_u_29.numActiveTouchInputs == 2 then
					local v44 = v40 / p_u_29.numActiveInputs
					p_u_29.props.panByPixels(v44)
					p_u_29.lastPanTime = v37
				end
				v36.lastPosition = p33.Position
				v36.lastTime = v37
				if v35 then
					if v36.changedThisFrame then
						v36.lastDeltaPosition = v39 + v36.lastDeltaPosition
						v36.lastDeltaTime = v38 + v36.lastDeltaTime
						return
					end
					v36.lastDeltaPosition = v39
					v36.lastDeltaTime = v38
					v36.changedThisFrame = true
				end
			end
		else
			return
		end
	end
	function p_u_29.onInputEnded(p45, _)
		-- upvalues: (copy) p_u_29
		local v46 = p45.UserInputType == Enum.UserInputType.Touch
		local v47 = p45.UserInputType == Enum.UserInputType.MouseButton1
		local v48 = v47 or p45.UserInputType == Enum.UserInputType.MouseButton2
		if v46 or v48 then
			local v49 = p_u_29:getActiveInput(p45)
			if v49 then
				local v50 = tick()
				local v51 = v50 - p_u_29.lastPanTime
				if v46 then
					v46 = v49.changedThisFrame
				end
				local v52
				if p_u_29.numActiveInputs == 1 then
					v52 = v51 > 0.1
				else
					v52 = false
				end
				if (v46 or v47) and v52 then
					local v53, v54
					if v47 then
						v53 = p45.Position - v49.lastPosition
						v54 = v50 - v49.lastTime
					else
						v53 = v49.lastDeltaPosition
						v54 = v49.lastDeltaTime
					end
					p_u_29.props.setAngularVelocityByPixels(v53.X / v54)
				end
				p_u_29:removeActivePointerInput(p45, v48)
			end
		else
			return
		end
	end
	function p_u_29.onInputBegan(p55, p56)
		-- upvalues: (copy) p_u_29
		p_u_29.handleScroll(p55, p56)
		local v57 = p56.UserInputType == Enum.UserInputType.Touch
		local v58 = p56.UserInputType == Enum.UserInputType.MouseButton1
		local v59 = v58 or p56.UserInputType == Enum.UserInputType.MouseButton2
		if v57 or v59 then
			local v60 = tick()
			if v57 or v58 then
				p_u_29:handleDoubleTap(p56, v60)
			end
			p_u_29:addActivePointerInput(p56, v59, v60)
		end
	end
	function p_u_29.onTouchPinch(_, p61, _, _, p62)
		-- upvalues: (copy) p_u_29
		if p61[2] == nil then
			return
		elseif p62 == Enum.UserInputState.Begin then
			p_u_29.lastPinchDistance = (p61[1] - p61[2]).Magnitude
		else
			local v63 = (p61[1] - p61[2]).Magnitude
			local v64 = v63 - p_u_29.lastPinchDistance
			p_u_29.lastPinchDistance = v63
			p_u_29.props.zoomToPoint(v64 * -0.05, (p61[1] + p61[2]) / 2)
		end
	end
end
function v7.willUnmount(p65) -- name: willUnmount
	if p65.inputChangedConnection then
		p65:disconnectEvents()
	end
end
function v7.render(p66) -- name: render
	-- upvalues: (copy) v_u_5
	local v67 = p66.props.Visible
	local v68 = p66.props.Size or UDim2.new(1, 0, 1, 0)
	local v69 = p66.props.Position
	local v70 = p66.props.ZIndex
	return v_u_5.createElement("Frame", {
		["BackgroundTransparency"] = 1,
		["Size"] = v68,
		["Position"] = v69,
		["ZIndex"] = v70,
		["Visible"] = v67,
		["Active"] = true,
		[v_u_5.Event.InputBegan] = p66.onInputBegan,
		[v_u_5.Event.InputChanged] = p66.handleScroll,
		[v_u_5.Event.TouchPinch] = p66.onTouchPinch
	}, p66.props[v_u_5.Children])
end
return v7