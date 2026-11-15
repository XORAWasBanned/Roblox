-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.OptionSelectorGroup.OptionSelectorGroupContext
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.React)
require(v1.Enums.FillBehavior)
local v4 = require(v1.Enums.OptionSelectorGroupSize)
local v5 = require(v1.Enums.Orientation)
return v3.createContext({
	["value"] = nil,
	["onValueChanged"] = nil,
	["orientation"] = nil,
	["Selectable"] = true,
	["testId"] = "",
	["size"] = nil,
	["fillBehavior"] = nil,
	["onValueChanged"] = function(_) -- name: onValueChanged
		warn("No OptionSelectorGroupProvider found for OptionSelectorGroup")
	end,
	["orientation"] = v5.Vertical,
	["size"] = v4.Medium
})