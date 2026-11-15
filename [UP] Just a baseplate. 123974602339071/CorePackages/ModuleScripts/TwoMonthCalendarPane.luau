-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Calendar.TwoMonthCalendarPane
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = require(script.Parent.Parent.Utilities.DateTimeCalendarConstants)
local v5 = require(script.Parent.Parent.Utilities.DateTimeCalendarDayConfigUtilities)
local v_u_6 = require(script.Parent.Parent.DateTimeUtilities)
local v_u_7 = require(script.Parent.RangeCalendarDayCell)
local v_u_8 = require(v1.Components.Text)
local v_u_9 = require(v1.Components.View)
local v_u_10 = v4.DAYS_PER_WEEK
local v_u_11 = v5.buildTwoMonthPaneCellConfigs
local function v_u_13(p12) -- name: EmptyCell
	-- upvalues: (copy) v_u_3, (copy) v_u_9
	return v_u_3.createElement(v_u_9, {
		["LayoutOrder"] = p12.LayoutOrder,
		["Size"] = UDim2.fromOffset(p12.cellSize, p12.cellSize)
	})
end
return function(p_u_14) -- name: TwoMonthCalendarPane
	-- upvalues: (copy) v_u_3, (copy) v_u_11, (copy) v_u_10, (copy) v_u_6, (copy) v_u_8, (copy) v_u_13, (copy) v_u_7, (copy) v_u_9
	local v15 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_11, (copy) p_u_14
		return v_u_11(p_u_14.month, p_u_14.year)
	end, { p_u_14.month, p_u_14.year })
	local v16 = { v_u_3.createElement("UIGridLayout", {
			["CellPadding"] = nil,
			["CellSize"] = nil,
			["FillDirection"] = nil,
			["FillDirectionMaxCells"] = nil,
			["HorizontalAlignment"] = nil,
			["key"] = "layout",
			["SortOrder"] = nil,
			["VerticalAlignment"] = nil,
			["CellPadding"] = UDim2.fromOffset(0, 0),
			["CellSize"] = UDim2.fromOffset(p_u_14.cellSize, p_u_14.cellSize),
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["FillDirectionMaxCells"] = v_u_10,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center
		}) }
	local v17 = 1
	for _, v18 in v_u_6.weekdays do
		local v19 = v_u_3.createElement
		local v20 = v_u_8
		local v21 = {
			["key"] = nil,
			["LayoutOrder"] = nil,
			["Text"] = nil,
			["tag"] = "text-body-small text-align-x-center text-align-y-center",
			["key"] = ("weekday-%*"):format(v18),
			["LayoutOrder"] = v17,
			["Text"] = v18
		}
		table.insert(v16, v19(v20, v21))
		v17 = v17 + 1
	end
	for _, v22 in v15 do
		if v22.day == nil then
			local v23 = v_u_3.createElement
			local v24 = v_u_13
			local v25 = {
				["key"] = v22.key,
				["cellSize"] = p_u_14.cellSize,
				["LayoutOrder"] = v22.LayoutOrder
			}
			table.insert(v16, v23(v24, v25))
		else
			local v26 = v_u_3.createElement
			local v27 = v_u_7
			local v28 = {
				["key"] = v22.key,
				["cellSize"] = p_u_14.cellSize,
				["day"] = v22.day,
				["hoveredDate"] = p_u_14.hoveredDate,
				["LayoutOrder"] = v22.LayoutOrder,
				["month"] = v22.month,
				["onDayActivated"] = p_u_14.onDayActivated,
				["onHoverEnter"] = p_u_14.onHoverEnter,
				["selectableDateRange"] = p_u_14.selectableDateRange,
				["selectedDates"] = p_u_14.selectedDates,
				["testId"] = p_u_14.testId,
				["year"] = v22.year
			}
			table.insert(v16, v26(v27, v28))
		end
	end
	return v_u_3.createElement(v_u_9, {
		["LayoutOrder"] = nil,
		["Size"] = nil,
		["tag"] = "auto-y",
		["testId"] = nil,
		["LayoutOrder"] = p_u_14.LayoutOrder,
		["Size"] = UDim2.fromOffset(p_u_14.paneWidth, 0),
		["testId"] = ("%*--pane-%*"):format(p_u_14.testId, p_u_14.LayoutOrder)
	}, v16)
end