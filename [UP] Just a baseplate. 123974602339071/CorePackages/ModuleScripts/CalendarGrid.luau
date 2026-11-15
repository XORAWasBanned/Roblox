-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Calendar.CalendarGrid
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(script.Parent.CalendarGridDayLabel)
local v5 = require(script.Parent.Parent.Utilities.DateTimeCalendarConstants)
local v6 = require(script.Parent.Parent.Utilities.DateTimeCalendarDayAppearanceUtilities)
local v7 = require(script.Parent.Parent.Utilities.DateTimeCalendarDayConfigUtilities)
require(script.Parent.Parent.Utilities.DateTimeCalendarViewUtilities)
local v_u_8 = require(script.Parent.Parent.DateTimeUtilities)
local v_u_9 = require(v1.Components.Text)
local v_u_10 = require(v1.Components.View)
local v_u_11 = require(v1.Providers.Style.useTokens)
local v_u_12 = v7.buildCalendarDayConfigs
local v_u_13 = v5.DAYS_PER_WEEK
local v_u_14 = v6.getDayCellAppearance
local v_u_34 = v_u_3.memo(function(p_u_15) -- name: CalendarGridDayCell
	-- upvalues: (copy) v_u_11, (copy) v_u_3, (copy) v_u_10, (copy) v_u_4
	local v16 = v_u_11()
	local v17 = v_u_3.useMemo(function()
		-- upvalues: (copy) p_u_15
		return p_u_15.onHoverEnter ~= nil and function()
			-- upvalues: (ref) p_u_15
			p_u_15.onHoverEnter(DateTime.fromLocalTime(p_u_15.year, p_u_15.month, p_u_15.day))
		end or nil
	end, {
		p_u_15.onHoverEnter,
		p_u_15.year,
		p_u_15.month,
		p_u_15.day
	})
	local v18 = v_u_3.useCallback(function()
		-- upvalues: (copy) p_u_15
		p_u_15.handleDateActivated(p_u_15.day, p_u_15.month, p_u_15.year)
	end, {
		p_u_15.handleDateActivated,
		p_u_15.day,
		p_u_15.month,
		p_u_15.year
	})
	local v19 = p_u_15.isHighlighted
	if v19 then
		v19 = not p_u_15.isSelected
	end
	local v20
	if p_u_15.bandRadiusTag == nil then
		v20 = false
	else
		v20 = p_u_15.bandRadiusTag ~= ""
	end
	local v21 = v_u_3.createElement
	local v22 = v_u_10
	local v23 = {
		["LayoutOrder"] = nil,
		["tag"] = "size-full",
		["LayoutOrder"] = p_u_15.LayoutOrder
	}
	local v24 = {}
	local v25
	if v19 then
		v25 = v_u_3.createElement(v_u_10, {
			["backgroundStyle"] = nil,
			["tag"] = nil,
			["ZIndex"] = 0,
			["backgroundStyle"] = v16.Color.ActionStandard.Background,
			["tag"] = {
				["size-full"] = true,
				[p_u_15.bandRadiusTag] = v20
			}
		})
	else
		v25 = nil
	end
	v24.RangeFill = v25
	local v26 = v_u_3.createElement
	local v27 = v_u_4
	local v28 = {
		["bandPosition"] = nil,
		["bandRadiusTag"] = nil,
		["bandSize"] = nil,
		["emphasizeText"] = nil,
		["highlight"] = false,
		["isSelectable"] = nil,
		["isSelected"] = nil,
		["LayoutOrder"] = 1,
		["onActivated"] = nil,
		["onHoverEnter"] = nil,
		["testId"] = nil,
		["label"] = nil
	}
	local v29
	if p_u_15.isSelected then
		v29 = p_u_15.bandPosition
	else
		v29 = nil
	end
	v28.bandPosition = v29
	local v30
	if p_u_15.isSelected then
		v30 = p_u_15.bandRadiusTag
	else
		v30 = nil
	end
	v28.bandRadiusTag = v30
	local v31
	if p_u_15.isSelected then
		v31 = p_u_15.bandSize
	else
		v31 = nil
	end
	v28.bandSize = v31
	local v32 = p_u_15.applyEmphasis and p_u_15.isSelectable
	if v32 then
		v32 = not p_u_15.isSelected
	end
	v28.emphasizeText = v32
	v28.isSelectable = p_u_15.isSelectable
	v28.isSelected = p_u_15.isSelected
	v28.onActivated = v18
	v28.onHoverEnter = v17
	v28.testId = p_u_15.testId
	local v33 = p_u_15.day
	v28.label = tostring(v33)
	v24.Day = v26(v27, v28)
	return v21(v22, v23, v24)
end)
return {
	["CalendarGrid"] = function(p_u_35) -- name: CalendarGrid
		-- upvalues: (copy) v_u_11, (copy) v_u_3, (copy) v_u_12, (copy) v_u_14, (copy) v_u_13, (copy) v_u_8, (copy) v_u_9, (copy) v_u_34, (copy) v_u_10
		local v36 = v_u_11().Padding.None
		local v_u_37 = v_u_3.useRef(nil)
		v_u_3.useEffect(function()
			-- upvalues: (copy) v_u_37, (copy) p_u_35
			local v38 = v_u_37.current
			local v39 = p_u_35.onHoverLeave
			if v38 ~= nil and v39 ~= nil then
				local v_u_40 = v38.MouseLeave:Connect(v39)
				return function()
					-- upvalues: (copy) v_u_40
					v_u_40:Disconnect()
				end
			end
		end, { p_u_35.onHoverLeave })
		local v_u_41 = v_u_3.useMemo(function()
			-- upvalues: (ref) v_u_12, (copy) p_u_35
			return v_u_12(p_u_35.currViewDate)
		end, { p_u_35.currViewDate })
		local v44 = v_u_3.useMemo(function()
			-- upvalues: (copy) v_u_41, (ref) v_u_14, (copy) p_u_35
			local v42 = {}
			for _, v43 in v_u_41 do
				v42[("%*-%*"):format(v43.keyPrefix, v43.day)] = v_u_14(DateTime.fromLocalTime(v43.year, v43.month, v43.day), p_u_35.localSelectedDateTimes, p_u_35.highlightDates, p_u_35.isDateRange, p_u_35.selectableDateRange)
			end
			return v42
		end, {
			v_u_41,
			p_u_35.highlightDates,
			p_u_35.isDateRange,
			p_u_35.localSelectedDateTimes,
			p_u_35.selectableDateRange
		})
		local v45 = { v_u_3.createElement("UIGridLayout", {
				["CellPadding"] = nil,
				["CellSize"] = nil,
				["FillDirection"] = nil,
				["FillDirectionMaxCells"] = nil,
				["HorizontalAlignment"] = nil,
				["key"] = "layout",
				["SortOrder"] = nil,
				["VerticalAlignment"] = nil,
				["CellPadding"] = UDim2.fromOffset(v36, v36),
				["CellSize"] = UDim2.fromOffset(p_u_35.scaledCalendarWidth / v_u_13, p_u_35.scaledCalendarWidth / v_u_13),
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["FillDirectionMaxCells"] = v_u_13,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center
			}) }
		local v46 = 1
		for _, v47 in v_u_8.weekdays do
			local v48 = v_u_3.createElement
			local v49 = v_u_9
			table.insert(v45, v48(v49, {
				["key"] = nil,
				["LayoutOrder"] = nil,
				["tag"] = "text-body-small text-align-x-center text-align-y-center",
				["Text"] = nil,
				["key"] = v47,
				["LayoutOrder"] = v46,
				["Text"] = v47
			}))
			v46 = v46 + 1
		end
		for _, v50 in v_u_41 do
			local v51 = ("%*-%*"):format(v50.keyPrefix, v50.day)
			local v52 = v44[v51]
			local v53 = v_u_3.createElement
			local v54 = v_u_34
			local v55 = {
				["key"] = v51,
				["applyEmphasis"] = v50.applyEmphasis,
				["bandPosition"] = v52.bandPosition,
				["bandRadiusTag"] = v52.bandRadiusTag,
				["bandSize"] = v52.bandSize,
				["day"] = v50.day,
				["handleDateActivated"] = p_u_35.handleDateActivated,
				["isHighlighted"] = v52.isHighlighted,
				["isSelectable"] = v52.isSelectable,
				["isSelected"] = v52.isSelected,
				["LayoutOrder"] = v50.LayoutOrder,
				["month"] = v50.month,
				["onHoverEnter"] = p_u_35.onHoverEnter,
				["testId"] = ("%*--%*-calendar-day-%*"):format(p_u_35.testId, v50.keyPrefix, v50.day),
				["year"] = v50.year
			}
			table.insert(v45, v53(v54, v55))
		end
		return v_u_3.createElement(v_u_10, {
			["LayoutOrder"] = nil,
			["ref"] = nil,
			["Size"] = nil,
			["tag"] = "size-full-0 auto-y",
			["testId"] = nil,
			["LayoutOrder"] = p_u_35.LayoutOrder,
			["ref"] = v_u_37,
			["Size"] = p_u_35.Size,
			["testId"] = ("%*--weekAndDates"):format(p_u_35.testId)
		}, v45)
	end
}