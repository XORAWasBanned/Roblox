-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Calendar.useSingleMonthCalendarState
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.React)
local v_u_3 = require(script.Parent.Parent.Utilities.DateTimeCalendarDayAppearanceUtilities)
local v_u_4 = require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local v_u_5 = require(script.Parent.Parent.Utilities.DateTimeParsingUtilities)
local v_u_6 = require(script.Parent.Parent.Utilities.DateTimeRangeSelectionUtilities)
local v_u_7 = require(script.Parent.Parent.DateTimeUtilities)
return function(p_u_8) -- name: useSingleMonthCalendarState
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_7, (copy) v_u_4, (copy) v_u_3, (copy) v_u_5
	local v_u_9 = p_u_8.isDateRange == true
	local v_u_10 = v_u_2.useMemo(function()
		-- upvalues: (copy) p_u_8, (ref) v_u_6, (copy) v_u_9
		return not p_u_8.selectedDates and {} or v_u_6.normalizeDates({
			["acceptsDateRange"] = v_u_9,
			["dates"] = p_u_8.selectedDates
		})
	end, { p_u_8.selectedDates, v_u_9 })
	local v_u_11, v_u_12 = v_u_2.useState(v_u_10)
	v_u_2.useEffect(function()
		-- upvalues: (copy) v_u_12, (copy) v_u_10
		v_u_12(v_u_10)
	end, { v_u_10 })
	v_u_2.useEffect(function()
		-- upvalues: (copy) p_u_8, (copy) v_u_10
		if not p_u_8.selectedDates then
			p_u_8.onSelectedDateChanged(v_u_10)
		end
	end, { p_u_8.selectedDates, v_u_10, p_u_8.onSelectedDateChanged })
	local v16 = v_u_2.useMemo(function()
		-- upvalues: (copy) v_u_11, (ref) v_u_7
		local v13 = {}
		for _, v14 in v_u_11 do
			local v15 = v_u_7.toLocalTime
			table.insert(v13, v15(v14))
		end
		return v13
	end, { v_u_11 })
	local v_u_17, v_u_18 = v_u_2.useState(v_u_4.toViewDate(v_u_4.resolveAnchorDate(p_u_8.selectedDates, p_u_8.referenceDate)))
	v_u_2.useEffect(function()
		-- upvalues: (copy) p_u_8, (copy) v_u_18, (ref) v_u_4
		if p_u_8.viewAnchorDate then
			v_u_18(v_u_4.toViewDate(p_u_8.viewAnchorDate))
		end
	end, { p_u_8.viewAnchorDate })
	local v21 = v_u_2.useCallback(function()
		-- upvalues: (ref) v_u_7, (copy) v_u_17, (copy) v_u_18
		local v19, v20 = v_u_7.getNextMonthInfo(v_u_17.month, v_u_17.year)
		v_u_18({
			["month"] = v19,
			["year"] = v20
		})
	end, { v_u_17 })
	local v24 = v_u_2.useCallback(function()
		-- upvalues: (ref) v_u_7, (copy) v_u_17, (copy) v_u_18
		local v22, v23 = v_u_7.getPrevMonthInfo(v_u_17.month, v_u_17.year)
		v_u_18({
			["month"] = v22,
			["year"] = v23
		})
	end, { v_u_17 })
	local v26 = v_u_2.useCallback(function(p25)
		-- upvalues: (copy) v_u_18
		v_u_18(p25)
	end, {})
	local v_u_27, v_u_28 = v_u_2.useState(function()
		return nil
	end)
	local v29 = v_u_2.useMemo(function()
		-- upvalues: (copy) v_u_9, (copy) v_u_11, (ref) v_u_3, (copy) v_u_27
		if v_u_9 then
			return v_u_3.resolveHighlightDates(v_u_11, v_u_27)
		else
			return v_u_11
		end
	end, { v_u_9, v_u_11, v_u_27 })
	local v31 = v_u_2.useCallback(function(p30)
		-- upvalues: (copy) v_u_9, (copy) v_u_28
		if v_u_9 then
			v_u_28(p30)
		end
	end, { v_u_9 })
	local v32 = v_u_2.useCallback(function()
		-- upvalues: (copy) v_u_28
		v_u_28(nil)
	end, {})
	v_u_2.useEffect(function()
		-- upvalues: (copy) v_u_9, (copy) v_u_11, (copy) v_u_28
		if v_u_9 then
			if not v_u_11[1] or v_u_11[2] then
				v_u_28(nil)
			end
		end
	end, { v_u_9, v_u_11 })
	return {
		["currViewDate"] = v_u_17,
		["handleDateActivated"] = v_u_2.useCallback(function(p33, p34, p35)
			-- upvalues: (copy) v_u_11, (ref) v_u_7, (copy) p_u_8, (ref) v_u_4, (copy) v_u_18, (copy) v_u_28, (copy) v_u_9, (ref) v_u_6, (copy) v_u_12
			local v36 = v_u_11[1]
			local v37, v38
			if v36 then
				local v39 = v_u_7.toLocalTime(v36)
				v37 = v39.Hour
				v38 = v39.Minute
			else
				v37 = 0
				v38 = 0
			end
			local v40 = DateTime.fromLocalTime(p35, p34, p33, v37, v38)
			if p_u_8.showTimeList then
				v40 = v_u_4.roundUpToNearestHalfHour(v40)
			end
			v_u_18({
				["month"] = p34,
				["year"] = p35
			})
			v_u_28(nil)
			local v41 = not v_u_9 and { v40 } or v_u_6.selectRangeEndpoint(v_u_11, v40)
			v_u_12(v41)
			p_u_8.onSelectedDateChanged(v41)
		end, {
			v_u_9,
			p_u_8.showTimeList,
			p_u_8.onSelectedDateChanged,
			v_u_11
		}),
		["highlightDates"] = v29,
		["isDateRange"] = v_u_9,
		["localSelectedDateTimes"] = v16,
		["navigateToNextMonth"] = v21,
		["navigateToPreviousMonth"] = v24,
		["onHoverEnter"] = v31,
		["onHoverLeave"] = v32,
		["onTimeListItemChanged"] = v_u_2.useCallback(function(p42)
			-- upvalues: (ref) v_u_5, (copy) v_u_12, (copy) p_u_8
			local v43 = v_u_5.adjustForDaylightSaving(DateTime.fromUnixTimestamp(p42))
			v_u_12({ v43 })
			p_u_8.onSelectedDateChanged({ v43 })
		end, { p_u_8.onSelectedDateChanged }),
		["onViewDateChanged"] = v26,
		["selectedDateTimes"] = v_u_11
	}
end