-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Link.Link
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = require(v1.Enums.ControlState)
local v5 = require(v1.Enums.InputSize)
local v6 = require(v1.Enums.LinkVariant)
local v_u_7 = require(v1.Enums.StateLayerAffordance)
local v8 = require(v1.Enums.TextOverflow)
local v_u_9 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_10 = require(v1.Components.View)
local v_u_11 = require(v1.Utility.escapeRichText)
local v_u_12 = require(v1.Utility.withCommonProps)
local v_u_13 = require(v1.Utility.withDefaults)
local v_u_14 = require(script.Parent.useLinkVariants)
local v_u_15 = require(v1.Providers.Style.useTokens)
local v_u_16 = {
	[v4.Hover] = true,
	[v4.Pressed] = true,
	[v4.Selected] = true,
	[v4.SelectedPressed] = true
}
local v_u_17 = {
	["variant"] = nil,
	["size"] = nil,
	["hasUnderline"] = false,
	["textOverflow"] = nil,
	["testId"] = "--foundation-link",
	["variant"] = v6.Standard,
	["size"] = v5.Medium,
	["textOverflow"] = v8.None
}
return v_u_3.memo(v_u_3.forwardRef(function(p18, p19) -- name: Link
	-- upvalues: (copy) v_u_13, (copy) v_u_17, (copy) v_u_15, (copy) v_u_14, (copy) v_u_3, (copy) v_u_16, (copy) v_u_10, (copy) v_u_12, (copy) v_u_7, (copy) v_u_9, (copy) v_u_11
	local v20 = v_u_13(p18, v_u_17)
	local v_u_21 = v_u_15()
	local v22 = v_u_14(v_u_21, v20.size, v20.variant, v20.textOverflow)
	local v23 = v22.content.style
	local v24, v_u_25 = v_u_3.useState(false)
	local v27 = v_u_3.useCallback(function(p26)
		-- upvalues: (copy) v_u_25, (ref) v_u_16
		v_u_25(v_u_16[p26] == true)
	end, {})
	local v28 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_21
		return {
			["radius"] = UDim.new(0, v_u_21.Radius.XSmall),
			["offset"] = v_u_21.Size.Size_50,
			["borderWidth"] = v_u_21.Stroke.Standard
		}
	end, { v_u_21 })
	local v29 = v20.hasUnderline or v24
	local v30 = v_u_3.createElement
	local v31 = v_u_10
	local v32 = v_u_12
	local v33 = {
		["tag"] = v22.container.tag,
		["cursor"] = v28,
		["stateLayer"] = {
			["affordance"] = v_u_7.None
		},
		["onActivated"] = v20.onActivated,
		["onStateChanged"] = v27,
		["selection"] = {
			["Selectable"] = v20.Selectable,
			["NextSelectionUp"] = v20.NextSelectionUp,
			["NextSelectionDown"] = v20.NextSelectionDown,
			["NextSelectionLeft"] = v20.NextSelectionLeft,
			["NextSelectionRight"] = v20.NextSelectionRight
		},
		["ref"] = p19
	}
	local v34 = v32(v20, v33)
	local v35 = {}
	local v36 = v_u_3.createElement
	local v37 = v_u_9
	local v38 = {
		["Text"] = nil,
		["RichText"] = nil,
		["tag"] = nil,
		["textStyle"] = nil,
		["LayoutOrder"] = 1,
		["testId"] = nil
	}
	local v39
	if v29 then
		v39 = ("<u>%*</u>"):format((v_u_11(v20.text)))
	else
		v39 = v20.text
	end
	v38.Text = v39
	v38.RichText = v29
	v38.tag = v22.text.tag
	v38.textStyle = {
		["Color3"] = v23.Color3,
		["Transparency"] = v23.Transparency
	}
	v38.testId = ("%*--text"):format(v20.testId)
	v35.Text = v36(v37, v38)
	return v30(v31, v34, v35)
end))