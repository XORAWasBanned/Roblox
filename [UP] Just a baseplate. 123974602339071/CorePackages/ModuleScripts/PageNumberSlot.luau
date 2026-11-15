-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Pagination.Nav.PageNumberSlot
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_5 = require(v1.Components.View)
local v_u_6 = require(v1.Components.Chip.useChipVariants)
local v_u_7 = require(v1.Enums.ChipSize)
local v_u_8 = require(v1.Enums.ChipVariant)
local v9 = require(v1.Enums.ColorNamespace)
local v_u_10 = require(v1.Enums.PaginationSize)
local v_u_11 = require(v1.Providers.Style.PresentationContext)
local v_u_12 = require(v1.Providers.Style.useTokens)
local v_u_13 = require(v1.Utility.withCommonProps)
local v14 = script.Parent.Parent
local v_u_15 = require(v14.paginationUtils)
local function v_u_21(p16) -- name: PageNumberText
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v17 = v_u_3.createElement
	local v18 = v_u_4
	local v19 = {
		["Text"] = nil,
		["textStyle"] = nil,
		["tag"] = nil,
		["padding"] = nil,
		["LayoutOrder"] = 1,
		["testId"] = nil
	}
	local v20 = p16.page
	v19.Text = tostring(v20)
	v19.textStyle = p16.textStyle
	v19.tag = p16.textTag
	v19.padding = p16.padding
	v19.testId = ("%*--text"):format(p16.testId)
	return v17(v18, v19)
end
local v_u_22 = {
	["colorNamespace"] = nil,
	["isIconSize"] = true,
	["colorNamespace"] = v9.Color
}
local v_u_23 = {
	[v_u_10.Small] = "size-0-600",
	[v_u_10.Medium] = "size-0-800"
}
return v_u_3.memo(v_u_3.forwardRef(function(p_u_24, p25) -- name: PageNumberSlot
	-- upvalues: (copy) v_u_12, (copy) v_u_15, (copy) v_u_10, (copy) v_u_7, (copy) v_u_6, (copy) v_u_8, (copy) v_u_23, (copy) v_u_3, (copy) v_u_5, (copy) v_u_13, (copy) v_u_11, (copy) v_u_22, (copy) v_u_21
	local v26 = v_u_12()
	local v27 = not p_u_24.isChecked
	local v28 = v_u_15.needsWidePageSlot(p_u_24.page)
	local v29
	if p_u_24.slotSize == v_u_10.Small then
		v29 = v_u_7.Small
	else
		v29 = v_u_7.Medium
	end
	local v30 = v_u_6(v26, v29, v_u_8.Utility, true, false, false)
	local v31 = v_u_6(v26, v29, v_u_8.Utility, false, false, false)
	local v32 = ("row align-x-center align-y-center auto-x radius-circle %*"):format(v_u_23[p_u_24.slotSize])
	local v33 = v_u_3.useCallback(function()
		-- upvalues: (copy) p_u_24
		p_u_24.onPageActivated(p_u_24.page)
	end, { p_u_24.onPageActivated, p_u_24.page })
	local v34 = {}
	local v35
	if v27 then
		v35 = p_u_24.Selectable ~= false
	else
		v35 = v27
	end
	v34.Selectable = v35
	v34.NextSelectionLeft = p_u_24.NextSelectionLeft
	v34.NextSelectionRight = p_u_24.NextSelectionRight
	v34.NextSelectionUp = p_u_24.NextSelectionUp
	v34.NextSelectionDown = p_u_24.NextSelectionDown
	if v28 then
		if v27 then
			return v_u_3.createElement(v_u_5, v_u_13({
				["LayoutOrder"] = p_u_24.LayoutOrder,
				["testId"] = p_u_24.testId
			}, {
				["backgroundStyle"] = v31.chip.backgroundStyle,
				["padding"] = v31.chip.padding,
				["cursor"] = v_u_15.getSlotCursor(v26),
				["onActivated"] = v33,
				["ref"] = p25,
				["selection"] = v34,
				["tag"] = v32
			}), {
				["Label"] = v_u_3.createElement(v_u_11.Provider, {
					["value"] = v_u_22
				}, {
					["Text"] = v_u_3.createElement(v_u_21, {
						["page"] = p_u_24.page,
						["textStyle"] = v31.text.contentStyle,
						["textTag"] = v31.text.tag,
						["padding"] = v31.text.padding,
						["testId"] = p_u_24.testId
					})
				})
			})
		else
			return v_u_3.createElement(v_u_5, v_u_13({
				["LayoutOrder"] = p_u_24.LayoutOrder,
				["testId"] = p_u_24.testId
			}, {
				["backgroundStyle"] = v30.chip.backgroundStyle,
				["padding"] = v30.chip.padding,
				["ref"] = p25,
				["selection"] = {
					["Selectable"] = false
				},
				["tag"] = v32
			}), {
				["Text"] = v_u_3.createElement(v_u_21, {
					["page"] = p_u_24.page,
					["textStyle"] = v30.text.contentStyle,
					["textTag"] = v30.text.tag,
					["padding"] = v30.text.padding,
					["testId"] = p_u_24.testId
				})
			})
		end
	else
		local v36 = v_u_3.createElement
		local v37 = v_u_5
		local v38 = v_u_13
		local v39 = {
			["LayoutOrder"] = p_u_24.LayoutOrder,
			["testId"] = p_u_24.testId
		}
		local v40 = {
			["backgroundStyle"] = {
				["Color3"] = nil,
				["Transparency"] = 1,
				["Color3"] = v26.Color.Surface.Surface_0.Color3
			}
		}
		local v41
		if v27 then
			v41 = v_u_15.getSlotCursor(v26)
		else
			v41 = nil
		end
		v40.cursor = v41
		if not v27 then
			v33 = nil
		end
		v40.onActivated = v33
		v40.ref = p25
		v40.selection = not v27 and {
			["Selectable"] = false
		} or v34
		v40.tag = v_u_15.getCircularSlotTag(p_u_24.slotSize)
		local v42 = v38(v39, v40)
		local v43 = {}
		local v44 = v_u_3.createElement
		local v45 = v_u_21
		local v46 = {
			["page"] = nil,
			["textStyle"] = nil,
			["textTag"] = nil,
			["padding"] = nil,
			["testId"] = nil,
			["page"] = p_u_24.page
		}
		local v47
		if p_u_24.isChecked then
			v47 = v30.text.contentStyle
		else
			v47 = v26.Color.Content.Default
		end
		v46.textStyle = v47
		v46.textTag = v_u_15.getPageLabelTextTag(p_u_24.slotSize)
		v46.testId = p_u_24.testId
		v43.Text = v44(v45, v46)
		return v36(v37, v42, v43)
	end
end))