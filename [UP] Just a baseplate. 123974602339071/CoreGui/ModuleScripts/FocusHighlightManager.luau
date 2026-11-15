-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.Connection.FocusHighlightManager
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v3 = require(v1.Packages.InGameMenuDependencies)
local v_u_4 = v3.Roact
local v5 = v3.RoactRodux
local v6 = v3.t
local v7 = script.Parent.Parent.Parent
local v_u_8 = require(v7.Resources.Constants).InputType
local v_u_9 = require(v7.Flags.GetFFlagIGMGamepadSelectionHistory)
local v_u_10 = require(script.Parent.FocusHandler)
local v11 = v_u_4.PureComponent:extend("FocusHighlightManager")
v11.validateProps = v6.strictInterface({
	["menuOpen"] = v6.boolean,
	["inputType"] = v6.string
})
function v11.render(p12) -- name: render
	-- upvalues: (copy) v_u_9, (copy) v_u_4, (copy) v_u_10, (copy) v_u_8, (copy) v_u_2
	if v_u_9() then
		return v_u_4.createElement(v_u_10, {
			["isFocused"] = not p12.props.menuOpen or p12.props.inputType ~= v_u_8.Gamepad,
			["didFocus"] = function() -- name: didFocus
				-- upvalues: (ref) v_u_2
				v_u_2.SelectedCoreObject = nil
			end
		})
	end
	local v13 = v_u_4.createElement
	local v14 = v_u_10
	local v15 = {}
	local v16 = p12.props.menuOpen
	if v16 then
		v16 = p12.props.inputType == v_u_8.Gamepad
	end
	v15.isFocused = v16
	function v15.didBlur() -- name: didBlur
		-- upvalues: (ref) v_u_2
		v_u_2.SelectedCoreObject = nil
	end
	return v13(v14, v15)
end
return v5.UNSTABLE_connect2(function(p17)
	return {
		["menuOpen"] = p17.isMenuOpen,
		["inputType"] = p17.displayOptions.inputType
	}
end)(v11)