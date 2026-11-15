-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalTextInput.InternalTextInput
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactUtils)
local v5 = v1.Components
local v_u_6 = require(v5.Icon)
local v_u_7 = require(v5.Padding)
local v_u_8 = require(v5.ScrollView)
require(v5.Types)
local v_u_9 = require(v5.View)
local v_u_10 = require(v1.Constants)
local v_u_11 = require(v1.Utility.Flags)
local v_u_12 = require(v1.Utility.blendTransparencies)
local v_u_13 = require(v1.Utility.getBindableValue)
local v_u_14 = require(v1.Utility.getDisabledStyle)
local v_u_15 = require(v1.Utility.getMultiLineTextHeight)
local v_u_16 = require(v1.Utility.isPluginSecurity)
local v_u_17 = require(v1.Utility.mapBindable)
local v_u_18 = require(v1.Utility.normalizeFontFace)
local v_u_19 = require(script.Parent.truncateTextToCursor)
local v_u_20 = require(v1.Utility.useBindable)
local v_u_21 = require(v1.Utility.usePreferredInput)
local v_u_22 = require(v1.Providers.Style.useStyleTags)
local v_u_23 = require(v5.TextInput.useTextInputVariants)
local v_u_24 = require(v1.Providers.Style.useTokens)
local v_u_25 = require(v1.Utility.withCommonProps)
local v_u_26 = require(v1.Utility.withDefaults)
local v_u_27 = require(v1.Enums.InputFocusBehavior)
local v28 = require(v1.Enums.InputSize)
local v29 = require(v1.Enums.InputVariant)
local v_u_30 = require(v1.Enums.Radius)
require(v1.Enums.ControlState)
local v_u_31 = require(v1.Enums.StateLayerAffordance)
local v_u_32 = {
	["size"] = nil,
	["variant"] = nil,
	["numLines"] = 1,
	["testId"] = "--foundation-internal-text-input",
	["Selectable"] = true,
	["size"] = v28.Large,
	["variant"] = v29.Standard
}
local v_u_51 = v_u_3.memo(v_u_3.forwardRef(function(p33, p34)
	-- upvalues: (copy) v_u_3, (copy) v_u_11, (copy) v_u_18, (copy) v_u_16, (copy) v_u_7
	local v35 = p33.isBoundsChecker
	local v36 = p33.isMultiLine or v35
	local v37 = v_u_3.createElement
	local v38 = "TextBox"
	local v39 = {
		["ClearTextOnFocus"] = false,
		["Selectable"] = false
	}
	local v40
	if v35 then
		v40 = false
	else
		v40 = nil
	end
	v39.Active = v40
	local v41
	if v35 then
		v41 = false
	else
		v41 = nil
	end
	v39.Visible = v41
	local v42
	if v_u_11.FoundationFontFaceMigration then
		v42 = nil
	else
		v42 = p33.fontStyle.Font
	end
	v39.Font = v42
	local v43
	if v_u_11.FoundationFontFaceMigration then
		v43 = v_u_18(p33.fontStyle.Font)
	else
		v43 = nil
	end
	v39.FontFace = v43
	v39.TextSize = p33.fontStyle.FontSize
	v39.LineHeight = p33.fontStyle.LineHeight
	local v44
	if p33.textStyle then
		v44 = p33.textStyle.Color3
	else
		v44 = nil
	end
	v39.TextColor3 = v44
	local v45
	if p33.textStyle then
		v45 = p33.textStyle.Transparency
	else
		v45 = nil
	end
	v39.TextTransparency = v45
	v39.MultiLine = v36
	v39.TextWrapped = v36
	local v46
	if v36 then
		v46 = Enum.TextYAlignment.Top
	else
		v46 = Enum.TextYAlignment.Center
	end
	v39.TextYAlignment = v46
	local v47
	if v35 then
		v47 = false
	else
		v47 = not p33.isDisabled
	end
	v39.TextEditable = v47
	v39.Interactable = p33.Interactable
	v39.PlaceholderText = p33.placeholder
	local v48
	if v_u_16() then
		v48 = p33.textInputType
	else
		v48 = nil
	end
	v39.TextInputType = v48
	local v49
	if p33.Size == nil then
		v49 = UDim2.fromScale(1, 1)
	else
		v49 = p33.Size
	end
	v39.Size = v49
	v39.AutomaticSize = p33.automaticSize
	local v50
	if v35 then
		v50 = nil
	else
		v50 = p33.text
	end
	v39.Text = v50
	v39.ref = p34
	v39[v_u_3.Tag] = p33.tag
	v39[v_u_3.Change.Text] = p33.onTextChanged
	v39[v_u_3.Change.CursorPosition] = p33.onCursorPositionChanged
	v39[v_u_3.Event.Focused] = p33.onFocusGained
	v39[v_u_3.Event.FocusLost] = p33.onFocusLost
	v39[v_u_3.Event.InputChanged] = p33.onInputChanged
	v39[v_u_3.Event.InputEnded] = p33.onInputEnded
	return v37(v38, v39, p33.padding and {
		["Padding"] = v_u_3.createElement(v_u_7, {
			["value"] = p33.padding
		})
	} or nil, p33.children)
end))
return v_u_3.memo(v_u_3.forwardRef(function(p52, p53) -- name: InternalTextInput
	-- upvalues: (copy) v_u_26, (copy) v_u_32, (copy) v_u_24, (copy) v_u_3, (copy) v_u_13, (copy) v_u_23, (copy) v_u_22, (copy) v_u_21, (copy) v_u_14, (copy) v_u_27, (copy) v_u_15, (copy) v_u_19, (copy) v_u_20, (copy) v_u_4, (copy) v_u_9, (copy) v_u_25, (copy) v_u_12, (copy) v_u_10, (copy) v_u_30, (copy) v_u_11, (copy) v_u_31, (copy) v_u_8, (copy) v_u_51, (copy) v_u_17, (copy) v_u_6
	if p52.Selectable == nil then
		p52.Selectable = true
	end
	local v_u_54 = v_u_26(p52, v_u_32)
	local v_u_55 = v_u_24()
	local v56 = v_u_54.numLines
	local v_u_57 = math.max(1, v56)
	local v_u_58 = v_u_57 > 1
	local v_u_59 = v_u_3.useRef(nil)
	local v_u_60 = v_u_3.useRef(nil)
	local v_u_61 = v_u_3.useRef(nil)
	local v_u_62 = v_u_3.useRef(nil)
	local v_u_63 = v_u_3.useRef("")
	local v_u_64 = v_u_3.useRef(v_u_13(v_u_54.text))
	local v_u_65 = v_u_3.useRef(nil)
	local v_u_66 = v_u_3.useRef(Vector2.zero)
	local v_u_67, v_u_68 = v_u_3.useState(false)
	local v69, v_u_70 = v_u_3.useBinding(false)
	local v_u_72 = v_u_3.useCallback(function(p71)
		-- upvalues: (copy) v_u_70, (copy) v_u_68
		v_u_70(p71)
		v_u_68(p71)
	end, {})
	local v73 = v_u_23(v_u_55, v_u_54.size, v_u_54.variant, v_u_54.radius, v_u_67, v_u_54.hasError)
	local v_u_74 = v73.container
	local v75 = v_u_22(v73.textBox.tag)
	local v76 = v_u_21()
	local v_u_77, v_u_78 = v_u_3.useState(false)
	local v_u_79 = v76 == Enum.PreferredInput.Touch
	local v_u_80 = v_u_55.Stroke.Standard
	local v_u_81 = math.ceil(v_u_80) * 2
	local v82 = v_u_55.Stroke.Thick
	local v83 = math.ceil(v82) * 2
	local v84 = v_u_14(v_u_55.Color.Content.Emphasis, v_u_54.isDisabled)
	local v85 = v73.textBox.fontStyle
	local v_u_86 = v85.FontSize
	local v_u_87 = v85.LineHeight
	local v_u_89 = v_u_3.useCallback(function(p88)
		-- upvalues: (copy) v_u_59, (copy) v_u_60
		if v_u_59.current then
			v_u_59.current.SelectionStart = p88
		end
		if v_u_60.current then
			v_u_60.current.SelectionStart = p88
		end
	end, {})
	local v_u_91 = v_u_3.useCallback(function(p90)
		-- upvalues: (copy) v_u_59, (copy) v_u_60
		if v_u_59.current then
			v_u_59.current.CursorPosition = p90
		end
		if v_u_60.current then
			v_u_60.current.CursorPosition = p90
		end
	end, {})
	local v_u_94 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_59, (copy) v_u_60, (copy) v_u_89, (copy) v_u_91
		local v92 = v_u_59.current or v_u_60.current
		if v92 ~= nil and v92.Parent ~= nil then
			local v93 = utf8.len(v92.Text)
			if v93 then
				v_u_89(0)
				v_u_91(v93 + 1)
			end
		end
	end, { v_u_89, v_u_91 })
	local v_u_95 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_59, (copy) v_u_54, (ref) v_u_27, (copy) v_u_94
		if v_u_59.current ~= nil then
			v_u_59.current:CaptureFocus()
			if v_u_54.focusBehavior == v_u_27.Highlight then
				task.spawn(v_u_94)
			end
		end
	end, { v_u_94, v_u_54.focusBehavior })
	local v_u_96 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_59
		if v_u_59.current then
			v_u_59.current:ReleaseFocus()
		end
	end, {})
	local v_u_97 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_59
		if v_u_59.current then
			return v_u_59.current:IsFocused()
		else
			return nil
		end
	end, {})
	local v_u_98 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_59
		if v_u_59.current then
			return v_u_59.current.SelectionStart
		else
			return nil
		end
	end, {})
	local v_u_99 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_59
		if v_u_59.current then
			return v_u_59.current.CursorPosition
		else
			return nil
		end
	end, {})
	local v100 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_59
		if v_u_59.current then
			v_u_59.current.Text = ""
		end
	end, {})
	v_u_3.useImperativeHandle(p53, function()
		-- upvalues: (copy) v_u_97, (copy) v_u_95, (copy) v_u_96, (copy) v_u_98, (copy) v_u_99, (copy) v_u_91, (copy) v_u_89
		return {
			["getIsFocused"] = v_u_97,
			["focus"] = v_u_95,
			["releaseFocus"] = v_u_96,
			["getSelectionStart"] = v_u_98,
			["getCursorPosition"] = v_u_99,
			["setCursorPosition"] = v_u_91,
			["setSelectionStart"] = v_u_89
		}
	end, {
		v_u_99,
		v_u_97,
		v_u_98,
		v_u_95,
		v_u_96,
		v_u_91,
		v_u_89
	})
	local v103 = v_u_3.useCallback(function(p101)
		-- upvalues: (copy) v_u_63, (copy) v_u_64, (copy) v_u_58, (copy) v_u_61, (copy) v_u_54
		if p101 == nil or (p101.Parent == nil or v_u_63.current ~= "") then
			return
		else
			local v102 = p101.Text
			if v102 ~= v_u_64.current then
				v_u_64.current = v102
				if v_u_58 and v_u_61.current then
					v_u_61.current.Text = v102
				end
				v_u_54.onChanged(v102)
			end
		end
	end, { v_u_54.onChanged, v_u_58, v_u_77 })
	local v_u_104 = v_u_3.useRef(false)
	local v106 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_54, (copy) v_u_58, (copy) v_u_79, (copy) v_u_59, (copy) v_u_63, (copy) v_u_78, (copy) v_u_72, (ref) v_u_27, (copy) v_u_60, (copy) v_u_104
		if not v_u_54.isDisabled then
			if v_u_58 and v_u_79 then
				if v_u_59.current and v_u_59.current.Parent then
					v_u_63.current = v_u_59.current.Text
				end
				v_u_78(true)
			end
			v_u_72(true)
			if v_u_54.onFocus then
				v_u_54.onFocus()
			end
			local v105 = v_u_54.focusBehavior
			if v105 == v_u_27.Clear then
				v_u_63.current = ""
				if v_u_59.current then
					v_u_59.current.Text = ""
				end
				if v_u_60.current then
					v_u_60.current.Text = ""
					return
				end
			elseif v105 == v_u_27.Highlight then
				v_u_104.current = true
			end
		end
	end, {
		v_u_54.onFocus,
		v_u_54.isDisabled,
		v_u_79,
		v_u_58,
		v_u_54.focusBehavior
	})
	local v108 = v_u_3.useCallback(function(_, p107)
		-- upvalues: (copy) v_u_104
		if p107.UserInputType == Enum.UserInputType.MouseMovement then
			v_u_104.current = false
		end
	end, {})
	local v110 = v_u_3.useCallback(function(_, p109)
		-- upvalues: (copy) v_u_104, (copy) v_u_94
		if v_u_104.current then
			v_u_104.current = false
			if p109.UserInputType == Enum.UserInputType.MouseButton1 then
				v_u_94()
			end
		else
			return
		end
	end, { v_u_89, v_u_91, v_u_94 })
	local v113 = v_u_3.useCallback(function(_, p111, p112)
		-- upvalues: (copy) v_u_72, (copy) v_u_104, (copy) v_u_58, (copy) v_u_78, (copy) v_u_54
		v_u_72(false)
		v_u_104.current = false
		if v_u_58 then
			v_u_78(false)
		end
		if v_u_54.onFocusLost then
			v_u_54.onFocusLost(p112)
		end
		if p111 and v_u_54.onReturnPressed then
			v_u_54.onReturnPressed()
		end
	end, { v_u_54.onReturnPressed, v_u_58, v_u_54.onFocusLost })
	local v_u_116 = v_u_3.useCallback(function(p114, p115)
		-- upvalues: (copy) v_u_65, (copy) v_u_54
		v_u_65.current = p115
		if v_u_54.onDragStarted then
			v_u_54.onDragStarted(p114, p115)
		end
	end, { v_u_54.onDragStarted })
	local v_u_119 = v_u_3.useCallback(function(p117, p118)
		-- upvalues: (copy) v_u_54
		if v_u_54.onDrag then
			v_u_54.onDrag(p117, p118)
		end
	end, { v_u_54.onDrag })
	local v_u_122 = v_u_3.useCallback(function(p120, p121)
		-- upvalues: (copy) v_u_65, (copy) v_u_95, (copy) v_u_96, (copy) v_u_72, (copy) v_u_54
		if v_u_65.current == p121 then
			v_u_95()
		else
			v_u_96()
			v_u_72(false)
		end
		v_u_65.current = nil
		if v_u_54.onDragEnded then
			v_u_54.onDragEnded(p120, p121)
		end
	end, { v_u_54.onDragEnded })
	local v123 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_74, (copy) v_u_55
		return {
			["radius"] = UDim.new(0, v_u_74.radius),
			["offset"] = v_u_55.Stroke.Thick,
			["borderWidth"] = v_u_55.Stroke.Thick
		}
	end, { v_u_55, v_u_74.radius })
	local v_u_124 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_15, (copy) v_u_86, (copy) v_u_57, (copy) v_u_87
		return v_u_15(v_u_86, v_u_57, v_u_87)
	end, { v_u_86, v_u_57, v_u_87 })
	local v_u_134, v135 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_74, (copy) v_u_81, (ref) v_u_15, (copy) v_u_86, (copy) v_u_87, (copy) v_u_124
		local v125 = (v_u_74.minHeight - v_u_81 - v_u_15(v_u_86, 1, v_u_87)) * 2
		local v126 = math.round(v125) / 2
		local v127 = UDim.new
		local v128 = v126 / 2
		local v129 = v127(0, (math.floor(v128)))
		local v130 = UDim.new
		local v131 = v126 / 2
		local v132 = v130(0, (math.ceil(v131)))
		local v133 = v_u_124 + math.round(v126) + v_u_81
		return {
			["top"] = v129,
			["bottom"] = v132,
			["left"] = UDim.new(0, 0),
			["right"] = UDim.new(0, 0)
		}, v133
	end, {
		v_u_74.minHeight,
		v_u_81,
		v83,
		v_u_86,
		v_u_124,
		v_u_87
	})
	local v139 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_54
		local v136 = {}
		local v137
		if v_u_54.horizontalPadding then
			v137 = v_u_54.horizontalPadding.innerLeft
		else
			v137 = nil
		end
		v136.left = v137
		local v138
		if v_u_54.horizontalPadding then
			v138 = v_u_54.horizontalPadding.innerRight
		else
			v138 = nil
		end
		v136.right = v138
		return v136
	end, { v_u_54.horizontalPadding })
	local v140 = v_u_134.bottom.Offset + v_u_134.top.Offset
	local v141 = UDim2.new(1, 0, 0, v_u_124 + v140)
	local v142 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_58
		return v_u_58 and {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["ItemLineAlignment"] = Enum.ItemLineAlignment.Center
		} or nil
	end, { v_u_58 })
	local v143 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_58
		return v_u_58 and {
			["AutomaticCanvasSize"] = Enum.AutomaticSize.Y,
			["CanvasSize"] = UDim2.fromOffset(0, 0),
			["ScrollingDirection"] = Enum.ScrollingDirection.Y,
			["VerticalScrollBarInset"] = Enum.ScrollBarInset.Always
		} or nil
	end, { v_u_58 })
	local v152 = v_u_3.useCallback(function(p144)
		-- upvalues: (copy) v_u_62, (copy) v_u_61, (ref) v_u_19, (copy) v_u_134
		local v145 = v_u_62.current
		local v146 = v_u_61.current
		if v145 ~= nil and v146 ~= nil then
			local v147 = p144.TextSize * p144.LineHeight
			local v148 = v145.CanvasPosition.Y
			v146.Text = v_u_19(p144)
			local v149 = v146.TextBounds.Y
			local v150 = v148 - v_u_134.top.Offset + v_u_134.bottom.Offset
			local v151 = v148 + v145.AbsoluteSize.Y - v_u_134.top.Offset - v_u_134.bottom.Offset
			if v149 - v147 < v150 then
				v145.CanvasPosition = v145.CanvasPosition + Vector2.new(0, v149 - v147 - v150)
			end
			if v151 < v149 then
				v145.CanvasPosition = v145.CanvasPosition + Vector2.new(0, v149 - v151)
			end
		end
	end, { v_u_134 })
	local v154 = v_u_3.useCallback(function(p153)
		-- upvalues: (copy) v_u_62, (copy) v_u_66
		if p153 ~= nil then
			v_u_62.current = p153
			p153.ClipsDescendants = true
			p153.CanvasPosition = v_u_66.current
		end
	end, {})
	local v156 = v_u_3.useCallback(function(p_u_155)
		-- upvalues: (copy) v_u_63
		if p_u_155 then
			p_u_155.Text = v_u_63.current
			v_u_63.current = ""
			task.delay(0, function()
				-- upvalues: (copy) p_u_155
				if p_u_155.Parent ~= nil then
					p_u_155:CaptureFocus()
				end
			end)
		end
	end, {})
	local v158 = v_u_3.useCallback(function(p157)
		-- upvalues: (copy) v_u_66
		v_u_66.current = p157.CanvasPosition
	end, {})
	local v163 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_54, (ref) v_u_3, (copy) v_u_116, (copy) v_u_119, (copy) v_u_122, (copy) v_u_67
		if not (v_u_54.onDragStarted or (v_u_54.onDrag or v_u_54.onDragEnded)) then
			return nil
		end
		local v159 = v_u_3.createElement
		local v160 = "UIDragDetector"
		local v161 = {
			["DragStyle"] = Enum.UIDragDetectorDragStyle.Scriptable,
			[v_u_3.Event.DragStart] = v_u_116,
			[v_u_3.Event.DragContinue] = v_u_119,
			[v_u_3.Event.DragEnd] = v_u_122
		}
		local v162 = not v_u_67
		if v162 then
			v162 = not v_u_54.isDisabled
		end
		v161.Enabled = v162
		return v159(v160, v161)
	end, {
		v_u_116,
		v_u_119,
		v_u_122,
		v_u_67,
		v_u_54.isDisabled
	})
	local v164 = v_u_20
	local v165
	if v_u_54.horizontalPadding then
		v165 = v_u_54.horizontalPadding.left or UDim.new(0, 0)
	else
		v165 = UDim.new(0, 0)
	end
	local v166 = v164(v165)
	local v167 = v_u_20
	local v168
	if v_u_54.horizontalPadding then
		v168 = v_u_54.horizontalPadding.right or UDim.new(0, 0)
	else
		v168 = UDim.new(0, 0)
	end
	local v169 = v167(v168)
	local v170 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_54, (copy) v_u_74, (copy) v_u_55
		if v_u_54.hasClearButton then
			return UDim2.fromOffset(0, (v_u_74.minHeight - v_u_55.Stroke.Standard) / 2)
		else
			return nil
		end
	end, { v_u_54.hasClearButton, v_u_74.minHeight, v_u_55.Stroke.Standard })
	local v171 = v_u_4.useComposedRef(v_u_60, v156)
	local v172 = v_u_3.createElement
	local v173 = v_u_9
	local v174 = v_u_25
	local v175 = {
		["ref"] = v_u_54.inputRef,
		["Size"] = UDim2.new(1, 0, 0, v135)
	}
	local v176 = {}
	local v177 = v_u_54.Selectable
	if v177 then
		v177 = not v_u_54.isDisabled
	end
	v176.Selectable = v177
	v176.NextSelectionUp = v_u_54.NextSelectionUp
	v176.NextSelectionDown = v_u_54.NextSelectionDown
	v176.NextSelectionLeft = v_u_54.NextSelectionLeft
	v176.NextSelectionRight = v_u_54.NextSelectionRight
	v175.selection = v176
	v175.cursor = v123
	local v178
	if v_u_74.strokeStyle and v_u_74.strokeThickness then
		v178 = {
			["Color"] = v_u_74.strokeStyle.Color3
		}
		local v179
		if v_u_54.isDisabled then
			v179 = v_u_12(v_u_74.strokeStyle.Transparency, v_u_10.DISABLED_TRANSPARENCY)
		else
			v179 = v_u_74.strokeStyle.Transparency
		end
		v178.Transparency = v179
		v178.Thickness = v_u_74.strokeThickness
		local v180
		if v_u_67 then
			v180 = Enum.BorderStrokePosition.Center
		else
			v180 = Enum.BorderStrokePosition.Inner
		end
		v178.BorderStrokePosition = v180
	else
		v178 = nil
	end
	v175.stroke = v178
	local v181
	if v_u_54.radius == v_u_30.Circle then
		local v182 = UDim.new
		local v183 = v_u_74.minHeight / 2
		v181 = v182(0, (math.ceil(v183)))
	else
		v181 = nil
	end
	v175.cornerRadius = v181
	local v185 = {
		["left"] = v166:map(function(p184)
			-- upvalues: (copy) v_u_80
			return UDim.new(0, v_u_80) + p184
		end)
	}
	local v186
	if v_u_54.trailingElement == nil and v_u_54.hasClearButton then
		v186 = UDim.new(0, v_u_80)
	else
		v186 = v169:map(function(p187)
			-- upvalues: (copy) v_u_80
			return UDim.new(0, v_u_80) + p187
		end)
	end
	v185.right = v186
	v185.top = UDim.new(0, v_u_80)
	v185.bottom = UDim.new(0, v_u_80)
	v175.padding = v185
	if v_u_54.isDisabled then
		v_u_95 = nil
	end
	v175.onActivated = v_u_95
	v175.isDisabled = v_u_54.isDisabled
	local v188
	if v_u_11.FoundationFixColorOnScrubbableNumberInput and v_u_54.backgroundGradient then
		v188 = v_u_14({
			["Color3"] = nil,
			["Transparency"] = 0.001,
			["Color3"] = Color3.new(1, 1, 1)
		}, v_u_54.isDisabled)
	elseif v_u_74.bgStyle then
		v188 = v_u_14({
			["Color3"] = v_u_74.bgStyle.Color3,
			["Transparency"] = not v_u_11.FoundationFixColorOnScrubbableNumberInput and v_u_54.backgroundGradient and 0 or v_u_74.bgStyle.Transparency
		}, v_u_54.isDisabled)
	else
		v188 = nil
	end
	v175.backgroundStyle = v188
	v175.stateLayer = {
		["affordance"] = v_u_31.None
	}
	v175.tag = v_u_74.tag
	v175.testId = ("%*--outer-container"):format(v_u_54.testId)
	local v189 = v174(v_u_54, v175)
	local v190 = {
		["DragDetector"] = v163,
		["Background"] = v_u_54.backgroundGradient
	}
	local v191
	if v_u_54.leadingElement then
		local v192 = v_u_3.createElement
		local v193 = v_u_9
		local v194 = {
			["GroupTransparency"] = nil,
			["LayoutOrder"] = 1,
			["tag"] = "size-0-full auto-x",
			["testId"] = nil
		}
		local v195
		if v_u_54.isDisabled then
			v195 = v_u_10.DISABLED_TRANSPARENCY
		else
			v195 = nil
		end
		v194.GroupTransparency = v195
		v194.testId = ("%*--leading"):format(v_u_54.testId)
		v191 = v192(v193, v194, v_u_54.leadingElement)
	else
		v191 = nil
	end
	v190.Leading = v191
	local v196 = v_u_3.createElement
	local v197
	if v_u_58 then
		v197 = v_u_8
	else
		v197 = v_u_9
	end
	local v198 = {
		["LayoutOrder"] = 2,
		["selection"] = nil,
		["scroll"] = nil,
		["layout"] = nil,
		["onCanvasPositionChanged"] = nil,
		["scrollingFrameRef"] = nil,
		["padding"] = nil,
		["tag"] = "fill size-full clip",
		["testId"] = nil,
		["selection"] = {
			["Selectable"] = false
		},
		["scroll"] = v143,
		["layout"] = v142
	}
	if not v_u_58 then
		v158 = nil
	end
	v198.onCanvasPositionChanged = v158
	if not v_u_58 then
		v154 = nil
	end
	v198.scrollingFrameRef = v154
	v198.padding = v139
	v198.testId = ("%*--textbox-wrapper"):format(v_u_54.testId)
	local v199 = {}
	local v200
	if v_u_77 then
		v200 = nil
	else
		local v201 = v_u_3.createElement
		local v202 = v_u_51
		local v203 = {
			["text"] = v_u_54.text,
			["placeholder"] = v_u_54.placeholder,
			["textInputType"] = v_u_54.textInputType,
			["fontStyle"] = v85,
			["textStyle"] = v84,
			["isMultiLine"] = v_u_58,
			["isDisabled"] = v_u_54.isDisabled,
			["ref"] = v_u_59,
			["tag"] = ("%* data-testid=%*--textbox"):format(v75 or "", v_u_54.testId)
		}
		local v204
		if v163 == nil then
			v204 = nil
		else
			v204 = v69
		end
		v203.Interactable = v204
		local v205
		if v_u_58 then
			v205 = v141
		else
			v205 = nil
		end
		v203.Size = v205
		v203.automaticSize = v_u_17(v_u_54.text, function(p206)
			-- upvalues: (copy) v_u_58, (copy) v_u_77
			if v_u_58 and (not v_u_77 and p206 ~= "") then
				return Enum.AutomaticSize.Y
			else
				return nil
			end
		end)
		v203.padding = v_u_134
		v203.onFocusGained = v106
		local v207
		if v_u_58 and v_u_79 then
			v207 = nil
		else
			v207 = v113
		end
		v203.onFocusLost = v207
		v203.onTextChanged = v103
		local v208
		if v_u_58 then
			v208 = v152
		else
			v208 = nil
		end
		v203.onCursorPositionChanged = v208
		v203.onInputChanged = v108
		v203.onInputEnded = v110
		local v209 = {}
		local v210
		if v_u_58 then
			v210 = v_u_3.createElement(v_u_51, {
				["isBoundsChecker"] = true,
				["fontStyle"] = nil,
				["textStyle"] = nil,
				["Size"] = nil,
				["ref"] = nil,
				["fontStyle"] = v85,
				["textStyle"] = v84,
				["Size"] = UDim2.new(1, 0, 1, v140),
				["ref"] = v_u_61
			})
		else
			v210 = nil
		end
		v209.BoundsChecker = v210
		v200 = v201(v202, v203, v209)
	end
	v199.TextBox = v200
	local v211
	if v_u_58 and v_u_77 then
		local v212 = v_u_3.createElement
		local v213 = v_u_51
		local v214 = {
			["text"] = v_u_54.text,
			["placeholder"] = v_u_54.placeholder,
			["textInputType"] = v_u_54.textInputType,
			["fontStyle"] = v85,
			["textStyle"] = v84,
			["isMultiLine"] = v_u_58,
			["isDisabled"] = v_u_54.isDisabled,
			["padding"] = v_u_134,
			["ref"] = v171,
			["tag"] = ("%* data-testid=%*--mobile-textbox"):format(v75 or "", v_u_54.testId)
		}
		if v163 == nil then
			v69 = nil
		end
		v214.Interactable = v69
		v214.Size = v141
		if not (v_u_58 and v_u_79) then
			v113 = nil
		end
		v214.onFocusLost = v113
		v214.onTextChanged = v103
		if not v_u_58 then
			v152 = nil
		end
		v214.onCursorPositionChanged = v152
		v211 = v212(v213, v214)
	else
		v211 = nil
	end
	v199.MobileTextBox = v211
	v190.TextBoxWrapper = v196(v197, v198, v199)
	local v215
	if v_u_54.hasClearButton then
		local v216 = v_u_3.createElement
		local v217 = v_u_9
		local v218 = {
			["isDisabled"] = nil,
			["GroupTransparency"] = nil,
			["LayoutOrder"] = 3,
			["Visible"] = nil,
			["tag"] = nil,
			["isDisabled"] = v_u_54.isDisabled
		}
		local v219
		if v_u_54.isDisabled then
			v219 = v_u_10.DISABLED_TRANSPARENCY
		else
			v219 = nil
		end
		v218.GroupTransparency = v219
		v218.Visible = v_u_17(v_u_54.text, function(p220)
			return p220 ~= ""
		end)
		v218.tag = v73.clearButton.tag
		v215 = v216(v217, v218, {
			["ClearButton"] = v_u_3.createElement(v_u_9, {
				["onActivated"] = nil,
				["padding"] = nil,
				["Position"] = nil,
				["stateLayer"] = nil,
				["tag"] = "anchor-center-left auto-xy",
				["testId"] = nil,
				["onActivated"] = v100,
				["padding"] = UDim.new(0, v73.clearButton.padding),
				["Position"] = v170,
				["stateLayer"] = {
					["affordance"] = v_u_31.None
				},
				["testId"] = ("%*--clear-button"):format(v_u_54.testId)
			}, {
				["Icon"] = v_u_3.createElement(v_u_6, {
					["name"] = v73.clearButton.icon
				})
			})
		})
	else
		v215 = nil
	end
	v190.Clear = v215
	local v221
	if v_u_54.trailingElement then
		local v222 = v_u_3.createElement
		local v223 = v_u_9
		local v224 = {
			["GroupTransparency"] = nil,
			["LayoutOrder"] = 4,
			["tag"] = "size-0-full auto-x",
			["testId"] = nil
		}
		local v225
		if v_u_54.isDisabled then
			v225 = v_u_10.DISABLED_TRANSPARENCY
		else
			v225 = nil
		end
		v224.GroupTransparency = v225
		v224.testId = ("%*--trailing"):format(v_u_54.testId)
		v221 = v222(v223, v224, v_u_54.trailingElement)
	else
		v221 = nil
	end
	v190.Trailing = v221
	return v172(v173, v189, v190)
end))