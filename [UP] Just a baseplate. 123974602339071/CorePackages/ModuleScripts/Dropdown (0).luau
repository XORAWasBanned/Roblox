-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Dropdown.Dropdown
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.BaseMenu)
local v_u_5 = require(v1.Components.Popover)
require(v1.Components.Types)
local v_u_6 = require(v1.Utility.withCommonProps)
local v_u_7 = require(v1.Utility.withDefaults)
local v8 = require(v1.Enums.InputSize)
local v9 = require(v1.Enums.InputVariant)
local v_u_10 = require(v1.Enums.PopoverAlign)
local v11 = require(v1.Enums.PopoverSide)
local v_u_12 = require(v1.Enums.Radius)
local v_u_13 = require(script.Parent.DropdownControl)
local v_u_14 = require(script.Parent.markSelectedItem)
local v_u_15 = {
	["variant"] = nil,
	["width"] = nil,
	["size"] = nil,
	["testId"] = "--foundation-dropdown",
	["variant"] = v9.Standard,
	["width"] = UDim.new(0, 400),
	["size"] = v8.Medium
}
local v_u_16 = {
	["position"] = nil,
	["offset"] = 5,
	["position"] = v11.Bottom
}
return v_u_3.memo(v_u_3.forwardRef(function(p_u_17, p18) -- name: Dropdown
	-- upvalues: (copy) v_u_7, (copy) v_u_15, (copy) v_u_3, (copy) v_u_14, (copy) v_u_5, (copy) v_u_13, (copy) v_u_6, (copy) v_u_10, (copy) v_u_16, (copy) v_u_12, (copy) v_u_4
	local v_u_19 = v_u_7(p_u_17, v_u_15)
	local v20, v_u_21 = v_u_3.useState(false)
	local v_u_22 = v_u_3.useRef(nil)
	local v_u_23, v_u_24 = v_u_3.useState(nil)
	local v26 = v_u_3.useCallback(function(p25)
		-- upvalues: (copy) v_u_22, (copy) v_u_24
		v_u_22.current = p25
		v_u_24(p25)
	end, {})
	v_u_3.useImperativeHandle(p18, function()
		-- upvalues: (copy) v_u_23
		return v_u_23
	end, { v_u_23 })
	local v27, v_u_28 = v_u_3.useBinding(v_u_19.width)
	local v29, v30 = v_u_14(v_u_19.items, v_u_19.value)
	local v32 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_21
		v_u_21(function(p31)
			return not p31
		end)
	end, {})
	local v33 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_21
		v_u_21(false)
	end, {})
	local v35 = v_u_3.useCallback(function(p34)
		-- upvalues: (copy) v_u_21, (copy) v_u_19
		v_u_21(false)
		v_u_19.onItemChanged(p34)
	end, { v_u_19.onItemChanged })
	v_u_19.onAbsoluteSizeChanged = v_u_3.useCallback(function(p36)
		-- upvalues: (copy) p_u_17, (copy) v_u_28
		if p_u_17.onAbsoluteSizeChanged then
			p_u_17.onAbsoluteSizeChanged(p36)
		end
		v_u_28(UDim.new(0, p36.AbsoluteSize.X))
	end, { v_u_28, p_u_17.onAbsoluteSizeChanged })
	local v37 = v_u_3.createElement
	local v38 = v_u_5.Root
	local v39 = {
		["DropdownControl"] = v_u_3.createElement(v_u_13, v_u_6(v_u_19, {
			["variant"] = v_u_19.variant,
			["onActivated"] = v32,
			["hasError"] = v_u_19.hasError,
			["isDisabled"] = v_u_19.isDisabled,
			["item"] = v30,
			["placeholder"] = v_u_19.placeholder,
			["isMenuOpen"] = v20,
			["width"] = v_u_19.width,
			["size"] = v_u_19.size,
			["label"] = v_u_19.label,
			["hint"] = v_u_19.hint,
			["inputRef"] = v26,
			["Selectable"] = v_u_19.Selectable,
			["NextSelectionUp"] = v_u_19.NextSelectionUp,
			["NextSelectionDown"] = v_u_19.NextSelectionDown,
			["NextSelectionLeft"] = v_u_19.NextSelectionLeft,
			["NextSelectionRight"] = v_u_19.NextSelectionRight
		})),
		["Anchor"] = v_u_3.createElement(v_u_5.Anchor, {
			["anchorRef"] = v_u_22
		}),
		["Menu"] = v_u_3.createElement(v_u_5.Content, {
			["hasArrow"] = false,
			["align"] = nil,
			["side"] = nil,
			["onPressedOutside"] = nil,
			["radius"] = nil,
			["selection"] = nil,
			["selectionGroup"] = nil,
			["align"] = v_u_10.End,
			["side"] = v_u_16,
			["onPressedOutside"] = v33,
			["radius"] = v_u_12.Medium,
			["selection"] = v_u_19.selection,
			["selectionGroup"] = v_u_19.selectionGroup
		}, v_u_3.createElement(v_u_4.Root, {
			["size"] = nil,
			["couldGrow"] = true,
			["width"] = nil,
			["items"] = nil,
			["maxHeight"] = nil,
			["onActivated"] = nil,
			["radius"] = nil,
			["scrollingFrameRef"] = nil,
			["testId"] = nil,
			["size"] = v_u_19.size,
			["width"] = v27,
			["items"] = v29,
			["maxHeight"] = v_u_19.maxHeight,
			["onActivated"] = v35,
			["radius"] = v_u_12.Medium,
			["scrollingFrameRef"] = v_u_19.scrollingFrameRef,
			["testId"] = ("%*--menu"):format(v_u_19.testId)
		}))
	}
	return v37(v38, {
		["isOpen"] = v20
	}, v39)
end))