-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Calendar.CalendarHeader
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.React)
local v_u_5 = v3.Icon
require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local v_u_6 = require(script.Parent.Parent.DateTimeUtilities)
local v_u_7 = require(v1.Enums.ButtonVariant)
local v_u_8 = require(v1.Components.Dropdown)
local v_u_9 = require(v1.Components.IconButton)
local v_u_10 = require(v1.Enums.InputSize)
local v_u_11 = require(v1.Enums.InputVariant)
local v_u_12 = require(v1.Components.View)
local v_u_13 = require(v1.Utility.useScaledValue)
local v_u_14 = require(script.Parent.useScrollToSelectedRef)
local v_u_15 = require(v1.Utility.useTextSize)
local v_u_16 = require(v1.Providers.Style.useTokens)
return function(p_u_17) -- name: CalendarHeader
	-- upvalues: (copy) v_u_16, (copy) v_u_6, (copy) v_u_15, (copy) v_u_13, (copy) v_u_4, (copy) v_u_14, (copy) v_u_12, (copy) v_u_9, (copy) v_u_5, (copy) v_u_10, (copy) v_u_7, (copy) v_u_8, (copy) v_u_11
	local v_u_18 = p_u_17.viewDate
	local v19 = v_u_16()
	local v20 = v_u_6.monthMap[v_u_18.month]
	local v21 = v_u_18.year
	local v22 = tostring(v21)
	local v23 = v_u_15(v20, v19.Typography.BodySmall)
	local v24 = v_u_15(v22, v19.Typography.BodySmall)
	local v25 = v_u_13(44)
	local v26 = v_u_13(200)
	local v27
	if v23 then
		local v28 = v23.X
		v27 = math.ceil(v28) + v25
	else
		v27 = 110
	end
	local v29
	if v24 then
		local v30 = v24.X
		v29 = math.ceil(v30) + v25
	else
		v29 = 70
	end
	local v34 = v_u_4.useMemo(function()
		-- upvalues: (ref) v_u_6
		local v31 = {}
		for v32, v33 in v_u_6.monthMap do
			table.insert(v31, {
				["id"] = v32,
				["text"] = v33
			})
		end
		return v31
	end, {})
	local v42 = v_u_4.useMemo(function()
		-- upvalues: (copy) p_u_17, (ref) v_u_6, (copy) v_u_18
		local v35, v36
		if p_u_17.selectableDateRange then
			local v37 = v_u_6.toLocalTime(p_u_17.selectableDateRange.startDate)
			local v38 = v_u_6.toLocalTime(p_u_17.selectableDateRange.endDate)
			v35 = v37.Year
			v36 = v38.Year
		else
			v35 = v_u_18.year - 50
			v36 = v_u_18.year + 50
		end
		local v39 = {}
		for v40 = v35, v36 do
			local v41 = {
				["id"] = v40,
				["text"] = tostring(v40)
			}
			table.insert(v39, v41)
		end
		return v39
	end, { p_u_17.selectableDateRange, v_u_18.year })
	local v45 = v_u_4.useCallback(function(p43)
		-- upvalues: (copy) p_u_17, (copy) v_u_18
		local v44 = tonumber(p43)
		if v44 then
			p_u_17.onViewDateChanged({
				["month"] = v44,
				["year"] = v_u_18.year
			})
		end
	end, { p_u_17.onViewDateChanged, v_u_18.year })
	local v48 = v_u_4.useCallback(function(p46)
		-- upvalues: (copy) p_u_17, (copy) v_u_18
		local v47 = tonumber(p46)
		if v47 then
			p_u_17.onViewDateChanged({
				["month"] = v_u_18.month,
				["year"] = v47
			})
		end
	end, { p_u_17.onViewDateChanged, v_u_18.month })
	local v49 = v_u_14(v34, v_u_18.month)
	local v50 = v_u_14(v42, v_u_18.year)
	local v51 = v_u_4.createElement
	local v52 = v_u_12
	local v53 = {
		["LayoutOrder"] = nil,
		["tag"] = "row align-y-center gap-small size-full-0 auto-y padding-y-small",
		["LayoutOrder"] = p_u_17.LayoutOrder
	}
	local v54 = {
		["PreviousMonthButton"] = v_u_4.createElement(v_u_9, {
			["icon"] = nil,
			["LayoutOrder"] = 1,
			["onActivated"] = nil,
			["size"] = nil,
			["testId"] = nil,
			["variant"] = nil,
			["icon"] = v_u_5.ChevronSmallLeft,
			["onActivated"] = p_u_17.onPreviousMonth,
			["size"] = v_u_10.Small,
			["testId"] = ("%*--previous-month-button"):format(p_u_17.testId),
			["variant"] = v_u_7.Utility
		}),
		["MonthYearDropdowns"] = v_u_4.createElement(v_u_12, {
			["LayoutOrder"] = 2,
			["tag"] = "row align-x-center align-y-center grow gap-small auto-y"
		}, {
			["MonthDropdown"] = v_u_4.createElement(v_u_8.Root, {
				["items"] = nil,
				["label"] = "",
				["LayoutOrder"] = 1,
				["maxHeight"] = nil,
				["onItemChanged"] = nil,
				["scrollingFrameRef"] = nil,
				["size"] = nil,
				["testId"] = nil,
				["value"] = nil,
				["variant"] = nil,
				["width"] = nil,
				["items"] = v34,
				["maxHeight"] = v26,
				["onItemChanged"] = v45,
				["scrollingFrameRef"] = v49,
				["size"] = v_u_10.XSmall,
				["testId"] = ("%*--month-dropdown"):format(p_u_17.testId),
				["value"] = v_u_18.month,
				["variant"] = v_u_11.Utility,
				["width"] = UDim.new(0, v27)
			}),
			["YearDropdown"] = v_u_4.createElement(v_u_8.Root, {
				["items"] = nil,
				["label"] = "",
				["LayoutOrder"] = 2,
				["maxHeight"] = nil,
				["onItemChanged"] = nil,
				["scrollingFrameRef"] = nil,
				["size"] = nil,
				["testId"] = nil,
				["value"] = nil,
				["variant"] = nil,
				["width"] = nil,
				["items"] = v42,
				["maxHeight"] = v26,
				["onItemChanged"] = v48,
				["scrollingFrameRef"] = v50,
				["size"] = v_u_10.XSmall,
				["testId"] = ("%*--year-dropdown"):format(p_u_17.testId),
				["value"] = v_u_18.year,
				["variant"] = v_u_11.Utility,
				["width"] = UDim.new(0, v29)
			})
		}),
		["NextMonthButton"] = v_u_4.createElement(v_u_9, {
			["icon"] = nil,
			["LayoutOrder"] = 3,
			["onActivated"] = nil,
			["size"] = nil,
			["testId"] = nil,
			["variant"] = nil,
			["icon"] = v_u_5.ChevronSmallRight,
			["onActivated"] = p_u_17.onNextMonth,
			["size"] = v_u_10.Small,
			["testId"] = ("%*--next-month-button"):format(p_u_17.testId),
			["variant"] = v_u_7.Utility
		})
	}
	return v51(v52, v53, v54)
end