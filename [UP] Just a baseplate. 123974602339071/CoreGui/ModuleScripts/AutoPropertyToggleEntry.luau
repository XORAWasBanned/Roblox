-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.GameSettingsPage.AutoPropertyToggleEntry
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.t
local v5 = script.Parent.Parent.Parent
local v_u_6 = require(v5.Utility.ExternalEventConnection)
local v_u_7 = require(script.Parent.ToggleEntry)
local v_u_8 = require(v5.Utility.SendAnalytics)
local v_u_9 = require(v5.Resources.Constants)
local v10 = v_u_3.PureComponent:extend("AutoPropertyToggleEntry")
v10.validateProps = v4.strictInterface({
	["instance"] = v4.Instance,
	["valueKey"] = v4.string,
	["lockedToOff"] = v4.optional(v4.boolean),
	["onValue"] = v4.optional(v4.any),
	["offValue"] = v4.optional(v4.any),
	["labelKey"] = v4.string,
	["LayoutOrder"] = v4.integer,
	["subtextEnabled"] = v4.optional(v4.boolean),
	["subtextKey"] = v4.optional(v4.string)
})
v10.defaultProps = {
	["onValue"] = true,
	["offValue"] = false,
	["lockedToOff"] = false,
	["subtextEnabled"] = false,
	["subtextKey"] = ""
}
function v10.init(p_u_11, p_u_12) -- name: init
	-- upvalues: (copy) v_u_8, (copy) v_u_9
	local v13 = p_u_12.instance[p_u_12.valueKey]
	p_u_11.changeEvent = p_u_12.instance:GetPropertyChangedSignal(p_u_12.valueKey)
	local v14 = {}
	local v15 = not p_u_12.lockedToOff
	if v15 then
		v15 = v13 == p_u_12.onValue
	end
	v14.checked = v15
	p_u_11:setState(v14)
	function p_u_11.onExternalChange()
		-- upvalues: (copy) p_u_12, (copy) p_u_11
		p_u_11:setState({
			["checked"] = p_u_12.instance[p_u_12.valueKey] == p_u_12.onValue
		})
	end
	function p_u_11.onToggled()
		-- upvalues: (copy) p_u_11, (copy) p_u_12, (ref) v_u_8, (ref) v_u_9
		if not p_u_11.props.lockedToOff then
			if p_u_12.instance[p_u_12.valueKey] == p_u_12.onValue then
				p_u_12.instance[p_u_12.valueKey] = p_u_12.offValue
			else
				p_u_12.instance[p_u_12.valueKey] = p_u_12.onValue
			end
			v_u_8(v_u_9.AnalyticsSettingsChangeName, nil, {}, true)
		end
	end
end
function v10.render(p16) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_6
	local v17 = p16.props
	local v18 = v_u_3.createFragment
	local v19 = {
		["Toggle"] = v_u_3.createElement(v_u_7, {
			["checked"] = p16.state.checked,
			["lockedToOff"] = v17.lockedToOff,
			["labelKey"] = v17.labelKey,
			["LayoutOrder"] = v17.LayoutOrder,
			["onToggled"] = p16.onToggled,
			["subtextEnabled"] = v17.subtextEnabled,
			["subtextKey"] = v17.subtextKey
		}),
		["Listener"] = v_u_3.createElement(v_u_6, {
			["event"] = p16.changeEvent,
			["callback"] = p16.onExternalChange
		})
	}
	return v18(v19)
end
return v10