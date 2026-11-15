-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Utilities.DateTimePresetRangesUtilities
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(script.Parent.DateTimeCalendarViewUtilities)
local v_u_3 = require(v1.Enums.DateTimePickerDateRangePreset)
local v_u_4 = require(script.Parent.Parent.DateTimeUtilities)
return {
	["resolvePresetRange"] = function(p5, p6) -- name: resolvePresetRange
		-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_2
		local v7 = p6 or DateTime.now()
		local v8 = v_u_4.toLocalTime(v7)
		local v9 = v_u_4.toLocalTime(v7)
		local v10 = DateTime.fromLocalTime(v9.Year, v9.Month, v9.Day)
		if p5 == v_u_3.Today then
			return {
				["startDate"] = v10,
				["endDate"] = v10
			}
		end
		if p5 == v_u_3.ThisWeek then
			local v11 = -v_u_2.getDayOfWeek(v7)
			local v12 = v_u_4.toLocalTime(v10)
			local v13 = DateTime.fromLocalTime(v12.Year, v12.Month, v12.Day, 12, 0, 0)
			local v14 = DateTime.fromUnixTimestamp(v13.UnixTimestamp + v11 * 86400)
			local v15 = v_u_4.toLocalTime(v14)
			local v16 = DateTime.fromLocalTime(v15.Year, v15.Month, v15.Day)
			local v17 = {
				["startDate"] = v16
			}
			local v18 = v_u_4.toLocalTime(v16)
			local v19 = DateTime.fromLocalTime(v18.Year, v18.Month, v18.Day, 12, 0, 0)
			local v20 = DateTime.fromUnixTimestamp(v19.UnixTimestamp + 518400)
			local v21 = v_u_4.toLocalTime(v20)
			v17.endDate = DateTime.fromLocalTime(v21.Year, v21.Month, v21.Day)
			return v17
		end
		if p5 ~= v_u_3.LastWeek then
			return p5 == v_u_3.ThisMonth and {
				["startDate"] = DateTime.fromLocalTime(v8.Year, v8.Month, 1),
				["endDate"] = DateTime.fromLocalTime(v8.Year, v8.Month, v_u_4.getDaysInMonth(v8.Month, v8.Year))
			} or (p5 == v_u_3.ThisYear and {
				["startDate"] = DateTime.fromLocalTime(v8.Year, 1, 1),
				["endDate"] = DateTime.fromLocalTime(v8.Year, 12, 31)
			} or {
				["startDate"] = DateTime.fromLocalTime(v8.Year - 1, 1, 1),
				["endDate"] = DateTime.fromLocalTime(v8.Year - 1, 12, 31)
			})
		end
		local v22 = -v_u_2.getDayOfWeek(v7) - 7
		local v23 = v_u_4.toLocalTime(v10)
		local v24 = DateTime.fromLocalTime(v23.Year, v23.Month, v23.Day, 12, 0, 0)
		local v25 = DateTime.fromUnixTimestamp(v24.UnixTimestamp + v22 * 86400)
		local v26 = v_u_4.toLocalTime(v25)
		local v27 = DateTime.fromLocalTime(v26.Year, v26.Month, v26.Day)
		local v28 = {
			["startDate"] = v27
		}
		local v29 = v_u_4.toLocalTime(v27)
		local v30 = DateTime.fromLocalTime(v29.Year, v29.Month, v29.Day, 12, 0, 0)
		local v31 = DateTime.fromUnixTimestamp(v30.UnixTimestamp + 518400)
		local v32 = v_u_4.toLocalTime(v31)
		v28.endDate = DateTime.fromLocalTime(v32.Year, v32.Month, v32.Day)
		return v28
	end
}