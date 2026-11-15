-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.TextInput.useTextInputVariants
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.BuilderIcons)
require(v1.Components.Types)
local v_u_4 = require(v1.Enums.InputSize)
local v_u_5 = require(v1.Enums.InputVariant)
local v_u_6 = require(v1.Enums.IconSize)
require(v1.Enums.Radius)
local v_u_7 = require(v1.Utility.Flags)
local v_u_8 = require(v1.Utility.composeStyleVariant)
local v_u_9 = require(v1.Components.InputField.getInputVariantsFactory)
require(v1.Providers.Style.Tokens)
local v_u_10 = require(v1.Providers.Style.VariantsContext)
local function v_u_13(p11) -- name: computeProps
	local v12 = {
		["container"] = {
			["minHeight"] = p11.minContainerHeight,
			["horizontalPadding"] = UDim.new(0, p11.horizontalPadding),
			["radius"] = p11.radius,
			["tag"] = p11.containerTag
		},
		["textBox"] = {
			["fontStyle"] = p11.typography
		},
		["icon"] = {
			["size"] = p11.iconSize
		},
		["clearButton"] = {
			["icon"] = p11.clearButtonIcon,
			["padding"] = p11.clearButtonPadding
		}
	}
	return v12
end
local function v_u_18(p14) -- name: variantsFactory
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_13, (copy) v_u_6, (copy) v_u_3
	local v15 = {}
	local v16 = {
		["fgStyle"] = nil,
		["strokeStyle"] = nil,
		["strokeThickness"] = nil,
		["tag"] = "row"
	}
	local v17
	if v_u_7.FoundationFixColorOnScrubbableNumberInput then
		v17 = p14.Color.Shift.Shift_200
	else
		v17 = nil
	end
	v16.fgStyle = v17
	v16.strokeStyle = p14.Color.Stroke.Emphasis
	v16.strokeThickness = p14.Stroke.Standard
	v15.container = v16
	v15.textBox = {
		["tag"] = "text-align-x-left text-align-y-center clip content-emphasis gui-object-defaults"
	}
	v15.icon = {
		["style"] = p14.Color.Content.Muted
	}
	v15.clearButton = {
		["tag"] = "auto-xy"
	}
	return {
		["common"] = v15,
		["sizes"] = {
			[v_u_4.XSmall] = v_u_13({
				["radius"] = nil,
				["containerTag"] = "size-full-600 gap-small",
				["horizontalPadding"] = nil,
				["typography"] = nil,
				["iconSize"] = nil,
				["minContainerHeight"] = nil,
				["clearButtonIcon"] = nil,
				["clearButtonPadding"] = nil,
				["radius"] = p14.Radius.Small,
				["horizontalPadding"] = p14.Padding.XSmall,
				["typography"] = p14.Typography.BodySmall,
				["iconSize"] = v_u_6.XSmall,
				["minContainerHeight"] = p14.Size.Size_600,
				["clearButtonIcon"] = v_u_3.Icon.XSmall,
				["clearButtonPadding"] = p14.Padding.XSmall
			}),
			[v_u_4.Small] = v_u_13({
				["radius"] = nil,
				["containerTag"] = "size-full-800 gap-medium",
				["horizontalPadding"] = nil,
				["typography"] = nil,
				["iconSize"] = nil,
				["minContainerHeight"] = nil,
				["clearButtonIcon"] = nil,
				["clearButtonPadding"] = nil,
				["radius"] = p14.Radius.Medium,
				["horizontalPadding"] = p14.Padding.Small,
				["typography"] = p14.Typography.BodyMedium,
				["iconSize"] = v_u_6.XSmall,
				["minContainerHeight"] = p14.Size.Size_800,
				["clearButtonIcon"] = v_u_3.Icon.XSmall,
				["clearButtonPadding"] = p14.Size.Size_150
			}),
			[v_u_4.Medium] = v_u_13({
				["radius"] = nil,
				["containerTag"] = "size-full-1000 gap-large",
				["horizontalPadding"] = nil,
				["typography"] = nil,
				["iconSize"] = nil,
				["minContainerHeight"] = nil,
				["clearButtonIcon"] = nil,
				["clearButtonPadding"] = nil,
				["radius"] = p14.Radius.Medium,
				["horizontalPadding"] = p14.Padding.Medium,
				["typography"] = p14.Typography.BodyMedium,
				["iconSize"] = v_u_6.Small,
				["minContainerHeight"] = p14.Size.Size_1000,
				["clearButtonIcon"] = v_u_3.Icon.X,
				["clearButtonPadding"] = p14.Padding.Small
			}),
			[v_u_4.Large] = v_u_13({
				["radius"] = nil,
				["containerTag"] = "size-full-1200 gap-large",
				["horizontalPadding"] = nil,
				["typography"] = nil,
				["iconSize"] = nil,
				["minContainerHeight"] = nil,
				["clearButtonIcon"] = nil,
				["clearButtonPadding"] = nil,
				["radius"] = p14.Radius.Medium,
				["horizontalPadding"] = p14.Padding.Medium,
				["typography"] = p14.Typography.BodyLarge,
				["iconSize"] = v_u_6.Small,
				["minContainerHeight"] = p14.Size.Size_1200,
				["clearButtonIcon"] = v_u_3.Icon.X,
				["clearButtonPadding"] = p14.Padding.Small
			})
		}
	}
end
return function(p19, p20, p21, p22, p23, p24)
	-- upvalues: (copy) v_u_10, (copy) v_u_18, (copy) v_u_9, (copy) v_u_5, (copy) v_u_8
	local v25 = v_u_10.useVariants("TextInput", v_u_18, p19)
	local v26 = v_u_10.useVariants("InputField", v_u_9, p19)
	local v27 = v26.variants[p21 or v_u_5.Standard]
	local v28 = v_u_8
	local v29 = v25.common
	local v30 = v26.sizes[p20]
	local v31 = v25.sizes[p20]
	local v32 = p21 == v_u_5.Utility and {} or v27
	local v33
	if p22 then
		v33 = v26.radius[p22]
	else
		v33 = v26.defaultRadius[p20]
	end
	return v28(v29, v30, v31, v32, v33, p23 == nil and {} or v26.focusedState[p23], p24 == nil and {} or v26.errorState[p24], p21 ~= v_u_5.Utility and {} or v27)
end