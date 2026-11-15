-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Calendar.SingleMonthCalendar
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(script.Parent.CalendarGrid).CalendarGrid
local v_u_5 = require(script.Parent.CalendarHeader)
local v_u_6 = require(script.Parent.Parent.Utilities.DateTimeCalendarConstants)
local v_u_7 = require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local v_u_8 = require(script.Parent.Parent.Utilities.DateTimeLayoutUtilities)
require(script.Parent.Parent.DateTimeUtilities)
local v_u_9 = require(script.Parent.Parent.Time.TimeList)
local v_u_10 = require(v1.Components.View)
local v_u_11 = require(script.Parent.useSingleMonthCalendarState)
local v_u_12 = require(v1.Utility.useScaledValue)
local v_u_13 = require(v1.Providers.Style.useTokens)
local v_u_14 = require(v1.Utility.withDefaults)
local v_u_15 = {
	["testId"] = "--foundation-calendar"
}
local function v_u_21(p16) -- name: CalendarPane
	-- upvalues: (copy) v_u_3, (copy) v_u_10, (copy) v_u_5, (copy) v_u_4
	local v17 = p16.state
	local v18 = v_u_3.createElement
	local v19 = v_u_10
	local v20 = {
		["LayoutOrder"] = p16.LayoutOrder,
		["Size"] = p16.Size,
		["tag"] = {
			["col gap-small padding-large"] = p16.showTimeList == true,
			["col auto-y"] = p16.showTimeList ~= true
		},
		["testId"] = p16.rootTestId
	}
	return v18(v19, v20, {
		["CalendarHeader"] = v_u_3.createElement(v_u_5, {
			["LayoutOrder"] = 1,
			["onNextMonth"] = nil,
			["onPreviousMonth"] = nil,
			["onViewDateChanged"] = nil,
			["selectableDateRange"] = nil,
			["testId"] = nil,
			["viewDate"] = nil,
			["onNextMonth"] = v17.navigateToNextMonth,
			["onPreviousMonth"] = v17.navigateToPreviousMonth,
			["onViewDateChanged"] = v17.onViewDateChanged,
			["selectableDateRange"] = p16.selectableDateRange,
			["testId"] = p16.testId,
			["viewDate"] = v17.currViewDate
		}),
		["WeekAndDates"] = v_u_3.createElement(v_u_4, {
			["currViewDate"] = nil,
			["handleDateActivated"] = nil,
			["highlightDates"] = nil,
			["isDateRange"] = nil,
			["localSelectedDateTimes"] = nil,
			["LayoutOrder"] = 2,
			["onHoverEnter"] = nil,
			["onHoverLeave"] = nil,
			["scaledCalendarWidth"] = nil,
			["selectableDateRange"] = nil,
			["Size"] = nil,
			["testId"] = nil,
			["currViewDate"] = v17.currViewDate,
			["handleDateActivated"] = v17.handleDateActivated,
			["highlightDates"] = v17.highlightDates,
			["isDateRange"] = v17.isDateRange,
			["localSelectedDateTimes"] = v17.localSelectedDateTimes,
			["onHoverEnter"] = v17.onHoverEnter,
			["onHoverLeave"] = v17.onHoverLeave,
			["scaledCalendarWidth"] = p16.scaledCalendarWidth,
			["selectableDateRange"] = p16.selectableDateRange,
			["Size"] = p16.gridSize,
			["testId"] = p16.testId
		})
	})
end
return function(p22) -- name: SingleMonthCalendar
	-- upvalues: (copy) v_u_14, (copy) v_u_15, (copy) v_u_13, (copy) v_u_12, (copy) v_u_8, (copy) v_u_11, (copy) v_u_6, (copy) v_u_3, (copy) v_u_10, (copy) v_u_21, (copy) v_u_9, (copy) v_u_7
	local v23 = v_u_14(p22, v_u_15)
	local v24 = v_u_13()
	local v25 = v_u_12(v_u_8.CALENDAR_WIDTH)
	local v26 = v_u_12(v_u_8.TIME_LIST_WIDTH)
	local v27 = v_u_11({
		["isDateRange"] = v23.isDateRange,
		["onSelectedDateChanged"] = v23.onSelectedDateChanged,
		["referenceDate"] = v23.referenceDate,
		["selectableDateRange"] = v23.selectableDateRange,
		["selectedDates"] = v23.selectedDates,
		["showTimeList"] = v23.showTimeList,
		["viewAnchorDate"] = v23.viewAnchorDate
	})
	if not v23.showTimeList then
		return v_u_3.createElement(v_u_21, {
			["LayoutOrder"] = v23.LayoutOrder,
			["rootTestId"] = v23.testId,
			["scaledCalendarWidth"] = v25,
			["selectableDateRange"] = v23.selectableDateRange,
			["Size"] = UDim2.fromOffset(v25, 0),
			["state"] = v27,
			["testId"] = v23.testId
		})
	end
	local v28 = v_u_8.computeSingleWithTimeLayout(v25, v26, v24, v_u_6.NUM_CALENDAR_GRID_ROWS)
	local v29 = v_u_3.createElement
	local v30 = v_u_10
	local v31 = {
		["LayoutOrder"] = nil,
		["tag"] = "row align-y-top auto-xy",
		["testId"] = nil,
		["LayoutOrder"] = v23.LayoutOrder,
		["testId"] = v23.testId
	}
	local v32 = {
		["CalendarPane"] = v_u_3.createElement(v_u_21, {
			["gridSize"] = nil,
			["LayoutOrder"] = 1,
			["scaledCalendarWidth"] = nil,
			["selectableDateRange"] = nil,
			["showTimeList"] = true,
			["Size"] = nil,
			["state"] = nil,
			["testId"] = nil,
			["gridSize"] = UDim2.fromOffset(v25, v28.gridHeight),
			["scaledCalendarWidth"] = v25,
			["selectableDateRange"] = v23.selectableDateRange,
			["Size"] = UDim2.fromOffset(v28.calendarColumnWidth, v28.bodyHeight),
			["state"] = v27,
			["testId"] = v23.testId
		}),
		["Divider"] = v_u_3.createElement(v_u_10, {
			["backgroundStyle"] = nil,
			["LayoutOrder"] = 2,
			["Size"] = nil,
			["backgroundStyle"] = v24.Color.Stroke.Default,
			["Size"] = UDim2.fromOffset(v24.Stroke.Standard, v28.bodyHeight)
		})
	}
	local v33 = v_u_3.createElement
	local v34 = v_u_10
	local v35 = {
		["LayoutOrder"] = 3,
		["Size"] = nil,
		["tag"] = "col padding-large",
		["Size"] = UDim2.fromOffset(v28.timeListColumnWidth, v28.bodyHeight)
	}
	local v36 = {
		["TimeList"] = v_u_3.createElement(v_u_9, {
			["dateTime"] = nil,
			["dayAnchor"] = nil,
			["height"] = nil,
			["LayoutOrder"] = 1,
			["onItemChanged"] = nil,
			["testId"] = nil,
			["width"] = nil,
			["dateTime"] = v27.selectedDateTimes[1],
			["dayAnchor"] = v_u_7.resolveAnchorDate(v27.selectedDateTimes, v23.viewAnchorDate or v23.referenceDate),
			["height"] = v28.timeListHeight,
			["onItemChanged"] = v27.onTimeListItemChanged,
			["testId"] = ("%*--time-list"):format(v23.testId),
			["width"] = UDim.new(0, v26)
		})
	}
	v32.TimeListColumn = v33(v34, v35, v36)
	return v29(v30, v31, v32)
end