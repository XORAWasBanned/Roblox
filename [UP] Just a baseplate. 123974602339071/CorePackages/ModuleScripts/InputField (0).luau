-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InputField.InputField
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = v1.Components
local v_u_5 = require(v4.HintText)
local v_u_6 = require(v4.InputLabel)
require(v4.Types)
local v_u_7 = require(v4.View)
local v_u_8 = require(v1.Utility.useScaledValue)
local v_u_9 = require(v1.Utility.withCommonProps)
local v_u_10 = require(v1.Utility.withDefaults)
local v_u_11 = require(v1.Constants)
local v_u_12 = {
	["size"] = nil,
	["testId"] = "--foundation-input-field",
	["size"] = require(v1.Enums.InputLabelSize).Small
}
return v_u_3.memo(v_u_3.forwardRef(function(p13, p14) -- name: InputField
	-- upvalues: (copy) v_u_10, (copy) v_u_12, (copy) v_u_8, (copy) v_u_11, (copy) v_u_3, (copy) v_u_7, (copy) v_u_9, (copy) v_u_6, (copy) v_u_5
	local v15 = v_u_10(p13, v_u_12)
	local v16 = v_u_8(v_u_11.DEFAULT_INPUT_FIELD_WIDTH_PIXELS)
	local v_u_17 = v_u_3.useRef(nil)
	local v18 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_17
		if v_u_17.current and not v_u_17.current.getIsFocused() then
			v_u_17.current.focus()
		end
	end, {})
	v_u_3.useImperativeHandle(v15.textBoxRef, function()
		-- upvalues: (copy) v_u_17
		return v_u_17.current and {
			["focus"] = v_u_17.current.focus,
			["releaseFocus"] = v_u_17.current.releaseFocus,
			["getIsFocused"] = v_u_17.current.getIsFocused,
			["getCursorPosition"] = v_u_17.current.getCursorPosition,
			["getSelectionStart"] = v_u_17.current.getSelectionStart,
			["setCursorPosition"] = v_u_17.current.setCursorPosition,
			["setSelectionStart"] = v_u_17.current.setSelectionStart
		} or nil
	end, {})
	local v19 = v_u_3.createElement
	local v20 = v_u_7
	local v21 = v_u_9
	local v22 = {
		["Size"] = nil,
		["tag"] = "col gap-small auto-y",
		["ref"] = nil
	}
	local v23
	if v15.width then
		v23 = UDim2.new(v15.width, UDim.new(0, 0))
	else
		v23 = UDim2.fromOffset(v16, 0)
	end
	v22.Size = v23
	v22.ref = p14
	local v24 = v21(v15, v22)
	local v25 = {}
	local v26
	if #v15.label > 0 then
		v26 = v_u_3.createElement(v_u_6, {
			["Text"] = nil,
			["size"] = nil,
			["isRequired"] = nil,
			["isDisabled"] = nil,
			["onActivated"] = nil,
			["LayoutOrder"] = 1,
			["testId"] = nil,
			["Text"] = v15.label,
			["size"] = v15.size,
			["isRequired"] = v15.isRequired,
			["isDisabled"] = v15.isDisabled,
			["onActivated"] = v18,
			["testId"] = ("%*--label"):format(v15.testId)
		})
	else
		v26 = nil
	end
	v25.Label = v26
	v25.InputWrapper = v_u_3.createElement(v_u_7, {
		["tag"] = "size-full-0 auto-y",
		["LayoutOrder"] = 2,
		["testId"] = nil,
		["testId"] = ("%*--input-wrapper"):format(v15.testId)
	}, {
		["Input"] = v15.input(v_u_17)
	})
	local v27
	if v15.hint then
		v27 = v_u_3.createElement(v_u_5, {
			["text"] = nil,
			["hasError"] = nil,
			["isDisabled"] = nil,
			["LayoutOrder"] = 3,
			["testId"] = nil,
			["text"] = v15.hint,
			["hasError"] = v15.hasError,
			["isDisabled"] = v15.isDisabled,
			["testId"] = ("%*--hint"):format(v15.testId)
		})
	else
		v27 = nil
	end
	v25.Hint = v27
	return v19(v20, v24, v25)
end))