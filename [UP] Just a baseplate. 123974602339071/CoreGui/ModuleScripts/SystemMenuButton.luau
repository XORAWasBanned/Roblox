-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.SideNavigation.SystemMenuButton
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v3 = require(v1.Packages.InGameMenuDependencies)
local v4 = v3.t
local v_u_5 = v3.Roact
local v_u_6 = require(script.Parent.CloseMenuButton)
local v_u_7 = require(script.Parent.GameIconButton)
local v8 = v_u_5.PureComponent:extend("SystemMenuButton")
v8.validateProps = v4.strictInterface({
	["on"] = v4.optional(v4.boolean),
	["anchorPoint"] = v4.optional(v4.Vector2),
	["position"] = v4.optional(v4.UDim2),
	["layoutOrder"] = v4.optional(v4.integer),
	["onActivated"] = v4.callback,
	["onClose"] = v4.callback,
	["canCaptureFocus"] = v4.optional(v4.boolean)
})
v8.defaultProps = {
	["on"] = false,
	["canCaptureFocus"] = false
}
function v8.tryCaptureFocus(p9, p10) -- name: tryCaptureFocus
	-- upvalues: (copy) v_u_2
	if p9.props.canCaptureFocus and not p10.canCaptureFocus or p9.props.canCaptureFocus and (p9.props.on ~= p10.on and p9.state.isIconFocused) then
		v_u_2.SelectedCoreObject = p9.iconRef:getValue()
	end
end
function v8.init(p_u_11) -- name: init
	-- upvalues: (copy) v_u_5
	p_u_11.iconRef = v_u_5.createRef()
	p_u_11:setState({
		["isIconFocused"] = false
	})
	function p_u_11.onIconSelectionGained()
		-- upvalues: (copy) p_u_11
		p_u_11:setState({
			["isIconFocused"] = true
		})
	end
	function p_u_11.onIconSelectionLost()
		-- upvalues: (copy) p_u_11
		p_u_11:setState({
			["isIconFocused"] = false
		})
	end
end
function v8.didMount(p12) -- name: didMount
	p12:tryCaptureFocus({
		["canCaptureFocus"] = false
	})
end
function v8.didUpdate(p13, p14) -- name: didUpdate
	p13:tryCaptureFocus(p14)
end
function v8.render(p15) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_7
	if p15.props.on then
		return v_u_5.createElement(v_u_6, {
			["onActivated"] = p15.props.onClose,
			["layoutOrder"] = p15.props.layoutOrder,
			["AnchorPoint"] = p15.props.anchorPoint,
			["Position"] = p15.props.position,
			["onSelectionGained"] = p15.onIconSelectionGained,
			["onSelectionLost"] = p15.onIconSelectionLost,
			[v_u_5.Ref] = p15.iconRef
		})
	else
		return v_u_5.createElement(v_u_7, {
			["onActivated"] = p15.props.onActivated,
			["layoutOrder"] = p15.props.layoutOrder,
			["anchorPoint"] = p15.props.anchorPoint,
			["position"] = p15.props.position,
			["onSelectionGained"] = p15.onIconSelectionGained,
			["onSelectionLost"] = p15.onIconSelectionLost,
			[v_u_5.Ref] = p15.iconRef
		})
	end
end
return v8