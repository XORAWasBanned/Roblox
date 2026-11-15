-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.DateTimeUtilities
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Utility.Wrappers).Services.LocalizationService
local v3 = require(v1.Utility.Localization.Translator)
local function v_u_6(p4, p5) -- name: getDaysInMonth
	return p4 == 2 and (p5 % 4 == 0 and p5 % 100 ~= 0 or p5 % 400 == 0) and 29 or ({
		31,
		28,
		31,
		30,
		31,
		30,
		31,
		31,
		30,
		31,
		30,
		31
	})[p4]
end
local function v_u_19(p7) -- name: getHoursAndMinutesFromString
	local v8 = p7:gsub("%s+", "")
	local v9 = string.match(v8, "^%d%d:%d%d$")
	local v10 = string.match(v8, "^%d%d?:%d%d[AP]M$")
	if v9 or v10 then
		if v10 then
			local v11, v12 = string.match(v8, "^(%d%d?):(%d%d)[AP]M$")
			local v13 = tonumber(v11)
			local v14 = tonumber(v12)
			if v13 and (v14 and (v13 >= 1 and (v13 <= 12 and (v14 >= 0 and v14 <= 59)))) then
				if string.sub(v8, -2) == "PM" and v13 ~= 12 then
					return v13 + 12, v14
				elseif string.sub(v8, -2) == "AM" and v13 == 12 then
					return 0, v14
				else
					return v13, v14
				end
			else
				return nil
			end
		else
			local v15, v16 = string.match(v8, "^(%d%d?):(%d%d)$")
			local v17 = tonumber(v15)
			local v18 = tonumber(v16)
			if v17 and (v18 and (v17 >= 0 and (v17 <= 23 and (v18 >= 0 and v18 <= 59)))) then
				return v17, v18
			else
				return nil
			end
		end
	else
		return nil
	end
