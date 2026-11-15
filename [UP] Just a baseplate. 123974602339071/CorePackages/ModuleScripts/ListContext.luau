-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.List.ListContext
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.React)
local v4 = require(v1.Enums.InputSize)
return v3.createContext({
	["hasDivider"] = false,
	["isContained"] = false,
	["isInset"] = false,
	["hasMargin"] = false,
	["lastLayoutOrder"] = 0,
	["size"] = nil,
	["testId"] = "",
	["size"] = v4.Medium
})