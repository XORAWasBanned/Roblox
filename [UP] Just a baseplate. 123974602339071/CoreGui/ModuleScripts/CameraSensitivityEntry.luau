-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.GameSettingsPage.CameraSensitivityEntry
local v_u_1 = UserSettings():GetService("UserGameSettings")
local v2 = game:GetService("CorePackages")
local v3 = require(v2.Packages.InGameMenuDependencies)
local v_u_4 = v3.Roact
local v5 = v3.t
local v_u_6 = {
	v_u_1:GetPropertyChangedSignal("GamepadCameraSensitivity"),
	v_u_1:GetPropertyChangedSignal("MouseSensitivity"),
	v_u_1:GetPropertyChangedSignal("MouseSensitivityFirstPerson"),
	v_u_1:GetPropertyChangedSignal("MouseSensitivityThirdPerson")
}
local v7 = script.Parent.Parent.Parent
local v_u_8 = require(v7.Utility.ExternalEventConnection)
local v_u_9 = require(script.Parent.SliderEntry)
local v_u_10 = require(v7.Utility.SendAnalytics)
local v_u_11 = require(v7.Resources.Constants)
local v12 = v_u_4.PureComponent:extend("CameraSensitivityEntry")
v12.validateProps = v5.strictInterface({
	["LayoutOrder"] = v5.integer,
	["canCaptureFocus"] = v5.optional(v5.boolean),
	["isMenuOpen"] = v5.optional(v5.boolean)
})
function v12.init(p_u_13) -- name: init
	-- upvalues: (copy) v_u_1
	function p_u_13.onSensitivityChanged()
		-- upvalues: (copy) p_u_13, (ref) v_u_1
		p_u_13:setState({
			["engineSensitivity"] = v_u_1.MouseSensitivityFirstPerson.X
		})
	end
	p_u_13.onSensitivityChanged()
end
function v12.render(p14) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_1, (copy) v_u_10, (copy) v_u_11, (copy) v_u_6, (copy) v_u_8
	local v15 = {}
	local v16 = v_u_4.createElement
	local v17 = v_u_9
	local v18 = {
		["LayoutOrder"] = nil,
		["labelKey"] = "CoreScripts.InGameMenu.GameSettings.CameraSensitivity",
		["value"] = nil,
		["min"] = 0,
		["max"] = 10,
		["stepInterval"] = 1,
		["keyboardInputStepInterval"] = 0.01,
		["valueChanged"] = nil,
		["canCaptureFocus"] = nil,
		["isMenuOpen"] = nil,
		["LayoutOrder"] = p14.props.LayoutOrder
	}
	local v19 = p14.state.engineSensitivity
	local v20
	if v19 <= 1 then
		v20 = (v19 - 0.01) / 0.198
	else
		v20 = (v19 + 2) / 0.6
	end
	local v21 = v20 / 0.01 + 0.5
	local v22 = math.floor(v21) * 0.01
	v18.value = math.clamp(v22, 0, 10)
	function v18.valueChanged(p23) -- name: valueChanged
		-- upvalues: (ref) v_u_1, (ref) v_u_10, (ref) v_u_11
		local v24
		if p23 <= 5 then
			v24 = 0.198 * p23 + 0.01
		else
			v24 = 0.6 * p23 - 2
		end
		local v25 = math.clamp(v24, 0, 10)
		local v26 = Vector2.new(v25, v25)
		v_u_1.MouseSensitivityFirstPerson = v26
		v_u_1.MouseSensitivityThirdPerson = v26
		v_u_10(v_u_11.AnalyticsSettingsChangeName, nil, {}, true)
	end
	v18.canCaptureFocus = p14.props.canCaptureFocus
	v18.isMenuOpen = p14.props.isMenuOpen
	v15.CameraSensitivityMouseSlider = v16(v17, v18)
	for _, v27 in ipairs(v_u_6) do
		v15[tostring(v27) .. "CameraSensitivityControlConnection"] = v_u_4.createElement(v_u_8, {
			["event"] = v27,
			["callback"] = p14.onSensitivityChanged
		})
	end
	return v_u_4.createFragment(v15)
end
return v12