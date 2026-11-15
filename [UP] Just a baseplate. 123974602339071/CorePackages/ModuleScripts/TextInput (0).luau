-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.TextInput.TextInput
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = v1.Components
local v_u_5 = require(v4.Icon)
local v_u_6 = require(v4.IconButton)
local v_u_7 = require(v4.InputField)
local v_u_8 = require(v4.InternalTextInput)
require(v1.Components.Types)
local v_u_9 = require(v4.View)
local v_u_10 = require(v1.Components.TextInput.useTextInputVariants)
local v_u_11 = require(v1.Providers.Style.useTokens)
local v_u_12 = require(v1.Utility.withCommonProps)
local v_u_13 = require(v1.Utility.withDefaults)
local v14 = require(v1.Enums.InputSize)
require(v1.Enums.InputVariant)
local v_u_15 = require(v1.Utility.getInputTextSize)
require(v1.Enums.ControlState)
local v_u_16 = {
	["size"] = nil,
	["testId"] = "--foundation-text-input",
	["size"] = v14.Large
}
return v_u_3.memo(v_u_3.forwardRef(function(p17, p18) -- name: TextInput
	-- upvalues: (copy) v_u_13, (copy) v_u_16, (copy) v_u_11, (copy) v_u_10, (copy) v_u_3, (copy) v_u_7, (copy) v_u_12, (copy) v_u_15, (copy) v_u_8, (copy) v_u_9, (copy) v_u_5, (copy) v_u_6
	local v_u_19 = v_u_13(p17, v_u_16)
	local v_u_20 = v_u_10(v_u_11(), v_u_19.size, v_u_19.variant)
	return v_u_3.createElement(v_u_7, v_u_12(v_u_19, {
		["width"] = v_u_19.width,
		["ref"] = p18,
		["label"] = v_u_19.label,
		["size"] = v_u_15(v_u_19.size),
		["isRequired"] = v_u_19.isRequired,
		["isDisabled"] = v_u_19.isDisabled,
		["hasError"] = v_u_19.hasError,
		["hint"] = v_u_19.hint,
		["textBoxRef"] = v_u_19.textBoxRef,
		["input"] = function(p21) -- name: input
			-- upvalues: (ref) v_u_3, (ref) v_u_8, (copy) v_u_19, (copy) v_u_20, (ref) v_u_9, (ref) v_u_5, (ref) v_u_6
			local v22 = v_u_3.createElement
			local v23 = v_u_8
			local v24 = {
				["ref"] = p21,
				["inputRef"] = v_u_19.inputRef,
				["hasError"] = v_u_19.hasError,
				["isDisabled"] = v_u_19.isDisabled,
				["hasClearButton"] = v_u_19.hasClearButton,
				["text"] = v_u_19.text,
				["textInputType"] = v_u_19.textInputType,
				["focusBehavior"] = v_u_19.focusBehavior,
				["size"] = v_u_19.size,
				["variant"] = v_u_19.variant,
				["Selectable"] = v_u_19.Selectable,
				["NextSelectionUp"] = v_u_19.NextSelectionUp,
				["NextSelectionDown"] = v_u_19.NextSelectionDown,
				["NextSelectionLeft"] = v_u_19.NextSelectionLeft,
				["NextSelectionRight"] = v_u_19.NextSelectionRight,
				["horizontalPadding"] = {
					["left"] = v_u_20.container.horizontalPadding,
					["right"] = v_u_20.container.horizontalPadding
				},
				["onChanged"] = v_u_19.onChanged,
				["onFocus"] = v_u_19.onFocusGained,
				["onFocusLost"] = v_u_19.onFocusLost,
				["onReturnPressed"] = v_u_19.onReturnPressed,
				["placeholder"] = v_u_19.placeholder
			}
			local v25
			if v_u_19.leadingIcon then
				v25 = v_u_3.createElement(v_u_9, {
					["tag"] = "row align-y-center size-0-full auto-x"
				}, v_u_3.createElement(v_u_5, {
					["name"] = v_u_19.leadingIcon,
					["style"] = v_u_20.icon.style,
					["size"] = v_u_20.icon.size
				}))
			else
				v25 = nil
			end
			v24.leadingElement = v25
			local v26
			if v_u_19.iconTrailing then
				local v27 = v_u_3.createElement
				local v28 = v_u_9
				local v29 = {
					["tag"] = "row align-y-center size-0-full auto-x"
				}
				local v30 = v_u_19.iconTrailing
				local v31
				if type(v30) == "table" and v_u_19.iconTrailing.onActivated then
					v31 = v_u_3.createElement(v_u_6, {
						["onActivated"] = v_u_19.iconTrailing.onActivated,
						["isDisabled"] = v_u_19.isDisabled,
						["size"] = v_u_20.icon.size,
						["icon"] = v_u_19.iconTrailing.name,
						["testId"] = ("%*--trailing-icon-button"):format(v_u_19.testId)
					})
				else
					local v32 = v_u_3.createElement
					local v33 = v_u_5
					local v34 = {}
					local v35 = v_u_19.iconTrailing
					local v36
					if type(v35) == "table" then
						v36 = v_u_19.iconTrailing.name
					else
						v36 = v_u_19.iconTrailing
					end
					v34.name = v36
					v34.style = v_u_20.icon.style
					v34.size = v_u_20.icon.size
					v31 = v32(v33, v34)
				end
				v26 = v27(v28, v29, v31)
			else
				v26 = nil
			end
			v24.trailingElement = v26
			v24.testId = ("%*--internal-text-input"):format(v_u_19.testId)
			return v22(v23, v24)
		end
	}))
end))