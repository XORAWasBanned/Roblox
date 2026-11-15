-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.DateTimePickerBeta
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.React)
local v_u_5 = v3.Icon
local v_u_6 = require(script.Parent.DateTimePickerCalendarContent)
local v_u_7 = require(script.Parent.DateTimePickerPanel)
require(script.Parent.DateTimePickerProps)
local v_u_8 = require(script.Parent.useDateTimePickerState)
local v_u_9 = require(v1.Enums.DateTimePickerVariant)
local v_u_10 = require(v1.Enums.InputSize)
local v_u_11 = require(v1.Components.Popover)
local v_u_12 = require(v1.Enums.PopoverAlign)
local v_u_13 = require(v1.Enums.PopoverSide)
local v_u_14 = require(v1.Components.TextInput)
local v_u_15 = require(v1.Utility.Localization.Translator)
local v_u_16 = require(v1.Providers.Style.useTokens)
local v_u_17 = require(v1.Utility.withCommonProps)
local v_u_18 = require(v1.Utility.withDefaults)
local v_u_19 = {
	["variant"] = nil,
	["testId"] = "--foundation-date-time-picker",
	["variant"] = v_u_9.Single
}
return v_u_4.memo(function(p20) -- name: DateTimePickerBeta
	-- upvalues: (copy) v_u_18, (copy) v_u_19, (copy) v_u_16, (copy) v_u_9, (copy) v_u_8, (copy) v_u_4, (copy) v_u_11, (copy) v_u_14, (copy) v_u_17, (copy) v_u_5, (copy) v_u_15, (copy) v_u_10, (copy) v_u_12, (copy) v_u_13, (copy) v_u_7, (copy) v_u_6
	local v21 = v_u_18(p20, v_u_19)
	local v22 = v_u_16()
	local v23 = v21.variant or v_u_9.Single
	local v24 = v23 == v_u_9.DualWithPresets
	local v25 = v23 == v_u_9.SingleWithTime
	local v26 = v24 or v25
	local v27 = v_u_8(v21)
	local v28 = v_u_4.createElement
	local v29 = v_u_11.Root
	local v30 = {
		["isOpen"] = v27.isOpen,
		["testId"] = v21.testId
	}
	local v31 = {
		["DateInput"] = v_u_4.createElement(v_u_14, v_u_17(v21, {
			["hasError"] = nil,
			["hint"] = nil,
			["iconTrailing"] = nil,
			["isDisabled"] = nil,
			["isRequired"] = nil,
			["key"] = "date-input",
			["label"] = nil,
			["onChanged"] = nil,
			["onFocusGained"] = nil,
			["onFocusLost"] = nil,
			["placeholder"] = nil,
			["ref"] = nil,
			["selectableDateRange"] = nil,
			["size"] = nil,
			["testId"] = nil,
			["text"] = nil,
			["width"] = nil,
			["hasError"] = v21.hasError,
			["hint"] = v21.hint,
			["iconTrailing"] = {
				["name"] = v_u_5.Calendar,
				["onActivated"] = v27.showDateTimePicker
			},
			["isDisabled"] = v21.isDisabled,
			["isRequired"] = v21.isRequired,
			["label"] = v21.label,
			["onChanged"] = v27.updateInputText,
			["onFocusGained"] = v27.onFocusGained,
			["onFocusLost"] = v27.onFocusLost,
			["placeholder"] = v21.placeholder or v_u_15:FormatByKey("CommonUI.Controls.Label.SelectDate"),
			["ref"] = v27.textInputRef,
			["selectableDateRange"] = v21.selectableDateRange,
			["size"] = v_u_10.Medium,
			["testId"] = ("%*--text-input"):format(v21.testId),
			["text"] = v27.inputText,
			["width"] = v21.width
		})),
		["Anchor"] = v_u_4.createElement(v_u_11.Anchor, {
			["anchorRef"] = v27.textInputRef
		})
	}
	local v32 = v_u_4.createElement
	local v33 = v_u_11.Content
	local v34 = {
		["align"] = nil,
		["hasArrow"] = false,
		["onPressedOutside"] = nil,
		["selection"] = nil,
		["selectionGroup"] = nil,
		["side"] = nil,
		["align"] = v_u_12.Start,
		["onPressedOutside"] = v27.closeDateTimePicker,
		["selection"] = v21.selection,
		["selectionGroup"] = v21.selectionGroup,
		["side"] = {
			["offset"] = v22.Stroke.Standard + v22.Padding.Small,
			["position"] = v_u_13.Bottom
		}
	}
	local v35 = v27.isOpen
	if v35 then
		local v36 = v_u_4.createElement
		local v37 = v_u_7
		local v38 = {
			["isApplyButtonDisabled"] = v27.isApplyButtonDisabled,
			["isResetButtonDisabled"] = v27.isResetButtonDisabled,
			["isSectioned"] = v26,
			["onApply"] = v27.onApply,
			["onCancel"] = v27.onCancel
		}
		local v39
		if v26 then
			v39 = v27.onReset
		else
			v39 = nil
		end
		v38.onReset = v39
		v38.sectionedLayout = v24 and "dual" or (v25 and "singleWithTime" or nil)
		v38.showReset = v26
		v38.testId = v21.testId
		v35 = v36(v37, v38, v_u_4.createElement(v_u_6, {
			["onDayActivated"] = v27.onDayActivated,
			["onPresetSelected"] = v27.onPresetSelected,
			["onSelectedDatesChanged"] = v27.onSelectedDatesChanged,
			["referenceDate"] = v21.referenceDate,
			["selectableDateRange"] = v21.selectableDateRange,
			["selectedDates"] = v27.selectedDates,
			["testId"] = v21.testId,
			["variant"] = v23,
			["viewAnchorDate"] = v27.viewAnchorDate
		}))
	end
	v31.PopoverContent = v32(v33, v34, v35)
	return v28(v29, v30, v31)
end)