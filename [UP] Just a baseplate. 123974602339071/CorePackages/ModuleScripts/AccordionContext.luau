-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Accordion.AccordionContext
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v1.Enums.InputPlacement)
local v4 = require(v1.Enums.InputSize)
return require(v2.React).createContext({
	["onAccordionItemActivated"] = nil,
	["itemSize"] = nil,
	["isContained"] = false,
	["chevronPosition"] = nil,
	["testId"] = "",
	["itemSize"] = v4.Medium,
	["chevronPosition"] = v3.End
})