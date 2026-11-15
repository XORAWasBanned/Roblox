-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Pagination.Nav.NavControls
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.View)
require(v1.Enums.PaginationSize)
local v_u_5 = require(v1.Enums.PaginationDirection)
local v_u_6 = require(script.Parent.NavButton)
local v_u_7 = require(script.Parent.Parent.paginationSlotsUtils)
require(script.Parent.Parent.usePaginationSelectionChain)
local v_u_8 = {
	["start"] = { v_u_5.First, v_u_5.Backward },
	["end"] = { v_u_5.Forward, v_u_5.Last }
}
local v_u_9 = {
	["start"] = "left-nav",
	["end"] = "right-nav"
}
return v_u_3.memo(function(p10) -- name: NavControls
	-- upvalues: (copy) v_u_8, (copy) v_u_5, (copy) v_u_7, (copy) v_u_3, (copy) v_u_6, (copy) v_u_4, (copy) v_u_9
	local v11 = v_u_8[p10.side]
	local v12 = {}
	local v13 = 0
	for v14 = 1, #v11 do
		local v15 = v11[v14]
		if (v15 == v_u_5.First or v15 == v_u_5.Last) and not p10.hasFirstLastButtons then
			continue
		end
		v13 = v13 + 1
		local v16 = v_u_7.NAV_SLOT_IDS[v15]
		local v17 = p10.selection.getSlotBindings(v16)
		local v18 = v_u_3.createElement
		local v19 = v_u_6
		local v20 = {
			["baseTestId"] = p10.testId,
			["slotSize"] = p10.size,
			["direction"] = v15
		}
		local v21
		if v15 == v_u_5.First then
			v21 = p10.isFirstDisabled
		elseif v15 == v_u_5.Backward then
			v21 = p10.isBackDisabled
		elseif v15 == v_u_5.Forward then
			v21 = p10.isForwardDisabled
		else
			v21 = p10.isLastDisabled
		end
		v20.isDisabled = v21
		v20.LayoutOrder = v13
		v20.onDirectionActivated = p10.onDirectionActivated
		v20.ref = p10.selection.getSlotRef(v16)
		v20.Selectable = v17.Selectable
		v20.NextSelectionLeft = v17.NextSelectionLeft
		v20.NextSelectionRight = v17.NextSelectionRight
		v20.NextSelectionUp = v17.NextSelectionUp
		v20.NextSelectionDown = v17.NextSelectionDown
		v12[v15] = v18(v19, v20)
	end
	return v_u_3.createElement(v_u_4, {
		["LayoutOrder"] = nil,
		["tag"] = "row gap-xsmall auto-xy",
		["testId"] = nil,
		["LayoutOrder"] = p10.LayoutOrder,
		["testId"] = ("%*--%*"):format(p10.testId, v_u_9[p10.side])
	}, v12)
end)