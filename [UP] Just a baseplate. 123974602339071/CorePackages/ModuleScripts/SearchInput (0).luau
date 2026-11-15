-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.SearchInput.SearchInput
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.React)
local v5 = v1.Components
local v_u_6 = require(v5.Icon)
local v_u_7 = require(v5.InternalTextInput)
require(v5.Types)
local v_u_8 = require(v5.View)
local v_u_9 = require(v1.Constants)
local v_u_10 = require(v1.Utility.Localization.Translator)
local v_u_11 = require(v1.Utility.useScaledValue)
local v_u_12 = require(v1.Components.TextInput.useTextInputVariants)
local v_u_13 = require(v1.Providers.Style.useTokens)
local v_u_14 = require(v1.Utility.withCommonProps)
local v_u_15 = require(v1.Utility.withDefaults)
local v16 = require(v1.Enums.InputSize)
local v17 = require(v1.Enums.InputVariant)
local v18 = require(v1.Enums.Radius)
local v19 = require(v1.Enums.SearchInputShape)
local v_u_20 = {
	[v19.Pill] = v18.Circle,
	[v19.Box] = v18.None
}
local v_u_21 = {
	["size"] = nil,
	["variant"] = nil,
	["shape"] = nil,
	["hasClearButton"] = true,
	["testId"] = "--foundation-search-input",
	["size"] = v16.Medium,
	["variant"] = v17.Standard,
	["shape"] = v19.Pill
}
return v_u_4.memo(v_u_4.forwardRef(function(p22, p23) -- name: SearchInput
	-- upvalues: (copy) v_u_15, (copy) v_u_21, (copy) v_u_13, (copy) v_u_12, (copy) v_u_11, (copy) v_u_9, (copy) v_u_4, (copy) v_u_8, (copy) v_u_14, (copy) v_u_7, (copy) v_u_20, (copy) v_u_10, (copy) v_u_6, (copy) v_u_3
	local v24 = v_u_15(p22, v_u_21)
	local v_u_25 = v_u_13()
	local v_u_26 = v_u_12(v_u_25, v24.size, v24.variant)
	local v27 = v_u_11(v_u_9.DEFAULT_INPUT_FIELD_WIDTH_PIXELS)
	local v28 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_26, (copy) v_u_25
		return UDim2.fromOffset(0, (v_u_26.container.minHeight - v_u_25.Stroke.Standard) / 2)
	end, { v_u_26.container.minHeight, v_u_25.Stroke.Standard })
	local v29 = v_u_4.createElement
	local v30 = v_u_8
	local v31 = v_u_14
	local v32 = {
		["Size"] = nil,
		["tag"] = "auto-y"
	}
	local v33
	if v24.width then
		v33 = UDim2.new(v24.width, UDim.new(0, 0))
	else
		v33 = UDim2.new(UDim.new(0, v27), UDim.new(0, 0))
	end
	v32.Size = v33
	local v34 = v31(v24, v32)
	local v35 = {}
	local v36 = v_u_4.createElement
	local v37 = v_u_7
	local v38 = {
		["ref"] = p23,
		["hasError"] = v24.hasError,
		["isDisabled"] = v24.isDisabled,
		["hasClearButton"] = v24.hasClearButton,
		["text"] = v24.text,
		["size"] = v24.size,
		["radius"] = v_u_20[v24.shape],
		["variant"] = v24.variant,
		["horizontalPadding"] = {
			["left"] = v_u_26.container.horizontalPadding,
			["right"] = v_u_26.container.horizontalPadding
		},
		["onChanged"] = v24.onChanged,
		["onFocus"] = v24.onFocusGained,
		["onFocusLost"] = v24.onFocusLost
	}
	local v39
	if v24.placeholder then
		v39 = v24.placeholder
	else
		v39 = v_u_10:FormatByKey("CommonUI.Controls.Action.Search")
	end
	v38.placeholder = v39
	local v40 = v_u_4.createElement
	local v41 = v_u_8
	local v42 = {
		["Icon"] = v_u_4.createElement(v_u_6, {
			["name"] = v_u_3.Icon.MagnifyingGlass,
			["size"] = v24.size,
			["testId"] = ("%*--search-icon"):format(v24.testId)
		})
	}
	v38.leadingElement = v40(v41, {
		["Position"] = nil,
		["tag"] = "anchor-center-left auto-xy",
		["Position"] = v28
	}, v42)
	v38.testId = ("%*--input"):format(v24.testId)
	v35.Input = v36(v37, v38)
	return v29(v30, v34, v35)
end))