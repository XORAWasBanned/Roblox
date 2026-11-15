-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Menu.Menu
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.BaseMenu)
local v_u_5 = require(v1.Components.Popover)
require(v1.Components.Types)
local v_u_6 = require(v1.Providers.Style.useTokens)
local v_u_7 = require(v1.Utility.withCommonProps)
local v_u_8 = require(v1.Utility.withDefaults)
local v9 = require(v1.Enums.InputSize)
local v10 = require(v1.Enums.PopoverAlign)
local v11 = require(v1.Enums.PopoverSide)
local v_u_12 = require(v1.Enums.Radius)
local v_u_13 = {
	["size"] = nil,
	["side"] = nil,
	["align"] = nil,
	["testId"] = "--foundation-menu",
	["size"] = v9.Medium,
	["side"] = v11.Bottom,
	["align"] = v10.Start
}
return v_u_3.memo(v_u_3.forwardRef(function(p14, p15) -- name: Menu
	-- upvalues: (copy) v_u_8, (copy) v_u_13, (copy) v_u_6, (copy) v_u_3, (copy) v_u_5, (copy) v_u_7, (copy) v_u_12, (copy) v_u_4
	local v16 = v_u_8(p14, v_u_13)
	local v17 = v_u_6()
	local v18 = v17.Stroke.Standard
	local v19 = v_u_3.createElement
	local v20 = v_u_5.Root
	local v21 = {
		["isOpen"] = v16.isOpen,
		["testId"] = v16.testId
	}
	local v22 = {}
	local v23 = v_u_3.createElement
	local v24 = v_u_5.Anchor
	local v25 = v_u_7(v16, {
		["anchorRef"] = v16.anchorRef
	})
	local v26
	if v16.anchorRef then
		v26 = nil
	else
		v26 = v16.children
	end
	v22.Anchor = v23(v24, v25, v26)
	v22.Content = v_u_3.createElement(v_u_5.Content, {
		["side"] = nil,
		["align"] = nil,
		["hasArrow"] = false,
		["onPressedOutside"] = nil,
		["backgroundStyle"] = nil,
		["radius"] = nil,
		["ref"] = nil,
		["selection"] = nil,
		["selectionGroup"] = nil,
		["side"] = {
			["position"] = v16.side,
			["offset"] = v18 + v17.Padding.Small
		},
		["align"] = v16.align,
		["onPressedOutside"] = v16.onPressedOutside,
		["backgroundStyle"] = v17.Color.Surface.Surface_200,
		["radius"] = v_u_12.Medium,
		["ref"] = p15,
		["selection"] = v16.selection,
		["selectionGroup"] = v16.selectionGroup
	}, v_u_3.createElement(v_u_3.Fragment, nil, {
		["Menu"] = v_u_3.createElement(v_u_4.Root, {
			["items"] = v16.items,
			["size"] = v16.size,
			["width"] = v16.width,
			["maxHeight"] = v16.maxHeight,
			["onActivated"] = v16.onActivated,
			["onNestedLeafActivated"] = v16.onPressedOutside,
			["radius"] = v_u_12.Medium
		})
	}))
	return v19(v20, v21, v22)
end))