-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.HeaderBar.constants
local v1 = script:FindFirstAncestor("Foundation")
local v2 = require(v1.Constants)
return {
	["LEADING_ACTIONS_LAYOUT_ORDER"] = nil,
	["LEADING_LAYOUT_ORDER"] = 1,
	["CONTENT_LAYOUT_ORDER"] = 2,
	["TRAILING_LAYOUT_ORDER"] = 3,
	["TRAILING_ACTIONS_LAYOUT_ORDER"] = nil,
	["LEADING_ACTIONS_LAYOUT_ORDER"] = v2.MIN_LAYOUT_ORDER,
	["TRAILING_ACTIONS_LAYOUT_ORDER"] = v2.MAX_LAYOUT_ORDER - 1
}