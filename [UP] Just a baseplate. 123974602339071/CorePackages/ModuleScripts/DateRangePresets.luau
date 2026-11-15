-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Presets.DateRangePresets
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(script.Parent.Parent.Utilities.DateTimeEqualityUtilities)
local v5 = require(v1.Enums.DateTimePickerDateRangePreset)
local v_u_6 = require(script.Parent.Parent.Utilities.DateTimePresetRangesUtilities)
require(script.Parent.Parent.DateTimeUtilities)
local v_u_7 = require(v1.Components.ChipGroup)
local v_u_8 = require(v1.Enums.ChipSize)
local v_u_9 = require(v1.Utility.Localization.Translator)
local v_u_10 = {
	v5.Today,
	v5.ThisWeek,
	v5.LastWeek,
	v5.ThisMonth,
	v5.ThisYear,
	v5.LastYear
}
local function v_u_17(p11, p12, p13, p14, p_u_15) -- name: buildPresetChip
	-- upvalues: (copy) v_u_6, (copy) v_u_4, (copy) v_u_9
	local v_u_16 = v_u_6.resolvePresetRange(p11, p13)
	return (not p14 or v_u_4.isRangeWithinSelectableRange(v_u_16, p14)) and {
		["text"] = v_u_9:FormatByKey((("CommonUI.Controls.Label.%*"):format(p11))),
		["isChecked"] = v_u_4.areDatesSameDayAsRange(p12, v_u_16),
		["onActivated"] = function() -- name: onActivated
			-- upvalues: (copy) p_u_15, (copy) v_u_16
			p_u_15(v_u_16)
		end
	} or nil
end
return function(p_u_18) -- name: DateRangePresets
	-- upvalues: (copy) v_u_3, (copy) v_u_10, (copy) v_u_17, (copy) v_u_7, (copy) v_u_8
	local v22 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_10, (ref) v_u_17, (copy) p_u_18
		local v19 = {}
		for v20 = 1, #v_u_10 do
			local v21 = v_u_17(v_u_10[v20], p_u_18.selectedDates, p_u_18.referenceDate, p_u_18.selectableDateRange, p_u_18.onPresetSelected)
			if not v21 then
				continue
			end
			table.insert(v19, v21)
		end
		return v19
	end, {
		p_u_18.selectedDates,
		p_u_18.referenceDate,
		p_u_18.onPresetSelected,
		p_u_18.selectableDateRange
	})
	return v_u_3.createElement(v_u_7, {
		["chips"] = v22,
		["LayoutOrder"] = p_u_18.LayoutOrder,
		["size"] = v_u_8.Small,
		["testId"] = p_u_18.testId
	})
end