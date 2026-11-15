-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Utilities.DateTimeEqualityUtilities
local v_u_1 = require(script.Parent.Parent.DateTimeUtilities)
return {
	["areDatesEqual"] = function(p2, p3) -- name: areDatesEqual
		if p2 == nil and p3 == nil then
			return true
		elseif p2 == nil or p3 == nil then
			return false
		else
			local v4 = p2[1]
			local v5 = p3[1]
			if v4 == nil == (v5 == nil) then
				if v4 and (v5 and v4.UnixTimestamp ~= v5.UnixTimestamp) then
					return false
				else
					local v6 = p2[2]
					local v7 = p3[2]
					if v6 == nil == (v7 == nil) then
						return (not v6 or (not v7 or v6.UnixTimestamp == v7.UnixTimestamp)) and true or false
					else
						return false
					end
				end
			else
				return false
			end
		end
	end,
	["areDatesSameDayAsRange"] = function(p8, p9) -- name: areDatesSameDayAsRange
		-- upvalues: (copy) v_u_1
		if not (p8 and (p8[1] and p8[2])) then
			return false
		end
		local v10 = p8[1]
		local v11 = p9.startDate
		local v12 = v_u_1.roundToStartOfDay(v10) == v_u_1.roundToStartOfDay(v11)
		if v12 then
			local v13 = p8[2]
			local v14 = p9.endDate
			v12 = v_u_1.roundToStartOfDay(v13) == v_u_1.roundToStartOfDay(v14)
		end
		return v12
	end,
	["isRangeWithinSelectableRange"] = function(p15, p16) -- name: isRangeWithinSelectableRange
		-- upvalues: (copy) v_u_1
		local v17 = v_u_1.isDateWithinRange(p15.startDate, p16)
		if v17 then
			v17 = v_u_1.isDateWithinRange(p15.endDate, p16)
		end
		return v17
	end,
	["isSameDay"] = function(p18, p19) -- name: isSameDay
		-- upvalues: (copy) v_u_1
		return v_u_1.roundToStartOfDay(p18) == v_u_1.roundToStartOfDay(p19)
	end
}