end
return {
	["formatLocalTime"] = function(p20, p21) -- name: formatLocalTime
		-- upvalues: (copy) v_u_2
		local v22 = p20:FormatLocalTime("L", v_u_2.RobloxLocaleId)
		if p21 then
			v22 = v22 .. ", " .. p20:FormatLocalTime("LT", v_u_2.RobloxLocaleId)
		end
		return v22
	end,
	["getDateTimeFromText"] = function(p23) -- name: getDateTimeFromText
		-- upvalues: (copy) v_u_19
		local v24
		if string.find(p23, ",") then
			p23, v24 = p23:match("^([^,]+),%s*(.+)$")
		else
			v24 = "00:00"
		end
		if not (p23 and v24) then
			return nil
		end
		local v_u_25 = p23:gsub("%s+", "")
		local v_u_26, v_u_27 = v_u_19(v24)
		if p23 then
			local v_u_28 = v_u_25:find("[/%.%-]")
			local v35, v36 = pcall(function()
				-- upvalues: (copy) v_u_28, (copy) v_u_25, (copy) v_u_26, (copy) v_u_27
				if v_u_28 == 3 then
					local v29, v30, v31 = v_u_25:match("^(%d%d)[/%.%-](%d%d)[/%.%-](%d%d%d%d)$")
					return DateTime.fromLocalTime(tonumber(v31), tonumber(v29), tonumber(v30), v_u_26, v_u_27, 0)
				end
				if v_u_28 == 5 then
					local v32, v33, v34 = v_u_25:match("^(%d%d%d%d)[/%.%-](%d%d)[/%.%-](%d%d)$")
					return DateTime.fromLocalTime(tonumber(v32), tonumber(v33), tonumber(v34), v_u_26, v_u_27, 0)
				end
				error("Invalid date format: " .. v_u_25)
			end)
			if v35 and v36 then
				if os.date("*t", v36.UnixTimestamp).isdst then
					local v37 = v36.UnixTimestamp
					v36 = DateTime.fromUnixTimestamp(v37 - 3600)
				end
				return v36
			end
		end
		return nil
	end,
	["getDaysInMonth"] = v_u_6,
	["getFirstDayOfWeek"] = function(p38, p39) -- name: getFirstDayOfWeek
		local v40 = DateTime.fromLocalTime(p39, p38, 1)
		if not v40 then
			return 0
		end
		local v41 = v40:FormatLocalTime("d", "en-us")
		return tonumber(v41) or 0
	end,
	["getLastDayOfWeek"] = function(p42, p43) -- name: getLastDayOfWeek
		-- upvalues: (copy) v_u_6
		local v44 = DateTime.fromLocalTime(p43, p42, (v_u_6(p42, p43)))
		if not v44 then
			return 0
		end
		local v45 = v44:FormatLocalTime("d", "en-us")
		return tonumber(v45) or 0
	end,
	["getNextMonthInfo"] = function(p46, p47) -- name: getNextMonthInfo
		if p46 == 12 then
			return 1, p47 + 1
		else
			return p46 + 1, p47
		end
	end,
	["getPrevMonthInfo"] = function(p48, p49) -- name: getPrevMonthInfo
		if p48 == 1 then
			return 12, p49 - 1
		else
			return p48 - 1, p49
		end
	end,
	["isDateWithinRange"] = function(p50, p51) -- name: isDateWithinRange
		local v52 = p51.startDate:ToLocalTime()
		local v53 = DateTime.fromLocalTime(v52.Year, v52.Month, v52.Day).UnixTimestamp
		local v54 = p51.endDate:ToLocalTime()
		local v55 = DateTime.fromLocalTime(v54.Year, v54.Month, v54.Day).UnixTimestamp
		local v56 = p50:ToLocalTime()
		local v57 = DateTime.fromLocalTime(v56.Year, v56.Month, v56.Day).UnixTimestamp
		local v58
		if v53 <= v57 then
			v58 = v57 <= v55
		else
			v58 = false
		end
		return v58
	end,
	["monthMap"] = {
		v3:FormatByKey("CommonUI.Controls.Label.January"),
		v3:FormatByKey("CommonUI.Controls.Label.February"),
		v3:FormatByKey("CommonUI.Controls.Label.March"),
		v3:FormatByKey("CommonUI.Controls.Label.April"),
		v3:FormatByKey("CommonUI.Controls.Label.May"),
		v3:FormatByKey("CommonUI.Controls.Label.June"),
		v3:FormatByKey("CommonUI.Controls.Label.July"),
		v3:FormatByKey("CommonUI.Controls.Label.August"),
		v3:FormatByKey("CommonUI.Controls.Label.September"),
		v3:FormatByKey("CommonUI.Controls.Label.October"),
		v3:FormatByKey("CommonUI.Controls.Label.November"),
		v3:FormatByKey("CommonUI.Controls.Label.December")
	},
	["roundDownToNearestMinute"] = function(p59) -- name: roundDownToNearestMinute
		local v60 = p59:ToLocalTime()
		return DateTime.fromLocalTime(v60.Year, v60.Month, v60.Day, v60.Hour, v60.Minute, 0)
	end,
	["roundToStartOfDay"] = function(p61) -- name: roundToStartOfDay
		local v62 = p61:ToLocalTime()
		return DateTime.fromLocalTime(v62.Year, v62.Month, v62.Day).UnixTimestamp
	end,
	["toLocalTime"] = function(p63) -- name: toLocalTime
		return p63:ToLocalTime()
	end,
	["weekdays"] = {
		v3:FormatByKey("CommonUI.Controls.Label.SundayAbbreviated"),
		v3:FormatByKey("CommonUI.Controls.Label.MondayAbbreviated"),
		v3:FormatByKey("CommonUI.Controls.Label.TuesdayAbbreviated"),
		v3:FormatByKey("CommonUI.Controls.Label.WednesdayAbbreviated"),
		v3:FormatByKey("CommonUI.Controls.Label.ThursdayAbbreviated"),
		v3:FormatByKey("CommonUI.Controls.Label.FridayAbbreviated"),
		v3:FormatByKey("CommonUI.Controls.Label.SaturdayAbbreviated")
	}
}