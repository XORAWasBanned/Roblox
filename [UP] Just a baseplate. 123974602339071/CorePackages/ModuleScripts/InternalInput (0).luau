-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalInput.InternalInput
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Motion).useMotion
local v_u_4 = require(v2.Dash)
local v_u_5 = require(v2.React)
local v6 = v1.Components
local v_u_7 = require(v6.InputLabel)
require(v6.Types)
local v_u_8 = require(v6.View)
local v_u_9 = require(v1.Enums.StateLayerAffordance)
local v_u_10 = require(script.Parent.InputHint)
local v_u_11 = require(script.Parent.useInputMotionStates)
local v_u_12 = require(script.Parent.useInputVariants)
local v_u_13 = require(v1.Utility.getInputTextSize)
local v_u_14 = require(v1.Providers.Style.useTokens)
local v_u_15 = require(v1.Utility.withCommonProps)
local v_u_16 = require(v1.Utility.withDefaults)
local v_u_17 = require(v1.Constants)
local v18 = require(v1.Enums.InputSize)
require(v1.Enums.CursorType)
require(v1.Providers.Style.Tokens)
local v_u_19 = {
	["size"] = nil,
	["Selectable"] = true,
	["testId"] = "--foundation-internal-input",
	["size"] = v18.Medium
}
return v_u_5.memo(v_u_5.forwardRef(function(p20, p21) -- name: InternalInput
	-- upvalues: (copy) v_u_16, (copy) v_u_19, (copy) v_u_14, (copy) v_u_12, (copy) v_u_5, (copy) v_u_11, (copy) v_u_3, (copy) v_u_17, (copy) v_u_9, (copy) v_u_8, (copy) v_u_15, (copy) v_u_4, (copy) v_u_7, (copy) v_u_13, (copy) v_u_10
	local v_u_22 = v_u_16(p20, v_u_19)
	local v23 = v_u_22.label.text
	local v24 = v_u_22.label.position or Enum.HorizontalAlignment.Right
	local v_u_25
	if typeof(v23) == "string" then
		v_u_25 = #v23 > 0
	else
		v_u_25 = v23 ~= nil
	end
	local v_u_26 = v_u_14()
	local v_u_27 = v_u_22.isChecked or v_u_22.isIndeterminate
	local v28 = v_u_12(v_u_26, v_u_22.size, v24)
	local v29 = v_u_5.useMemo(function()
		-- upvalues: (copy) v_u_22, (copy) v_u_26
		return {
			["radius"] = v_u_22.customVariantProps.cursorRadius or UDim.new(0, 0),
			["offset"] = v_u_26.Size.Size_200,
			["borderWidth"] = v_u_26.Stroke.Thicker
		}
	end, { v_u_26, v_u_25, v_u_22.customVariantProps.cursorRadius })
	local v_u_30 = v_u_11(v_u_26, v_u_22.customVariantProps.colors)
	local v31, v_u_32 = v_u_3(v_u_30.Default)
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_27, (copy) v_u_32, (copy) v_u_30
		if v_u_27 then
			v_u_32(v_u_30.Checked)
		else
			v_u_32(v_u_30.Default)
		end
	end, { v_u_27, v_u_30 })
	local v33 = v_u_5.useCallback(function()
		-- upvalues: (copy) v_u_22
		if not v_u_22.isDisabled then
			v_u_22.onActivated(not v_u_22.isChecked)
		end
	end, { v_u_22.isDisabled, v_u_22.isChecked, v_u_22.onActivated })
	local v34 = {}
	local v35
	if v_u_22.isDisabled then
		v35 = false
	else
		v35 = v_u_22.Selectable
	end
	v34.Selectable = v35
	v34.NextSelectionUp = v_u_22.NextSelectionUp
	v34.NextSelectionDown = v_u_22.NextSelectionDown
	v34.NextSelectionLeft = v_u_22.NextSelectionLeft
	v34.NextSelectionRight = v_u_22.NextSelectionRight
	local v36 = {
		["Active"] = not v_u_22.isDisabled,
		["GroupTransparency"] = not v_u_22.isDisabled and 0 or v_u_17.DISABLED_TRANSPARENCY,
		["onActivated"] = v33,
		["stateLayer"] = {
			["affordance"] = v_u_9.None
		},
		["selection"] = v_u_25 and {
			["Selectable"] = false
		} or v34
	}
	local v37
	if v_u_25 then
		v37 = nil
	else
		v37 = v29
	end
	v36.cursor = v37
	v36.isDisabled = v_u_22.isDisabled
	v36.ref = p21
	local v38
	if v_u_22.customVariantProps.stroke and v_u_22.customVariantProps.stroke.thickness ~= nil then
		v38 = v_u_22.customVariantProps.stroke.thickness
	else
		v38 = v28.input.stroke.thickness
	end
	local v39 = v_u_5.useMemo(function()
		-- upvalues: (ref) v_u_9
		return {
			["affordance"] = nil,
			["inset"] = nil,
			["mode"] = nil,
			["affordance"] = v_u_9.None
		}
	end, {})
	local v42 = {
		["tag"] = v_u_22.customVariantProps.tag,
		["Size"] = v_u_22.customVariantProps.size - UDim2.fromOffset(v38, v38),
		["backgroundStyle"] = v31.backgroundStyle,
		["onActivated"] = v33,
		["stateLayer"] = v39,
		["stroke"] = {
			["Color"] = v31.strokeStyle:map(function(p40)
				return p40.Color3
			end),
			["Transparency"] = v31.strokeStyle:map(function(p41)
				-- upvalues: (copy) v_u_22, (copy) v_u_25, (ref) v_u_17
				if v_u_22.isDisabled and not v_u_25 then
					return v_u_17.DISABLED_TRANSPARENCY
				else
					return p41.Transparency
				end
			end),
			["Thickness"] = v38,
			["BorderStrokePosition"] = Enum.BorderStrokePosition.Inner
		},
		["selection"] = v34
	}
	if not v_u_25 then
		v29 = nil
	end
	v42.cursor = v29
	v42.LayoutOrder = v_u_25 and (v24 == Enum.HorizontalAlignment.Left and 1 or -1) or nil
	v42.testId = ("%*--container"):format(v_u_22.testId)
	if not v_u_25 then
		return v_u_5.createElement(v_u_8, v_u_15(v_u_22, v_u_4.union(v36, v42)), v_u_22.children)
	end
	local v43 = {
		["tag"] = v28.container.tag
	}
	local v44 = {
		["top"] = v28.container.padding,
		["bottom"] = v28.container.padding
	}
	local v45
	if v24 == Enum.HorizontalAlignment.Right then
		v45 = v28.container.padding
	else
		v45 = nil
	end
	v44.left = v45
	local v46
	if v24 == Enum.HorizontalAlignment.Left then
		v46 = v28.container.padding
	else
		v46 = nil
	end
	v44.right = v46
	v43.padding = v44
	if typeof(v23) == "string" then
		v23 = v_u_5.createElement(v_u_7, {
			["Text"] = v23,
			["textStyle"] = v31.labelStyle,
			["size"] = v_u_13(v_u_22.size),
			["testId"] = ("%*--label"):format(v_u_22.testId)
		})
	end
	local v47 = v_u_5.createElement
	local v48 = v_u_8
	local v49 = v_u_15(v_u_22, v_u_4.union(v43, v36))
	local v50 = {
		["Input"] = v_u_5.createElement(v_u_8, v42, v_u_22.children)
	}
	if v_u_22.label.hint ~= nil and v_u_22.label.hint ~= "" then
		v23 = v_u_5.createElement(v_u_8, {
			["tag"] = "col gap-xxsmall auto-xy"
		}, {
			["InputLabel"] = v23,
			["Hint"] = v_u_5.createElement(v_u_10, {
				["text"] = nil,
				["size"] = nil,
				["testId"] = nil,
				["LayoutOrder"] = 2,
				["text"] = v_u_22.label.hint,
				["size"] = v_u_13(v_u_22.size),
				["testId"] = ("%*--hint"):format(v_u_22.testId)
			})
		})
	end
	v50.InputLabel = v23
	return v47(v48, v49, v50)
end))