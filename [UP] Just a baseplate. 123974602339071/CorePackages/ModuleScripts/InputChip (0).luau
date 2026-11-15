-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InputChip.InputChip
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.CloseAffordance)
local v_u_5 = require(v1.Enums.CloseAffordanceVariant)
local v_u_6 = require(v1.Enums.InputSize)
local v_u_7 = require(v1.Constants)
local v_u_8 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_9 = require(v1.Components.View)
local v_u_10 = require(script.Parent.useInputChipVariants)
local v_u_11 = require(v1.Providers.Style.useTokens)
local v_u_12 = require(v1.Utility.withCommonProps)
local v_u_13 = require(v1.Utility.withDefaults)
local v_u_14 = {
	["size"] = nil,
	["isDisabled"] = false,
	["testId"] = "--foundation-input-chip",
	["size"] = v_u_6.Medium
}
return v_u_3.memo(v_u_3.forwardRef(function(p15, p16) -- name: InputChip
	-- upvalues: (copy) v_u_13, (copy) v_u_14, (copy) v_u_11, (copy) v_u_10, (copy) v_u_3, (copy) v_u_9, (copy) v_u_12, (copy) v_u_7, (copy) v_u_8, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5
	local v17 = v_u_13(p15, v_u_14)
	local v18 = v_u_10(v_u_11(), v17.size)
	local v19 = v_u_3.createElement
	local v20 = v_u_9
	local v21 = v_u_12
	local v22 = {
		["tag"] = v18.container.tag
	}
	local v23
	if v17.isDisabled then
		v23 = v_u_7.DISABLED_TRANSPARENCY
	else
		v23 = nil
	end
	v22.GroupTransparency = v23
	v22.ref = p16
	local v24 = v21(v17, v22)
	local v25 = {
		["Text"] = v_u_3.createElement(v_u_8, {
			["Text"] = nil,
			["textStyle"] = nil,
			["tag"] = nil,
			["padding"] = nil,
			["LayoutOrder"] = 1,
			["testId"] = nil,
			["Text"] = v17.text,
			["textStyle"] = v18.text.contentStyle,
			["tag"] = v18.text.tag,
			["padding"] = v18.text.padding,
			["testId"] = ("%*--text"):format(v17.testId)
		})
	}
	local v26 = v_u_3.createElement
	local v27 = v_u_9
	local v28 = {
		["tag"] = nil,
		["padding"] = nil,
		["LayoutOrder"] = 2,
		["testId"] = nil,
		["tag"] = v18.close.tag,
		["padding"] = v18.close.padding,
		["testId"] = ("%*--close-container"):format(v17.testId)
	}
	local v29 = {}
	local v30 = v_u_3.createElement
	local v31 = v_u_4
	local v32 = {
		["onActivated"] = nil,
		["size"] = nil,
		["variant"] = nil,
		["hasPadding"] = false,
		["Selectable"] = nil,
		["LayoutOrder"] = 1,
		["testId"] = nil
	}
	local v33
	if v17.isDisabled then
		v33 = nil
	else
		v33 = v17.onClose
	end
	v32.onActivated = v33
	v32.size = v_u_6.XSmall
	v32.variant = v_u_5.Utility
	local v34
	if v17.isDisabled then
		v34 = false
	else
		v34 = nil
	end
	v32.Selectable = v34
	v32.testId = ("%*--close"):format(v17.testId)
	v29.CloseAffordance = v30(v31, v32)
	v25.Close = v26(v27, v28, v29)
	return v19(v20, v24, v25)
end))