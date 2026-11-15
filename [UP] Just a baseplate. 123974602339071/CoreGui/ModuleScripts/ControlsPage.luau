-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ControlsPage
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = require(v1.Workspace.Packages.MockableProxyServices).VRService
local v4 = require(v1.Packages.InGameMenuDependencies)
local v_u_5 = v4.Roact
local v6 = v4.RoactRodux
local v7 = v4.t
local v8 = script.Parent.Parent
local v_u_9 = require(v8.Resources.Controls)
local v_u_10 = require(script.ControlLayouts.KeyboardControls)
local v_u_11 = require(script.ControlLayouts.GamepadControls)
local v_u_12 = require(script.ControlLayouts.VRGamepadControlsWrapper)
local v_u_13 = require(v1.Workspace.Packages.VrCommon).VRUtil
local v_u_14 = require(v8.Components.Connection.FocusHandler)
local v15 = v_u_5.PureComponent:extend("ControlsPage")
v15.validateProps = v7.strictInterface({
	["pageTitle"] = v7.string,
	["controlLayout"] = v7.optional(v7.string),
	["canCaptureFocus"] = v7.optional(v7.boolean)
})
function v15.init(p16) -- name: init
	-- upvalues: (copy) v_u_5
	p16.closeButtonRef = v_u_5.createRef()
end
function v15.render(p_u_17) -- name: render
	-- upvalues: (copy) v_u_9, (copy) v_u_5, (copy) v_u_10, (copy) v_u_3, (copy) v_u_13, (copy) v_u_12, (copy) v_u_11, (copy) v_u_14, (copy) v_u_2
	local v18 = p_u_17.props.controlLayout
	if v18 == v_u_9.ControlLayouts.KEYBOARD then
		return v_u_5.createElement(v_u_10)
	end
	if v18 ~= v_u_9.ControlLayouts.GAMEPAD then
		return nil
	end
	if v_u_3.VREnabled and v_u_13.getCurrentControllerType() == "Touch" then
		return v_u_5.createElement(v_u_12)
	end
	local v19 = v_u_5.createFragment
	local v21 = {
		["GamepadControls"] = v_u_5.createElement(v_u_11, {
			["closeButtonRef"] = p_u_17.closeButtonRef
		}),
		["FocusHandler"] = v_u_5.createElement(v_u_14, {
			["isFocused"] = p_u_17.props.canCaptureFocus,
			["didFocus"] = function() -- name: didFocus
				-- upvalues: (copy) p_u_17, (ref) v_u_2
				local v20 = p_u_17.closeButtonRef:getValue()
				v_u_2:AddSelectionParent("IGMControlsPage_CloseButtonSelectionGroup", v20)
				v_u_2.SelectedCoreObject = v20
			end,
			["didBlur"] = function() -- name: didBlur
				-- upvalues: (ref) v_u_2
				v_u_2:RemoveSelectionGroup("IGMControlsPage_CloseButtonSelectionGroup")
			end
		})
	}
	return v19(v21)
end
return v6.UNSTABLE_connect2(function(p22)
	return {
		["controlLayout"] = p22.controlLayout,
		["canCaptureFocus"] = p22.menuPage == "Controls"
	}
end)(v15)