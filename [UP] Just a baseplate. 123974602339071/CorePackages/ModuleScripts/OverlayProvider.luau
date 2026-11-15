-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Overlay.OverlayProvider
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v1.Constants)
local v_u_4 = require(v1.Utility.getMainGui)
local v_u_5 = require(v1.Utility.withDefaults)
local v_u_6 = require(v1.Providers.Style.StyleSheetContext).useStyleSheet
require(v1.Components.Types)
local v_u_7 = require(script.Parent.OverlayContext)
local v_u_8 = require(script.Parent.useKeyboardAwareSize)
local v_u_9 = require(v2.React)
local v_u_10 = require(v2.ReactRoblox)
local v_u_11 = {
	["DisplayOrder"] = v3.MAX_LAYOUT_ORDER - 1
}
return function(p12) -- name: OverlayProvider
	-- upvalues: (copy) v_u_5, (copy) v_u_11, (copy) v_u_9, (copy) v_u_8, (copy) v_u_6, (copy) v_u_4, (copy) v_u_7, (copy) v_u_10
	local v_u_13 = v_u_5(p12, v_u_11)
	local v_u_14, v15 = v_u_9.useState(v_u_13.gui)
	local v16, v_u_17 = v_u_9.useState(false)
	local v_u_18
	if v_u_13.gui then
		v_u_18 = nil
	elseif v_u_14 then
		v_u_18 = v_u_14.Parent
	else
		v_u_18 = v_u_14
	end
	local v19 = v_u_8(v_u_18)
	local v20 = v_u_6()
	local v_u_21 = v_u_9.useCallback(function()
		-- upvalues: (copy) v_u_13, (copy) v_u_17
		if v_u_13.gui == nil then
			v_u_17(true)
		end
	end, { v_u_13.gui })
	local v22
	if v_u_13.gui == nil and v16 then
		v22 = v_u_4()
	else
		v22 = nil
	end
	if v_u_13.gui == nil then
		if v22 == nil then
			v16 = false
		end
	else
		v16 = false
	end
	if v_u_13.gui ~= nil then
		v_u_14 = v_u_13.gui
	end
	if v_u_13.gui ~= nil then
		v_u_18 = v_u_13.gui
	end
	local v23 = v_u_9.useMemo(function()
		-- upvalues: (copy) v_u_21, (copy) v_u_14, (copy) v_u_18
		return {
			["requestOverlay"] = v_u_21,
			["instance"] = v_u_14,
			["screen"] = v_u_18
		}
	end, { v_u_21, v_u_14, v_u_18 })
	local v24 = v_u_9.createElement
	local v25 = v_u_7.Provider
	local v26 = {
		["value"] = v23
	}
	local v27 = {}
	local v28
	if v16 then
		v28 = v_u_10.createPortal(v_u_9.createElement("ScreenGui", {
			["Enabled"] = true,
			["DisplayOrder"] = nil,
			["ZIndexBehavior"] = nil,
			["ScreenInsets"] = nil,
			["SafeAreaCompatibility"] = nil,
			["ClipToDeviceSafeArea"] = false,
			["DisplayOrder"] = v_u_13.DisplayOrder,
			["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling,
			["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets,
			["SafeAreaCompatibility"] = Enum.SafeAreaCompatibility.None
		}, {
			["SafeAreaFrame"] = v_u_9.createElement("Frame", {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["BorderSizePixel"] = 0,
				["ref"] = nil,
				["Size"] = v19,
				["ref"] = v15
			}),
			["FoundationStyleLink"] = v_u_9.createElement("StyleLink", {
				["StyleSheet"] = v20
			})
		}), v22)
	else
		v28 = nil
	end
	v27.FoundationOverlay = v28
	v27.Children = v_u_9.createElement(v_u_9.Fragment, nil, v_u_13.children)
	return v24(v25, v26, v27)
end