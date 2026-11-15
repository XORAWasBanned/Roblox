-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Utilities.DateTimeLayoutUtilities
local v1 = script:FindFirstAncestor("Foundation")
local v2 = require(script.Parent.DateTimeCalendarConstants)
require(v1.Providers.Style.Tokens)
local v_u_3 = v2.DAYS_PER_WEEK
return {
	["CALENDAR_WIDTH"] = 272,
	["PANE_WIDTH"] = 280,
	["TIME_LIST_WIDTH"] = 132,
	["computeSingleWithTimeLayout"] = nil,
	["computeSingleWithTimeLayout"] = function(p4, p5, p6, p7) -- name: computeSingleWithTimeLayout
		-- upvalues: (copy) v_u_3
		local v8 = p6.Padding.Large
		local v9 = p7 * (p4 / v_u_3)
		local v10 = p6.Size.Size_800 + 2 * p6.Padding.Small
		local v11 = 2 * v8 + v10 + p6.Gap.Small + v9
		local v12 = p4 + 2 * v8
		local v13 = p5 + 2 * v8
		return {
			["bodyHeight"] = v11,
			["calendarColumnWidth"] = v12,
			["contentWidth"] = v12 + p6.Stroke.Standard + v13,
			["gridHeight"] = v9,
			["timeListColumnWidth"] = v13,
			["timeListHeight"] = v11 - 2 * v8
		}
	end
}