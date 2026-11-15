-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Foundation.FoundationProvider
local v1 = script.Parent.Parent
local v2 = v1.Parent
local v3 = v2.Parent
local v_u_4 = require(v3.React)
local v_u_5 = require(v3.ReactUtils).ContextStack
local v_u_6 = require(v2.Utility.Flags)
local v_u_7 = require(v1.Cursor)
local v_u_8 = require(v1.Overlay)
local v_u_9 = require(v1.StudioPanels.PanelsProvider)
local v_u_10 = require(v1.Plugin.PluginProvider)
local v_u_11 = require(v1.Preferences.PreferencesProvider)
require(v1.Responsive.ResponsiveContext)
local v_u_12 = require(v1.Responsive.ResponsiveProvider)
local v_u_13 = require(v1.Style.StyleProvider)
require(v2.Components.Types)
local v_u_14 = require(v1.StudioWidgets.WidgetsProvider)
local v_u_15 = require(v1.Elevation.ElevationProvider).ElevationProvider
local v_u_16 = require(v1.Plugin.isPluginElevated)
local v_u_17 = table.freeze({})
return function(p18) -- name: FoundationProvider
	-- upvalues: (copy) v_u_6, (copy) v_u_17, (copy) v_u_4, (copy) v_u_10, (copy) v_u_15, (copy) v_u_11, (copy) v_u_13, (copy) v_u_12, (copy) v_u_8, (copy) v_u_7, (copy) v_u_16, (copy) v_u_14, (copy) v_u_9, (copy) v_u_5
	local v19
	if p18.preferences then
		v19 = p18.preferences
	else
		v19 = not v_u_6.FoundationProviderStableEmptyTable and {} or v_u_17
	end
	local v20
	if p18.responsiveConfig then
		v20 = p18.responsiveConfig
	else
		v20 = not v_u_6.FoundationProviderStableEmptyTable and {} or v_u_17
	end
	local v21 = {}
	local v22 = v_u_4.createElement(v_u_10, {
		["plugin"] = p18.plugin
	})
	local v23 = v_u_4.createElement(v_u_15, nil)
	local v24 = v_u_4.createElement(v_u_11, v19)
	local v25 = v_u_4.createElement(v_u_13, {
		["themeName"] = p18.themeName,
		["colorMode"] = p18.colorMode,
		["theme"] = p18.theme,
		["device"] = p18.device,
		["derives"] = p18.derives,
		["scale"] = v19.scale,
		["tokenOverrides"] = p18.tokenOverrides
	})
	local v26 = v_u_4.createElement(v_u_12, {
		["config"] = v20
	})
	local v27 = v_u_4.createElement
	local v28 = v_u_8
	local v29 = p18.overlayGui
	local v30
	if typeof(v29) == "table" then
		v30 = {
			["DisplayOrder"] = p18.overlayGui.DisplayOrder
		}
	else
		v30 = {
			["gui"] = p18.overlayGui
		}
	end
	__set_list(v21, 1, {v22, v23, v24, v25, v26, v27(v28, v30), v_u_4.createElement(v_u_7)})
	if p18.plugin and v_u_16(p18.plugin) then
		local v31 = v_u_4.createElement
		local v32 = v_u_14
		table.insert(v21, v31(v32, {}))
		local v33 = v_u_4.createElement
		local v34 = v_u_9
		table.insert(v21, v33(v34, {}))
	end
	return v_u_4.createElement(v_u_5, {
		["providers"] = v21
	}, p18.children)
end