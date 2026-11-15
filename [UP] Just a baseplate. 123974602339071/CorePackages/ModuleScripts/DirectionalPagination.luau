-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Pagination.Variants.DirectionalPagination
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Chip)
local v_u_5 = require(v1.Components.Text)
local v_u_6 = require(v1.Components.View)
local v_u_7 = require(v1.Enums.ChipSize)
local v_u_8 = require(v1.Enums.ChipVariant)
local v_u_9 = require(v1.Enums.PaginationSize)
local v_u_10 = require(v1.Enums.PaginationVariant)
local v_u_11 = require(v1.Utility.withDefaults)
require(script.Parent.MultiPagePagination)
local v_u_12 = require(script.Parent.Parent.paginationUtils)
local v_u_13 = require(script.Parent.Parent.usePaginationNav)
local v_u_14 = {
	["size"] = nil,
	["testId"] = "--foundation-pagination",
	["size"] = v_u_9.Medium
}
return v_u_3.memo(v_u_3.forwardRef(function(p15, p16) -- name: DirectionalPagination
	-- upvalues: (copy) v_u_11, (copy) v_u_14, (copy) v_u_10, (copy) v_u_3, (copy) v_u_13, (copy) v_u_12, (copy) v_u_4, (copy) v_u_9, (copy) v_u_7, (copy) v_u_8, (copy) v_u_6, (copy) v_u_5
	local v_u_17 = v_u_11(p15, v_u_14)
	local v_u_18 = v_u_17.size
	local v19 = v_u_17.count
	local v20
	if v19 == nil then
		v20 = false
	else
		v20 = v_u_17.hasFirstLastButtons == true
	end
	local v_u_21 = v_u_17.variant == v_u_10.SinglePage
	local v22
	if v_u_17.hasPreviousPage == nil then
		v22 = v_u_17.page <= 1
	else
		v22 = v_u_17.hasPreviousPage ~= true
	end
	local v23
	if v19 == nil then
		v23 = v_u_17.hasNextPage == nil and true or v_u_17.hasNextPage ~= true
	else
		v23 = v19 <= v_u_17.page
	end
	local v_u_24, v25 = v_u_3.useState(nil)
	local v26 = v_u_13(v_u_17, {
		["hasFirstLastButtons"] = v20,
		["currentPage"] = v_u_17.page,
		["disabledState"] = {
			["isBackDisabled"] = v22,
			["isFirstDisabled"] = v22,
			["isForwardDisabled"] = v23,
			["isLastDisabled"] = v23
		}
	}, v25)
	v_u_3.useImperativeHandle(p16, function()
		-- upvalues: (copy) v_u_24
		return v_u_24
	end, { v_u_24 })
	local v37 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_21, (copy) v_u_17, (ref) v_u_12, (ref) v_u_3, (ref) v_u_4, (copy) v_u_18, (ref) v_u_9, (ref) v_u_7, (ref) v_u_8, (ref) v_u_6, (ref) v_u_5
		if not v_u_21 then
			return nil
		end
		local v27 = v_u_17.page
		local v28 = tostring(v27)
		if not v_u_12.needsWidePageSlot(v_u_17.page) then
			local v29 = v_u_3.createElement
			local v30 = v_u_6
			local v31 = {
				["LayoutOrder"] = 2,
				["tag"] = nil,
				["testId"] = nil,
				["tag"] = v_u_12.getCircularSlotTag(v_u_18),
				["testId"] = ("%*--page-label"):format(v_u_17.testId)
			}
			local v32 = {
				["Text"] = v_u_3.createElement(v_u_5, {
					["Text"] = nil,
					["tag"] = nil,
					["LayoutOrder"] = 1,
					["Text"] = v28,
					["tag"] = v_u_12.getPageLabelTag(v_u_18)
				})
			}
			return v29(v30, v31, v32)
		end
		local v33 = v_u_3.createElement
		local v34 = v_u_4
		local v35 = {
			["LayoutOrder"] = 2,
			["isChecked"] = false,
			["isDisabled"] = true,
			["onActivated"] = nil,
			["size"] = nil,
			["testId"] = nil,
			["text"] = nil,
			["variant"] = nil,
			["onActivated"] = function() -- name: onActivated end
		}
		local v36
		if v_u_18 == v_u_9.Small then
			v36 = v_u_7.Small
		else
			v36 = v_u_7.Medium
		end
		v35.size = v36
		v35.testId = ("%*--page-label"):format(v_u_17.testId)
		v35.text = v28
		v35.variant = v_u_8.Utility
		return v33(v34, v35)
	end, {
		v_u_21,
		v_u_17.page,
		v_u_18,
		v_u_17.testId
	})
	return v26.createLayout(v37)
end))