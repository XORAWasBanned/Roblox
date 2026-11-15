-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.PresentationMobile.DropDownButtonAnimator
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.t)
local v_u_5 = require(v1.Packages.Otter)
local v_u_6 = require(v1.Workspace.Packages.PlayerList).Common.useLayoutValues
local v7 = script.Parent.Parent.Connection
local v_u_8 = require(v7.LayoutValues).WithLayoutValues
local v_u_9 = require(script.Parent.DropDownButton)
local v_u_10 = {
	["dampingRatio"] = 1,
	["frequency"] = 4
}
local v_u_11 = {
	["dampingRatio"] = 1,
	["frequency"] = 4
}
local v_u_12 = v_u_3.PureComponent:extend("DropDownAnimator")
v_u_12.validateProps = v4.strictInterface({
	["text"] = v4.string,
	["icon"] = v4.union(v4.string, v4.table),
	["lastButton"] = v4.boolean,
	["layoutOrder"] = v4.integer,
	["onActivated"] = v4.callback,
	["forceShowOptions"] = v4.boolean,
	["selectedPlayer"] = v4.optional(v4.instanceIsA("Player")),
	["onDecline"] = v4.optional(v4.callback),
	["onDismiss"] = v4.optional(v4.callback),
	["contentVisible"] = v4.boolean,
	["layoutValues"] = v4.optional(v4.table),
	["onAnimationComplete"] = v4.optional(v4.callback),
	["forwardRef"] = v4.optional(v4.callback)
})
function v_u_12.init(p_u_13) -- name: init
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_10
	p_u_13.state = {
		["lastButtonProps"] = nil,
		["onDeclineCalled"] = nil,
		["onActivatedCalled"] = nil,
		["overlayPercentage"] = 0
	}
	local v14, v15 = v_u_3.createBinding(UDim2.new(0, 0, 0, 0))
	p_u_13.currentButtonPosition = v14
	p_u_13.updateCurrentButtonPosition = v15
	local v16, v17 = v_u_3.createBinding(UDim2.new(0, 0, 0, 0))
	p_u_13.lastButtonPosition = v16
	p_u_13.updateLastButtonPosition = v17
	p_u_13.positionMotor = v_u_5.createSingleMotor(0)
	p_u_13.positionMotor:onStep(function(p18)
		-- upvalues: (copy) p_u_13
		p_u_13.updateCurrentButtonPosition(UDim2.new(p18, 0, 0, 0))
		if p_u_13.animatingRight then
			p_u_13.updateLastButtonPosition(UDim2.new(p18 + 1, 0, 0, 0))
		else
			p_u_13.updateLastButtonPosition(UDim2.new(p18 - 1, 0, 0, 0))
		end
	end)
	p_u_13.positionMotor:onComplete(function(p19)
		-- upvalues: (copy) p_u_13, (ref) v_u_3
		if p19 == 0 then
			p_u_13:setState({
				["lastButtonProps"] = v_u_3.None,
				["onDeclineCalled"] = v_u_3.None,
				["onActivatedCalled"] = v_u_3.None
			})
		end
	end)
	p_u_13.overlayMotor = v_u_5.createSingleMotor(0)
	p_u_13.overlayMotor:onStep(function(p20)
		-- upvalues: (copy) p_u_13
		p_u_13:setState({
			["overlayPercentage"] = p20
		})
	end)
	p_u_13.overlayMotor:onComplete(function(p21)
		-- upvalues: (copy) p_u_13, (ref) v_u_5, (ref) v_u_10
		if p21 == 1 then
			p_u_13.positionMotor:setGoal(v_u_5.spring(0, v_u_10))
		end
	end)
