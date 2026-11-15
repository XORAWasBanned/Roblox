-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Chip.Chip
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.BuilderIcons).IconVariant
local v_u_5 = require(v1.Constants)
local v_u_6 = require(v1.Utility.Flags)
local v_u_7 = require(v1.Providers.Style.PresentationContext)
local v_u_8 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_9 = require(v1.Components.View)
local v_u_10 = require(v1.Providers.Style.useTokens)
local v_u_11 = require(v1.Utility.withCommonProps)
local v_u_12 = require(v1.Utility.withDefaults)
local v_u_13 = require(script.Parent.Accessory)
local v_u_14 = require(v1.Enums.IconPosition)
local v_u_15 = require(v1.Enums.ColorNamespace)
local v_u_16 = require(v1.Enums.StateLayerMode)
require(v1.Enums.CursorType)
local v17 = require(v1.Enums.ChipSize)
local v18 = require(v1.Enums.ChipVariant)
local v_u_19 = require(script.Parent.useChipVariants)
local v_u_20 = {
	["isChecked"] = false,
	["Selectable"] = true,
	["isDisabled"] = false,
	["size"] = nil,
	["variant"] = nil,
	["testId"] = "--foundation-chip",
	["size"] = v17.Medium,
	["variant"] = v18.Standard
}
return v_u_3.memo(v_u_3.forwardRef(function(p21, p22) -- name: Chip
	-- upvalues: (copy) v_u_12, (copy) v_u_20, (copy) v_u_10, (copy) v_u_3, (copy) v_u_14, (copy) v_u_4, (copy) v_u_6, (copy) v_u_19, (copy) v_u_15, (copy) v_u_9, (copy) v_u_11, (copy) v_u_16, (copy) v_u_5, (copy) v_u_7, (copy) v_u_13, (copy) v_u_8
	local v_u_23 = v_u_12(p21, v_u_20)
	local v24 = v_u_10()
	local v29, v30 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_23, (ref) v_u_14, (ref) v_u_4
		local v25 = v_u_23.leading
		local v26 = v_u_23.trailing
		local v27
		if v_u_23.icon == nil then
			v27 = v26
		else
			local v28 = v_u_23.icon
			if typeof(v28) == "string" then
				v25 = {
					["iconName"] = v_u_23.icon
				}
				v27 = v26
			else
				v27 = {
					["iconName"] = v_u_23.icon.name
				}
				if v_u_23.icon.position == v_u_14.Left then
					v25 = v27
					v27 = v26
				end
			end
		end
		if typeof(v25) == "table" and v25.isCircular then
			v25.iconVariant = v_u_4.Filled
		end
		if typeof(v27) == "table" and v27.isCircular then
			v27.iconVariant = v_u_4.Filled
		end
		return v25, v27
	end, { v_u_23.leading, v_u_23.icon, v_u_23.trailing })
	local v31
	if v_u_23.text == nil then
		v31 = false
	else
		v31 = v_u_23.text ~= ""
	end
	local v32 = v_u_6.FoundationFixChipAccessoryLayout and not v31
	if v32 then
		v32 = v29 == nil ~= (v30 == nil)
	end
	local v33 = v_u_19(v24, v_u_23.size, v_u_23.variant, v_u_23.isChecked, v29 ~= nil, v30 ~= nil)
	local v34 = v24.Stroke.Thicker
	local v35 = math.floor(v34)
	local v38 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_23, (ref) v_u_15
		local v36 = {
			["colorNamespace"] = nil,
			["isIconSize"] = true
		}
		local v37
		if v_u_23.isChecked then
			v37 = v_u_15.Inverse
		else
			v37 = v_u_15.Color
		end
		v36.colorNamespace = v37
		return v36
	end, { v_u_23.isChecked })
	local v39 = v_u_3.createElement
	local v40 = v_u_9
	local v41 = v_u_11
	local v42 = {
		["isDisabled"] = v_u_23.isDisabled
	}
	local v43 = {}
	local v44
	if v_u_23.isDisabled then
		v44 = false
	else
		v44 = v_u_23.Selectable
	end
	v43.Selectable = v44
	v43.NextSelectionUp = v_u_23.NextSelectionUp
	v43.NextSelectionDown = v_u_23.NextSelectionDown
	v43.NextSelectionLeft = v_u_23.NextSelectionLeft
	v43.NextSelectionRight = v_u_23.NextSelectionRight
	v42.selection = v43
	v42.onActivated = v_u_23.onActivated
	v42.stateLayer = v_u_23.isChecked and {
		["mode"] = v_u_16.Inverse
	} or nil
	v42.backgroundStyle = v33.chip.backgroundStyle
	v42.padding = v33.chip.padding
	v42.cursor = {
		["radius"] = UDim.new(0, v24.Radius.Circle),
		["offset"] = v35 * 2,
		["borderWidth"] = v35
	}
	v42.tag = v33.chip.tag
	v42.ref = p22
	v42.GroupTransparency = not v_u_23.isDisabled and 0 or v_u_5.DISABLED_TRANSPARENCY
	local v45 = v41(v_u_23, v42)
	local v46 = v_u_3.createElement
	local v47 = v_u_7.Provider
	local v48 = {
		["value"] = v38
	}
	local v49 = {}
	local v50
	if v29 then
		v50 = v_u_3.createElement(v_u_13, {
			["isLeading"] = true,
			["config"] = nil,
			["size"] = nil,
			["chipBackgroundStyle"] = nil,
			["contentStyle"] = nil,
			["isDisabled"] = nil,
			["isIconOnly"] = nil,
			["testId"] = nil,
			["config"] = v29,
			["size"] = v_u_23.size,
			["chipBackgroundStyle"] = v33.chip.backgroundStyle,
			["contentStyle"] = v33.text.contentStyle,
			["isDisabled"] = v_u_23.isDisabled,
			["isIconOnly"] = v32,
			["testId"] = ("%*--leading-accessory"):format(v_u_23.testId)
		})
	else
		v50 = nil
	end
	v49.Leading = v50
	local v51
	if v31 then
		v51 = v_u_3.createElement(v_u_8, {
			["Text"] = nil,
			["textStyle"] = nil,
			["LayoutOrder"] = 2,
			["tag"] = nil,
			["padding"] = nil,
			["testId"] = nil,
			["Text"] = v_u_23.text,
			["textStyle"] = v33.text.contentStyle,
			["tag"] = v33.text.tag,
			["padding"] = v33.text.padding,
			["testId"] = ("%*--text"):format(v_u_23.testId)
		})
	else
		v51 = nil
	end
	v49.Text = v51
	local v52
	if v30 then
		v52 = v_u_3.createElement(v_u_13, {
			["isLeading"] = false,
			["config"] = nil,
			["size"] = nil,
			["chipBackgroundStyle"] = nil,
			["contentStyle"] = nil,
			["isDisabled"] = nil,
			["isIconOnly"] = nil,
			["testId"] = nil,
			["config"] = v30,
			["size"] = v_u_23.size,
			["chipBackgroundStyle"] = v33.chip.backgroundStyle,
			["contentStyle"] = v33.text.contentStyle,
			["isDisabled"] = v_u_23.isDisabled,
			["isIconOnly"] = v32,
			["testId"] = ("%*--trailing-accessory"):format(v_u_23.testId)
		})
	else
		v52 = nil
	end
	v49.Trailing = v52
	return v39(v40, v45, v46(v47, v48, v49))
end))