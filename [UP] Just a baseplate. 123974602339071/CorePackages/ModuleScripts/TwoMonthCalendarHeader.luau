-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Calendar.TwoMonthCalendarHeader
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.React)
local v_u_5 = v3.Icon
require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local v_u_6 = require(script.Parent.Parent.DateTimeUtilities)
local v_u_7 = require(v1.Enums.ButtonVariant)
local v_u_8 = require(v1.Components.IconButton)
local v_u_9 = require(v1.Enums.InputSize)
local v_u_10 = require(v1.Components.Text)
local v_u_11 = require(v1.Components.View)
return function(p12) -- name: TwoMonthCalendarHeader
	-- upvalues: (copy) v_u_4, (copy) v_u_11, (copy) v_u_8, (copy) v_u_5, (copy) v_u_9, (copy) v_u_7, (copy) v_u_10, (copy) v_u_6
	local v13 = v_u_4.createElement
	local v14 = v_u_11
	local v15 = {
		["PreviousMonthButton"] = v_u_4.createElement(v_u_8, {
			["icon"] = nil,
			["isCircular"] = false,
			["LayoutOrder"] = 1,
			["onActivated"] = nil,
			["size"] = nil,
			["testId"] = nil,
			["variant"] = nil,
			["icon"] = v_u_5.ChevronSmallLeft,
			["onActivated"] = p12.onPreviousMonth,
			["size"] = v_u_9.Small,
			["testId"] = ("%*--previous-month-button"):format(p12.testId),
			["variant"] = v_u_7.Utility
		}),
		["FirstMonthLabel"] = v_u_4.createElement(v_u_10, {
			["LayoutOrder"] = 2,
			["tag"] = "grow auto-y text-title-small text-align-x-center",
			["testId"] = nil,
			["Text"] = nil,
			["testId"] = ("%*--first-month-label"):format(p12.testId),
			["Text"] = ("%* %*"):format(v_u_6.monthMap[p12.currViewDate.month], p12.currViewDate.year)
		}),
		["SecondMonthLabel"] = v_u_4.createElement(v_u_10, {
			["LayoutOrder"] = 3,
			["tag"] = "grow auto-y text-title-small text-align-x-center",
			["testId"] = nil,
			["Text"] = nil,
			["testId"] = ("%*--second-month-label"):format(p12.testId),
			["Text"] = ("%* %*"):format(v_u_6.monthMap[p12.secondMonth], p12.secondYear)
		}),
		["NextMonthButton"] = v_u_4.createElement(v_u_8, {
			["icon"] = nil,
			["isCircular"] = false,
			["LayoutOrder"] = 4,
			["onActivated"] = nil,
			["size"] = nil,
			["testId"] = nil,
			["variant"] = nil,
			["icon"] = v_u_5.ChevronSmallRight,
			["onActivated"] = p12.onNextMonth,
			["size"] = v_u_9.Small,
			["testId"] = ("%*--next-month-button"):format(p12.testId),
			["variant"] = v_u_7.Utility
		})
	}
	return v13(v14, {
		["LayoutOrder"] = 1,
		["tag"] = "row align-y-center gap-small size-full-0 auto-y padding-x-large padding-y-medium"
	}, v15)
end