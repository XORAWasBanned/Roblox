-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.NumberInput.NumberInput
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactIs)
local v_u_5 = require(v2.ReactUtils)
local v6 = v1.Components
local v_u_7 = require(v1.Utility.withCommonProps)
local v_u_8 = require(v1.Utility.withDefaults)
local v_u_9 = require(v1.Enums.InputSize)
require(v1.Enums.InputLabelSize)
local v10 = require(v1.Enums.InputVariant)
local v_u_11 = require(v1.Enums.NumberInputControlsVariant)
local v_u_12 = require(v1.Enums.ScrubBehavior)
local v_u_13 = require(v1.Enums.OnChangeCallbackReason)
local v_u_14 = require(v1.Utility.Flags)
local v_u_15 = require(v6.Icon)
local v_u_16 = require(v6.InputField)
local v_u_17 = require(v6.InternalTextInput)
local v_u_18 = require(v6.Text)
require(v6.Types)
local v_u_19 = require(v6.View)
local v_u_20 = require(v1.Utility.getBindableValue)
local v_u_21 = require(v1.Utility.getInputTextSize)
local v_u_22 = require(v1.Utility.getMultiLineTextHeight)
local v_u_23 = require(v1.Utility.isBuilderIcon)
local v_u_24 = require(v1.Utility.joinBindables)
local v_u_25 = require(v1.Utility.mapBindable)
local v_u_26 = require(v1.Utility.useIconSize)
local v_u_27 = require(v6.TextInput.useTextInputVariants)
local v_u_28 = require(v1.Utility.useTextSize)
local v_u_29 = require(v1.Providers.Style.useTokens)
local v_u_30 = require(script.Parent.NumberInputControls)
local v_u_31 = require(script.Parent.useNumberInputVariants)
local v_u_32 = require(v1.Constants)
local v_u_33 = require(script.Parent.calculateNumberInputValueFromPositions)
require(v1.Enums.InputFocusBehavior)
local v_u_34 = {
	[v_u_12.On] = 1,
	[v_u_12.Off] = 0
}
local v_u_36 = {
	["variant"] = nil,
	["size"] = nil,
	["minimum"] = (-1 / 0),
	["maximum"] = (1 / 0),
	["step"] = 1,
	["precision"] = 3,
	["value"] = 0,
	["formatAsString"] = nil,
	["isScrubbable"] = false,
	["scrubBehavior"] = nil,
	["hasControls"] = false,
	["testId"] = "--foundation-number-input",
	["variant"] = v10.Standard,
	["size"] = v_u_9.Large,
	["formatAsString"] = function(p35) -- name: defaultFormatAsString
		return tostring(p35)
	end,
	["scrubBehavior"] = v_u_12.Off
}
return v_u_3.memo(v_u_3.forwardRef(function(p_u_37, p38) -- name: NumberInput
	-- upvalues: (copy) v_u_8, (copy) v_u_36, (copy) v_u_29, (copy) v_u_27, (copy) v_u_31, (copy) v_u_3, (copy) v_u_5, (copy) v_u_12, (copy) v_u_34, (copy) v_u_25, (copy) v_u_20, (copy) v_u_9, (copy) v_u_28, (copy) v_u_26, (copy) v_u_23, (copy) v_u_22, (copy) v_u_32, (copy) v_u_13, (copy) v_u_11, (copy) v_u_30, (copy) v_u_14, (copy) v_u_33, (copy) v_u_4, (copy) v_u_16, (copy) v_u_7, (copy) v_u_21, (copy) v_u_17, (copy) v_u_24, (copy) v_u_19, (copy) v_u_15, (copy) v_u_18
	local v_u_39 = v_u_8(p_u_37, v_u_36)
	local v_u_40 = v_u_29()
	local v_u_41 = v_u_27(v_u_40, v_u_39.size, v_u_39.variant)
	local v_u_42 = v_u_31(v_u_40, v_u_39.size).controls
	local v_u_43 = v_u_3.useRef(nil)
	local v44 = v_u_5.useComposedRef(v_u_43, v_u_39.textBoxRef)
	local v_u_45 = v_u_3.useRef(nil)
	local v_u_46 = v_u_3.useRef(false)
	local v_u_47 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_43
		if v_u_43.current then
			return v_u_43.current.getIsFocused()
		else
			return false
		end
	end, {})
	local v48, v_u_49 = v_u_3.useState(false)
	local v_u_50 = v_u_39.hasError or v48
	local v51 = v_u_39.controlsVariant
	local v52
	if v_u_39.isScrubbable then
		v52 = v_u_12.On
	else
		v52 = v_u_39.scrubBehavior
	end
	local v_u_53
	if v52 then
		v_u_53 = v52 ~= v_u_12.Off
	else
		v_u_53 = v52
	end
	local v_u_54 = v_u_34[v52]
	local v_u_58 = v_u_3.useCallback(function(p55)
		-- upvalues: (copy) v_u_39
		local v56 = v_u_39.minimum
		local v57 = v_u_39.maximum
		return math.clamp(p55, v56, v57)
	end, { v_u_39.minimum, v_u_39.maximum })
	local v_u_61 = v_u_3.useCallback(function(p59, p60)
		-- upvalues: (copy) v_u_39
		return p60(p59 / v_u_39.step) * v_u_39.step
	end, { v_u_39.step })
	local v_u_74 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_25, (copy) v_u_39, (copy) v_u_61, (copy) v_u_58
		return v_u_25(v_u_39.value, function(p62)
			-- upvalues: (ref) v_u_39, (ref) v_u_61, (ref) v_u_58
			local v63 = 10 ^ (v_u_39.precision or 0)
			local v64 = p62 * v63 + 0.5
			local v65 = math.floor(v64) / v63
			local v66 = p62 + v_u_39.step
			local v67 = 10 ^ (v_u_39.precision or 0)
			local v68 = v66 * v67 + 0.5
			local v69 = math.floor(v68) / v67
			local v70 = v_u_61(p62, math.ceil)
			local v71 = 10 ^ (v_u_39.precision or 0)
			local v72 = v70 * v71 + 0.5
			local v73 = math.floor(v72) / v71
			if v65 ~= v73 then
				v69 = v73
			end
			return v_u_58(v69)
		end)
	end, {
		v_u_39.value,
		v_u_39.step,
		v_u_39.precision,
		v_u_58,
		v_u_61
	})
	local v_u_87 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_25, (copy) v_u_39, (copy) v_u_61, (copy) v_u_58
		return v_u_25(v_u_39.value, function(p75)
			-- upvalues: (ref) v_u_39, (ref) v_u_61, (ref) v_u_58
			local v76 = 10 ^ (v_u_39.precision or 0)
			local v77 = p75 * v76 + 0.5
			local v78 = math.floor(v77) / v76
			local v79 = p75 - v_u_39.step
			local v80 = 10 ^ (v_u_39.precision or 0)
			local v81 = v79 * v80 + 0.5
			local v82 = math.floor(v81) / v80
			local v83 = v_u_61(p75, math.floor)
			local v84 = 10 ^ (v_u_39.precision or 0)
			local v85 = v83 * v84 + 0.5
			local v86 = math.floor(v85) / v84
			if v78 ~= v86 then
				v82 = v86
			end
			return v_u_58(v82)
		end)
	end, {
		v_u_39.value,
		v_u_39.step,
		v_u_39.precision,
		v_u_58,
		v_u_61
	})
	local v_u_89 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_25, (copy) v_u_39
		return v_u_25(v_u_39.value, function(p88)
			-- upvalues: (ref) v_u_39
			return v_u_39.isDisabled or p88 == v_u_39.maximum
		end)
	end, { v_u_39.isDisabled, v_u_39.value, v_u_39.maximum })
	local v_u_91 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_25, (copy) v_u_39
		return v_u_25(v_u_39.value, function(p90)
			-- upvalues: (ref) v_u_39
			return v_u_39.isDisabled or p90 == v_u_39.minimum
		end)
	end, { v_u_39.isDisabled, v_u_39.value, v_u_39.minimum })
	local v_u_98 = v_u_3.useCallback(function(p92)
		-- upvalues: (copy) v_u_39
		local v93 = v_u_39.minimum
		local v94 = v_u_39.maximum
		local v95 = math.clamp(p92, v93, v94)
		local v96 = 10 ^ (v_u_39.precision or 0)
		local v97 = v95 * v96 + 0.5
		return math.floor(v97) / v96
	end, { v_u_39.minimum, v_u_39.maximum, v_u_39.precision })
	local v_u_99, v_u_100 = v_u_3.useBinding(v_u_39.formatAsString(v_u_98(v_u_20(v_u_39.value))))
	local v_u_101
	if v_u_39.size == v_u_9.XSmall then
		v_u_101 = v_u_40.Gap.Small - v_u_40.Gap.XSmall / 2
	else
		v_u_101 = v_u_40.Gap.Small
	end
	local v_u_102 = v_u_41.textBox.fontStyle
	local v_u_103 = v_u_102.FontSize
	local v_u_104 = ((not v_u_39.prefix or v_u_39.prefix == "") and true or false) and v_u_39.suffix
	if v_u_104 then
		v_u_104 = v_u_39.suffix ~= ""
	end
	local v105
	if v_u_39.prefix then
		v105 = v_u_39.prefix .. " "
	else
		v105 = nil
	end
	local v_u_108 = v_u_28(v105, (v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_102, (copy) v_u_103
		local v106 = {
			["Font"] = v_u_102.Font
		}
		local v107 = v_u_103
		v106.FontSize = math.floor(v107)
		v106.LineHeight = v_u_102.LineHeight
		return v106
	end, { v_u_102, v_u_103 })))
	local v109 = v_u_26(v_u_41.icon.size, v_u_23(v_u_39.leadingIcon))
	local v110 = v_u_26(v_u_41.icon.size, v_u_23(v_u_39.trailingIcon))
	local v_u_111 = not v_u_39.leadingIcon and 0 or v109.X.Offset
	local v_u_112 = not v_u_39.trailingIcon and 0 or v110.X.Offset
	local v113
	if v_u_39.size == v_u_9.XSmall then
		v113 = v_u_40.Gap.Small
	elseif v_u_39.size == v_u_9.Small then
		v113 = v_u_40.Gap.Medium
	else
		v113 = v_u_40.Gap.Large
	end
	local v_u_114 = not v_u_39.leadingIcon and 0 or v113
	local v_u_115 = not v_u_39.trailingIcon and 0 or v113
	local v_u_116 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_41, (copy) v_u_111, (copy) v_u_114, (copy) v_u_112, (copy) v_u_115
		return {
			["left"] = UDim.new(0, v_u_41.container.horizontalPadding.Offset + v_u_111 + v_u_114),
			["right"] = UDim.new(0, v_u_41.container.horizontalPadding.Offset + v_u_112 + v_u_115)
		}
	end, {
		v_u_41.container.horizontalPadding,
		v_u_114,
		v_u_115,
		v_u_111,
		v_u_112
	})
	local v_u_125 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_22, (copy) v_u_103, (copy) v_u_102, (copy) v_u_41
		local v117 = v_u_22(v_u_103, 1, v_u_102.LineHeight)
		local v118 = (v_u_41.container.minHeight - 2 - v117) * 2
		local v119 = math.round(v118) / 2
		local v120 = {}
		local v121 = UDim.new
		local v122 = v119 / 2
		v120.top = v121(0, math.floor(v122) + 1)
		local v123 = UDim.new
		local v124 = v119 / 2
		v120.bottom = v123(0, math.ceil(v124) + 1)
		v120.left = UDim.new()
		v120.right = UDim.new()
		return v120
	end, { v_u_41.container.minHeight, v_u_102, v_u_103 })
	local v_u_126
	if v_u_39.width then
		v_u_126 = v_u_39.width
	else
		v_u_126 = UDim.new(0, v_u_32.DEFAULT_NUMBER_INPUT_WIDTH)
	end
	local v_u_130 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_100, (ref) v_u_20, (copy) v_u_39
		local v127 = v_u_100
		local v128 = v_u_20
		local v129 = v_u_39.value
		v127((tostring(v128(v129))))
		if v_u_39.onFocusGained then
			v_u_39.onFocusGained()
		end
	end, { v_u_39.onFocusGained, v_u_39.value })
	local v_u_136 = v_u_3.useCallback(function(p131, p132)
		-- upvalues: (copy) v_u_98, (copy) v_u_100, (copy) v_u_47, (copy) v_u_39
		local v133 = v_u_98(p131)
		local v134 = v_u_100
		local v135
		if v_u_47() then
			v135 = tostring(v133)
		else
			v135 = v_u_39.formatAsString(v133)
		end
		v134(v135)
		v_u_39.onChanged(v133, p132)
	end, {
		v_u_39.onChanged,
		v_u_39.formatAsString,
		v_u_98,
		v_u_47
	})
	local v_u_138 = v_u_3.useCallback(function(p137)
		-- upvalues: (copy) v_u_49, (copy) v_u_136, (ref) v_u_20, (copy) v_u_39, (ref) v_u_13
		v_u_49(false)
		v_u_136(v_u_20(v_u_39.value), v_u_13.FocusLost)
		if v_u_39.onFocusLost then
			v_u_39.onFocusLost(p137)
		end
	end, {
		v_u_136,
		v_u_39.onFocusLost,
		v_u_39.value,
		v_u_98
	})
	local v_u_141 = v_u_3.useCallback(function(p139)
		-- upvalues: (copy) v_u_100, (copy) v_u_47, (copy) v_u_39, (copy) v_u_49, (ref) v_u_13
		v_u_100(p139)
		if v_u_47() then
			local v140 = tonumber(p139)
			if v_u_39.onTextChanged == nil then
				if v140 == nil then
					v_u_49(true)
					return
				end
			else
				v_u_39.onTextChanged(p139)
			end
			if v140 ~= nil then
				v_u_49(false)
				v_u_39.onChanged(v140, v_u_13.Keyboard)
			end
		end
	end, { v_u_47, v_u_39.onChanged, v_u_39.onTextChanged })
	local v142 = v_u_3.useCallback(function()
		-- upvalues: (ref) v_u_20, (copy) v_u_89, (copy) v_u_136, (copy) v_u_74, (ref) v_u_13
		if not v_u_20(v_u_89) then
			v_u_136(v_u_20(v_u_74), v_u_13.Activate)
		end
	end, { v_u_89, v_u_74, v_u_136 })
	local v143 = v_u_3.useCallback(function()
		-- upvalues: (ref) v_u_20, (copy) v_u_91, (copy) v_u_136, (copy) v_u_87, (ref) v_u_13
		if not v_u_20(v_u_91) then
			v_u_136(v_u_20(v_u_87), v_u_13.Activate)
		end
	end, { v_u_91, v_u_87, v_u_136 })
	local v_u_144 = v_u_39.hasControls
	if v_u_144 then
		if v51 == v_u_11.None then
			v_u_144 = false
		else
			v_u_144 = v51 ~= v_u_11.Stacked
		end
	end
	local v_u_145
	if v_u_144 then
		v_u_145 = v_u_3.createElement(v_u_30, {
			["variant"] = v_u_39.variant,
			["size"] = v_u_39.size,
			["increment"] = {
				["isDisabled"] = v_u_89,
				["onClick"] = v142
			},
			["decrement"] = {
				["isDisabled"] = v_u_91,
				["onClick"] = v143
			},
			["testId"] = v_u_39.testId
		})
	else
		v_u_145 = nil
	end
	local v_u_146 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_144, (copy) v_u_42, (copy) v_u_101
		if v_u_144 then
			return UDim.new(0, v_u_42.width + v_u_101)
		else
			return UDim.new()
		end
	end, {
		v_u_40,
		v51,
		v_u_40.Gap.XSmall,
		v_u_42,
		v_u_101,
		v_u_144
	})
	local v_u_149 = v_u_3.useCallback(function(_, p147)
		-- upvalues: (copy) v_u_39, (copy) v_u_46, (copy) v_u_45, (ref) v_u_20
		local v148 = v_u_39.value
		v_u_46.current = false
		if v148 then
			v_u_45.current = {
				["position"] = p147.X,
				["value"] = v_u_20(v148)
			}
		end
	end, { v_u_39.value })
	local v150 = v_u_3.useCallback
	local function v152(_, p151)
		-- upvalues: (copy) v_u_45, (ref) v_u_14, (copy) v_u_39, (copy) v_u_46, (ref) v_u_33, (copy) v_u_54, (copy) v_u_136, (ref) v_u_13
		if v_u_45.current then
			if v_u_14.FoundationNumberInputScrubCallbackProps and (v_u_39.onScrubStarted and not v_u_46.current) then
				v_u_39.onScrubStarted()
				v_u_46.current = true
			end
			v_u_136(v_u_33(v_u_45.current.value, v_u_45.current.position, p151.X, v_u_39.step, v_u_54), v_u_13.Drag)
		end
	end
	local v153 = {}
	local v154 = v_u_39.step
	local v155 = v_u_98
	local v156
	if v_u_14.FoundationNumberInputScrubCallbackProps then
		v156 = v_u_39.onScrubStarted
	else
		v156 = nil
	end
	__set_list(v153, 1, {v_u_136, v154, v155, v156, v_u_54})
	local v_u_157 = v150(v152, v153)
	local v158 = v_u_3.useCallback
	local function v159()
		-- upvalues: (copy) v_u_45, (ref) v_u_14, (copy) v_u_39, (copy) v_u_46
		if v_u_45.current then
			v_u_45.current = nil
			if v_u_14.FoundationNumberInputScrubCallbackProps and (v_u_39.onScrubEnded and v_u_46.current) then
				v_u_39.onScrubEnded()
			end
		end
		v_u_46.current = false
	end
	local v160 = {}
	local v161
	if v_u_14.FoundationNumberInputScrubCallbackProps then
		v161 = v_u_39.onScrubEnded
	else
		v161 = nil
	end
	__set_list(v160, 1, {v161})
	local v_u_162 = v158(v159, v160)
	local v_u_163 = nil
	local v_u_164, v_u_165
	if v_u_14.FoundationFixColorOnScrubbableNumberInput then
		local v166 = v_u_41.container.fgStyle
		local v167 = v_u_41.container.bgStyle
		if v167 and v167.Color3 then
			v_u_163 = v167.Color3
		else
			v_u_163 = v_u_40.Color.Shift.Shift_100.Color3
		end
		if v166 and v166.Transparency then
			v_u_164 = v166.Transparency
		else
			v_u_164 = v_u_40.Color.None.Transparency
		end
		if v167 and v167.Transparency then
			v_u_165 = v167.Transparency
		else
			v_u_165 = v_u_40.Color.None.Transparency
		end
	else
		v_u_164 = v_u_40.Color.Shift.Shift_300.Transparency
		v_u_165 = v_u_40.Color.Shift.Shift_100.Transparency
	end
	local v168 = v_u_39.maximum
	local v_u_169
	if math.abs(v168) < (1 / 0) then
		local v170 = v_u_39.minimum
		v_u_169 = math.abs(v170) < (1 / 0)
	else
		v_u_169 = false
	end
	local v_u_171 = nil
	local v_u_172
	if v_u_14.FoundationNumberInputScrubbingUsesOffset then
		v_u_172 = v_u_3.useMemo(function()
			-- upvalues: (ref) v_u_164, (ref) v_u_165
			return NumberSequence.new({
				NumberSequenceKeypoint.new(0, v_u_164),
				NumberSequenceKeypoint.new(0.499, v_u_164),
				NumberSequenceKeypoint.new(0.5, v_u_165),
				NumberSequenceKeypoint.new(1, v_u_165)
			})
		end, { v_u_164, v_u_165 })
		v_u_171 = v_u_3.useMemo(function()
			-- upvalues: (ref) v_u_25, (copy) v_u_39, (copy) v_u_169, (copy) v_u_58
			return v_u_25(v_u_39.value, function(p173)
				-- upvalues: (ref) v_u_169, (ref) v_u_58, (ref) v_u_39
				local v174
				if p173 and v_u_169 then
					local v175 = v_u_58(p173)
					v174 = v_u_39.maximum == v_u_39.minimum and 1 or (v175 - v_u_39.minimum) / (v_u_39.maximum - v_u_39.minimum)
				else
					v174 = 0
				end
				if v174 <= 0 then
					return Vector2.new(-1, 0)
				elseif v174 >= 1 then
					return Vector2.new(1, 0)
				else
					return Vector2.new(v174 - 0.5, 0)
				end
			end)
		end, {
			v_u_39.value,
			v_u_58,
			v_u_39.maximum,
			v_u_39.minimum,
			v_u_169
		})
	else
		v_u_172 = v_u_3.useMemo(function()
			-- upvalues: (ref) v_u_25, (copy) v_u_39, (copy) v_u_58, (ref) v_u_165, (ref) v_u_164
			return v_u_25(v_u_39.value, function(p176)
				-- upvalues: (ref) v_u_39, (ref) v_u_58, (ref) v_u_165, (ref) v_u_164
				local v177
				if p176 and (v_u_39.maximum and v_u_39.minimum) then
					local v178 = v_u_58(p176)
					v177 = v_u_39.maximum == v_u_39.minimum and 1 or (v178 - v_u_39.minimum) / (v_u_39.maximum - v_u_39.minimum)
				else
					v177 = 0
				end
				if v177 == 0 then
					return NumberSequence.new(v_u_165)
				end
				if v177 == 1 then
					return NumberSequence.new(v_u_164)
				end
				if v177 <= 0 and v177 >= 1 then
					return NumberSequence.new(v_u_165)
				end
				local v179 = {}
				local v180 = NumberSequenceKeypoint.new(0, v_u_164)
				local v181 = NumberSequenceKeypoint.new(v177, v_u_164)
				local v182 = NumberSequenceKeypoint.new
				local v183 = v177 + 0.001
				__set_list(v179, 1, {v180, v181, v182(math.min(v183, 1), v_u_165)})
				if v177 < 0.999 then
					local v184 = NumberSequenceKeypoint.new
					local v185 = v_u_165
					table.insert(v179, v184(1, v185))
				end
				return NumberSequence.new(v179)
			end)
		end, {
			v_u_164,
			v_u_165,
			v_u_39.value,
			v_u_58,
			v_u_39.maximum,
			v_u_39.minimum
		})
	end
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_47, (ref) v_u_4, (copy) v_u_39, (copy) v_u_100, (copy) v_u_98
		if not (v_u_47() or v_u_4.isBinding(v_u_39.value)) then
			v_u_100(v_u_39.formatAsString(v_u_98(v_u_39.value)))
		end
	end, {
		v_u_39.value,
		v_u_39.formatAsString,
		v_u_98,
		v_u_47
	})
	return v_u_3.createElement(v_u_16, v_u_7(v_u_39, {
		["width"] = v_u_126,
		["ref"] = p38,
		["hasError"] = v_u_50,
		["label"] = v_u_39.label,
		["size"] = v_u_21(v_u_39.size),
		["isRequired"] = v_u_39.isRequired,
		["isDisabled"] = v_u_39.isDisabled,
		["hint"] = v_u_39.hint,
		["textBoxRef"] = v44,
		["input"] = function(p186) -- name: input
			-- upvalues: (copy) v_u_144, (copy) v_u_145, (ref) v_u_3, (ref) v_u_17, (copy) v_u_39, (ref) v_u_24, (copy) v_u_99, (copy) v_u_47, (copy) v_u_98, (copy) v_u_50, (copy) v_u_41, (ref) v_u_108, (copy) p_u_37, (copy) v_u_141, (copy) v_u_138, (copy) v_u_130, (copy) v_u_53, (copy) v_u_149, (copy) v_u_157, (copy) v_u_162, (ref) v_u_14, (copy) v_u_169, (ref) v_u_163, (ref) v_u_172, (ref) v_u_171, (copy) v_u_40, (ref) v_u_19, (ref) v_u_15, (ref) v_u_104, (ref) v_u_18, (ref) v_u_116, (ref) v_u_125, (copy) v_u_126, (copy) v_u_146, (copy) v_u_101
			local v187 = v_u_144
			if v187 then
				v187 = v_u_145
			end
			local v188 = v_u_3.createElement
			local v189 = v_u_17
			local v191 = {
				["inputRef"] = v_u_39.inputRef,
				["text"] = v_u_24({
					["text"] = v_u_99,
					["value"] = v_u_39.value
				}, function(p190)
					-- upvalues: (ref) v_u_47, (ref) v_u_39, (ref) v_u_98
					if v_u_47() then
						return p190.text
					else
						return v_u_39.formatAsString(v_u_98(p190.value))
					end
				end),
				["hasError"] = v_u_50,
				["variant"] = v_u_39.variant,
				["size"] = v_u_39.size,
				["Selectable"] = v_u_39.Selectable,
				["NextSelectionUp"] = v_u_39.NextSelectionUp,
				["NextSelectionDown"] = v_u_39.NextSelectionDown,
				["NextSelectionLeft"] = v_u_39.NextSelectionLeft,
				["NextSelectionRight"] = v_u_39.NextSelectionRight
			}
			local v192 = {
				["left"] = v_u_41.container.horizontalPadding,
				["right"] = v_u_41.container.horizontalPadding
			}
			local v193
			if v_u_108 and v_u_108.X > 0 then
				v193 = UDim.new(0, v_u_108.X)
			else
				v193 = nil
			end
			v192.innerLeft = v193
			v191.horizontalPadding = v192
			v191.focusBehavior = p_u_37.focusBehavior
			v191.onChanged = v_u_141
			v191.onFocusLost = v_u_138
			v191.onFocus = v_u_130
			local v194
			if v_u_53 then
				v194 = v_u_149
			else
				v194 = nil
			end
			v191.onDragStarted = v194
			local v195
			if v_u_53 then
				v195 = v_u_157
			else
				v195 = nil
			end
			v191.onDrag = v195
			local v196
			if v_u_53 then
				v196 = v_u_162
			else
				v196 = nil
			end
			v191.onDragEnded = v196
			v191.onReturnPressed = v_u_39.onReturnPressed
			v191.ref = p186
			local v197
			if v_u_14.FoundationNumberInputScrubbingUsesOffset then
				if v_u_53 and v_u_169 then
					v197 = v_u_3.createElement("UIGradient", {
						["Color"] = ColorSequence.new(v_u_163),
						["Transparency"] = v_u_172,
						["Offset"] = v_u_171
					})
				else
					v197 = nil
				end
			elseif v_u_53 and v_u_172 then
				local v198 = v_u_3.createElement
				local v199 = "UIGradient"
				local v200 = {
					["Color"] = nil,
					["Transparency"] = nil,
					["Rotation"] = 0
				}
				local v201
				if v_u_14.FoundationFixColorOnScrubbableNumberInput then
					v201 = ColorSequence.new(v_u_163)
				else
					v201 = ColorSequence.new(v_u_40.Color.Shift.Shift_300.Color3)
				end
				v200.Color = v201
				v200.Transparency = v_u_172
				v197 = v198(v199, v200)
			else
				v197 = nil
			end
			v191.backgroundGradient = v197
			local v202
			if v_u_39.trailingIcon then
				v202 = v_u_3.createElement(v_u_19, {
					["tag"] = "row align-y-center size-0-full auto-x"
				}, v_u_3.createElement(v_u_15, {
					["name"] = v_u_39.trailingIcon,
					["style"] = v_u_41.icon.style,
					["size"] = v_u_41.icon.size
				}))
			else
				v202 = nil
			end
			v191.trailingElement = v202
			local v203
			if v_u_39.leadingIcon then
				v203 = v_u_3.createElement(v_u_19, {
					["tag"] = "row align-y-center size-0-full auto-x"
				}, v_u_3.createElement(v_u_15, {
					["name"] = v_u_39.leadingIcon,
					["style"] = v_u_41.icon.style,
					["size"] = v_u_41.icon.size
				}))
			else
				v203 = nil
			end
			v191.leadingElement = v203
			v191.isDisabled = v_u_39.isDisabled
			v191.LayoutOrder = v187 and 0 or nil
			v191.testId = ("%*--field"):format(v_u_39.testId)
			local v204 = v188(v189, v191)
			local v205
			if v_u_104 then
				v205 = v_u_3.createElement(v_u_18, {
					["tag"] = "text-align-x-left text-align-y-center content-muted",
					["fontStyle"] = nil,
					["Size"] = nil,
					["Position"] = nil,
					["Text"] = nil,
					["RichText"] = true,
					["ClipsDescendants"] = true,
					["padding"] = nil,
					["testId"] = nil,
					["fontStyle"] = v_u_41.textBox.fontStyle,
					["Size"] = UDim2.new(1, -(v_u_116.left.Offset + v_u_116.right.Offset), 1, 0),
					["Position"] = UDim2.fromOffset(v_u_116.left.Offset, 0),
					["Text"] = v_u_99:map(function(p206)
						-- upvalues: (ref) v_u_39
						return ("%*<font transparency=\"1\">%*</font>%*"):format(not v_u_39.prefix and "" or v_u_39.prefix .. " ", p206, not v_u_39.suffix and "" or " " .. v_u_39.suffix)
					end),
					["padding"] = v_u_125,
					["testId"] = ("%*--units"):format(v_u_39.testId)
				})
			else
				v205 = nil
			end
			local v207 = v_u_3.createElement(v_u_19, {
				["tag"] = "size-full-0 auto-y"
			}, {
				["Input"] = v204,
				["Units"] = v205
			})
			local v208 = v_u_3.createElement
			local v209 = v_u_19
			local v210 = {
				["Size"] = nil,
				["tag"] = "row align-y-center auto-y",
				["layout"] = nil,
				["Size"] = UDim2.new(v_u_126.Scale - v_u_146.Scale, v_u_126.Offset - v_u_146.Offset, 0, 0),
				["layout"] = {
					["FillDirection"] = Enum.FillDirection.Horizontal,
					["Padding"] = UDim.new(0, v_u_101),
					["SortOrder"] = Enum.SortOrder.LayoutOrder
				}
			}
			local v211 = {
				["InputField"] = v207
			}
			local v212
			if v187 then
				v212 = v_u_145
			else
				v212 = nil
			end
			v211.Controls = v212
			return v208(v209, v210, v211)
		end
	}))
end))