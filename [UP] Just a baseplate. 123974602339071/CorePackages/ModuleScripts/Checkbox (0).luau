-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Checkbox.Checkbox
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.React)
local v_u_5 = require(v1.Constants)
local v6 = v1.Components
local v_u_7 = require(v6.InternalInput)
local v_u_8 = require(v6.Text)
require(v6.Types)
local v_u_9 = require(v6.InternalInput.useUncontrolledState)
local v_u_10 = require(v1.Providers.Style.useTokens)
local v_u_11 = require(v1.Utility.withCommonProps)
local v_u_12 = require(script.Parent.useCheckboxVariants)
local v13 = require(v1.Enums.InputSize)
local v14 = require(v1.Enums.InputPlacement)
local v_u_15 = require(v6.InternalInputGroup.useInputGroupDefaults)
local v_u_16 = {
	["size"] = nil,
	["placement"] = nil,
	["Selectable"] = true,
	["testId"] = "--foundation-checkbox",
	["size"] = v13.Medium,
	["placement"] = v14.Start
}
return v_u_4.memo(v_u_4.forwardRef(function(p17, p18) -- name: Checkbox
	-- upvalues: (copy) v_u_15, (copy) v_u_16, (copy) v_u_10, (copy) v_u_12, (copy) v_u_9, (copy) v_u_4, (copy) v_u_7, (copy) v_u_11, (copy) v_u_5, (copy) v_u_8, (copy) v_u_3
	local v19 = v_u_15(p17, v_u_16)
	local v20 = v_u_12(v_u_10(), v19.size)
	local v21, v22 = v_u_9(v19.isChecked, v19.onActivated)
	local v23 = v19.isIndeterminate or false
	local v24 = v_u_4.createElement
	local v25 = v_u_7
	local v26 = v_u_11(v19, {
		["isChecked"] = v21,
		["isIndeterminate"] = v23,
		["isDisabled"] = v19.isDisabled,
		["onActivated"] = v22,
		["label"] = {
			["text"] = v19.label,
			["position"] = v_u_5.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[v19.placement],
			["hint"] = v19.hint
		},
		["customVariantProps"] = v20.input,
		["size"] = v19.size,
		["Selectable"] = v19.Selectable,
		["NextSelectionUp"] = v19.NextSelectionUp,
		["NextSelectionDown"] = v19.NextSelectionDown,
		["NextSelectionLeft"] = v19.NextSelectionLeft,
		["NextSelectionRight"] = v19.NextSelectionRight,
		["ref"] = p18
	})
	local v27 = {}
	local v28
	if v21 or v23 then
		local v29 = v_u_4.createElement
		local v30 = v_u_8
		local v31 = {
			["Text"] = nil,
			["fontStyle"] = nil,
			["TextScaled"] = true,
			["tag"] = nil,
			["testId"] = nil
		}
		local v32
		if v23 then
			v32 = v_u_3.Icon.Minus
		else
			v32 = v_u_3.Icon.Check
		end
		v31.Text = v32
		v31.fontStyle = {
			["Font"] = v_u_3.Font[v_u_3.IconVariant.Filled]
		}
		v31.tag = v20.checkmark.tag
		v31.testId = ("%*--checkmark"):format(v19.testId)
		v28 = v29(v30, v31)
	else
		v28 = nil
	end
	v27.Checkmark = v28
	return v24(v25, v26, v27)
end))