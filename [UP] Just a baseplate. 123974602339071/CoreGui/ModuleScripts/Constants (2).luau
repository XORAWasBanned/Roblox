-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.MusicUtility.Constants
local v1 = script:FindFirstAncestor("Chrome")
local v2 = require(v1.ChromeShared.Unibar.Constants)
return {
	["MIN_TRACK_DETAILS_WIDTH"] = 48 / v2.ICON_CELL_WIDTH,
	["MAX_TRACK_DETAILS_WIDTH"] = 78 / v2.ICON_CELL_WIDTH,
	["MUSIC_WINDOW_MAX_SIZE"] = Vector2.new(400, 80)
}