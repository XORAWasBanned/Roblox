-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Pagination.Variants.MultiPagePagination
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Components.Types)
local v_u_4 = require(v1.Components.View)
local v_u_5 = require(v1.Components.Chip.useChipVariants)
local v_u_6 = require(v1.Enums.ChipSize)
local v_u_7 = require(v1.Enums.ChipVariant)
local v_u_8 = require(v1.Enums.PaginationSize)
local v_u_9 = require(v1.Providers.Style.useTokens)
local v_u_10 = require(v1.Utility.withDefaults)
local v_u_11 = require(script.Parent.Parent.Nav.Ellipsis)
local v_u_12 = require(script.Parent.Parent.Nav.PageNumberSlot)
local v_u_13 = require(script.Parent.Parent.paginationSlotsUtils)
local v_u_14 = require(script.Parent.Parent.paginationUtils)
local v_u_15 = require(script.Parent.Parent.usePaginationAnimatedHighlight)
local v_u_16 = require(script.Parent.Parent.usePaginationNav)
local v_u_17 = {
	["size"] = nil,
	["hasFirstLastButtons"] = false,
	["testId"] = "--foundation-pagination",
	["size"] = v_u_8.Medium
}
return v_u_3.memo(v_u_3.forwardRef(function(p18, p19) -- name: MultiPagePagination
	-- upvalues: (copy) v_u_10, (copy) v_u_17, (copy) v_u_9, (copy) v_u_3, (copy) v_u_13, (copy) v_u_16, (copy) v_u_15, (copy) v_u_8, (copy) v_u_6, (copy) v_u_5, (copy) v_u_7, (copy) v_u_11, (copy) v_u_12, (copy) v_u_4, (copy) v_u_14
	local v_u_20 = v_u_10(p18, v_u_17)
	local v_u_21 = v_u_20.size
	local v22 = v_u_9()
	local v23 = v_u_20.page <= 1
	local v24 = v_u_20.page >= v_u_20.count
	local v_u_25 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_13, (copy) v_u_20
		return v_u_13.getVisiblePageSlots(v_u_20.page, v_u_20.count)
	end, { v_u_20.page, v_u_20.count })
	local v_u_26, v27 = v_u_3.useState(nil)
	local v_u_28 = v_u_16(v_u_20, {
		["hasFirstLastButtons"] = v_u_20.hasFirstLastButtons,
		["currentPage"] = v_u_20.page,
		["pageSlots"] = v_u_25,
		["disabledState"] = {
			["isBackDisabled"] = v23,
			["isFirstDisabled"] = v23,
			["isForwardDisabled"] = v24,
			["isLastDisabled"] = v24
		}
	}, v27)
	v_u_3.useImperativeHandle(p19, function()
		-- upvalues: (copy) v_u_26
		return v_u_26
	end, { v_u_26 })
	local v_u_29 = v_u_3.useRef(nil)
	local v_u_33 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_25, (ref) v_u_13, (copy) v_u_28
		local v30 = {}
		for _, v31 in v_u_25 do
			if v31 == "ellipsis" then
				continue
			end
			local v32 = v_u_13.getPageSlotId(v31)
			v30[v32] = v_u_28.selection.getSlotBindings(v32).ref
		end
		return v30
	end, { v_u_25, v_u_28.selection })
	local v_u_34 = v_u_13.getPageSlotId(v_u_20.page)
	local v_u_35 = v_u_15(v_u_34, v_u_29, v_u_33, v_u_21, v_u_25)
	local v36
	if v_u_21 == v_u_8.Small then
		v36 = v_u_6.Small
	else
		v36 = v_u_6.Medium
	end
	local v37 = v_u_5(v22, v36, v_u_7.Utility, true, false, false)
	local v43 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_25, (ref) v_u_3, (ref) v_u_11, (copy) v_u_21, (copy) v_u_20, (ref) v_u_13, (copy) v_u_28, (ref) v_u_12
		local v38 = {}
		for v39, v40 in v_u_25 do
			if v40 == "ellipsis" then
				v38[v39 == 2 and "ellipsis-leading" or "ellipsis-trailing"] = v_u_3.createElement(v_u_11, {
					["slotSize"] = v_u_21,
					["LayoutOrder"] = v39,
					["testId"] = ("%*--ellipsis-%*"):format(v_u_20.testId, v39)
				})
			else
				local v41 = v_u_13.getPageSlotId(v40)
				local v42 = v_u_28.selection.getSlotBindings(v41)
				v38[("Page-%*"):format(v40)] = v_u_3.createElement(v_u_12, {
					["slotSize"] = v_u_21,
					["isChecked"] = v40 == v_u_20.page,
					["LayoutOrder"] = v39,
					["onPageActivated"] = v_u_20.onActivated,
					["page"] = v40,
					["testId"] = ("%*--page-%*"):format(v_u_20.testId, v40),
					["ref"] = v_u_28.selection.getSlotRef(v41),
					["Selectable"] = v42.Selectable,
					["NextSelectionLeft"] = v42.NextSelectionLeft,
					["NextSelectionRight"] = v42.NextSelectionRight,
					["NextSelectionUp"] = v42.NextSelectionUp,
					["NextSelectionDown"] = v42.NextSelectionDown
				})
			end
		end
		return v38
	end, {
		v_u_25,
		v_u_20.page,
		v_u_21,
		v_u_20.testId,
		v_u_20.onActivated,
		v_u_28.selection
	})
	local v45 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_33, (copy) v_u_34, (copy) v_u_29, (copy) v_u_35
		local v44 = v_u_33[v_u_34]
		if v44 and (v44.current and v_u_29.current) then
			v_u_35.updateHighlight(v44, true)
		end
	end, { v_u_34, v_u_33, v_u_35.updateHighlight })
	local v46 = v_u_28.createLayout
	local v47 = v_u_3.createElement
	local v48 = v_u_4
	local v49 = {
		["LayoutOrder"] = 2,
		["tag"] = "auto-xy",
		["testId"] = nil,
		["ref"] = nil,
		["testId"] = ("%*--pages"):format(v_u_20.testId),
		["ref"] = v_u_29
	}
	local v50 = {}
	local v51
	if v_u_14.needsWidePageSlot(v_u_20.page) then
		v51 = nil
	else
		v51 = v_u_3.createElement(v_u_4, {
			["Active"] = false,
			["backgroundStyle"] = nil,
			["tag"] = "radius-circle clip",
			["Size"] = nil,
			["Position"] = nil,
			["Visible"] = nil,
			["ZIndex"] = 1,
			["selection"] = nil,
			["testId"] = nil,
			["backgroundStyle"] = v37.chip.backgroundStyle,
			["Size"] = v_u_3.joinBindings({ v_u_35.highlightWidth, v_u_35.activeItemHeight }):map(function(p52)
				return UDim2.fromOffset(p52[1], p52[2])
			end),
			["Position"] = v_u_35.highlightPosition:map(function(p53)
				return UDim2.fromOffset(p53, 0)
			end),
			["Visible"] = v_u_35.isVisible,
			["selection"] = {
				["Selectable"] = false
			},
			["testId"] = ("%*--active-page-highlight"):format(v_u_20.testId)
		})
	end
	v50.ActivePageHighlight = v51
	v50.PagesRow = v_u_3.createElement(v_u_4, {
		["tag"] = "row gap-xsmall auto-xy",
		["LayoutOrder"] = 1,
		["ZIndex"] = 2,
		["onAbsoluteSizeChanged"] = nil,
		["onAbsoluteSizeChanged"] = v45
	}, v43)
	return v46(v47(v48, v49, v50), nil)
end))