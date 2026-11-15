-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.DateTimePickerCalendarContent
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(script.Parent.DateTimeUtilities)
local v_u_4 = require(script.Parent.Calendar.SingleMonthCalendar)
local v_u_5 = require(v1.Enums.DateTimePickerVariant)
local v_u_6 = require(v1.Components.Divider)
local v_u_7 = require(v1.Components.View)
return function(p8) -- name: DateTimePickerCalendarContent
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_7, (copy) v_u_6, (copy) v_u_4
	local v9 = ("%*--calendar"):format(p8.testId)
	if p8.variant ~= v_u_5.DualWithPresets then
		return v_u_3.createElement(v_u_4, {
			["isDateRange"] = nil,
			["LayoutOrder"] = 1,
			["onSelectedDateChanged"] = nil,
			["referenceDate"] = nil,
			["selectableDateRange"] = nil,
			["selectedDates"] = nil,
			["showTimeList"] = nil,
			["testId"] = nil,
			["viewAnchorDate"] = nil,
			["isDateRange"] = p8.variant == v_u_5.Dual,
			["onSelectedDateChanged"] = p8.onSelectedDatesChanged,
			["referenceDate"] = p8.referenceDate,
			["selectableDateRange"] = p8.selectableDateRange,
			["selectedDates"] = p8.selectedDates,
			["showTimeList"] = p8.variant == v_u_5.SingleWithTime,
			["testId"] = v9,
			["viewAnchorDate"] = p8.viewAnchorDate
		})
	end
	local v10 = require(script.Parent.Calendar.TwoMonthCalendar)
	local v11 = require(script.Parent.Presets.DateRangePresets)
	return v_u_3.createElement(v_u_7, {
		["tag"] = "col size-full-0 auto-y"
	}, {
		["Calendar"] = v_u_3.createElement(v10, {
			["LayoutOrder"] = 1,
			["onDayActivated"] = nil,
			["referenceDate"] = nil,
			["selectableDateRange"] = nil,
			["selectedDates"] = nil,
			["testId"] = nil,
			["viewAnchorDate"] = nil,
			["onDayActivated"] = p8.onDayActivated,
			["referenceDate"] = p8.referenceDate,
			["selectableDateRange"] = p8.selectableDateRange,
			["selectedDates"] = p8.selectedDates,
			["testId"] = v9,
			["viewAnchorDate"] = p8.viewAnchorDate
		}),
		["PresetsDivider"] = v_u_3.createElement(v_u_6, {
			["LayoutOrder"] = 2
		}),
		["PresetsBar"] = v_u_3.createElement(v_u_7, {
			["LayoutOrder"] = 3,
			["tag"] = "row size-full-0 auto-y padding-x-large padding-y-medium"
		}, {
			["Presets"] = v_u_3.createElement(v11, {
				["LayoutOrder"] = 1,
				["onPresetSelected"] = nil,
				["referenceDate"] = nil,
				["selectableDateRange"] = nil,
				["selectedDates"] = nil,
				["testId"] = nil,
				["onPresetSelected"] = p8.onPresetSelected,
				["referenceDate"] = p8.referenceDate,
				["selectableDateRange"] = p8.selectableDateRange,
				["selectedDates"] = p8.selectedDates,
				["testId"] = ("%*--presets"):format(v9)
			})
		})
	})
end