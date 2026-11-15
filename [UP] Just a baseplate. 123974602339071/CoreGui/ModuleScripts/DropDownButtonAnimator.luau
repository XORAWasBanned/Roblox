-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Presentation.DropDownButtonAnimator
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.t)
local v_u_4 = require(v1.Packages.Otter)
local v5 = script.Parent.Parent.Connection
local v_u_6 = require(v5.LayoutValues).WithLayoutValues
local v_u_7 = require(script.Parent.DropDownButton)
local v_u_8 = {
	["dampingRatio"] = 1,
	["frequency"] = 4
}
local v_u_9 = {
	["dampingRatio"] = 1,
	["frequency"] = 4
}
local v10 = v_u_2.PureComponent:extend("DropDownAnimator")
v10.validateProps = v3.strictInterface({
	["text"] = v3.string,
	["icon"] = v3.union(v3.string, v3.table),
	["lastButton"] = v3.boolean,
	["layoutOrder"] = v3.integer,
	["onActivated"] = v3.callback,
	["forceShowOptions"] = v3.boolean,
	["selectedPlayer"] = v3.optional(v3.instanceIsA("Player")),
	["onDecline"] = v3.optional(v3.callback),
	["onDismiss"] = v3.optional(v3.callback)
})
function v10.init(p_u_11) -- name: init
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_8
	p_u_11.state = {
		["lastButtonProps"] = nil,
		["onDeclineCalled"] = nil,
		["onActivatedCalled"] = nil,
		["overlayPercentage"] = 0
	}
	local v12, v13 = v_u_2.createBinding(UDim2.new(0, 0, 0, 0))
	p_u_11.currentButtonPosition = v12
	p_u_11.updateCurrentButtonPosition = v13
	local v14, v15 = v_u_2.createBinding(UDim2.new(0, 0, 0, 0))
	p_u_11.lastButtonPosition = v14
	p_u_11.updateLastButtonPosition = v15
	p_u_11.positionMotor = v_u_4.createSingleMotor(0)
	p_u_11.positionMotor:onStep(function(p16)
		-- upvalues: (copy) p_u_11
		p_u_11.updateCurrentButtonPosition(UDim2.new(p16, 0, 0, 0))
		if p_u_11.animatingRight then
			p_u_11.updateLastButtonPosition(UDim2.new(p16 + 1, 0, 0, 0))
		else
			p_u_11.updateLastButtonPosition(UDim2.new(p16 - 1, 0, 0, 0))
		end
	end)
	p_u_11.positionMotor:onComplete(function(p17)
		-- upvalues: (copy) p_u_11, (ref) v_u_2
		if p17 == 0 then
			p_u_11:setState({
				["lastButtonProps"] = v_u_2.None,
				["onDeclineCalled"] = v_u_2.None,
				["onActivatedCalled"] = v_u_2.None
			})
		end
	end)
	p_u_11.overlayMotor = v_u_4.createSingleMotor(0)
	p_u_11.overlayMotor:onStep(function(p18)
		-- upvalues: (copy) p_u_11
		p_u_11:setState({
			["overlayPercentage"] = p18
		})
	end)
	p_u_11.overlayMotor:onComplete(function(p19)
		-- upvalues: (copy) p_u_11, (ref) v_u_4, (ref) v_u_8
		if p19 == 1 then
			p_u_11.positionMotor:setGoal(v_u_4.spring(0, v_u_8))
		end
	end)
end
function v10.getButtonProps(p_u_20, p_u_21, p22) -- name: getButtonProps
	local v23 = {
		["text"] = p_u_21.text,
		["icon"] = p_u_21.icon,
		["lastButton"] = p_u_21.lastButton,
		["forceShowOptions"] = p_u_21.forceShowOptions,
		["onDismiss"] = p_u_21.onDismiss
	}
	if p_u_20.state.lastButtonProps ~= nil then
		if p22 then
			v23.animatingAccept = p_u_20.state.onActivatedCalled
			v23.animatingDecline = p_u_20.state.onDeclineCalled
			v23.animatingPercentage = p_u_20.state.overlayPercentage
			return v23
		end
	else
		if p_u_21.onActivated and (p_u_21.onDecline or p_u_20.props.forceShowOptions) then
			function v23.onActivated()
				-- upvalues: (copy) p_u_20, (copy) p_u_21
				p_u_20:setState({
					["onActivatedCalled"] = true,
					["onDeclineCalled"] = false
				})
				p_u_21.onActivated()
			end
		elseif p_u_21.onActivated then
			v23.onActivated = p_u_21.onActivated
		end
		if p_u_21.onDecline then
			function v23.onDecline()
				-- upvalues: (copy) p_u_20, (copy) p_u_21
				p_u_20:setState({
					["onActivatedCalled"] = false,
					["onDeclineCalled"] = true
				})
				p_u_21.onDecline()
			end
		end
	end
	return v23
end
function v10.render(p_u_24) -- name: render
	-- upvalues: (copy) v_u_6, (copy) v_u_2, (copy) v_u_7
	return v_u_6(function(p25)
		-- upvalues: (ref) v_u_2, (copy) p_u_24, (ref) v_u_7
		local v26 = {
			["CurrentButtonContainer"] = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["Position"] = p_u_24.currentButtonPosition
			}, {
				["DropDownButton"] = v_u_2.createElement(v_u_7, p_u_24:getButtonProps(p_u_24.props))
			})
		}
		if p_u_24.state.lastButtonProps then
			v26.LastButtonContainer = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["Position"] = p_u_24.lastButtonPosition
			}, {
				["DropDownButton"] = v_u_2.createElement(v_u_7, p_u_24:getButtonProps(p_u_24.state.lastButtonProps, true))
			})
		end
		return v_u_2.createElement("Frame", {
			["ZIndex"] = 2,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = nil,
			["Size"] = UDim2.new(1, 0, 0, p25.DropDownButtonSizeY),
			["LayoutOrder"] = p_u_24.props.layoutOrder
		}, v26)
	end)
end
function v10.didUpdate(p27, p28, _) -- name: didUpdate
	-- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_2
	if p27.props.text ~= p28.text and ((p28.onDecline ~= nil and true or p27.props.forceShowOptions) and (p27.state.onDeclineCalled or p27.state.onActivatedCalled)) then
		if p27.state.onActivatedCalled and not p27.props.forceShowOptions then
			p27.animatingRight = true
			p27.positionMotor:setGoal(v_u_4.instant(-1))
		else
			p27.animatingRight = false
			p27.positionMotor:setGoal(v_u_4.instant(1))
		end
		p27.overlayMotor:setGoal(v_u_4.instant(0))
		p27.positionMotor:step(0)
		p27.overlayMotor:step(0)
		p27:setState({
			["lastButtonProps"] = p28
		})
		p27.overlayMotor:setGoal(v_u_4.spring(1, v_u_9))
	end
	if p27.props.selectedPlayer ~= p28.selectedPlayer then
		p27.positionMotor:setGoal(v_u_4.instant(0))
		p27.overlayMotor:setGoal(v_u_4.instant(0))
		p27.positionMotor:step(0)
		p27.overlayMotor:step(0)
		p27:setState({
			["lastButtonProps"] = v_u_2.None
		})
	end
end
function v10.willUnmount(p29) -- name: willUnmount
	p29.positionMotor:destroy()
	p29.positionMotor = nil
	p29.overlayMotor:destroy()
	p29.overlayMotor = nil
end
return v10