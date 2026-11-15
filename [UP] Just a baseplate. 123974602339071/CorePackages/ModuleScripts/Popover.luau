-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Popover
local v1 = require(script.Popover)
local v2 = require(script.Anchor)
require(script.Content)
return {
	["Root"] = v1,
	["Anchor"] = v2,
	["Content"] = require(script.PopoverContentProxy)
}