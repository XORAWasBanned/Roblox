-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InputLabel.InputLabel
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v1.Components.Text)
local v_u_4 = require(v2.React)
local v_u_5 = require(v1.Utility.Localization.Translator)
local v_u_6 = require(v1.Enums.StateLayerAffordance)
require(v1.Components.Types)
local v_u_7 = require(v1.Utility.withCommonProps)
local v_u_8 = require(v1.Utility.withDefaults)
local v_u_9 = require(v1.Enums.ControlState)
local v_u_10 = require(v1.Enums.InputLabelSize)
local v_u_11 = {
	["size"] = nil,
	["testId"] = "--foundation-input-label",
	["size"] = v_u_10.Medium
}
return v_u_4.memo(v_u_4.forwardRef(function(p12, p13) -- name: InputLabel
	-- upvalues: (copy) v_u_8, (copy) v_u_11, (copy) v_u_4, (copy) v_u_9, (copy) v_u_3, (copy) v_u_7, (copy) v_u_5, (copy) v_u_6, (copy) v_u_10
	local v_u_14 = v_u_8(p12, v_u_11)
	local v16 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_14, (ref) v_u_9
		return v_u_14.onHover ~= nil and function(p15)
			-- upvalues: (ref) v_u_14, (ref) v_u_9
			v_u_14.onHover(p15 == v_u_9.Hover)
		end or nil
	end, { v_u_14.onHover })
	local v17 = v_u_4.createElement
	local v18 = v_u_3
	local v19 = v_u_7
	local v20 = {}
	local v21 = v_u_14.Text
	local v22 = v_u_14.isRequired
	if v22 ~= nil and v22 ~= v_u_4.None then
		if v22 then
			v21 = v21 .. " *"
		else
			v21 = v_u_5:FormatByKey("CommonUI.Controls.Input.Optional", {
				["inputLabel"] = v21
			})
		end
	end
	v20.Text = v21
	v20.RichText = v_u_14.RichText
	v20.selection = {
		["Selectable"] = false
	}
	local v23
	if v_u_14.isDisabled then
		v23 = nil
	else
		v23 = v_u_14.onActivated
	end
	v20.onActivated = v23
	if v_u_14.isDisabled then
		v16 = nil
	end
	v20.onStateChanged = v16
	v20.stateLayer = {
		["affordance"] = v_u_6.None
	}
	v20.textStyle = v_u_14.textStyle
	v20.tag = {
		["size-0 auto-xy text-wrap text-align-x-left text-align-y-top"] = true,
		["padding-top-xxsmall"] = v_u_14.size ~= v_u_10.XSmall,
		["content-muted"] = v_u_14.isDisabled,
		["content-emphasis"] = not v_u_14.isDisabled,
		["text-body-small"] = v_u_14.size == v_u_10.Small and true or v_u_14.size == v_u_10.XSmall,
		["text-body-medium"] = v_u_14.size == v_u_10.Medium,
		["text-body-large"] = v_u_14.size == v_u_10.Large
	}
	v20.ref = p13
	return v17(v18, v19(v_u_14, v20))
end))