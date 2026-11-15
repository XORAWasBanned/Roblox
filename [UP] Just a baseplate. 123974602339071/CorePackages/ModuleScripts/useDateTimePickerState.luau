-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.useDateTimePickerState
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(script.Parent.Utilities.DateTimeCalendarViewUtilities)
local v_u_5 = require(script.Parent.Utilities.DateTimeEqualityUtilities)
local v_u_6 = require(script.Parent.Utilities.DateTimeParsingUtilities)
require(script.Parent.DateTimePickerProps)
local v_u_7 = require(script.Parent.Utilities.DateTimeRangeSelectionUtilities)
local v_u_8 = require(script.Parent.DateTimeUtilities)
local v_u_9 = require(v1.Enums.DateTimePickerVariant)
require(v1.Components.Types)
local v_u_10 = require(v1.Utility.Wrappers.Services).GuiService
return function(p_u_11) -- name: useDateTimePickerState
	-- upvalues: (copy) v_u_9, (copy) v_u_3, (copy) v_u_7, (copy) v_u_6, (copy) v_u_10, (copy) v_u_4, (copy) v_u_8, (copy) v_u_5
	local v_u_12 = p_u_11.variant or v_u_9.Single
	local v_u_13 = v_u_12 == v_u_9.Dual and true or v_u_12 == v_u_9.DualWithPresets
	local v_u_14 = v_u_12 == v_u_9.DualWithPresets
	local v_u_15 = v_u_12 == v_u_9.SingleWithTime
	local v16, v_u_17 = v_u_3.useState(false)
	local v18 = v_u_3.useRef(nil)
	local v_u_21 = v_u_3.useMemo(function()
		-- upvalues: (copy) p_u_11, (ref) v_u_7, (copy) v_u_13
		local v19 = p_u_11.defaultDates
		if v19 == nil then
			return nil
		end
		local v20 = {
			["acceptsDateRange"] = v_u_13,
			["dates"] = v19
		}
		return v_u_7.normalizeDates(v20)
	end, { p_u_11.defaultDates, v_u_13 })
	local v22, v_u_23 = v_u_3.useState(not v_u_21 and "" or v_u_6.formatInputText({
		["dates"] = v_u_21,
		["variant"] = v_u_12
	}))
	local v_u_24 = v_u_3.useRef(v22)
	v_u_24.current = v22
	local v25, v_u_26 = v_u_3.useState(function()
		-- upvalues: (copy) v_u_21
		return v_u_21
	end)
	local v_u_27 = v_u_3.useRef(v25)
	v_u_27.current = v25
	local v28, v_u_29 = v_u_3.useState(nil)
	local v_u_30, v_u_31 = v_u_3.useState(function()
		-- upvalues: (copy) v_u_21
		return v_u_21
	end)
	local v_u_32 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_17
		v_u_17(false)
	end, {})
	local v_u_33 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_17
		v_u_17(true)
	end, {})
	local v34 = v_u_3.useCallback(function()
		-- upvalues: (ref) v_u_10, (copy) v_u_33
		if v_u_10.ViewportDisplaySize ~= Enum.DisplaySize.Small then
			v_u_33()
		end
	end, { v_u_33, v_u_10.ViewportDisplaySize })
	local v_u_37 = v_u_3.useCallback(function(p35, p36)
		-- upvalues: (copy) v_u_26, (copy) v_u_27, (copy) v_u_31, (copy) v_u_29
		v_u_26(p35)
		v_u_27.current = p35
		if p36 and p36.asApplied then
			v_u_31(p35)
		end
		if p36 and p36.anchor then
			v_u_29(p36.anchor)
		end
	end, {})
	local v_u_38 = v_u_3.useRef(nil)
	local v49 = v_u_3.useCallback(function(p39)
		-- upvalues: (copy) v_u_23, (copy) v_u_38, (copy) v_u_37, (ref) v_u_4, (copy) p_u_11, (copy) v_u_13, (ref) v_u_6, (ref) v_u_8
		v_u_23(p39)
		if v_u_38.current ~= nil then
			local v40 = v_u_38.current
			v_u_38.current = nil
			if p39 == v40 then
				return
			end
		end
		local function v44() -- name: clearDraftToReference
			-- upvalues: (ref) v_u_37, (ref) v_u_4, (ref) p_u_11
			local v41 = v_u_37
			local v42 = {
				["anchor"] = nil,
				["asApplied"] = true
			}
			local v43 = v_u_4.resolveAnchorDate(nil, p_u_11.referenceDate)
			v42.anchor = DateTime.fromUnixTimestamp(v43.UnixTimestamp)
			v41({}, v42)
		end
		if p39:match("^%s*$") then
			v44()
			p_u_11.onChanged(nil)
			return
		elseif v_u_13 then
			local v45, v46 = v_u_6.parseDualInputEndpoints(p39)
			p_u_11.onChanged(v45, v46)
			local v47 = v_u_6.parseInputToDraftDates(p39, p_u_11.selectableDateRange)
			if v47 then
				v_u_37(v47, {
					["anchor"] = nil,
					["asApplied"] = true,
					["anchor"] = v47[1]
				})
			else
				v44()
			end
		else
			local v48 = v_u_6.parseDateTimeFromText(v_u_6.trimInputText(p39))
			if v48 and (p_u_11.selectableDateRange == nil or v_u_8.isDateWithinRange(v48, p_u_11.selectableDateRange)) then
				v_u_37({ v48 }, {
					["anchor"] = nil,
					["asApplied"] = true,
					["anchor"] = v48
				})
				p_u_11.onChanged(v48)
			else
				v44()
				p_u_11.onChanged(v48)
			end
		end
	end, {
		p_u_11.onChanged,
		v_u_13,
		v_u_15,
		p_u_11.referenceDate,
		p_u_11.selectableDateRange,
		v_u_37
	})
	local v55 = v_u_3.useCallback(function(_)
		-- upvalues: (copy) v_u_13, (copy) v_u_24, (ref) v_u_6, (copy) p_u_11, (copy) v_u_12, (copy) v_u_27, (ref) v_u_5, (copy) v_u_38, (copy) v_u_23
		if v_u_13 then
			local v50 = v_u_24.current
			local v51 = v_u_6.parseInputToDraftDates(v50, p_u_11.selectableDateRange)
			if v51 then
				local v52 = {
					["dates"] = v51,
					["variant"] = v_u_12
				}
				local v53 = v_u_6.formatInputText(v52)
				if v53 == v50 then
					return
				else
					local v54 = v_u_27.current
					if v54 and (v54[1] and (v54[2] and (v_u_5.isSameDay(v54[1], v51[1]) and v_u_5.isSameDay(v54[2], v51[2])))) then
						v_u_38.current = v53
						v_u_23(v53)
						p_u_11.onChanged(v51[1], v51[2])
					end
				end
			else
				return
			end
		else
			return
		end
	end, {
		v_u_13,
		p_u_11.onChanged,
		p_u_11.selectableDateRange,
		v_u_12
	})
	local v57 = v_u_3.useCallback(function(p56)
		-- upvalues: (ref) v_u_7, (copy) v_u_27, (copy) v_u_37
		v_u_37((v_u_7.selectRangeEndpoint(v_u_27.current, p56)))
	end, { v_u_37 })
	local v59 = v_u_3.useCallback(function(p58)
		-- upvalues: (copy) p_u_11, (ref) v_u_5, (copy) v_u_37
		if not p_u_11.selectableDateRange or v_u_5.isRangeWithinSelectableRange(p58, p_u_11.selectableDateRange) then
			v_u_37({ p58.startDate, p58.endDate }, {
				["anchor"] = p58.startDate
			})
		end
	end, { p_u_11.selectableDateRange, v_u_37 })
	local v66 = v_u_3.useCallback(function(p60)
		-- upvalues: (copy) v_u_27, (copy) v_u_37
		local v61 = v_u_27.current
		local v62
		if v61 then
			v62 = v61[1]
		else
			v62 = nil
		end
		local v63
		if v61 then
			v63 = v61[2]
		else
			v63 = nil
		end
		local v64 = p60[1]
		local v65 = p60[2]
		if not v61 or (not v64 or (not v62 or (v62.UnixTimestamp ~= v64.UnixTimestamp or (not v63 ~= not v65 or v63 and (v65 and v63.UnixTimestamp ~= v65.UnixTimestamp))))) then
			v_u_37(p60)
		end
	end, { v_u_37 })
	local v_u_72 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_37, (copy) v_u_30, (ref) v_u_4, (copy) p_u_11
		local v67 = v_u_37
		local v68 = v_u_30
		local v69 = {}
		local v70 = v_u_30
		local v71 = v_u_4.resolveAnchorDate(v70, p_u_11.referenceDate)
		v69.anchor = DateTime.fromUnixTimestamp(v71.UnixTimestamp)
		v67(v68, v69)
	end, { v_u_30, p_u_11.referenceDate, v_u_37 })
	local v73 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_72, (copy) v_u_32
		v_u_72()
		v_u_32()
	end, { v_u_72, v_u_32 })
	local v74 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_72
		v_u_72()
	end, { v_u_72 })
	local v_u_80 = v_u_3.useCallback(function(p75)
		-- upvalues: (copy) v_u_37, (copy) v_u_13, (ref) v_u_8, (copy) v_u_38, (copy) v_u_23, (copy) p_u_11, (copy) v_u_15
		local v76 = p75[1]
		if v76 then
			v_u_37(p75, {
				["anchor"] = v76
			})
			if v_u_13 then
				local v77 = p75[2]
				local v78 = v_u_8.formatLocalTime(v76) .. " - " .. (not v77 and "" or v_u_8.formatLocalTime(v77))
				v_u_38.current = v78
				v_u_23(v78)
				p_u_11.onChanged(v76, v77)
			else
				local v79 = v_u_8.formatLocalTime(v76, v_u_15)
				v_u_38.current = v79
				v_u_23(v79)
				p_u_11.onChanged(v76)
			end
		else
			return
		end
	end, {
		p_u_11.onChanged,
		v_u_13,
		v_u_15,
		v_u_37
	})
	local v82 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_27, (copy) v_u_14, (copy) v_u_32, (copy) v_u_31, (copy) v_u_80
		local v81 = v_u_27.current
		if v81 then
			if v_u_14 and not (v81[1] and v81[2]) then
				v_u_32()
				return
			end
			v_u_31(v81)
			v_u_80(v81)
		end
		v_u_32()
	end, { v_u_32, v_u_80, v_u_14 })
	local v83 = false
	if v25 then
		local v84 = v25[1]
		local v85 = v25[2]
		if v_u_14 or v_u_13 then
			v83 = (v84 == nil or v85 == nil) and true or v84.UnixTimestamp > v85.UnixTimestamp
		elseif v_u_12 == v_u_9.Single or v_u_15 then
			v83 = v84 == nil
		end
	else
		v83 = v_u_14 and true or v83
	end
	return {
		["closeDateTimePicker"] = v_u_32,
		["isOpen"] = v16,
		["onFocusGained"] = v34,
		["onFocusLost"] = v55,
		["showDateTimePicker"] = v_u_33,
		["textInputRef"] = v18,
		["selectedDates"] = v25,
		["inputText"] = v22,
		["updateInputText"] = v49,
		["viewAnchorDate"] = v28,
		["onDayActivated"] = v57,
		["onPresetSelected"] = v59,
		["onSelectedDatesChanged"] = v66,
		["onApply"] = v82,
		["onCancel"] = v73,
		["onReset"] = v74,
		["isApplyButtonDisabled"] = v83,
		["isResetButtonDisabled"] = not (v_u_14 or v_u_15) and true or v_u_5.areDatesEqual(v25, v_u_30)
	}
end