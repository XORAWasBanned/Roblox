-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.View.View
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Utility.Logger)
local v_u_5 = require(v1.Components.Interactable)
local v_u_6 = require(v1.Utility.Flags)
local v_u_7 = require(v1.Utility.GuiObjectChildren)
require(v1.Components.Types)
local v_u_8 = require(v1.Utility.useDefaultTags)
local v_u_9 = require(v1.Utility.withDefaults)
local v_u_10 = require(v1.Utility.withGuiObjectProps)
local v_u_11 = require(v1.Providers.Style.useStyleTags)
require(v1.Enums.ControlState)
local v_u_12 = {
	["layout"] = nil,
	["AutoLocalize"] = false,
	["BorderSizePixel"] = 0,
	["isDisabled"] = false,
	["layout"] = {
		["SortOrder"] = Enum.SortOrder.LayoutOrder
	}
}
local v_u_13 = false
local function v30(p14, p15) -- name: View
	-- upvalues: (copy) v_u_9, (copy) v_u_12, (copy) v_u_8, (copy) v_u_11, (copy) v_u_6, (copy) v_u_3, (ref) v_u_13, (copy) v_u_4, (copy) v_u_10, (copy) v_u_5, (copy) v_u_7
	local v_u_16 = v_u_9(p14, v_u_12)
	local v17 = v_u_16.backgroundStyle == nil and "gui-object-defaults" or "gui-object-defaults x-default-transparency"
	local v18 = v_u_11((v_u_8(v_u_16.tag, v17)))
	local v_u_19 = (v_u_16.onStateChanged ~= nil or v_u_16.onActivated ~= nil) and true or v_u_16.onSecondaryActivated ~= nil
	local v_u_20
	if v_u_6.FoundationViewMemoizationChanges then
		if v_u_16.GroupTransparency == nil then
			v_u_20 = false
		else
			local v21 = v_u_16.GroupTransparency
			v_u_20 = type(v21) == "table" and true or v_u_16.GroupTransparency > 0
		end
	else
		v_u_20 = v_u_3.useMemo(function()
			-- upvalues: (copy) v_u_16
			if v_u_16.GroupTransparency == nil then
				return false
			end
			local v22 = v_u_16.GroupTransparency
			return type(v22) == "table" and true or v_u_16.GroupTransparency > 0
		end, { v_u_16.GroupTransparency })
	end
	local v23
	if v_u_6.FoundationViewMemoizationChanges then
		v23 = v_u_20 and "CanvasGroup" or (v_u_19 and "ImageButton" or "Frame")
		if v_u_20 and (v_u_19 and not (v_u_16.isDisabled or v_u_13)) then
			v_u_13 = true
			v_u_4:warning("Some state changes are not supported with GroupTransparency")
		end
	else
		v23 = v_u_3.useMemo(function()
			-- upvalues: (ref) v_u_20, (copy) v_u_19, (copy) v_u_16, (ref) v_u_4
			if not v_u_20 then
				return v_u_19 and "ImageButton" or "Frame"
			end
			if v_u_19 and not v_u_16.isDisabled then
				v_u_4:warning("Some state changes are not supported with GroupTransparency")
			end
			return "CanvasGroup"
		end, { v_u_20, v_u_19 })
	end
	local v24 = v_u_10
	local v25 = {}
	local v26
	if v23 == "ImageButton" then
		v26 = false
	else
		v26 = nil
	end
	v25.AutoButtonColor = v26
	local v27
	if v_u_20 then
		v27 = v_u_16.GroupTransparency
	else
		v27 = nil
	end
	v25.GroupTransparency = v27
	v25.ref = p15
	v25[v_u_3.Tag] = v18
	local v28 = v24(v_u_16, v25)
	local v29
	if v_u_19 then
		v29 = v_u_5
		v28.component = v23
		v28.onActivated = v_u_16.onActivated
		v28.onSecondaryActivated = v_u_16.onSecondaryActivated
		v28.onStateChanged = v_u_16.onStateChanged
		v28.stateLayer = v_u_16.stateLayer
		v28.isDisabled = v_u_16.isDisabled
		v28.cursor = v_u_16.cursor
	else
		v29 = v23
	end
	return v_u_3.createElement(v29, v28, v_u_7(v_u_16))
end
return v_u_3.memo(v_u_3.forwardRef(v30))