-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Utilities.DateTimeRangeSelectionUtilities
local v_u_1 = require(script.Parent.Parent.DateTimeUtilities)
return {
	["normalizeDates"] = function(p2) -- name: normalizeDates
		local v3 = p2.dates
		local v4
		if typeof(v3) == "table" then
			v4 = p2.dates
		else
			v4 = { p2.dates }
		end
		local v5 = v4[2]
		return not p2.acceptsDateRange and v5 ~= nil and { v4[1] } or v4
	end,
	["selectRangeEndpoint"] = function(p6, p7) -- name: selectRangeEndpoint
		-- upvalues: (copy) v_u_1
		if not p6 or (not p6[1] or p6[2]) then
			return { p7 }
		end
		local v8 = p6[1]
		return v_u_1.roundToStartOfDay(p7) < v_u_1.roundToStartOfDay(v8) and { p7, v8 } or { v8, p7 }
	end
}