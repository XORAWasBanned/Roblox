-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Dropdown.DropdownControl
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = v1.Components
require(v4.BaseMenu)
local v_u_5 = require(v4.View)
local v_u_6 = require(v1.Constants)
local v_u_7 = require(v4.Icon)
local v_u_8 = require(v4.InputField)
local v_u_9 = require(v1.Enums.StateLayerAffordance)
local v_u_10 = require(v4.Text)
require(v1.Components.Types)
local v_u_11 = require(v1.Utility.blendTransparencies)
local v_u_12 = require(v1.Utility.getInputTextSize)
local v_u_13 = require(v1.Providers.Style.useTokens)
local v_u_14 = require(v1.Utility.withCommonProps)
local v_u_15 = require(v1.Utility.withDefaults)
local v_u_16 = require(script.Parent.useDropdownVariants)
local v_u_17 = require(v1.Enums.ControlState)
require(v1.Enums.CursorType)
require(v1.Enums.InputSize)
local v18 = require(v1.Enums.InputVariant)
local v19 = require(v2.BuilderIcons)
local v_u_20 = v19.Icon.ChevronLargeUp
local v_u_21 = v19.Icon.ChevronLargeDown
local v_u_22 = {
	["variant"] = nil,
	["isMenuOpen"] = false,
	["placeholder"] = "",
	["Selectable"] = true,
	["variant"] = v18.Standard
}
return v_u_3.memo(v_u_3.forwardRef(function(p23, p24) -- name: DropdownControl
	-- upvalues: (copy) v_u_15, (copy) v_u_22, (copy) v_u_13, (copy) v_u_3, (copy) v_u_17, (copy) v_u_16, (copy) v_u_8, (copy) v_u_14, (copy) v_u_12, (copy) v_u_5, (copy) v_u_9, (copy) v_u_11, (copy) v_u_6, (copy) v_u_10, (copy) v_u_7, (copy) v_u_20, (copy) v_u_21
	local v_u_25 = v_u_15(p23, v_u_22)
	local v_u_26 = v_u_13()
	local v27, v_u_28 = v_u_3.useState(v_u_17.Initialize)
	local v29 = v_u_25.item == nil
	local v_u_30 = v_u_16(v_u_26, v_u_25.size, v_u_25.variant, v27, v29, v_u_25.hasError or false, v_u_25.isMenuOpen, v27 == v_u_17.Hover)
	local v_u_31 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_26
		return {
			["radius"] = UDim.new(0, v_u_26.Radius.Small),
			["offset"] = v_u_26.Size.Size_200,
			["borderWidth"] = v_u_26.Stroke.Thicker
		}
	end, { v_u_26 })
	return v_u_3.createElement(v_u_8, v_u_14(v_u_25, {
		["size"] = v_u_12(v_u_25.size),
		["hasError"] = v_u_25.hasError,
		["isDisabled"] = v_u_25.isDisabled,
		["label"] = v_u_25.label,
		["hint"] = v_u_25.hint,
		["ref"] = p24,
		["width"] = v_u_25.width,
		["input"] = function(_) -- name: input
			-- upvalues: (ref) v_u_3, (ref) v_u_5, (copy) v_u_28, (copy) v_u_25, (copy) v_u_31, (ref) v_u_9, (copy) v_u_30, (ref) v_u_11, (ref) v_u_6, (ref) v_u_10, (ref) v_u_7, (ref) v_u_20, (ref) v_u_21, (copy) v_u_26
			local v32 = v_u_3.createElement
			local v33 = v_u_5
			local v34 = {
				["onStateChanged"] = v_u_28,
				["isDisabled"] = v_u_25.isDisabled,
				["onActivated"] = v_u_25.onActivated
			}
			local v35 = {}
			local v36
			if v_u_25.isDisabled then
				v36 = false
			else
				v36 = v_u_25.Selectable
			end
			v35.Selectable = v36
			v35.NextSelectionUp = v_u_25.NextSelectionUp
			v35.NextSelectionDown = v_u_25.NextSelectionDown
			v35.NextSelectionLeft = v_u_25.NextSelectionLeft
			v35.NextSelectionRight = v_u_25.NextSelectionRight
			v34.selection = v35
			v34.cursor = v_u_31
			v34.stateLayer = {
				["affordance"] = v_u_9.None
			}
			local v37
			if v_u_30.container.bgStyle then
				v37 = {
					["Color3"] = v_u_30.container.bgStyle.Color3
				}
				local v38
				if v_u_25.isDisabled then
					v38 = v_u_11(v_u_30.container.bgStyle.Transparency, v_u_6.DISABLED_TRANSPARENCY)
				else
					v38 = v_u_30.container.bgStyle.Transparency
				end
				v37.Transparency = v38
			else
				v37 = nil
			end
			v34.backgroundStyle = v37
			local v39
			if v_u_30.container.strokeStyle then
				v39 = {
					["Color"] = v_u_30.container.strokeStyle.Color3
				}
				local v40
				if v_u_25.isDisabled then
					v40 = v_u_11(v_u_30.container.strokeStyle.Transparency, v_u_6.DISABLED_TRANSPARENCY)
				else
					v40 = v_u_30.container.strokeStyle.Transparency
				end
				v39.Transparency = v40
				v39.Thickness = v_u_30.container.strokeThickness
				v39.BorderStrokePosition = Enum.BorderStrokePosition.Inner
			else
				v39 = nil
			end
			v34.stroke = v39
			v34.tag = v_u_30.container.tag
			v34.ref = v_u_25.inputRef
			v34.testId = ("%*--control"):format(v_u_25.testId)
			local v41 = {}
			local v42 = v_u_3.createElement
			local v43 = v_u_10
			local v44 = {
				["LayoutOrder"] = 1,
				["Text"] = nil,
				["tag"] = nil
			}
			local v45
			if v_u_25.item then
				v45 = v_u_25.item.text
			else
				v45 = v_u_25.placeholder
			end
			v44.Text = v45
			v44.tag = v_u_30.text.tag
			v41.Text = v42(v43, v44)
			local v46 = v_u_3.createElement
			local v47 = v_u_7
			local v48 = {
				["LayoutOrder"] = 2,
				["name"] = nil,
				["size"] = nil,
				["style"] = nil,
				["tag"] = nil,
				["testId"] = nil
			}
			local v49
			if v_u_25.isMenuOpen then
				v49 = v_u_20
			else
				v49 = v_u_21
			end
			v48.name = v49
			v48.size = v_u_30.arrow.size
			local v50
			if v_u_25.isDisabled then
				v50 = v_u_26.Color.Content.Muted
			else
				v50 = nil
			end
			v48.style = v50
			v48.tag = v_u_30.text.tag
			v48.testId = ("%*--arrow"):format(v_u_25.testId)
			v41.Arrow = v46(v47, v48)
			return v32(v33, v34, v41)
		end
	}))
end))