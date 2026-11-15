-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Calendar.TwoMonthCalendar
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local v_u_5 = require(script.Parent.Parent.Utilities.DateTimeLayoutUtilities)
local v_u_6 = require(script.Parent.Parent.DateTimeUtilities)
local v_u_7 = require(v1.Components.Divider)
local v_u_8 = require(script.Parent.TwoMonthCalendarHeader)
local v_u_9 = require(script.Parent.TwoMonthCalendarPane)
local v_u_10 = require(v1.Components.View)
local v_u_11 = require(v1.Utility.useScaledValue)
return function(p_u_12) -- name: TwoMonthCalendar
	-- upvalues: (copy) v_u_11, (copy) v_u_5, (copy) v_u_3, (copy) v_u_4, (copy) v_u_6, (copy) v_u_10, (copy) v_u_8, (copy) v_u_7, (copy) v_u_9
	local v13 = v_u_11(v_u_5.PANE_WIDTH)
	local v14 = v13 / 7
	local v15, v_u_16 = v_u_3.useState(v_u_4.toViewDate(v_u_4.resolveAnchorDate(p_u_12.selectedDates, p_u_12.referenceDate)))
	local v17, v_u_18 = v_u_3.useState(function()
		return nil
	end)
	local v_u_19 = v_u_3.useRef(nil)
	v_u_3.useEffect(function()
		-- upvalues: (copy) p_u_12, (copy) v_u_16, (ref) v_u_4
		if p_u_12.viewAnchorDate then
			v_u_16(v_u_4.toViewDate(p_u_12.viewAnchorDate))
		end
	end, { p_u_12.viewAnchorDate })
	v_u_3.useEffect(function()
		-- upvalues: (copy) p_u_12, (copy) v_u_16, (ref) v_u_4
		if not (p_u_12.viewAnchorDate or p_u_12.selectedDates and p_u_12.selectedDates[1]) then
			if p_u_12.referenceDate then
				v_u_16(v_u_4.toViewDate(p_u_12.referenceDate))
			end
		end
	end, { p_u_12.viewAnchorDate, p_u_12.referenceDate, p_u_12.selectedDates })
	v_u_3.useEffect(function()
		-- upvalues: (copy) p_u_12, (copy) v_u_18
		local v20 = p_u_12.selectedDates
		if not v20 or (not v20[1] or v20[2]) then
			v_u_18(nil)
		end
	end, { p_u_12.selectedDates })
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_19, (copy) v_u_18
		local v21 = v_u_19.current
		if v21 ~= nil then
			local v_u_22 = v21.MouseLeave:Connect(function()
				-- upvalues: (ref) v_u_18
				v_u_18(nil)
			end)
			return function()
				-- upvalues: (copy) v_u_22
				v_u_22:Disconnect()
			end
		end
	end, {})
	local v26 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_16, (ref) v_u_6
		v_u_16(function(p23)
			-- upvalues: (ref) v_u_6
			local v24, v25 = v_u_6.getPrevMonthInfo(p23.month, p23.year)
			return {
				["month"] = v24,
				["year"] = v25
			}
		end)
	end, {})
	local v30 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_16, (ref) v_u_6
		v_u_16(function(p27)
			-- upvalues: (ref) v_u_6
			local v28, v29 = v_u_6.getNextMonthInfo(p27.month, p27.year)
			return {
				["month"] = v28,
				["year"] = v29
			}
		end)
	end, {})
	local v32 = v_u_3.useCallback(function(p31)
		-- upvalues: (copy) v_u_18
		v_u_18(p31)
	end, {})
	local v34 = v_u_3.useCallback(function(p33)
		-- upvalues: (copy) v_u_18, (copy) p_u_12
		v_u_18(nil)
		p_u_12.onDayActivated(p33)
	end, { p_u_12.onDayActivated })
	local v35, v36 = v_u_6.getNextMonthInfo(v15.month, v15.year)
	local v37 = v_u_3.createElement
	local v38 = v_u_10
	local v39 = {
		["LayoutOrder"] = nil,
		["tag"] = "col size-full-0 auto-y",
		["testId"] = nil,
		["LayoutOrder"] = p_u_12.LayoutOrder,
		["testId"] = p_u_12.testId
	}
	local v40 = {
		["Header"] = v_u_3.createElement(v_u_8, {
			["currViewDate"] = v15,
			["onNextMonth"] = v30,
			["onPreviousMonth"] = v26,
			["secondMonth"] = v35,
			["secondYear"] = v36,
			["testId"] = p_u_12.testId
		}),
		["HeaderDivider"] = v_u_3.createElement(v_u_7, {
			["LayoutOrder"] = 2
		})
	}
	local v41 = v_u_3.createElement
	local v42 = v_u_10
	local v43 = {
		["FirstPane"] = v_u_3.createElement(v_u_9, {
			["cellSize"] = nil,
			["hoveredDate"] = nil,
			["LayoutOrder"] = 1,
			["month"] = nil,
			["onDayActivated"] = nil,
			["onHoverEnter"] = nil,
			["paneWidth"] = nil,
			["selectableDateRange"] = nil,
			["selectedDates"] = nil,
			["testId"] = nil,
			["year"] = nil,
			["cellSize"] = v14,
			["hoveredDate"] = v17,
			["month"] = v15.month,
			["onDayActivated"] = v34,
			["onHoverEnter"] = v32,
			["paneWidth"] = v13,
			["selectableDateRange"] = p_u_12.selectableDateRange,
			["selectedDates"] = p_u_12.selectedDates,
			["testId"] = p_u_12.testId,
			["year"] = v15.year
		}),
		["SecondPane"] = v_u_3.createElement(v_u_9, {
			["cellSize"] = nil,
			["hoveredDate"] = nil,
			["LayoutOrder"] = 2,
			["month"] = nil,
			["onDayActivated"] = nil,
			["onHoverEnter"] = nil,
			["paneWidth"] = nil,
			["selectableDateRange"] = nil,
			["selectedDates"] = nil,
			["testId"] = nil,
			["year"] = nil,
			["cellSize"] = v14,
			["hoveredDate"] = v17,
			["month"] = v35,
			["onDayActivated"] = v34,
			["onHoverEnter"] = v32,
			["paneWidth"] = v13,
			["selectableDateRange"] = p_u_12.selectableDateRange,
			["selectedDates"] = p_u_12.selectedDates,
			["testId"] = p_u_12.testId,
			["year"] = v36
		})
	}
	v40.Panes = v41(v42, {
		["LayoutOrder"] = 3,
		["ref"] = nil,
		["tag"] = "row align-y-top gap-large auto-xy padding-x-large padding-y-small",
		["ref"] = v_u_19
	}, v43)
	return v37(v38, v39, v40)
end