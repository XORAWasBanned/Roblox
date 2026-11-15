-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.ColorPicker.ColorPicker
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.ColorPicker.BrickColorPicker)
local v_u_5 = require(v1.Enums.ColorInputMode)
local v_u_6 = require(v1.Components.ColorPicker.ColorInputs)
local v_u_7 = require(v1.Components.ColorPicker.ColorSlider)
local v_u_8 = require(v1.Enums.ColorSliderType)
local v_u_9 = require(v1.Components.ColorPicker.SVPicker)
local v_u_10 = require(v1.Components.View)
local v_u_11 = require(v1.Components.ColorPicker.colorUtils)
local v_u_12 = require(v1.Providers.Style.useTokens)
local v_u_13 = require(v1.Utility.withCommonProps)
local v_u_14 = require(v1.Utility.withDefaults)
require(v1.Components.Types)
local v_u_15 = {
	["initialAlpha"] = 1,
	["initialMode"] = nil,
	["testId"] = "--foundation-color-picker",
	["initialMode"] = v_u_5.RGB
}
return function(p16) -- name: ColorPicker
	-- upvalues: (copy) v_u_5, (copy) v_u_14, (copy) v_u_15, (copy) v_u_12, (copy) v_u_3, (copy) v_u_11, (copy) v_u_10, (copy) v_u_13, (copy) v_u_6, (copy) v_u_4, (copy) v_u_9, (copy) v_u_7, (copy) v_u_8
	local v_u_17 = p16.availableModes or {
		v_u_5.RGB,
		v_u_5.HSV,
		v_u_5.Hex,
		v_u_5.Brick
	}
	local v_u_18 = v_u_14(p16, v_u_15)
	local v19 = v_u_12().Color.Extended.Magenta.Magenta_700.Color3
	local v20 = v_u_18.initialColor or v19
	local v21, v_u_22 = v_u_3.useBinding(v20)
	local v23, v24, v25
	if type(v20) == "table" then
		v23 = v20.H / 360
		v24 = (v20.S or 100) / 100
		v25 = (v20.V or 100) / 100
	else
		v23, v24, v25 = v20:ToHSV()
	end
	local v_u_26, v_u_27 = v_u_3.useBinding(v23)
	local v_u_28, v_u_29 = v_u_3.useBinding(v24)
	local v_u_30, v_u_31 = v_u_3.useBinding(v25)
	local v32, v_u_33 = v_u_3.useBinding(v_u_18.initialAlpha or 1)
	local v34, v_u_35 = v_u_3.useState(v_u_18.initialMode or v_u_5.RGB)
	local v_u_36 = v21:map(v_u_11.toColor3)
	local v38 = v21:map(function(p37)
		-- upvalues: (ref) v_u_11
		return not v_u_11.isPartialHSV(p37)
	end)
	local v39 = v_u_3.useRef(false)
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_18, (copy) v_u_17, (copy) v_u_35
		local v40 = v_u_18.initialMode
		if v40 then
			local v41 = false
			for _, v42 in v_u_17 do
				if v42 ~= v40 then
					continue
				end
				v41 = true
			end
			if not v41 then
				warn((("ColorPicker: initialMode %* is not in availableModes. Using first available mode."):format(v40)))
				v_u_35(v_u_17[1])
			end
		end
	end, { v_u_18.initialMode })
	local v_u_45 = v_u_3.useCallback(function(p43, p44)
		-- upvalues: (copy) v_u_22, (copy) v_u_18
		v_u_22(p43)
		v_u_18.onColorChanged(p43, p44)
	end, { v_u_18.onColorChanged })
	local v47 = v_u_3.useCallback(function(p46)
		-- upvalues: (copy) v_u_33, (copy) v_u_18
		v_u_33(p46)
		if v_u_18.onAlphaChanged then
			v_u_18.onAlphaChanged(p46)
		end
	end, { v_u_18.onAlphaChanged })
	local v49 = v_u_3.useCallback(function(p48)
		-- upvalues: (copy) v_u_45
		v_u_45(p48.Color, p48)
	end, { v_u_45 })
	local v50 = v_u_18.onAlphaChanged ~= nil
	local v52 = v_u_3.useCallback(function(p51)
		-- upvalues: (copy) v_u_45
		v_u_45(p51, nil)
	end, { v_u_45 })
	local v_u_53 = v_u_3.useCallback(v_u_11.createHSVUpdateHandler(v_u_27, v_u_29, v_u_31, v52, v39), {
		v52,
		v_u_27,
		v_u_29,
		v_u_31,
		v_u_22
	})
	local v54 = v_u_3.useCallback(v_u_11.createColorInputChangeHandler(v52, v39, v_u_27, v_u_29, v_u_31), {
		v52,
		v39,
		v_u_27,
		v_u_29,
		v_u_31
	})
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_36, (copy) v_u_27, (copy) v_u_29, (copy) v_u_31
		local v55, v56, v57 = v_u_36:getValue():ToHSV()
		v_u_27(v55)
		v_u_29(v56)
		v_u_31(v57)
	end, {})
	local v58 = v_u_3.createElement
	local v59 = v_u_10
	local v60 = v_u_13(v_u_18, {
		["tag"] = "col gap-small size-full-0 auto-y padding-small"
	})
	local v61 = {}
	local v62 = v_u_3.createElement
	local v63 = v_u_6
	local v64 = {
		["color"] = nil,
		["alpha"] = nil,
		["onColorChanged"] = nil,
		["onAlphaChanged"] = nil,
		["mode"] = nil,
		["onModeChanged"] = nil,
		["availableModes"] = nil,
		["LayoutOrder"] = 1,
		["testId"] = nil,
		["color"] = v21,
		["alpha"] = v32,
		["onColorChanged"] = v54
	}
	local v65
	if v50 then
		v65 = v47
	else
		v65 = nil
	end
	v64.onAlphaChanged = v65
	v64.mode = v34
	v64.onModeChanged = v_u_35
	v64.availableModes = v_u_17
	v64.testId = ("%*--input"):format(v_u_18.testId)
	v61.ColorInputs = v62(v63, v64)
	local v66
	if v34 == v_u_5.Brick then
		v66 = v_u_3.createElement(v_u_4, {
			["selectedColor"] = nil,
			["onBrickColorChanged"] = nil,
			["LayoutOrder"] = 2,
			["testId"] = nil,
			["selectedColor"] = v_u_36,
			["onBrickColorChanged"] = v49,
			["testId"] = ("%*--brick-picker"):format(v_u_18.testId)
		})
	else
		v66 = nil
	end
	v61.BrickPicker = v66
	local v67
	if v34 == v_u_5.Brick then
		v67 = nil
	else
		v67 = v_u_3.createElement(v_u_10, {
			["Size"] = nil,
			["LayoutOrder"] = 2,
			["Size"] = UDim2.new(1, 0, 0, 156)
		}, {
			["SVPicker"] = v_u_3.createElement(v_u_9, {
				["hue"] = v_u_26,
				["saturation"] = v_u_28,
				["value"] = v_u_30,
				["onChanged"] = function(p68, p69) -- name: onChanged
					-- upvalues: (copy) v_u_53, (copy) v_u_26
					v_u_53(v_u_26:getValue(), p68, p69)
				end,
				["onDragStarted"] = v_u_18.onDragStarted,
				["onDragEnded"] = v_u_18.onDragEnded,
				["showSelectionKnob"] = v38:getValue(),
				["testId"] = ("%*--sv-picker"):format(v_u_18.testId)
			})
		})
	end
	v61.SVPickerContainer = v67
	local v70
	if v34 == v_u_5.Brick then
		v70 = nil
	else
		v70 = v_u_3.createElement(v_u_7, {
			["sliderType"] = nil,
			["value"] = nil,
			["onValueChanged"] = nil,
			["onDragStarted"] = nil,
			["onDragEnded"] = nil,
			["LayoutOrder"] = 3,
			["testId"] = nil,
			["sliderType"] = v_u_8.Hue,
			["value"] = v_u_26,
			["onValueChanged"] = function(p71) -- name: onValueChanged
				-- upvalues: (copy) v_u_53, (copy) v_u_28, (copy) v_u_30
				v_u_53(p71, v_u_28:getValue(), v_u_30:getValue())
			end,
			["onDragStarted"] = v_u_18.onDragStarted,
			["onDragEnded"] = v_u_18.onDragEnded,
			["testId"] = ("%*--hue-slider"):format(v_u_18.testId)
		})
	end
	v61.HueSlider = v70
	local v72
	if v50 then
		v72 = v_u_3.createElement(v_u_7, {
			["sliderType"] = nil,
			["value"] = nil,
			["baseColor"] = nil,
			["onValueChanged"] = nil,
			["onDragStarted"] = nil,
			["onDragEnded"] = nil,
			["LayoutOrder"] = 4,
			["testId"] = nil,
			["sliderType"] = v_u_8.Alpha,
			["value"] = v32,
			["baseColor"] = v_u_36,
			["onValueChanged"] = v47,
			["onDragStarted"] = v_u_18.onDragStarted,
			["onDragEnded"] = v_u_18.onDragEnded,
			["testId"] = ("%*--alpha-slider"):format(v_u_18.testId)
		})
	else
		v72 = nil
	end
	v61.AlphaSlider = v72
	return v58(v59, v60, v61)
end