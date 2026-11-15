-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.RadioGroup.Item.RadioGroupItem
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Constants)
local v5 = v1.Components
local v_u_6 = require(v5.InternalInput)
require(v5.Types)
local v_u_7 = require(v5.View)
local v_u_8 = require(v1.Providers.Style.useTokens)
local v_u_9 = require(v1.Utility.withCommonProps)
local v_u_10 = require(script.Parent.useRadioGroupItemVariants)
local v11 = require(v1.Enums.InputSize)
local v12 = require(v1.Enums.InputPlacement)
local v_u_13 = require(v1.Components.InternalInputGroup.useInputGroupDefaults)
local v_u_14 = require(script.Parent.Parent.useRadioGroup)
local v_u_15 = {
	["size"] = nil,
	["isDisabled"] = false,
	["placement"] = nil,
	["size"] = v11.Medium,
	["placement"] = v12.Start
}
return v_u_3.memo(v_u_3.forwardRef(function(p16, p17) -- name: RadioGroupItem
	-- upvalues: (copy) v_u_13, (copy) v_u_15, (copy) v_u_14, (copy) v_u_8, (copy) v_u_3, (copy) v_u_10, (copy) v_u_6, (copy) v_u_9, (copy) v_u_4, (copy) v_u_7
	local v_u_18 = v_u_13(p16, v_u_15)
	local v19 = v_u_18.isDisabled
	local v_u_20 = v_u_14()
	local v21 = v_u_20.value == v_u_18.value
	local v22 = v_u_18.label or v_u_18.value
	local v23 = v_u_8()
	local v24 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_20, (copy) v_u_18
		v_u_20.onValueChanged(v_u_18.value)
	end, { v19, v_u_18.value, v_u_20.onValueChanged })
	local v25 = v_u_10(v23, v_u_18.size)
	v_u_18.testId = ("%*--item-%*"):format(v_u_20.testId, v_u_18.value)
	local v26 = v_u_3.createElement
	local v27 = v_u_6
	local v28 = v_u_9(v_u_18, {
		["isChecked"] = v21,
		["isDisabled"] = v19,
		["onActivated"] = v24,
		["label"] = {
			["text"] = v22,
			["position"] = v_u_4.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[v_u_18.placement],
			["hint"] = v_u_18.hint
		},
		["customVariantProps"] = v25.input,
		["size"] = v_u_18.size,
		["Selectable"] = v_u_20.Selectable,
		["ref"] = p17
	})
	local v29 = {}
	local v30
	if v21 then
		v30 = v_u_3.createElement(v_u_7, {
			["tag"] = v25.checkmark.tag,
			["backgroundStyle"] = v25.checkmark.style
		})
	else
		v30 = nil
	end
	v29.Center = v30
	return v26(v27, v28, v29)
end))