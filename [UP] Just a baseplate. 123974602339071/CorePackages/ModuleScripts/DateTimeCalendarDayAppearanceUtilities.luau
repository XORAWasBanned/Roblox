-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Utilities.DateTimeCalendarDayAppearanceUtilities
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(script.Parent.DateTimeCalendarViewUtilities)
local v_u_3 = require(v1.Enums.DateTimePickerRangeBandRole)
local v_u_4 = require(script.Parent.DateTimeRangeSelectionUtilities)
local v_u_5 = require(script.Parent.Parent.DateTimeUtilities)
local function v_u_11(p6, p7, p8) -- name: isDaySelected
	-- upvalues: (copy) v_u_5
	local v9 = v_u_5.toLocalTime(p6)
	if not p8 then
		p7 = p7[1] == nil and {} or { p7[1] }
	end
	for _, v10 in p7 do
		if v10.Day ~= v9.Day or (v10.Month ~= v9.Month or v10.Year ~= v9.Year) then
			continue
		end
		return true
	end
	return false
end
local function v_u_25(p_u_12, p13, p14, p15) -- name: getRangeBand
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_3
	local v16 = p13[1]
	local v17 = p13[2]
	if p14 and (v16 and v17) then
		local v_u_18 = {
			["startDate"] = v16,
			["endDate"] = v17
		}
		local v19, v20 = v_u_2.getRangeDayBounds(v_u_18)
		if v19 == v20 then
			return nil, nil, nil
		else
			local v21 = v_u_5.roundToStartOfDay(p_u_12)
			local v22 = p15 ~= false
			local function v23() -- name: fullCellBand
				-- upvalues: (ref) v_u_2, (copy) p_u_12, (copy) v_u_18, (ref) v_u_3
				return nil, nil, v_u_2.getRangeBandRadiusTag(p_u_12, v_u_18, v_u_3.Full)
			end
			if v21 == v19 then
				if v22 then
					return UDim2.fromScale(0.5, 0), UDim2.fromScale(0.5, 1), v_u_2.getRangeBandRadiusTag(p_u_12, v_u_18, v_u_3.Start)
				else
					return v23()
				end
			elseif v21 == v20 then
				if v22 then
					return UDim2.fromScale(0, 0), UDim2.fromScale(0.5, 1), v_u_2.getRangeBandRadiusTag(p_u_12, v_u_18, v_u_3.End)
				else
					return v23()
				end
			else
				local v24
				if p14 and (p13[1] and p13[2]) then
					v24 = v_u_5.isDateWithinRange(p_u_12, {
						["startDate"] = p13[1],
						["endDate"] = p13[2]
					})
				else
					v24 = false
				end
				if v24 then
					return v23()
				else
					return nil, nil, nil
				end
			end
		end
	else
		return nil, nil, nil
	end
end
return {
	["getDayCellAppearance"] = function(p26, p27, p28, p29, p30) -- name: getDayCellAppearance
		-- upvalues: (copy) v_u_11, (copy) v_u_25, (copy) v_u_5
		local v31 = v_u_11(p26, p27, p29)
		local v32, v33, v34 = v_u_25(p26, p28, p29, v31)
		local v35 = {
			["bandPosition"] = v32,
			["bandRadiusTag"] = v34,
			["bandSize"] = v33
		}
		local v36
		if p29 and (p28[1] and p28[2]) then
			v36 = v_u_5.isDateWithinRange(p26, {
				["startDate"] = p28[1],
				["endDate"] = p28[2]
			})
		else
			v36 = false
		end
		v35.isHighlighted = v36
		v35.isSelectable = (not p30 or v_u_5.isDateWithinRange(p26, p30)) and true or false
		v35.isSelected = v31
		return v35
	end,
	["getRangeBand"] = v_u_25,
	["isDayHighlighted"] = function(p37, p38, p39) -- name: isDayHighlighted
		-- upvalues: (copy) v_u_5
		if p39 then
			if p38[1] and p38[2] then
				return v_u_5.isDateWithinRange(p37, {
					["startDate"] = p38[1],
					["endDate"] = p38[2]
				})
			else
				return false
			end
		else
			return false
		end
	end,
	["isDaySelectable"] = function(p40, p41) -- name: isDaySelectable
		-- upvalues: (copy) v_u_5
		return (not p41 or v_u_5.isDateWithinRange(p40, p41)) and true or false
	end,
	["isDaySelected"] = v_u_11,
	["resolveHighlightDates"] = function(p42, p43) -- name: resolveHighlightDates
		-- upvalues: (copy) v_u_4
		if p42 and p42[1] then
			if p42[2] or not p43 then
				return p42
			else
				return v_u_4.selectRangeEndpoint(p42, p43)
			end
		else
			return p42 or {}
		end
	end
}