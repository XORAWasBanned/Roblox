-- Path: CorePackages.Packages._Index.Foundation.Foundation.Constants
local v1 = script:FindFirstAncestor("Foundation")
local v2 = require(v1.Enums.ColorNamespace)
require(v1.Components.Types)
local v3 = require(v1.Enums.StateLayerMode)
local v4 = require(v1.Enums.InputPlacement)
local v5 = {
	[v4.Start] = Enum.HorizontalAlignment.Right,
	[v4.End] = Enum.HorizontalAlignment.Left
}
local v6 = {
	[false] = {
		[v2.Color] = v3.Default,
		[v2.Inverse] = v3.Inverse,
		[v2.LightMode] = v3.Light,
		[v2.DarkMode] = v3.Dark
	},
	[true] = {
		[v2.Color] = v3.Inverse,
		[v2.Inverse] = v3.Default,
		[v2.LightMode] = v3.Dark,
		[v2.DarkMode] = v3.Light
	}
}
local v7 = {
	["MAX_LAYOUT_ORDER"] = 2147483648,
	["MIN_LAYOUT_ORDER"] = -2147483648,
	["DISABLED_TRANSPARENCY"] = 0.5,
	["DEFAULT_DELAY_TIME"] = 0.15,
	["DEFAULT_INPUT_FIELD_WIDTH_PIXELS"] = 400,
	["DEFAULT_NUMBER_INPUT_WIDTH"] = 300,
	["TOOLTIP_MAX_WIDTH"] = 280,
	["SHADOW_IMAGE"] = "component_assets/dropshadow_17_8",
	["SHADOW_SIZE"] = 16,
	["PLUGIN_SHADOW_SIZE"] = 4,
	["MODAL"] = nil,
	["COLOR_NAMESPACE_TO_STATE_LAYER_MODE"] = nil,
	["INPUT_PLACEMENT_TO_LABEL_ALIGNMENT"] = nil,
	["BUILDER_SANS_FONT_ASSET"] = "rbxasset://fonts/families/BuilderSans.json"
}
local v8 = {
	["DISABLE_SELECTION"] = {
		["Selectable"] = false
	},
	["TRAP_FOCUS"] = {
		["SelectionBehaviorRight"] = Enum.SelectionBehavior.Stop,
		["SelectionBehaviorLeft"] = Enum.SelectionBehavior.Stop,
		["SelectionBehaviorDown"] = Enum.SelectionBehavior.Stop,
		["SelectionBehaviorUp"] = Enum.SelectionBehavior.Stop
	}
}
v7.MODAL = v8
v7.COLOR_NAMESPACE_TO_STATE_LAYER_MODE = v6
v7.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT = v5
return v7