-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Utilities.DateTimeCalendarViewUtilities
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.DateTimePickerRangeBandRole)
local v_u_3 = require(script.Parent.Parent.DateTimeUtilities)
local v_u_4 = require(v1.Utility.Wrappers).Services.LocalizationService
local function v_u_11(p5) -- name: roundUpToNearestHalfHour
	-- upvalues: (copy) v_u_3
	local v6 = v_u_3.toLocalTime(p5)
	if v6.Second == 0 and (v6.Minute == 0 or v6.Minute == 30) then
		return v_u_3.roundDownToNearestMinute(p5)
	end
	local v7 = v_u_3.roundToStartOfDay(p5)
	local v8 = (p5.UnixTimestamp - v7) / 1800
	local v9 = math.ceil(v8) * 1800
	local v10 = math.min(v9, 84600)
	return DateTime.fromUnixTimestamp(v7 + v10)
end
return {
	["getDayOfWeek"] = function(p12) -- name: getDayOfWeek
		local v13 = p12:FormatLocalTime("d", "en-us")
		return tonumber(v13) or 0
	end,
	["getRangeBandRadiusTag"] = function(p14, p15, p16) -- name: getRangeBandRadiusTag
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		local v17 = v_u_3.roundToStartOfDay(p15.startDate)
		local v18 = v_u_3.roundToStartOfDay(p15.endDate)
		local v19 = math.min(v17, v18)
		local v20 = math.max(v17, v18)
		local v21 = v_u_3.roundToStartOfDay(p14)
		local v22 = v19 < v21
		local v23 = v21 < v20
		local v24 = p14:FormatLocalTime("d", "en-us")
		local v25 = tonumber(v24) or 0
		local v26
		if p16 == v_u_2.Start then
			v26 = false
		else
			v26 = v25 == 0 and true or not v22
		end
		local v27
		if p16 == v_u_2.End then
			v27 = false
		else
			v27 = v25 == 6 and true or not v23
		end
		return v26 and v27 and "radius-circle" or (v26 and "radius-left-circle" or (v27 and "radius-right-circle" or ""))
	end,
	["getRangeDayBounds"] = function(p28) -- name: getRangeDayBounds
		-- upvalues: (copy) v_u_3
		local v29 = v_u_3.roundToStartOfDay(p28.startDate)
		local v30 = v_u_3.roundToStartOfDay(p28.endDate)
		return math.min(v29, v30), math.max(v29, v30)
	end,
	["getTimeSlotIndex"] = function(p31, p32) -- name: getTimeSlotIndex
		if p32 == nil then
			return nil
		end
		for v33, v34 in p31 do
			if v34.id ~= p32 then
				continue
			end
			return v33
		end
		return nil
	end,
	["getTimeSlotsForDay"] = function(p35) -- name: getTimeSlotsForDay
		-- upvalues: (copy) v_u_11, (copy) v_u_3, (copy) v_u_4
		local v36 = v_u_11(p35)
		local v37 = v_u_3.toLocalTime(v36)
		local v38 = DateTime.fromLocalTime(v37.Year, v37.Month, v37.Day, v37.Hour, v37.Minute, 0).UnixTimestamp
		local v39 = {}
		for v40 = 0, 47 do
			local v41 = v40 / 2
			local v42 = math.floor(v41)
			local v43 = v40 % 2 * 30
			local v44 = DateTime.fromLocalTime(v37.Year, v37.Month, v37.Day, v42, v43, 0)
			local v45 = {
				["id"] = v44.UnixTimestamp,
				["text"] = v44:FormatLocalTime("LT", v_u_4.RobloxLocaleId)
			}
			table.insert(v39, v45)
		end
		return v39, v38
	end,
	["resolveAnchorDate"] = function(p46, p47) -- name: resolveAnchorDate
		if p46 and p46[1] then
			return p46[1]
		else
			return p47 or DateTime.now()
		end
	end,
	["roundUpToNearestHalfHour"] = v_u_11,
	["toViewDate"] = function(p48) -- name: toViewDate
		-- upvalues: (copy) v_u_3
		local v49 = v_u_3.toLocalTime(p48)
		return {
			["month"] = v49.Month,
			["year"] = v49.Year
		}
	end
}