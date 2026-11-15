-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Components.Prompts.PromptWithAvatarViewport
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v4 = require(v1.Packages.t)
local v_u_5 = require(v1.Packages.UIBlox).App.Dialog.Alert.InteractiveAlert
local v6 = script.Parent.Parent
local v7 = v6.Parent
local v_u_8 = require(v6.HumanoidViewport)
local v_u_9 = require(v7.GetConformedHumanoidDescription)
local v10 = v_u_2.PureComponent:extend("PromptWithAvatarViewport")
v10.validateProps = v4.strictInterface({
	["humanoidDescription"] = v4.instanceOf("HumanoidDescription"),
	["rigType"] = v4.enum(Enum.HumanoidRigType),
	["title"] = v4.string,
	["bodyText"] = v4.optional(v4.string),
	["buttonStackInfo"] = v4.table,
	["screenSize"] = v4.Vector2
})
function v10.init(p_u_11) -- name: init
	-- upvalues: (copy) v_u_2
	p_u_11.mounted = false
	p_u_11.middleContentRef = v_u_2.createRef()
	local v12, v13 = v_u_2.createBinding(UDim2.new(1, 0, 0, 200))
	p_u_11.contentSize = v12
	p_u_11.updateContentSize = v13
	p_u_11:setState({
		["conformedHumanoidDescription"] = nil,
		["getConformedDescriptionFailed"] = false
	})
	function p_u_11.onAlertSizeChanged(p14)
		-- upvalues: (copy) p_u_11
		local v15 = p14.AbsoluteSize
		if p_u_11.middleContentRef:getValue() then
			local v16 = p_u_11.middleContentRef:getValue().AbsoluteSize.Y
			local v17 = v15.Y - v16
			local v18 = p_u_11.props.screenSize.Y - 60 - v17
			local v19 = p_u_11.middleContentRef:getValue().AbsoluteSize.X - 20
			if v19 >= v18 then
				v19 = v18
			end
			if v16 ~= v19 then
				p_u_11.updateContentSize(UDim2.new(1, 0, 0, v19))
			end
		end
	end
	function p_u_11.retryLoadDescription()
		-- upvalues: (copy) p_u_11
		p_u_11:setState({
			["getConformedDescriptionFailed"] = false
		})
		p_u_11:getConformedHumanoidDescription()
	end
end
function v10.renderAlertMiddleContent(p20) -- name: renderAlertMiddleContent
	-- upvalues: (copy) v_u_2, (copy) v_u_8
	local v21 = p20.state.conformedHumanoidDescription
	local v22 = p20.state.getConformedDescriptionFailed
	local v23 = v_u_2.createElement
	local v24 = {
		["BackgroundTransparency"] = 1,
		["Size"] = p20.contentSize,
		[v_u_2.Ref] = p20.middleContentRef
	}
	local v25 = {
		["HumanoidViewport"] = v_u_2.createElement(v_u_8, {
			["humanoidDescription"] = v21,
			["loadingFailed"] = v22,
			["retryLoadDescription"] = p20.retryLoadDescription,
			["rigType"] = p20.props.rigType
		})
	}
	return v23("Frame", v24, v25)
end
function v10.render(p_u_26) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_5
	return v_u_2.createElement(v_u_5, {
		["title"] = nil,
		["bodyText"] = nil,
		["buttonStackInfo"] = nil,
		["position"] = nil,
		["screenSize"] = nil,
		["middleContent"] = nil,
		["onAbsoluteSizeChanged"] = nil,
		["isMiddleContentFocusable"] = false,
		["title"] = p_u_26.props.title,
		["bodyText"] = p_u_26.props.bodyText,
		["buttonStackInfo"] = p_u_26.props.buttonStackInfo,
		["position"] = UDim2.fromScale(0.5, 0.5),
		["screenSize"] = p_u_26.props.screenSize,
		["middleContent"] = function() -- name: middleContent
			-- upvalues: (copy) p_u_26
			return p_u_26:renderAlertMiddleContent()
		end,
		["onAbsoluteSizeChanged"] = p_u_26.onAlertSizeChanged
	})
end
function v10.getConformedHumanoidDescription(p_u_27, p28) -- name: getConformedHumanoidDescription
	-- upvalues: (copy) v_u_9
	v_u_9(p28, true):andThen(function(p29)
		-- upvalues: (copy) p_u_27
		if p_u_27.mounted then
			p_u_27:setState({
				["conformedHumanoidDescription"] = p29
			})
		end
	end, function(_)
		-- upvalues: (copy) p_u_27
		if p_u_27.mounted then
			p_u_27:setState({
				["getConformedDescriptionFailed"] = true
			})
		end
	end)
end
function v10.didMount(p30) -- name: didMount
	p30.mounted = true
	p30:getConformedHumanoidDescription(p30.props.humanoidDescription)
end
function v10.didUpdate(p31, p32, _) -- name: didUpdate
	-- upvalues: (copy) v_u_2
	if p32.humanoidDescription ~= p31.props.humanoidDescription then
		p31:setState({
			["conformedHumanoidDescription"] = nil,
			["getConformedDescriptionFailed"] = false,
			["conformedHumanoidDescription"] = v_u_2.None
		})
		p31:getConformedHumanoidDescription(p31.props.humanoidDescription)
	end
end
function v10.willUnmount(p33) -- name: willUnmount
	p33.mounted = false
end
return v3.connect(function(p34) -- name: mapStateToProps
	return {
		["screenSize"] = p34.screenSize
	}
end, nil)(v10)