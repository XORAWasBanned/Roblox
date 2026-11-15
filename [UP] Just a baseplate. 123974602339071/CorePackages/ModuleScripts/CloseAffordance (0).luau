-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.CloseAffordance.CloseAffordance
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.BuilderIcons)
local v_u_4 = require(v1.Components.Icon)
local v_u_5 = require(v2.React)
local v6 = require(v1.Enums.InputSize)
local v_u_7 = v_u_3.IconVariant
require(v1.Enums.IconSize)
local v8 = require(v1.Enums.CloseAffordanceVariant)
require(v1.Enums.Radius)
local v_u_9 = require(v1.Providers.Style.useTokens)
local v_u_10 = require(v1.Providers.Style.PresentationContext).usePresentationContext
local v_u_11 = require(v1.Utility.withCommonProps)
local v_u_12 = require(v1.Utility.withDefaults)
local v_u_13 = require(v1.Constants)
require(v1.Components.Types)
local v_u_14 = require(v1.Components.View)
local v_u_15 = require(script.Parent.useCloseAffordanceVariants)
local v_u_16 = {
	["isDisabled"] = false,
	["size"] = nil,
	["variant"] = nil,
	["isCircular"] = false,
	["hasPadding"] = true,
	["testId"] = "--foundation-close-affordance",
	["size"] = v6.Medium,
	["variant"] = v8.OverMedia
}
return v_u_5.memo(v_u_5.forwardRef(function(p17, p18) -- name: CloseAffordance
	-- upvalues: (copy) v_u_12, (copy) v_u_16, (copy) v_u_9, (copy) v_u_10, (copy) v_u_15, (copy) v_u_5, (copy) v_u_14, (copy) v_u_11, (copy) v_u_13, (copy) v_u_4, (copy) v_u_3, (copy) v_u_7
	local v19 = v_u_12(p17, v_u_16)
	local v_u_20 = v_u_9()
	local v21 = v_u_10()
	local v22 = v_u_15(v_u_20, v19.size, v19.variant, v21.colorNamespace, v19.hasPadding, v19.isCircular)
	local v_u_23 = UDim.new(0, v22.container.radius)
	local v24 = v_u_5.useMemo(function()
		-- upvalues: (copy) v_u_23, (copy) v_u_20
		return {
			["radius"] = v_u_23,
			["offset"] = v_u_20.Size.Size_150,
			["borderWidth"] = v_u_20.Stroke.Thicker
		}
	end, { v_u_20, v_u_23 })
	local v25 = v_u_5.createElement
	local v26 = v_u_14
	local v27 = v_u_11
	local v28 = {
		["Size"] = v22.container.size,
		["onActivated"] = v19.onActivated
	}
	local v29 = {}
	local v30
	if v19.isDisabled then
		v30 = false
	else
		v30 = v19.Selectable
	end
	v29.Selectable = v30
	v29.NextSelectionUp = v19.NextSelectionUp
	v29.NextSelectionDown = v19.NextSelectionDown
	v29.NextSelectionLeft = v19.NextSelectionLeft
	v29.NextSelectionRight = v19.NextSelectionRight
	v28.selection = v29
	v28.isDisabled = v19.isDisabled
	v28.padding = v22.container.padding
	v28.cornerRadius = v_u_23
	v28.stateLayer = v22.container.stateLayer
	v28.cursor = v24
	v28.tag = v22.container.tag
	local v31
	if v19.isDisabled then
		v31 = v_u_13.DISABLED_TRANSPARENCY
	else
		v31 = nil
	end
	v28.GroupTransparency = v31
	v28.ref = p18
	return v25(v26, v27(v19, v28), {
		["Icon"] = v_u_5.createElement(v_u_4, {
			["name"] = v_u_3.Icon.X,
			["variant"] = v_u_7.Regular,
			["size"] = v22.content.iconSize,
			["style"] = v22.content.style
		})
	})
end))