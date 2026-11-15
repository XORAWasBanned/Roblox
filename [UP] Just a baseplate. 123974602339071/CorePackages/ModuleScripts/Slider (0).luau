-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Slider.Slider
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactUtils)
local v_u_5 = require(v1.Constants)
local v_u_6 = require(v1.Utility.Wrappers.Services).GuiService
local v_u_7 = require(v1.Utility.Input.InputMode)
require(v1.Components.Types)
local v_u_8 = require(v1.Components.View)
local v_u_9 = require(v1.Utility.useBindable)
local v_u_10 = require(v1.Utility.Input.useLastInputMode)
local v_u_11 = require(v1.Utility.withCommonProps)
local v_u_12 = require(v1.Utility.withDefaults)
local v_u_13 = require(script.Parent.calculateSliderFraction)
local v_u_14 = require(script.Parent.calculateSliderStepValue)
local v_u_15 = require(script.Parent.calculateSliderValueFraction)
local v_u_16 = require(script.Parent.getGuiInputPosition)
local v_u_17 = require(script.Parent.getSelectionEntryDirection)
local v_u_18 = require(script.Parent.useSliderCaptureKeys)
local v_u_19 = require(script.Parent.useSliderDirectionalInput)
local v20 = require(v1.Enums.InputSize)
local v_u_21 = require(v1.Enums.Visibility)
local v_u_22 = require(v1.Enums.Orientation)
local v23 = require(v1.Enums.SliderVariant)
local v_u_24 = require(v1.Enums.SliderType)
local v_u_25 = require(v1.Components.InternalSlider)
local v_u_26 = require(script.Parent.SliderThumb)
local v27 = require(v1.Enums.ColorNamespace)
local v_u_28 = require(v1.Enums.ControlState)
local v_u_29 = require(v1.Enums.CursorType)
local v_u_30 = require(v1.Enums.StateLayerAffordance)
local v_u_31 = require(v1.Providers.Cursor.CursorComponent)
local v_u_32 = require(v1.Utility.Flags)
local v_u_33 = require(v1.Components.Knob)
local v_u_34 = require(v1.Providers.Style.PresentationContext)
local v_u_35 = require(v1.Utility.blendTransparencies)
local v_u_36 = require(v1.Components.Knob.getKnobSize)
local v_u_37 = v_u_34.usePresentationContext
local v_u_38 = require(v1.Components.Slider.useSliderVariants)
local v_u_39 = require(v1.Providers.Style.useTokens)
local v_u_40 = {
	["range"] = nil,
	["size"] = nil,
	["width"] = nil,
	["orientation"] = nil,
	["variant"] = nil,
	["isDisabled"] = false,
	["isContained"] = false,
	["knobVisibility"] = nil,
	["testId"] = "--foundation-slider",
	["range"] = NumberRange.new(0, 1),
	["size"] = v20.Medium,
	["width"] = UDim.new(1, 0),
	["orientation"] = v_u_22.Horizontal,
	["variant"] = v23.Standard,
	["knobVisibility"] = v_u_21.Auto
}
local v_u_41 = {
	["colorNamespace"] = v27.Inverse
}
local v_u_42 = {
	["SelectionBehaviorLeft"] = Enum.SelectionBehavior.Stop,
	["SelectionBehaviorRight"] = Enum.SelectionBehavior.Stop,
	["SelectionBehaviorUp"] = Enum.SelectionBehavior.Stop,
	["SelectionBehaviorDown"] = Enum.SelectionBehavior.Stop
}
local v_u_43 = {
	["SelectionBehaviorLeft"] = Enum.SelectionBehavior.Escape,
	["SelectionBehaviorRight"] = Enum.SelectionBehavior.Escape,
	["SelectionBehaviorUp"] = Enum.SelectionBehavior.Escape,
	["SelectionBehaviorDown"] = Enum.SelectionBehavior.Escape
}
local v_u_44 = {
	["SelectionBehaviorLeft"] = Enum.SelectionBehavior.Stop,
	["SelectionBehaviorRight"] = Enum.SelectionBehavior.Stop,
	["SelectionBehaviorUp"] = Enum.SelectionBehavior.Stop,
	["SelectionBehaviorDown"] = Enum.SelectionBehavior.Stop
}
return v_u_3.forwardRef(function(p_u_45, p46) -- name: Slider
	-- upvalues: (copy) v_u_32, (copy) v_u_12, (copy) v_u_40, (copy) v_u_22, (copy) v_u_24, (copy) v_u_39, (copy) v_u_38, (copy) v_u_9, (copy) v_u_3, (copy) v_u_8, (copy) v_u_34, (copy) v_u_41, (copy) v_u_33, (copy) v_u_35, (copy) v_u_15, (copy) v_u_25, (copy) v_u_11, (copy) v_u_28, (copy) v_u_10, (copy) v_u_4, (copy) v_u_18, (copy) v_u_6, (copy) v_u_21, (copy) v_u_14, (copy) v_u_7, (copy) v_u_13, (copy) v_u_16, (copy) v_u_19, (copy) v_u_17, (copy) v_u_37, (copy) v_u_36, (copy) v_u_26, (copy) v_u_44, (copy) v_u_29, (copy) v_u_31, (copy) v_u_5, (copy) v_u_42, (copy) v_u_43, (copy) v_u_30
	if v_u_32.FoundationSliderRebuild then
		local v_u_47 = v_u_12(p_u_45, v_u_40)
		local v_u_48 = v_u_47.orientation == v_u_22.Vertical
		local v_u_49 = p_u_45.type == v_u_24.Range
		local v_u_50 = v_u_38(v_u_39(), v_u_47.size, v_u_47.variant, v_u_48)
		local v_u_51 = v_u_9(p_u_45.type == v_u_24.Range and 0 or p_u_45.value)
		local v52 = v_u_9
		local v53
		if p_u_45.type == v_u_24.Range then
			v53 = p_u_45.value
		else
			v53 = NumberRange.new(0)
		end
		local v_u_54 = v52(v53)
		local v_u_60 = v_u_3.useMemo(function()
			-- upvalues: (copy) v_u_49, (copy) v_u_54, (copy) v_u_47, (copy) v_u_51
			return v_u_49 and {
				{
					["value"] = v_u_54:map(function(p55)
						return p55.Min
					end),
					["testId"] = ("%*--min"):format(v_u_47.testId)
				},
				{
					["value"] = v_u_54:map(function(p56)
						return p56.Max
					end),
					["testId"] = ("%*--max"):format(v_u_47.testId)
				}
			} or {
				{
					["value"] = v_u_51:map(function(p57)
						-- upvalues: (ref) v_u_47
						local v58 = v_u_47.range.Min
						local v59 = v_u_47.range.Max
						return math.clamp(p57, v58, v59)
					end),
					["testId"] = ("%*--thumb"):format(v_u_47.testId)
				}
			}
		end, {
			v_u_49,
			v_u_54,
			v_u_51,
			v_u_47.range.Min,
			v_u_47.range.Max,
			v_u_47.testId
		})
		local v66 = v_u_3.useCallback(function(p61, p62)
			-- upvalues: (copy) p_u_45, (ref) v_u_24, (copy) v_u_54
			if p_u_45.type == v_u_24.Range then
				if p_u_45.onValueChanged then
					local v63 = v_u_54:getValue()
					local v64 = p_u_45.onValueChanged
					local v65
					if p61 == 1 then
						v65 = NumberRange.new(p62, v63.Max)
					else
						v65 = NumberRange.new(v63.Min, p62)
					end
					v64(v65)
					return
				end
			elseif p_u_45.onValueChanged then
				p_u_45.onValueChanged(p62)
			end
		end, { p_u_45.type, p_u_45.onValueChanged, v_u_54 })
		local v82 = v_u_3.useCallback(function(p67, p68)
			-- upvalues: (copy) v_u_47, (copy) v_u_49, (ref) v_u_3, (ref) v_u_8, (ref) v_u_34, (ref) v_u_41, (ref) v_u_33, (copy) v_u_50, (ref) v_u_35, (copy) v_u_60
			if v_u_47.knob then
				if v_u_49 then
					return v_u_47.knob
				else
					return v_u_3.createElement(v_u_8, {
						["tag"] = "size-0-0 auto-xy",
						["Visible"] = nil,
						["testId"] = nil,
						["Visible"] = p68.isVisible,
						["testId"] = ("%*--custom-knob"):format(v_u_47.testId)
					}, v_u_47.knob)
				end
			else
				local v69 = v_u_3.createElement
				local v70 = v_u_34.Provider
				local v71 = {
					["value"] = v_u_41
				}
				local v72 = {}
				local v73 = v_u_3.createElement
				local v74 = v_u_33
				local v75 = {
					["size"] = v_u_47.size
				}
				local v76
				if p68.isVisible then
					if p68.isDragging then
						v76 = v_u_50.knob.dragStyle
					else
						v76 = v_u_50.knob.style
					end
				else
					v76 = {
						["Color3"] = nil,
						["Transparency"] = 1,
						["Color3"] = v_u_50.knob.style.Color3
					}
				end
				v75.style = v76
				local v77
				if v_u_50.knob.stroke then
					v77 = {
						["Color"] = v_u_50.knob.stroke.Color,
						["Thickness"] = v_u_50.knob.stroke.Thickness
					}
					local v78 = v_u_35
					local v79 = v_u_50.knob.stroke.Transparency
					local v80
					if typeof(v79) == "number" then
						v80 = v_u_50.knob.stroke.Transparency
					else
						v80 = nil
					end
					v77.Transparency = v78(v80, p68.isVisible and 0 or 1)
				else
					v77 = nil
				end
				v75.stroke = v77
				v75.hasShadow = v_u_50.knob.hasShadow
				local v81
				if v_u_49 then
					v81 = ("%*--knob"):format(v_u_60[p67].testId)
				else
					v81 = ("%*--knob"):format(v_u_47.testId)
				end
				v75.testId = v81
				v72.Knob = v73(v74, v75)
				return v69(v70, v71, v72)
			end
		end, {
			v_u_47.knob,
			v_u_47.size,
			v_u_47.testId,
			v_u_49,
			v_u_50,
			v_u_60
		})
		local v83
		if v_u_49 then
			v83 = v_u_3.createElement(v_u_8, {
				["tag"] = v_u_50.fill.tag,
				["Position"] = v_u_54:map(function(p84)
					-- upvalues: (copy) v_u_48, (ref) v_u_15, (copy) v_u_47
					if v_u_48 then
						return UDim2.fromScale(0, 1 - v_u_15(p84.Max, v_u_47.range))
					else
						return UDim2.fromScale(v_u_15(p84.Min, v_u_47.range), 0)
					end
				end),
				["Size"] = v_u_54:map(function(p85)
					-- upvalues: (ref) v_u_15, (copy) v_u_47, (copy) v_u_48
					local v86 = v_u_15(p85.Max, v_u_47.range) - v_u_15(p85.Min, v_u_47.range)
					if v_u_48 then
						return UDim2.fromScale(1, v86)
					else
						return UDim2.fromScale(v86, 1)
					end
				end),
				["testId"] = ("%*--fill"):format(v_u_47.testId)
			})
		else
			local v87 = v_u_3.createElement
			local v88 = v_u_8
			local v89 = {
				["tag"] = v_u_50.fill.tag
			}
			local v90
			if v_u_48 then
				v90 = Vector2.new(0, 1)
			else
				v90 = nil
			end
			v89.AnchorPoint = v90
			local v91
			if v_u_48 then
				v91 = UDim2.fromScale(0, 1)
			else
				v91 = nil
			end
			v89.Position = v91
			v89.Size = v_u_51:map(function(p92)
				-- upvalues: (ref) v_u_15, (copy) v_u_47, (copy) v_u_48
				local v93 = v_u_15(p92, v_u_47.range)
				if v_u_48 then
					return UDim2.fromScale(1, v93)
				else
					return UDim2.fromScale(v93, 1)
				end
			end)
			v89.testId = ("%*--fill"):format(v_u_47.testId)
			v83 = v87(v88, v89)
		end
		local v94 = v_u_3.createElement
		local v95 = v_u_25
		local v96 = v_u_11(v_u_47, {
			["thumbs"] = v_u_60,
			["onValueChanged"] = v66,
			["renderThumb"] = v82,
			["range"] = v_u_47.range,
			["step"] = v_u_47.step,
			["size"] = v_u_47.size,
			["width"] = v_u_47.width,
			["orientation"] = v_u_47.orientation,
			["isDisabled"] = v_u_47.isDisabled,
			["isContained"] = v_u_47.isContained,
			["knobVisibility"] = v_u_47.knobVisibility,
			["onDragStarted"] = v_u_47.onDragStarted,
			["onDragEnded"] = v_u_47.onDragEnded,
			["ref"] = p46
		})
		local v97 = v_u_3.createElement
		local v98 = v_u_8
		local v99 = {
			["tag"] = v_u_50.bar.tag
		}
		local v100
		if v_u_48 then
			v100 = UDim2.new(0, v_u_50.bar.height, 1, 0)
		else
			v100 = UDim2.new(1, 0, 0, v_u_50.bar.height)
		end
		v99.Size = v100
		v99.testId = ("%*--bar"):format(v_u_47.testId)
		return v94(v95, v96, v97(v98, v99, {
			["Fill"] = v83
		}))
	end
	local v_u_101 = v_u_12(p_u_45, v_u_40)
	local v_u_102 = v_u_101.orientation == v_u_22.Vertical
	local v_u_103 = p_u_45.type == v_u_24.Range
	local v104 = p_u_45.type == v_u_24.Range and 0 or p_u_45.value
	local v_u_105
	if p_u_45.type == v_u_24.Range then
		v_u_105 = nil
	else
		v_u_105 = p_u_45.onValueChanged
	end
	local v_u_106
	if p_u_45.type == v_u_24.Range then
		v_u_106 = p_u_45.onValueChanged
	else
		v_u_106 = nil
	end
	local v107 = v_u_39()
	local v_u_108, v_u_109 = v_u_3.useState(v_u_28.Initialize)
	local v_u_110, v_u_111 = v_u_3.useState(false)
	local v_u_112, v_u_113 = v_u_3.useState(false)
	local v_u_114, v_u_115
	if v_u_32.FoundationSliderCapture then
		v_u_114, v_u_115 = v_u_3.useState(false)
	else
		v_u_115 = nil
		v_u_114 = nil
	end
	local v_u_116, v_u_117
	if v_u_32.FoundationSliderCapture then
		v_u_116, v_u_117 = v_u_3.useState(false)
	else
		v_u_117 = nil
		v_u_116 = nil
	end
	local v_u_118
	if v_u_32.FoundationSliderCapture then
		v_u_118 = v_u_3.useRef(nil)
	else
		v_u_118 = nil
	end
	local v_u_119
	if v_u_32.FoundationSliderCapture then
		v_u_119 = v_u_3.useRef(nil)
	else
		v_u_119 = nil
	end
	local v_u_120
	if v_u_32.FoundationSliderCapture then
		v_u_120 = v_u_3.useRef(false)
	else
		v_u_120 = nil
	end
	local v_u_121 = v_u_3.useRef(false)
	local v_u_122, v_u_123 = v_u_3.useState(false)
	local v_u_127 = v_u_9(v104):map(function(p124)
		-- upvalues: (copy) v_u_101
		local v125 = v_u_101.range.Min
		local v126 = v_u_101.range.Max
		return math.clamp(p124, v125, v126)
	end)
	local v128 = v_u_9
	local v129
	if p_u_45.type == v_u_24.Range then
		v129 = p_u_45.value
	else
		v129 = NumberRange.new(0)
	end
	local v_u_130 = v128(v129)
	local v_u_131 = v_u_3.useRef(nil)
	local v_u_132 = v_u_3.useRef(0)
	local v133, v_u_134 = v_u_3.useBinding(UDim2.new())
	local v135, v_u_136 = v_u_3.useBinding(UDim2.new())
	local v_u_138 = v_u_3.useCallback(function(p137)
		-- upvalues: (copy) v_u_102, (copy) v_u_134, (copy) v_u_136
		if v_u_102 then
			v_u_134(UDim2.fromScale(0, p137 - 1))
			v_u_136(UDim2.fromScale(0, p137))
		else
			v_u_134(UDim2.fromScale(-p137, 0))
			v_u_136(UDim2.fromScale(1 - p137, 0))
		end
	end, { v_u_102 })
	local v_u_139 = v_u_3.useRef(0)
	local v_u_140 = v_u_10()
	local v_u_141 = v_u_3.useRef(nil)
	v_u_3.useImperativeHandle(p46, function()
		-- upvalues: (copy) v_u_141
		return v_u_141.current
	end, {})
	local v142, v143 = v_u_3.useBinding(nil)
	local v144 = v_u_4.useComposedRef(v_u_141, v143)
	local v_u_145 = v_u_38(v107, v_u_101.size, v_u_101.variant, v_u_102)
	local v_u_146 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_112, (copy) v_u_145, (copy) v_u_110, (copy) v_u_103
		if v_u_112 then
			if v_u_110 and not v_u_103 then
				return v_u_145.knob.dragStyle
			else
				return v_u_145.knob.style
			end
		else
			return {
				["Color3"] = nil,
				["Transparency"] = 1,
				["Color3"] = v_u_145.knob.style.Color3
			}
		end
	end, {
		v_u_145,
		v_u_112,
		v_u_110,
		v_u_103
	})
	local v_u_147 = (v_u_108 == v_u_28.Selected or v_u_108 == v_u_28.SelectedPressed) and true or v_u_32.FoundationSliderCapture and v_u_114
	local v148
	if v_u_32.FoundationSliderCapture then
		v148 = v_u_3.useCallback(function()
			-- upvalues: (ref) v_u_114, (copy) v_u_103, (ref) v_u_117, (ref) v_u_116, (ref) v_u_115
			if v_u_114 then
				if v_u_103 then
					v_u_117(not v_u_116)
					return
				end
			else
				v_u_115(true)
			end
		end, { v_u_114, v_u_103, v_u_116 })
	else
		v148 = nil
	end
	if v_u_32.FoundationSliderCapture then
		local v149 = v_u_18
		local v150
		if v_u_147 then
			v150 = not v_u_101.isDisabled
		else
			v150 = v_u_147
		end
		v149(v150, v148)
	end
	if v_u_32.FoundationSliderCapture then
		v_u_3.useEffect(function()
			-- upvalues: (copy) v_u_101, (ref) v_u_115
			if v_u_101.isDisabled then
				v_u_115(false)
			end
		end, { v_u_101.isDisabled })
		v_u_3.useEffect(function()
			-- upvalues: (ref) v_u_6, (copy) v_u_141, (copy) v_u_118, (copy) v_u_119
			local function v153() -- name: redirectDragSelection
				-- upvalues: (ref) v_u_6, (ref) v_u_141, (ref) v_u_118, (ref) v_u_119
				local v151 = v_u_6.SelectedObject
				local v152 = v151 ~= v_u_141.current and (v151 ~= nil and (v_u_141.current ~= nil and v151:IsDescendantOf(v_u_141.current)))
				if v152 then
					if v151 == v_u_118.current then
						v152 = false
					else
						v152 = v151 ~= v_u_119.current
					end
				end
				if v152 then
					v_u_6.SelectedObject = v_u_118.current
				end
			end
			local v154 = v_u_6.SelectedObject
			local v155 = v154 ~= v_u_141.current and (v154 ~= nil and v_u_141.current ~= nil and v154:IsDescendantOf(v_u_141.current))
			if v155 then
				if v154 == v_u_118.current then
					v155 = false
				else
					v155 = v154 ~= v_u_119.current
				end
			end
			if v155 then
				v_u_6.SelectedObject = v_u_118.current
			end
			local v_u_156 = v_u_6:GetPropertyChangedSignal("SelectedObject"):Connect(v153)
			return function()
				-- upvalues: (copy) v_u_156
				v_u_156:Disconnect()
			end
		end, {})
		v_u_3.useEffect(function()
			-- upvalues: (ref) v_u_114, (ref) v_u_6, (copy) v_u_119, (ref) v_u_115
			if v_u_114 then
				v_u_6.SelectedObject = v_u_119.current
				local v_u_157 = v_u_6:GetPropertyChangedSignal("SelectedObject"):Connect(function()
					-- upvalues: (ref) v_u_6, (ref) v_u_119, (ref) v_u_115
					if v_u_6.SelectedObject ~= v_u_119.current then
						v_u_115(false)
					end
				end)
				return function()
					-- upvalues: (copy) v_u_157
					v_u_157:Disconnect()
				end
			end
		end, { v_u_114 })
	end
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_101, (copy) v_u_113, (ref) v_u_21, (copy) v_u_147, (copy) v_u_110, (copy) v_u_108, (ref) v_u_28
		if v_u_101.isDisabled then
			v_u_113(false)
			return
		elseif v_u_101.knobVisibility == v_u_21.None then
			v_u_113(v_u_147)
			return
		elseif v_u_101.knobVisibility == v_u_21.Always then
			v_u_113(true)
		else
			v_u_113(v_u_110 or ((v_u_108 == v_u_28.Hover or v_u_108 == v_u_28.Selected) and true or v_u_108 == v_u_28.Pressed))
		end
	end, {
		v_u_101.knobVisibility,
		v_u_108,
		v_u_110,
		v_u_101.isDisabled,
		v_u_147
	})
	local v_u_159 = v_u_3.useCallback(function(p158)
		-- upvalues: (copy) v_u_127, (copy) v_u_105
		if p158 ~= v_u_127:getValue() and v_u_105 then
			v_u_105(p158)
		end
	end, { v_u_127, v_u_105 })
	local v_u_162 = v_u_3.useCallback(function(p160)
		-- upvalues: (copy) v_u_130, (copy) v_u_106
		local v161 = v_u_130:getValue()
		if v_u_106 and (typeof(v161) ~= "NumberRange" or (p160.Min ~= v161.Min or p160.Max ~= v161.Max)) then
			v_u_106(p160)
		end
	end, { v_u_130, v_u_106 })
	local v_u_164 = v_u_3.useCallback(function(p163)
		-- upvalues: (copy) v_u_123, (ref) v_u_32, (ref) v_u_117, (copy) v_u_111, (copy) v_u_101
		v_u_123(p163)
		if v_u_32.FoundationSliderCapture then
			v_u_117(p163)
		end
		v_u_111(true)
		if v_u_101.onDragStarted then
			v_u_101.onDragStarted()
		end
	end, { v_u_101.onDragStarted })
	local v_u_165 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_111, (copy) v_u_101
		v_u_111(false)
		if v_u_101.onDragEnded then
			v_u_101.onDragEnded()
		end
	end, { v_u_101.onDragEnded })
	local v166 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_164
		v_u_164(false)
	end, { v_u_164 })
	local v167 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_164
		v_u_164(true)
	end, { v_u_164 })
	local v_u_170 = v_u_3.useCallback(function(p168)
		-- upvalues: (copy) v_u_101
		local v169 = (p168 - v_u_101.range.Min) / (v_u_101.range.Max - v_u_101.range.Min)
		return math.clamp(v169, 0, 1)
	end, { v_u_101.range.Min, v_u_101.range.Max })
	local v_u_172 = v_u_3.useCallback(function(p171)
		-- upvalues: (copy) v_u_101
		return v_u_101.range.Min + p171 * (v_u_101.range.Max - v_u_101.range.Min)
	end, { v_u_101.range.Min, v_u_101.range.Max })
	local v_u_175 = v_u_3.useCallback(function(p173)
		-- upvalues: (copy) v_u_172, (copy) v_u_101, (ref) v_u_14
		local v174 = v_u_172(p173)
		if v_u_101.step then
			return v_u_14(v174, v_u_101.step, v_u_101.range)
		else
			return v174
		end
	end, { v_u_172, v_u_101.step, v_u_101.range })
	local v_u_179 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_170, (copy) v_u_130, (copy) v_u_101, (copy) v_u_172
		local v176 = v_u_170(v_u_130:getValue().Max)
		if v_u_101.step and v_u_101.step > 0 then
			local v177 = (v_u_172(v176) - v_u_101.range.Min) / v_u_101.step + 0.5
			local v178 = math.floor(v177)
			v176 = v_u_170(v_u_101.range.Min + v178 * v_u_101.step)
		end
		return 0, v176
	end, {
		v_u_130,
		v_u_170,
		v_u_101.step,
		v_u_172,
		v_u_101.range.Min
	})
	local v_u_183 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_170, (copy) v_u_130, (copy) v_u_101, (copy) v_u_172
		local v180 = v_u_170(v_u_130:getValue().Min)
		if v_u_101.step and v_u_101.step > 0 then
			local v181 = (v_u_172(v180) - v_u_101.range.Min) / v_u_101.step + 0.5
			local v182 = math.floor(v181)
			v180 = v_u_170(v_u_101.range.Min + v182 * v_u_101.step)
		end
		return v180, 1
	end, {
		v_u_130,
		v_u_170,
		v_u_101.step,
		v_u_172,
		v_u_101.range.Min
	})
	local v_u_190 = v_u_3.useCallback(function(p184)
		-- upvalues: (copy) v_u_130, (copy) v_u_162, (copy) v_u_175
		local v185 = v_u_130:getValue()
		local v186 = v_u_162
		local v187 = NumberRange.new
		local v188 = v_u_175(p184)
		local v189 = v185.Max
		v186(v187(math.min(v188, v189), v185.Max))
	end, { v_u_130, v_u_162, v_u_175 })
	local v_u_198 = v_u_3.useCallback(function(p191)
		-- upvalues: (copy) v_u_130, (copy) v_u_162, (copy) v_u_175
		local v192 = v_u_130:getValue()
		local v193 = v_u_162
		local v194 = NumberRange.new
		local v195 = v192.Min
		local v196 = v_u_175(p191)
		local v197 = v192.Min
		v193(v194(v195, (math.max(v196, v197))))
	end, { v_u_130, v_u_162, v_u_175 })
	local v_u_205 = v_u_3.useCallback(function(p199, p200)
		-- upvalues: (copy) v_u_183, (copy) v_u_198, (copy) v_u_179, (copy) v_u_190
		if p200 then
			local v201, v202 = v_u_183()
			v_u_198((math.clamp(p199, v201, v202)))
		else
			local v203, v204 = v_u_179()
			v_u_190((math.clamp(p199, v203, v204)))
		end
	end, {
		v_u_183,
		v_u_179,
		v_u_198,
		v_u_190
	})
	local v215 = v_u_3.useCallback(function(_, p206)
		-- upvalues: (copy) v_u_103, (copy) v_u_140, (ref) v_u_7, (copy) v_u_141, (ref) v_u_13, (ref) v_u_16, (copy) v_u_102, (copy) v_u_130, (copy) v_u_170, (copy) v_u_121, (ref) v_u_32, (ref) v_u_117, (copy) v_u_164, (copy) v_u_205
		if v_u_103 and (v_u_140 ~= v_u_7.Directional and v_u_141.current) then
			local v207 = v_u_13(v_u_16(p206, v_u_141.current), v_u_141.current, v_u_102)
			local v208 = v_u_130:getValue()
			local v209 = v_u_170(v208.Min)
			local v210 = v_u_170(v208.Max)
			local v211 = v210 - v207
			local v212 = math.abs(v211)
			local v213 = v207 - v209
			local v214
			if v212 < math.abs(v213) then
				v214 = true
			elseif v209 == v210 then
				v214 = v210 < v207
			else
				v214 = false
			end
			v_u_121.current = v214
			if v_u_32.FoundationSliderCapture then
				v_u_117(v214)
			end
			v_u_164(v214)
			v_u_205(v207, v214)
		end
	end, {
		v_u_103,
		v_u_140,
		v_u_102,
		v_u_130,
		v_u_164,
		v_u_205,
		v_u_170
	})
	local v217 = v_u_3.useCallback(function(_, p216)
		-- upvalues: (copy) v_u_103, (copy) v_u_140, (ref) v_u_7, (copy) v_u_141, (ref) v_u_16, (copy) v_u_205, (ref) v_u_13, (copy) v_u_102, (copy) v_u_121
		if v_u_103 and (v_u_140 ~= v_u_7.Directional and v_u_141.current) then
			v_u_205(v_u_13(v_u_16(p216, v_u_141.current), v_u_141.current, v_u_102), v_u_121.current)
		end
	end, {
		v_u_103,
		v_u_140,
		v_u_102,
		v_u_205
	})
	local v218 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_103, (copy) v_u_165
		if v_u_103 then
			v_u_165()
		end
	end, { v_u_103, v_u_165 })
	local v_u_219
	if v_u_32.FoundationSliderCapture then
		v_u_219 = v_u_3.useCallback(function()
			-- upvalues: (ref) v_u_115, (ref) v_u_6, (copy) v_u_118
			v_u_115(false)
			v_u_6.SelectedObject = v_u_118.current
		end, {})
	else
		v_u_219 = nil
	end
	local v220 = v_u_3.useMemo
	local function v235()
		-- upvalues: (ref) v_u_32, (copy) v_u_103, (copy) v_u_130, (ref) v_u_116, (copy) v_u_127, (copy) v_u_162, (copy) v_u_159, (copy) v_u_101, (ref) v_u_14, (copy) v_u_219
		local v222 = {
			["getValue"] = function() -- name: getValue
				-- upvalues: (ref) v_u_32, (ref) v_u_103, (ref) v_u_130, (ref) v_u_116, (ref) v_u_127
				if v_u_32.FoundationSliderCapture and v_u_103 then
					local v221 = v_u_130:getValue()
					if v_u_116 then
						return v221.Max
					else
						return v221.Min
					end
				else
					return v_u_127:getValue()
				end
			end
		}
		local v223
		if v_u_32.FoundationSliderCapture then
			v223 = function(p224)
				-- upvalues: (ref) v_u_103, (ref) v_u_130, (ref) v_u_116, (ref) v_u_162, (ref) v_u_159
				if v_u_103 then
					local v225 = v_u_130:getValue()
					if v_u_116 then
						local v226 = v_u_162
						local v227 = NumberRange.new
						local v228 = v225.Min
						local v229 = v225.Min
						v226(v227(v228, (math.max(p224, v229))))
					else
						local v230 = v_u_162
						local v231 = NumberRange.new
						local v232 = v225.Max
						v230(v231(math.min(p224, v232), v225.Max))
					end
				else
					v_u_159(p224)
					return
				end
			end
		else
			v223 = function(p233)
				-- upvalues: (ref) v_u_101, (ref) v_u_14, (ref) v_u_159
				if v_u_101.step then
					p233 = v_u_14(p233, v_u_101.step, v_u_101.range)
				end
				v_u_159(p233)
			end
		end
		v222.onStep = v223
		local v234
		if v_u_32.FoundationSliderCapture then
			v234 = v_u_219
		else
			v234 = nil
		end
		v222.onExit = v234
		return v222
	end
	local v236 = {}
	local v237 = v_u_101.step
	local v238 = v_u_101.range
	local v239
	if v_u_32.FoundationSliderCapture then
		v239 = v_u_103
	else
		v239 = nil
	end
	local v240
	if v_u_32.FoundationSliderCapture then
		v240 = v_u_130
	else
		v240 = nil
	end
	local v241
	if v_u_32.FoundationSliderCapture then
		v241 = v_u_116
	else
		v241 = nil
	end
	if not v_u_32.FoundationSliderCapture then
		v_u_162 = nil
	end
	if not v_u_32.FoundationSliderCapture then
		v_u_219 = nil
	end
	__set_list(v236, 1, {v_u_127, v_u_159, v237, v238, v239, v240, v241, v_u_162, v_u_219})
	local v242 = v220(v235, v236)
	local v243
	if v_u_147 then
		v243 = not v_u_101.isDisabled
	else
		v243 = v_u_147
	end
	if v_u_32.FoundationSliderCapture then
		v243 = v243 and v_u_114
	elseif v243 then
		v243 = not v_u_103
	end
	v_u_19(v243, v_u_101.step, v_u_101.range, v_u_102, v242)
	local v252 = v_u_3.useCallback(function(_, _)
		-- upvalues: (copy) v_u_131, (copy) v_u_101, (copy) v_u_102, (copy) v_u_140, (ref) v_u_7, (copy) v_u_139, (copy) v_u_132, (copy) v_u_127, (copy) v_u_138, (copy) v_u_159, (ref) v_u_14
		local v244 = v_u_131.current
		if v244 then
			local v245 = v_u_101.range.Max - v_u_101.range.Min
			local v246
			if v_u_102 then
				v246 = -v244.DragUDim2.Y.Scale
			else
				v246 = v244.DragUDim2.X.Scale
			end
			if v_u_140 == v_u_7.Directional then
				local v247 = v246 - v_u_139.current
				if math.abs(v247) > 0.01 then
					v_u_132.current = (v_u_127:getValue() - v_u_101.range.Min) / v245 - v246
					v_u_139.current = v246
					v_u_138(v_u_132.current)
					return
				end
			end
			v_u_139.current = v246
			local v248 = v_u_132.current + v246
			local v249 = math.clamp(v248, 0, 1)
			local v250 = v_u_101.range.Min + v249 * v245
			local v251 = v_u_159
			if v_u_101.step then
				v250 = v_u_14(v250, v_u_101.step, v_u_101.range)
			end
			v251(v250)
		end
	end, {
		v_u_101.step,
		v_u_101.range,
		v_u_140,
		v_u_127,
		v_u_159,
		v_u_102,
		v_u_138
	})
	local v257 = v_u_3.useCallback(function(_, p253)
		-- upvalues: (copy) v_u_111, (copy) v_u_101, (copy) v_u_139, (copy) v_u_140, (ref) v_u_7, (copy) v_u_132, (copy) v_u_127, (copy) v_u_138, (copy) v_u_141, (ref) v_u_13, (ref) v_u_16, (copy) v_u_102, (copy) v_u_159, (ref) v_u_14
		v_u_111(true)
		if v_u_101.onDragStarted then
			v_u_101.onDragStarted()
		end
		v_u_139.current = 0
		local v254 = v_u_101.range.Max - v_u_101.range.Min
		if v_u_140 == v_u_7.Directional then
			v_u_132.current = (v_u_127:getValue() - v_u_101.range.Min) / v254
			v_u_138(v_u_132.current)
		else
			local v255
			if v_u_141.current then
				v255 = v_u_101.range.Min + v_u_13(v_u_16(p253, v_u_141.current), v_u_141.current, v_u_102) * v254
			else
				v255 = v_u_101.range.Min
			end
			v_u_132.current = (v255 - v_u_101.range.Min) / v254
			local v256 = v_u_159
			if v_u_101.step then
				v255 = v_u_14(v255, v_u_101.step, v_u_101.range)
			end
			v256(v255)
			v_u_138(v_u_132.current)
		end
	end, {
		v_u_101.onDragStarted,
		v_u_101.step,
		v_u_101.range,
		v_u_140,
		v_u_127,
		v_u_159,
		v_u_102,
		v_u_138
	})
	local v258 = v_u_3.useCallback(function(_, _)
		-- upvalues: (copy) v_u_111, (copy) v_u_101
		v_u_111(false)
		if v_u_101.onDragEnded then
			v_u_101.onDragEnded()
		end
	end, { v_u_101.onDragEnded })
	local v261 = v_u_3.useCallback(function(p259)
		-- upvalues: (copy) v_u_109, (ref) v_u_32, (ref) v_u_28, (copy) v_u_103, (copy) v_u_120, (ref) v_u_117, (ref) v_u_17, (copy) v_u_102
		v_u_109(p259)
		if v_u_32.FoundationSliderCapture then
			local v260 = p259 == v_u_28.Selected and true or p259 == v_u_28.SelectedPressed
			if v_u_103 and (v260 and not v_u_120.current) then
				v_u_117(v_u_17(v_u_102) < 0)
			end
			v_u_120.current = v260
		end
	end, { v_u_103, v_u_102 })
	local v262 = v_u_37()
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_131, (copy) v_u_141
		local v263 = v_u_131.current
		if v263 then
			v263.ReferenceUIInstance = v_u_141.current
		end
	end, {})
	local v264
	if v_u_102 then
		v264 = UDim2.fromScale(0.5, 0)
	else
		v264 = UDim2.fromScale(1, 0.5)
	end
	local v265
	if v_u_101.isContained then
		v265 = v_u_127:map(function(p266)
			-- upvalues: (copy) v_u_101, (copy) v_u_102
			local v267 = (p266 - v_u_101.range.Min) / (v_u_101.range.Max - v_u_101.range.Min)
			if v_u_102 then
				return Vector2.new(0.5, 1 - v267)
			else
				return Vector2.new(v267, 0.5)
			end
		end)
	else
		v265 = Vector2.new(0.5, 0.5)
	end
	local v268 = UDim.new(0, v_u_36(v107, v_u_101.size).X.Offset)
	local v269
	if v_u_102 then
		v269 = UDim2.new(v268, v_u_101.width)
	else
		v269 = UDim2.new(v_u_101.width, v268)
	end
	local v_u_275 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_145, (ref) v_u_35, (copy) v_u_112
		local v270 = v_u_145.knob.stroke
		if v270 == nil then
			return nil
		end
		local v271 = {
			["Color"] = v270.Color,
			["Thickness"] = v270.Thickness
		}
		local v272 = v_u_35
		local v273 = v270.Transparency
		local v274
		if typeof(v273) == "number" then
			v274 = v270.Transparency
		else
			v274 = nil
		end
		v271.Transparency = v272(v274, v_u_112 and 0 or 1)
		return v271
	end, { v_u_145, v_u_112 })
	local v276, v_u_277 = v_u_3.useBinding(Vector2.zero)
	local v279 = v_u_3.useCallback(function(p278)
		-- upvalues: (copy) v_u_277
		v_u_277(p278.AbsoluteSize)
	end, {})
	local v282 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_101, (copy) v_u_112, (copy) v_u_110, (copy) v_u_122, (copy) v_u_145, (copy) v_u_146, (copy) v_u_275
		local v280 = {
			["size"] = v_u_101.size
		}
		local v281
		if v_u_112 and (v_u_110 and not v_u_122) then
			v281 = v_u_145.knob.dragStyle
		else
			v281 = v_u_146
		end
		v280.style = v281
		v280.stroke = v_u_275
		v280.hasShadow = v_u_145.knob.hasShadow
		return v280
	end, {
		v_u_101.size,
		v_u_112,
		v_u_110,
		v_u_122,
		v_u_145.knob.dragStyle,
		v_u_146,
		v_u_275,
		v_u_145.knob.hasShadow
	})
	local v285 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_101, (copy) v_u_112, (copy) v_u_110, (copy) v_u_122, (copy) v_u_145, (copy) v_u_146, (copy) v_u_275
		local v283 = {
			["size"] = v_u_101.size
		}
		local v284
		if v_u_112 and (v_u_110 and v_u_122) then
			v284 = v_u_145.knob.dragStyle
		else
			v284 = v_u_146
		end
		v283.style = v284
		v283.stroke = v_u_275
		v283.hasShadow = v_u_145.knob.hasShadow
		return v283
	end, {
		v_u_101.size,
		v_u_112,
		v_u_110,
		v_u_122,
		v_u_145.knob.dragStyle,
		v_u_146,
		v_u_275,
		v_u_145.knob.hasShadow
	})
	local v287 = v_u_130:map(function(p286)
		-- upvalues: (copy) v_u_170
		return v_u_170(p286.Min)
	end)
	local v289 = v_u_130:map(function(p288)
		-- upvalues: (copy) v_u_170
		return v_u_170(p288.Max)
	end)
	local v290
	if v_u_147 then
		v290 = not v_u_32.FoundationSliderCapture or v_u_114
	else
		v290 = v_u_147
	end
	local v291
	if v_u_32.FoundationSliderCapture and v_u_103 then
		if v_u_116 then
			v291 = v289
		else
			v291 = v287
		end
	else
		v291 = nil
	end
	local v292
	if v_u_32.FoundationSliderCapture and v_u_103 then
		if v_u_101.isContained then
			v292 = v291:map(function(p293)
				-- upvalues: (copy) v_u_102
				if v_u_102 then
					return Vector2.new(0.5, 1 - p293)
				else
					return Vector2.new(p293, 0.5)
				end
			end)
		else
			v292 = Vector2.new(0.5, 0.5)
		end
	else
		v292 = nil
	end
	local v294
	if v_u_32.FoundationSliderCapture and v_u_103 then
		if v_u_101.knob then
			v294 = v276:map(function(p295)
				return UDim2.fromOffset(p295.X, p295.Y)
			end)
		else
			v294 = v_u_36(v107, v_u_101.size)
		end
	else
		v294 = nil
	end
	local v296
	if v_u_32.FoundationSliderCapture then
		v296 = v_u_3.useCallback(function(_) end, {})
	else
		v296 = nil
	end
	local v297 = v_u_32.FoundationSliderCapture
	if v297 then
		if v_u_140 ~= v_u_7.Directional then
			v_u_147 = false
		end
	else
		v_u_147 = v297
	end
	local v298
	if v_u_147 then
		v298 = nil
	elseif v_u_103 then
		v298 = v_u_3.createElement("UIDragDetector", {
			["DragStyle"] = Enum.UIDragDetectorDragStyle.Scriptable,
			[v_u_3.Event.DragStart] = v215,
			[v_u_3.Event.DragContinue] = v217,
			[v_u_3.Event.DragEnd] = v218,
			["SelectionModeDragSpeed"] = UDim2.new(),
			["Enabled"] = not v_u_101.isDisabled
		})
	else
		local v299 = v_u_3.createElement
		local v300 = "UIDragDetector"
		local v301 = {
			["ref"] = v_u_131,
			["ReferenceUIInstance"] = v142,
			["DragStyle"] = Enum.UIDragDetectorDragStyle.TranslateLine
		}
		local v302
		if v_u_102 then
			v302 = Vector2.new(0, 1)
		else
			v302 = Vector2.new(1, 0)
		end
		v301.DragAxis = v302
		v301.ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale
		v301.DragRelativity = Enum.UIDragDetectorDragRelativity.Absolute
		v301.MinDragTranslation = v133
		v301.MaxDragTranslation = v135
		v301[v_u_3.Event.DragStart] = v257
		v301[v_u_3.Event.DragContinue] = v252
		v301[v_u_3.Event.DragEnd] = v258
		v301.SelectionModeDragSpeed = UDim2.new()
		v301.Enabled = not v_u_101.isDisabled
		v298 = v299(v300, v301)
	end
	local v303
	if v_u_103 then
		v303 = {}
		local v304 = v_u_3.createElement
		local v305 = v_u_8
		local v306 = {
			["tag"] = v_u_145.fill.tag,
			["AnchorPoint"] = Vector2.new(0, 0)
		}
		local v307
		if v_u_102 then
			v307 = v289:map(function(p308)
				return UDim2.fromScale(0, 1 - p308)
			end)
		else
			v307 = v287:map(function(p309)
				return UDim2.fromScale(p309, 0)
			end)
		end
		v306.Position = v307
		v306.Size = v_u_130:map(function(p310)
			-- upvalues: (copy) v_u_170, (copy) v_u_102
			local v311 = v_u_170(p310.Max) - v_u_170(p310.Min)
			if v_u_102 then
				return UDim2.fromScale(1, v311)
			else
				return UDim2.fromScale(v311, 1)
			end
		end)
		v306.testId = ("%*--fill"):format(v_u_101.testId)
		v303.Fill = v304(v305, v306)
		local v312 = v_u_3.createElement
		local v313 = v_u_26
		local v314 = {
			["trackRef"] = nil,
			["fraction"] = nil,
			["isVertical"] = nil,
			["isDisabled"] = nil,
			["isDragEnabled"] = nil,
			["knobAppearance"] = nil,
			["knob"] = nil,
			["isContained"] = nil,
			["onSeek"] = nil,
			["getBounds"] = nil,
			["onDragStarted"] = nil,
			["onDragEnded"] = nil,
			["Visible"] = nil,
			["onAbsoluteSizeChanged"] = nil,
			["LayoutOrder"] = 1,
			["testId"] = nil,
			["trackRef"] = v_u_141,
			["fraction"] = v287,
			["isVertical"] = v_u_102,
			["isDisabled"] = v_u_101.isDisabled,
			["isDragEnabled"] = not v_u_147,
			["knobAppearance"] = v282,
			["knob"] = v_u_101.knob,
			["isContained"] = v_u_101.isContained,
			["onSeek"] = v_u_190,
			["getBounds"] = v_u_179,
			["onDragStarted"] = v166,
			["onDragEnded"] = v_u_165,
			["Visible"] = v_u_112
		}
		local v315
		if v_u_32.FoundationSliderCapture then
			v315 = v279
		else
			v315 = nil
		end
		v314.onAbsoluteSizeChanged = v315
		v314.testId = ("%*--min"):format(v_u_101.testId)
		v303.MinKnob = v312(v313, v314)
		local v316 = v_u_3.createElement
		local v317 = v_u_26
		local v318 = {
			["trackRef"] = nil,
			["fraction"] = nil,
			["isVertical"] = nil,
			["isDisabled"] = nil,
			["isDragEnabled"] = nil,
			["knobAppearance"] = nil,
			["knob"] = nil,
			["isContained"] = nil,
			["onSeek"] = nil,
			["getBounds"] = nil,
			["onDragStarted"] = nil,
			["onDragEnded"] = nil,
			["Visible"] = nil,
			["onAbsoluteSizeChanged"] = nil,
			["LayoutOrder"] = 2,
			["testId"] = nil,
			["trackRef"] = v_u_141,
			["fraction"] = v289,
			["isVertical"] = v_u_102,
			["isDisabled"] = v_u_101.isDisabled,
			["isDragEnabled"] = not v_u_147,
			["knobAppearance"] = v285,
			["knob"] = v_u_101.knob,
			["isContained"] = v_u_101.isContained,
			["onSeek"] = v_u_198,
			["getBounds"] = v_u_183,
			["onDragStarted"] = v167,
			["onDragEnded"] = v_u_165,
			["Visible"] = v_u_112
		}
		if not v_u_32.FoundationSliderCapture then
			v279 = nil
		end
		v318.onAbsoluteSizeChanged = v279
		v318.testId = ("%*--max"):format(v_u_101.testId)
		v303.MaxKnob = v316(v317, v318)
		local v319
		if v_u_32.FoundationSliderCapture and v290 then
			v319 = v_u_3.createElement(v_u_8, {
				["Size"] = nil,
				["AnchorPoint"] = nil,
				["Position"] = nil,
				["ZIndex"] = 3,
				["selection"] = nil,
				["selectionGroup"] = nil,
				["cursor"] = nil,
				["onStateChanged"] = nil,
				["ref"] = nil,
				["testId"] = nil,
				["Size"] = v294,
				["AnchorPoint"] = v292,
				["Position"] = v291:map(function(p320)
					-- upvalues: (copy) v_u_102
					if v_u_102 then
						return UDim2.fromScale(0.5, 1 - p320)
					else
						return UDim2.fromScale(p320, 0.5)
					end
				end),
				["selection"] = {
					["Selectable"] = true
				},
				["selectionGroup"] = v_u_44,
				["cursor"] = v_u_29.Invisible,
				["onStateChanged"] = v296,
				["ref"] = v_u_119,
				["testId"] = ("%*--selection-cursor"):format(v_u_101.testId)
			}, {
				["Cursor"] = v_u_3.createElement(v_u_31, {
					["isVisible"] = true,
					["cornerRadius"] = nil,
					["offset"] = nil,
					["borderWidth"] = nil,
					["colorNamespace"] = nil,
					["cornerRadius"] = UDim.new(0.5, 0),
					["offset"] = v107.Padding.XSmall,
					["borderWidth"] = v107.Stroke.Thicker,
					["colorNamespace"] = v262.colorNamespace
				})
			})
		else
			v319 = nil
		end
		v303.SelectionCursor = v319
	else
		v303 = {}
		local v321 = v_u_3.createElement
		local v322 = v_u_8
		local v323 = {
			["tag"] = v_u_145.fill.tag
		}
		local v324
		if v_u_102 then
			v324 = Vector2.new(0, 1)
		else
			v324 = nil
		end
		v323.AnchorPoint = v324
		local v325
		if v_u_102 then
			v325 = UDim2.fromScale(0, 1)
		else
			v325 = nil
		end
		v323.Position = v325
		v323.Size = v_u_127:map(function(p326)
			-- upvalues: (copy) v_u_101, (copy) v_u_102
			local v327 = (p326 - v_u_101.range.Min) / (v_u_101.range.Max - v_u_101.range.Min)
			if v_u_102 then
				return UDim2.fromScale(1, v327)
			else
				return UDim2.fromScale(v327, 1)
			end
		end)
		v323.testId = ("%*--fill"):format(v_u_101.testId)
		local v328 = {}
		local v329
		if v290 then
			local v330 = v_u_3.createElement
			local v331 = v_u_8
			local v332 = {}
			local v333
			if v_u_101.knob then
				v333 = v276:map(function(p334)
					return UDim2.fromOffset(p334.X, p334.Y)
				end)
			else
				v333 = v_u_36(v107, v_u_101.size)
			end
			v332.Size = v333
			v332.AnchorPoint = v265
			v332.Position = v264
			v332.selection = v_u_32.FoundationSliderCapture and {
				["Selectable"] = true
			} or nil
			local v335
			if v_u_32.FoundationSliderCapture then
				v335 = v_u_44
			else
				v335 = nil
			end
			v332.selectionGroup = v335
			local v336
			if v_u_32.FoundationSliderCapture then
				v336 = v_u_29.Invisible
			else
				v336 = nil
			end
			v332.cursor = v336
			v332.onStateChanged = v296
			v332.ref = v_u_119
			v332.testId = ("%*--selection-cursor"):format(v_u_101.testId)
			v329 = v330(v331, v332, {
				["Cursor"] = v_u_3.createElement(v_u_31, {
					["isVisible"] = true,
					["cornerRadius"] = nil,
					["offset"] = nil,
					["borderWidth"] = nil,
					["colorNamespace"] = nil,
					["cornerRadius"] = UDim.new(0.5, 0),
					["offset"] = v107.Padding.XSmall,
					["borderWidth"] = v107.Stroke.Thicker,
					["colorNamespace"] = v262.colorNamespace
				})
			})
		else
			v329 = nil
		end
		v328.SelectionCursor = v329
		local v337
		if v_u_101.knob then
			v337 = v_u_3.createElement(v_u_8, {
				["tag"] = "size-0-0 auto-xy",
				["AnchorPoint"] = nil,
				["Position"] = nil,
				["Visible"] = nil,
				["onAbsoluteSizeChanged"] = nil,
				["testId"] = nil,
				["AnchorPoint"] = v265,
				["Position"] = v264,
				["Visible"] = v_u_112,
				["onAbsoluteSizeChanged"] = v279,
				["testId"] = ("%*--custom-knob"):format(v_u_101.testId)
			}, v_u_101.knob)
		else
			v337 = v_u_3.createElement(v_u_34.Provider, {
				["value"] = v_u_41
			}, {
				["Knob"] = v_u_3.createElement(v_u_33, {
					["AnchorPoint"] = v265,
					["Position"] = v264,
					["size"] = v_u_101.size,
					["style"] = v_u_146,
					["stroke"] = v_u_275,
					["hasShadow"] = v_u_145.knob.hasShadow,
					["testId"] = ("%*--knob"):format(v_u_101.testId)
				})
			})
		end
		v328.Knob = v337
		v303.Fill = v321(v322, v323, v328)
	end
	local v338
	if v_u_102 then
		v338 = UDim2.new(0, v_u_145.bar.height, 1, 0)
	else
		v338 = UDim2.new(1, 0, 0, v_u_145.bar.height)
	end
	local v339 = v_u_3.createElement(v_u_8, {
		["tag"] = v_u_145.bar.tag,
		["Size"] = v338,
		["testId"] = ("%*--bar"):format(v_u_101.testId)
	}, v303)
	local v340 = {
		["DragDetector"] = v298,
		["Bar"] = v339
	}
	if not v_u_32.FoundationSliderCapture then
		local v341 = v_u_3.createElement
		local v342 = v_u_8
		local v343 = v_u_11
		local v344 = {
			["Size"] = v269
		}
		local v345
		if v_u_101.isDisabled then
			v345 = v_u_5.DISABLED_TRANSPARENCY
		else
			v345 = nil
		end
		v344.GroupTransparency = v345
		v344.stateLayer = {
			["affordance"] = v_u_30.None
		}
		local v346
		if v_u_103 then
			v346 = nil
		else
			v346 = v_u_145.selectionGroup
		end
		v344.selectionGroup = v346
		v344.cursor = v_u_29.Invisible
		v344.onStateChanged = v261
		v344.isDisabled = v_u_101.isDisabled
		if v_u_103 then
			v144 = v_u_141
		end
		v344.ref = v144
		return v341(v342, v343(v_u_101, v344), v340)
	end
	local v347 = v_u_3.createElement
	local v348 = v_u_8
	local v349 = v_u_11
	local v350 = {
		["Size"] = v269
	}
	local v351
	if v_u_101.isDisabled then
		v351 = v_u_5.DISABLED_TRANSPARENCY
	else
		v351 = nil
	end
	v350.GroupTransparency = v351
	local v352
	if v_u_114 then
		v352 = v_u_42
	else
		v352 = v_u_43
	end
	v350.selectionGroup = v352
	if v_u_103 then
		v144 = v_u_141
	end
	v350.ref = v144
	local v353 = v349(v_u_101, v350)
	local v354 = {}
	local v355 = v_u_3.createElement
	local v356 = v_u_8
	local v357 = {
		["Size"] = nil,
		["stateLayer"] = nil,
		["cursor"] = nil,
		["onStateChanged"] = nil,
		["isDisabled"] = nil,
		["ref"] = nil,
		["ZIndex"] = 0,
		["testId"] = nil,
		["Size"] = UDim2.fromScale(1, 1),
		["stateLayer"] = {
			["affordance"] = v_u_30.None
		}
	}
	local v358
	if v_u_114 then
		v358 = v_u_29.Invisible
	else
		v358 = nil
	end
	v357.cursor = v358
	v357.onStateChanged = v261
	v357.isDisabled = v_u_101.isDisabled
	v357.ref = v_u_118
	v357.testId = ("%*--focus-target"):format(v_u_101.testId)
	v354.FocusTarget = v355(v356, v357, {
		["DragDetector"] = v298
	})
	v354.Bar = v339
	return v347(v348, v353, v354)
end)