-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Utilities.DateTimeCalendarDayConfigUtilities
local v1 = script:FindFirstAncestor("Foundation")
local v2 = require(script.Parent.DateTimeCalendarConstants)
require(script.Parent.DateTimeCalendarViewUtilities)
local v_u_3 = require(v1.Enums.DateTimePickerCalendarDayKeyPrefix)
local v_u_4 = require(script.Parent.Parent.DateTimeUtilities)
local v_u_5 = v2.DAYS_PER_WEEK
local v_u_6 = v2.NUM_ELEMENTS_IN_DATES_GRID
local v_u_7 = v2.NUM_NON_DAY_ELEMENTS
local v_u_8 = v2.NUM_WEEKDAY_HEADERS
return {
	["buildCalendarDayConfigs"] = function(p9) -- name: buildCalendarDayConfigs
		-- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_5, (copy) v_u_3, (copy) v_u_7, (copy) v_u_6
		local v10 = {}
		local v11 = v_u_8 + 1
		local v12, v13 = v_u_4.getPrevMonthInfo(p9.month, p9.year)
		local v14 = v_u_4.getDaysInMonth(v12, v13)
		local v15 = p9.month
		local v16 = p9.year
		local v17 = v_u_4.getFirstDayOfWeek(v15, v16)
		if v17 == 0 then
			v17 = v_u_5
		end
		for v18 = 1, v17 do
			local v19 = {
				["day"] = v14 - v17 + v18,
				["keyPrefix"] = v_u_3.PrevMonth,
				["LayoutOrder"] = v11,
				["month"] = v12,
				["year"] = v13
			}
			table.insert(v10, v19)
			v11 = v11 + 1
		end
		for v20 = 1, v_u_4.getDaysInMonth(p9.month, p9.year) do
			local v21 = {
				["applyEmphasis"] = true,
				["day"] = nil,
				["keyPrefix"] = nil,
				["LayoutOrder"] = nil,
				["month"] = nil,
				["year"] = nil,
				["day"] = v20,
				["keyPrefix"] = v_u_3.CurrentMonth,
				["LayoutOrder"] = v11,
				["month"] = p9.month,
				["year"] = p9.year
			}
			table.insert(v10, v21)
			v11 = v11 + 1
		end
		local v22 = v_u_4.getLastDayOfWeek(p9.month, p9.year)
		local v23, v24 = v_u_4.getNextMonthInfo(p9.month, p9.year)
		local v25 = v_u_5 - (v22 + 1)
		local v26 = v_u_7 + #v10
		if v25 + v26 < v_u_6 then
			v25 = v25 + (v_u_6 - v26 - v25)
		end
		for v27 = 1, v25 do
			local v28 = {
				["day"] = v27,
				["keyPrefix"] = v_u_3.NextMonth,
				["LayoutOrder"] = v11,
				["month"] = v23,
				["year"] = v24
			}
			table.insert(v10, v28)
			v11 = v11 + 1
		end
		return v10
	end,
	["buildTwoMonthPaneCellConfigs"] = function(p29, p30) -- name: buildTwoMonthPaneCellConfigs
		-- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_5
		local v31 = v_u_8 + 1
		local v32 = v_u_4.getFirstDayOfWeek(p29, p30)
		local v33 = {}
		for v34 = 1, v32 do
			local v35 = {
				["key"] = ("lead-%*"):format(v34),
				["LayoutOrder"] = v31
			}
			table.insert(v33, v35)
			v31 = v31 + 1
		end
		local v36 = v_u_4.getDaysInMonth(p29, p30)
		for v37 = 1, v36 do
			local v38 = {
				["day"] = v37,
				["key"] = ("day-%*"):format(v37),
				["LayoutOrder"] = v31,
				["month"] = p29,
				["year"] = p30
			}
			table.insert(v33, v38)
			v31 = v31 + 1
		end
		for v39 = 1, (v_u_5 - (v32 + v36) % v_u_5) % v_u_5 do
			local v40 = {
				["key"] = ("trail-%*"):format(v39),
				["LayoutOrder"] = v31
			}
			table.insert(v33, v40)
			v31 = v31 + 1
		end
		return v33
	end
}