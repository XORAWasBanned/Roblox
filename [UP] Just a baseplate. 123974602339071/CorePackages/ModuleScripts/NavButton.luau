-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Pagination.Nav.NavButton
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.React)
local v_u_5 = require(v1.Enums.ButtonVariant)
local v_u_6 = require(v1.Components.IconButton)
local v_u_7 = require(v1.Enums.InputSize)
local v8 = require(v1.Enums.PaginationDirection)
require(v1.Components.Types)
local v_u_9 = require(v1.Enums.PaginationSize)
local v10 = v3.Icon
local v_u_11 = {
	[v8.First] = {
		["icon"] = nil,
		["testIdSuffix"] = "first",
		["icon"] = v10.ChevronSmallLeftToLine
	},
	[v8.Backward] = {
		["icon"] = nil,
		["testIdSuffix"] = "back",
		["icon"] = v10.ChevronSmallLeft
	},
	[v8.Forward] = {
		["icon"] = nil,
		["testIdSuffix"] = "forward",
		["icon"] = v10.ChevronSmallRight
	},
	[v8.Last] = {
		["icon"] = nil,
		["testIdSuffix"] = "last",
		["icon"] = v10.ChevronSmallRightToLine
	}
}
return v_u_4.memo(v_u_4.forwardRef(function(p_u_12, p13) -- name: NavButton
	-- upvalues: (copy) v_u_11, (copy) v_u_4, (copy) v_u_6, (copy) v_u_9, (copy) v_u_7, (copy) v_u_5
	local v14 = v_u_11[p_u_12.direction]
	local v15 = ("%*--%*"):format(p_u_12.baseTestId, v14.testIdSuffix)
	local v16 = v_u_4.useCallback(function()
		-- upvalues: (copy) p_u_12
		p_u_12.onDirectionActivated(p_u_12.direction)
	end, { p_u_12.onDirectionActivated, p_u_12.direction })
	local v17 = v_u_4.createElement
	local v18 = v_u_6
	local v19 = {
		["LayoutOrder"] = nil,
		["testId"] = nil,
		["ref"] = nil,
		["icon"] = nil,
		["size"] = nil,
		["variant"] = nil,
		["isCircular"] = true,
		["isDisabled"] = nil,
		["onActivated"] = nil,
		["Selectable"] = nil,
		["NextSelectionLeft"] = nil,
		["NextSelectionRight"] = nil,
		["NextSelectionUp"] = nil,
		["NextSelectionDown"] = nil,
		["LayoutOrder"] = p_u_12.LayoutOrder,
		["testId"] = v15,
		["ref"] = p13,
		["icon"] = v14.icon
	}
	local v20
	if p_u_12.slotSize == v_u_9.Small then
		v20 = v_u_7.XSmall
	else
		v20 = v_u_7.Small
	end
	v19.size = v20
	v19.variant = v_u_5.Utility
	v19.isDisabled = p_u_12.isDisabled
	v19.onActivated = v16
	v19.Selectable = p_u_12.Selectable
	v19.NextSelectionLeft = p_u_12.NextSelectionLeft
	v19.NextSelectionRight = p_u_12.NextSelectionRight
	v19.NextSelectionUp = p_u_12.NextSelectionUp
	v19.NextSelectionDown = p_u_12.NextSelectionDown
	return v17(v18, v19)
end))