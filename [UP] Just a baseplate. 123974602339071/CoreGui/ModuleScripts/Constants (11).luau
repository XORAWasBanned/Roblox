-- Path: CoreGui.RobloxGui.Modules.Settings.Integrations.Constants
local v1 = script:FindFirstAncestor("Settings")
return {
	["GAMESETTINGS"] = {
		["PAGE_ID"] = "gamesettings",
		["TAB_HEADER"] = nil,
		["LAYOUT_ORDER"] = nil,
		["TAB_HEADER"] = {
			["NAME"] = "GameSettingsTab",
			["TEXT"] = "Settings",
			["ICON"] = "icons/common/settings"
		},
		["LAYOUT_ORDER"] = require(v1.Resources.GameSettingsConstants).SETTINGS_MENU_LAYOUT_ORDER
	},
	["TRAVERSAL_HISTORY"] = {
		["TAB_HEADER"] = {
			["NAME"] = "TraversalHistoryWrapper",
			["TEXT_KEY"] = "CoreScripts.TopBar.Traversal.History"
		}
	}
}