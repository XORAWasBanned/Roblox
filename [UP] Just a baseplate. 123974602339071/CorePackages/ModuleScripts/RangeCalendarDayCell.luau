-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Calendar.RangeCalendarDayCell
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(script.Parent.CalendarGridDayLabel)
local v_u_5 = require(script.Parent.Parent.Utilities.DateTimeCalendarDayAppearanceUtilities)
local v_u_6 = require(script.Parent.Parent.DateTimeUtilities)
local v_u_7 = require(v1.Components.View)
local v_u_8 = require(v1.Providers.Style.useTokens)
return function(p_u_9) -- name: RangeCalendarDayCell
	-- upvalues: (copy) v_u_8, (copy) v_u_6, (copy) v_u_5, (copy) v_u_3, (copy) v_u_7, (copy) v_u_4
	local v10 = v_u_8()
	local v_u_11 = DateTime.fromLocalTime(p_u_9.year, p_u_9.month, p_u_9.day)
	local v12 = p_u_9.selectedDates or {}
	local v13 = {}
	for _, v14 in v12 do
		local v15 = v_u_6.toLocalTime
		table.insert(v13, v15(v14))
	end
	local v16 = v_u_5.resolveHighlightDates(v12, p_u_9.hoveredDate)
	local v17 = v_u_5.isDaySelectable(v_u_11, p_u_9.selectableDateRange)
	local v18 = v_u_5.isDaySelected(v_u_11, v13, true)
	local v19 = v_u_5.isDayHighlighted(v_u_11, v16, true)
	local v20, v21, v22 = v_u_5.getRangeBand(v_u_11, v16, true, v18)
	local v23 = v_u_3.useMemo(function()
		-- upvalues: (copy) p_u_9, (copy) v_u_11
		return p_u_9.onHoverEnter ~= nil and function()
			-- upvalues: (ref) p_u_9, (ref) v_u_11
			p_u_9.onHoverEnter(v_u_11)
		end or nil
	end, { p_u_9.onHoverEnter, v_u_11 })
	if v19 then
		v19 = not v18
	end
	local v24
	if v22 == nil then
		v24 = false
	else
		v24 = v22 ~= ""
	end
	local v25 = v_u_3.createElement
	local v26 = v_u_7
	local v27 = {
		["LayoutOrder"] = p_u_9.LayoutOrder,
		["Size"] = UDim2.fromOffset(p_u_9.cellSize, p_u_9.cellSize)
	}
	local v28 = {}
	local v29
	if v19 then
		v29 = v_u_3.createElement(v_u_7, {
			["backgroundStyle"] = nil,
			["tag"] = nil,
			["ZIndex"] = 0,
			["backgroundStyle"] = v10.Color.ActionStandard.Background,
			["tag"] = {
				["size-full"] = true,
				[v22] = v24
			}
		})
	else
		v29 = nil
	end
	v28.RangeFill = v29
	local v30 = v_u_3.createElement
	local v31 = v_u_4
	local v32 = {
		["bandPosition"] = nil,
		["bandRadiusTag"] = nil,
		["bandSize"] = nil,
		["emphasizeText"] = nil,
		["highlight"] = false,
		["isSelectable"] = nil,
		["isSelected"] = nil,
		["LayoutOrder"] = 1,
		["label"] = nil,
		["onActivated"] = nil,
		["onHoverEnter"] = nil,
		["testId"] = nil
	}
	if not v18 then
		v20 = nil
	end
	v32.bandPosition = v20
	if not v18 then
		v22 = nil
	end
	v32.bandRadiusTag = v22
	if not v18 then
		v21 = nil
	end
	v32.bandSize = v21
	local v33
	if v17 then
		v33 = not v18
	else
		v33 = v17
	end
	v32.emphasizeText = v33
	v32.isSelectable = v17
	v32.isSelected = v18
	local v34 = p_u_9.day
	v32.label = tostring(v34)
	function v32.onActivated() -- name: onActivated
		-- upvalues: (copy) p_u_9, (copy) v_u_11
		p_u_9.onDayActivated(v_u_11)
	end
	v32.onHoverEnter = v23
	v32.testId = ("%*--day-%*-%*-%*"):format(p_u_9.testId, p_u_9.year, p_u_9.month, p_u_9.day)
	v28.Day = v30(v31, v32)
	return v25(v26, v27, v28)
end