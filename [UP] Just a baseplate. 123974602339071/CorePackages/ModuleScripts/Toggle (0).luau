-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Toggle.Toggle
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Otter)
local v_u_4 = require(v2.React)
local v_u_5 = require(v1.Constants)
local v6 = v1.Components
local v_u_7 = require(v6.InternalInput)
local v_u_8 = require(v6.Knob)
local v_u_9 = require(v1.Providers.Style.PresentationContext)
require(v6.Types)
local v_u_10 = require(v6.InternalInput.useUncontrolledState)
local v_u_11 = require(v2.BuilderIcons)
local v_u_12 = require(v1.Providers.Style.useTokens)
local v_u_13 = require(v1.Utility.withCommonProps)
local v14 = require(v1.Enums.ColorNamespace)
require(v1.Enums.ControlState)
local v_u_15 = require(script.Parent.useToggleVariants)
local v_u_16 = require(v1.Enums.InputSize)
require(v1.Enums.InputLabelSize)
local v17 = require(v1.Enums.InputPlacement)
local v_u_18 = require(v6.InternalInputGroup.useInputGroupDefaults)
local v_u_19 = {
	["frequency"] = 4
}
local v_u_20 = {
	["size"] = nil,
	["placement"] = nil,
	["Selectable"] = true,
	["testId"] = "--foundation-toggle",
	["size"] = v_u_16.Medium,
	["placement"] = v17.Start
}
local v_u_21 = {
	["colorNamespace"] = v14.Color
}
return v_u_4.memo(v_u_4.forwardRef(function(p22, p23) -- name: Toggle
	-- upvalues: (copy) v_u_18, (copy) v_u_20, (copy) v_u_12, (copy) v_u_15, (copy) v_u_10, (copy) v_u_16, (copy) v_u_4, (copy) v_u_3, (copy) v_u_19, (copy) v_u_7, (copy) v_u_13, (copy) v_u_5, (copy) v_u_9, (copy) v_u_21, (copy) v_u_8, (copy) v_u_11
	local v24 = v_u_18(p22, v_u_20)
	local v_u_25 = v_u_15(v_u_12(), v24.size)
	local v_u_26, v27 = v_u_10(v24.isChecked, v24.onActivated)
	local v28
	if v24.size == v_u_16.Large then
		v28 = v_u_16.Medium
	else
		v28 = v24.size
	end
	local v_u_29 = v_u_26 and 1 or 0
	local v30, v_u_31 = v_u_4.useBinding(v_u_29)
	local v_u_32 = v_u_4.useRef(nil)
	local v34 = v30:map(function(p33)
		-- upvalues: (copy) v_u_25
		return v_u_25.knob.offPosition:Lerp(v_u_25.knob.onPosition, p33)
	end)
	v_u_4.useEffect(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_29, (copy) v_u_32, (copy) v_u_31
		local v_u_35 = v_u_3.createSingleMotor(v_u_29)
		v_u_32.current = v_u_35
		v_u_35:start()
		v_u_35:onStep(function(p36)
			-- upvalues: (ref) v_u_31
			v_u_31(p36)
		end)
		return function()
			-- upvalues: (copy) v_u_35
			v_u_35:destroy()
		end
	end, {})
	v_u_4.useEffect(function()
		-- upvalues: (copy) v_u_26, (copy) v_u_32, (ref) v_u_3, (ref) v_u_19
		local v37 = v_u_26 and 1 or 0
		if v_u_32.current then
			v_u_32.current:setGoal(v_u_3.spring(v37, v_u_19))
		end
	end, { v_u_26 })
	local v38 = v_u_4.createElement
	local v39 = v_u_7
	local v40 = v_u_13(v24, {
		["isChecked"] = v_u_26,
		["isDisabled"] = v24.isDisabled,
		["onActivated"] = v27,
		["label"] = {
			["text"] = v24.label,
			["position"] = v_u_5.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[v24.placement],
			["hint"] = v24.hint
		},
		["customVariantProps"] = v_u_25.input,
		["size"] = v24.size,
		["Selectable"] = v24.Selectable,
		["NextSelectionUp"] = v24.NextSelectionUp,
		["NextSelectionDown"] = v24.NextSelectionDown,
		["NextSelectionLeft"] = v24.NextSelectionLeft,
		["NextSelectionRight"] = v24.NextSelectionRight,
		["ref"] = p23
	})
	local v41 = v_u_4.createElement
	local v42 = v_u_9.Provider
	local v43 = {
		["value"] = v_u_21
	}
	local v44 = {
		["Knob"] = v_u_4.createElement(v_u_8, {
			["size"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["hasShadow"] = false,
			["icon"] = nil,
			["testId"] = nil,
			["size"] = v28,
			["AnchorPoint"] = Vector2.new(0, 0.5),
			["Position"] = v34,
			["icon"] = v_u_26 and {
				["name"] = v_u_11.Icon.Check,
				["variant"] = v_u_11.IconVariant.Regular
			} or nil,
			["testId"] = ("%*--knob"):format(v24.testId)
		})
	}
	return v38(v39, v40, v41(v42, v43, v44))
end))