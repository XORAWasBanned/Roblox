-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.TextArea.TextArea
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = v1.Components
local v_u_5 = require(v4.InputField)
local v_u_6 = require(v4.InternalTextInput)
require(v1.Components.Types)
local v_u_7 = require(v1.Utility.getInputTextSize)
local v_u_8 = require(v4.TextInput.useTextInputVariants)
local v_u_9 = require(v1.Providers.Style.useTokens)
local v_u_10 = require(v1.Utility.withCommonProps)
local v_u_11 = require(v1.Utility.withDefaults)
local v12 = require(v1.Enums.InputSize)
require(v1.Enums.InputVariant)
require(v1.Enums.ControlState)
local v_u_13 = {
	["size"] = nil,
	["numLines"] = 3,
	["testId"] = "--foundation-text-area",
	["size"] = v12.Medium
}
return v_u_3.memo(v_u_3.forwardRef(function(p14, p15) -- name: TextArea
	-- upvalues: (copy) v_u_11, (copy) v_u_13, (copy) v_u_9, (copy) v_u_8, (copy) v_u_3, (copy) v_u_5, (copy) v_u_10, (copy) v_u_7, (copy) v_u_6
	local v_u_16 = v_u_11(p14, v_u_13)
	local v_u_17 = v_u_9()
	local v_u_18 = v_u_8(v_u_17, v_u_16.size, v_u_16.variant)
	local v19 = v_u_3.createElement
	local v20 = v_u_5
	local v21 = v_u_10
	local v22 = {}
	local v23
	if v_u_16.width then
		v23 = v_u_16.width
	else
		v23 = nil
	end
	v22.width = v23
	v22.label = v_u_16.label
	v22.size = v_u_7(v_u_16.size)
	v22.hint = v_u_16.hint
	v22.hasError = v_u_16.hasError
	v22.isDisabled = v_u_16.isDisabled
	v22.isRequired = v_u_16.isRequired
	function v22.input(p24) -- name: input
		-- upvalues: (ref) v_u_3, (ref) v_u_6, (copy) v_u_16, (copy) v_u_18, (copy) v_u_17
		local v25 = v_u_3.createElement
		local v26 = v_u_6
		local v27 = {
			["inputRef"] = nil,
			["size"] = nil,
			["variant"] = nil,
			["numLines"] = nil,
			["focusBehavior"] = nil,
			["onFocus"] = nil,
			["onFocusLost"] = nil,
			["onChanged"] = nil,
			["text"] = nil,
			["hasError"] = nil,
			["isDisabled"] = nil,
			["hasClearButton"] = nil,
			["placeholder"] = nil,
			["horizontalPadding"] = nil,
			["LayoutOrder"] = 2,
			["ref"] = nil,
			["testId"] = nil,
			["inputRef"] = v_u_16.inputRef,
			["size"] = v_u_16.size,
			["variant"] = v_u_16.variant,
			["numLines"] = v_u_16.numLines,
			["focusBehavior"] = v_u_16.focusBehavior,
			["onFocus"] = v_u_16.onFocusGained,
			["onFocusLost"] = v_u_16.onFocusLost,
			["onChanged"] = v_u_16.onChanged,
			["text"] = v_u_16.text,
			["hasError"] = v_u_16.hasError,
			["isDisabled"] = v_u_16.isDisabled,
			["hasClearButton"] = v_u_16.hasClearButton,
			["placeholder"] = v_u_16.placeholder,
			["horizontalPadding"] = {
				["left"] = v_u_18.container.horizontalPadding,
				["right"] = v_u_18.container.horizontalPadding - UDim.new(0, v_u_17.Size.Size_150)
			},
			["ref"] = p24,
			["testId"] = ("%*--input"):format(v_u_16.testId)
		}
		return v25(v26, v27)
	end
	v22.textBoxRef = v_u_16.textBoxRef
	v22.ref = p15
	return v19(v20, v21(v_u_16, v22))
end))