-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.Connection.MouseOverrideManager
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("VRService")
local v4 = require(v1.Workspace.Packages.AppCommonLib).Symbol
local v_u_5 = require(v1.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local v6 = require(v1.Packages.InGameMenuDependencies)
local v_u_7 = v6.Roact
local v8 = v6.RoactRodux
local v9 = v6.t
local v10 = script.Parent.Parent.Parent
local v11 = require(v10.Resources.Constants)
local v_u_12 = require(v10.Utility.ExternalEventConnection)
local v_u_13 = v4.named("InGameMenuCursorOverride")
local v_u_14 = v11.InputType
local v15 = v_u_7.PureComponent:extend("MouseOverrideManager")
v15.validateProps = v9.strictInterface({
	["menuOpen"] = v9.boolean,
	["exitModalOpen"] = v9.boolean,
	["inputType"] = v9.string
})
function v15.render(p_u_16) -- name: render
	-- upvalues: (copy) v_u_7, (copy) v_u_12, (copy) v_u_2
	local v_u_17 = p_u_16.props.exitModalOpen
	return v_u_7.createElement(v_u_12, {
		["event"] = v_u_2:GetPropertyChangedSignal("OverrideMouseIconBehavior"),
		["callback"] = function() -- name: callback
			-- upvalues: (copy) p_u_16, (copy) v_u_17, (ref) v_u_2
			if (p_u_16.props.menuOpen or v_u_17) and v_u_2.OverrideMouseIconBehavior == Enum.OverrideMouseIconBehavior.None then
				p_u_16:updateMouseIconOverride()
			end
		end
	})
end
function v15.init(p18) -- name: init
	p18.didOverrideMouse = false
end
function v15.updateMouseIconOverride(p19) -- name: updateMouseIconOverride
	-- upvalues: (copy) v_u_14, (copy) v_u_3, (copy) v_u_5, (copy) v_u_13
	local v20 = p19.props.exitModalOpen
	if p19.props.menuOpen or v20 then
		p19.didOverrideMouse = true
		if p19.props.inputType == v_u_14.Gamepad or v_u_3.VREnabled then
			v_u_5.push(v_u_13, Enum.OverrideMouseIconBehavior.ForceHide)
		else
			v_u_5.push(v_u_13, Enum.OverrideMouseIconBehavior.ForceShow)
		end
	else
		if p19.didOverrideMouse then
			p19.didOverrideMouse = false
			v_u_5.pop(v_u_13)
		end
		return
	end
end
function v15.didMount(p21) -- name: didMount
	p21:updateMouseIconOverride()
end
function v15.didUpdate(p22) -- name: didUpdate
	p22:updateMouseIconOverride()
end
return v8.UNSTABLE_connect2(function(p23)
	local v24 = p23.nativeClosePrompt.closingApp
	return {
		["menuOpen"] = p23.isMenuOpen,
		["exitModalOpen"] = v24,
		["inputType"] = p23.displayOptions.inputType
	}
end, nil)(v15)