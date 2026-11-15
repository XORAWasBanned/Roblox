-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalInputGroup.InputGroupContext
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.React)
require(v1.Enums.InputPlacement)
require(v1.Enums.InputSize)
return v3.createContext({
	["size"] = nil,
	["placement"] = nil
})