end
function v_u_12.getButtonProps(p_u_22, p_u_23, p24) -- name: getButtonProps
	local v25 = {
		["text"] = p_u_23.text,
		["icon"] = p_u_23.icon,
		["lastButton"] = p_u_23.lastButton,
		["forceShowOptions"] = p_u_23.forceShowOptions,
		["onDismiss"] = p_u_23.onDismiss
	}
	if p_u_22.state.lastButtonProps ~= nil then
		if p24 then
			v25.animatingAccept = p_u_22.state.onActivatedCalled
			v25.animatingDecline = p_u_22.state.onDeclineCalled
			v25.animatingPercentage = p_u_22.state.overlayPercentage
			return v25
		end
	else
		if p_u_23.onActivated and (p_u_23.onDecline or p_u_22.props.forceShowOptions) then
			function v25.onActivated()
				-- upvalues: (copy) p_u_22, (copy) p_u_23
				p_u_22:setState({
					["onActivatedCalled"] = true,
					["onDeclineCalled"] = false
				})
				p_u_23.onActivated()
			end
		elseif p_u_23.onActivated then
			v25.onActivated = p_u_23.onActivated
		end
		if p_u_23.onDecline then
			function v25.onDecline()
				-- upvalues: (copy) p_u_22, (copy) p_u_23
				p_u_22:setState({
					["onActivatedCalled"] = false,
					["onDeclineCalled"] = true
				})
				p_u_23.onDecline()
			end
		end
	end
	return v25
end
function v_u_12.render(p_u_26) -- name: render
	-- upvalues: (copy) v_u_8, (copy) v_u_3, (copy) v_u_9
	return v_u_8(function(_)
		-- upvalues: (copy) p_u_26, (ref) v_u_3, (ref) v_u_9
		local v27 = p_u_26.props.layoutValues
		local v28 = {
			["CurrentButtonContainer"] = v_u_3.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["Position"] = p_u_26.currentButtonPosition
			}, {
				["DropDownButton"] = v_u_3.createElement(v_u_9, p_u_26:getButtonProps(p_u_26.props))
			})
		}
		if p_u_26.state.lastButtonProps then
			v28.LastButtonContainer = v_u_3.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["Position"] = p_u_26.lastButtonPosition
			}, {
				["DropDownButton"] = v_u_3.createElement(v_u_9, p_u_26:getButtonProps(p_u_26.state.lastButtonProps, true))
			})
		end
		return v_u_3.createElement("Frame", {
			["Visible"] = p_u_26.props.contentVisible,
			["ZIndex"] = 2,
			["Size"] = UDim2.new(1, 0, 0, v27.DropDownButtonSizeY),
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = p_u_26.props.layoutOrder,
			[v_u_3.Ref] = p_u_26.props.forwardRef
		}, v28)
	end)
end
function v_u_12.didUpdate(p29, p30, p31) -- name: didUpdate
	-- upvalues: (copy) v_u_5, (copy) v_u_11, (copy) v_u_3
	local v32 = p29.props.text ~= p30.text
	local v33 = p30.onDecline ~= nil and true or p29.props.forceShowOptions
	local v34 = p29.state.onDeclineCalled or p29.state.onActivatedCalled
	local v35
	if p29.state.lastButtonProps == nil then
		v35 = p31.lastButtonProps ~= nil
	else
		v35 = false
	end
	if v32 and (v33 and v34) then
		if p29.state.onActivatedCalled and not p29.props.forceShowOptions then
			p29.animatingRight = true
			p29.positionMotor:setGoal(v_u_5.instant(-1))
		else
			p29.animatingRight = false
			p29.positionMotor:setGoal(v_u_5.instant(1))
		end
		p29.overlayMotor:setGoal(v_u_5.instant(0))
		p29.positionMotor:step(0)
		p29.overlayMotor:step(0)
		p29:setState({
			["lastButtonProps"] = p30
		})
		p29.overlayMotor:setGoal(v_u_5.spring(1, v_u_11))
	end
	if v35 and p29.props.onAnimationComplete then
		p29.props.onAnimationComplete()
	end
	if p29.props.selectedPlayer ~= p30.selectedPlayer then
		p29.positionMotor:setGoal(v_u_5.instant(0))
		p29.overlayMotor:setGoal(v_u_5.instant(0))
		p29.positionMotor:step(0)
		p29.overlayMotor:step(0)
		p29:setState({
			["lastButtonProps"] = v_u_3.None
		})
	end
end
function v_u_12.willUnmount(p36) -- name: willUnmount
	p36.positionMotor:destroy()
	p36.positionMotor = nil
	p36.overlayMotor:destroy()
	p36.overlayMotor = nil
end
return function(p37)
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_12, (copy) v_u_2
	local v38 = {
		["layoutValues"] = v_u_6()
	}
	return v_u_3.createElement(v_u_12, v_u_2.Dictionary.join(p37, v38))
end