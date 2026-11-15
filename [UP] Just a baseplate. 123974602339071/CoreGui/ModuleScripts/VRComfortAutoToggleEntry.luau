-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.GameSettingsPage.VRComfortAutoToggleEntry
local v1 = game:GetService("CorePackages")
local v_u_2 = UserSettings():GetService("UserGameSettings")
local v3 = require(v1.Packages.InGameMenuDependencies)
local v_u_4 = v3.Roact
local v5 = v3.t
local v6 = script.Parent.Parent.Parent
local v_u_7 = require(v6.Utility.ExternalEventConnection)
local v_u_8 = require(script.Parent.ToggleEntry)
local v_u_9 = require(v6.Utility.SendAnalytics)
local v_u_10 = require(v6.Resources.Constants)
local v_u_11 = v_u_2:GetPropertyChangedSignal("VRComfortSetting")
local v12 = v_u_4.PureComponent:extend("VRComfortAutoToggleEntry")
v12.validateProps = v5.strictInterface({
	["customValueKey"] = v5.string,
	["derivedValueKey"] = v5.string,
	["labelKey"] = v5.string,
	["LayoutOrder"] = v5.integer,
	["checkedValue"] = v5.optional(v5.any)
})
v12.defaultProps = {
	["checkedValue"] = true
}
function v12.init(p_u_13, p_u_14) -- name: init
	-- upvalues: (copy) v_u_2, (copy) v_u_9, (copy) v_u_10
	p_u_13.derivedValueChangeEvent = v_u_2:GetPropertyChangedSignal(p_u_14.derivedValueKey)
	p_u_13:setState({
		["checked"] = v_u_2[p_u_14.derivedValueKey] == p_u_14.checkedValue,
		["vrComfortSetting"] = v_u_2.VRComfortSetting
	})
	function p_u_13.onExternalChange()
		-- upvalues: (ref) v_u_2, (copy) p_u_14, (copy) p_u_13
		p_u_13:setState({
			["checked"] = v_u_2[p_u_14.derivedValueKey] == p_u_14.checkedValue
		})
	end
	function p_u_13.onToggled()
		-- upvalues: (copy) p_u_13, (ref) v_u_2, (copy) p_u_14, (ref) v_u_9, (ref) v_u_10
		if p_u_13.state.vrComfortSetting == Enum.VRComfortSetting.Custom then
			if v_u_2[p_u_14.customValueKey] == p_u_14.checkedValue then
				v_u_2[p_u_14.customValueKey] = not p_u_14.checkedValue
			else
				v_u_2[p_u_14.customValueKey] = p_u_14.checkedValue
			end
			v_u_9(v_u_10.AnalyticsSettingsChangeName, nil, {}, true)
		end
	end
end
function v12.render(p_u_15) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_7, (copy) v_u_11, (copy) v_u_2
	local v16 = p_u_15.props
	local v17 = v_u_4.createFragment
	local v18 = {
		["Toggle"] = v_u_4.createElement(v_u_8, {
			["checked"] = p_u_15.state.checked,
			["labelKey"] = v16.labelKey,
			["LayoutOrder"] = v16.LayoutOrder,
			["onToggled"] = p_u_15.onToggled,
			["isDisabled"] = p_u_15.state.vrComfortSetting ~= Enum.VRComfortSetting.Custom
		}),
		["DerivedValueListener"] = v_u_4.createElement(v_u_7, {
			["event"] = p_u_15.derivedValueChangeEvent,
			["callback"] = p_u_15.onExternalChange
		})
	}
	local v19 = {
		["event"] = v_u_11,
		["callback"] = function() -- name: callback
			-- upvalues: (copy) p_u_15, (ref) v_u_2
			p_u_15:setState({
				["vrComfortSetting"] = v_u_2.VRComfortSetting
			})
		end
	}
	v18.VRComfortSettingListener = v_u_4.createElement(v_u_7, v19)
	return v17(v18)
end
return v12