-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.BaseMenu.BaseMenuContext
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.React)
require(v1.Components.Types)
local v4 = require(v1.Enums.InputSize)
return v3.createContext({
	["onActivated"] = nil,
	["onNestedLeafActivated"] = nil,
	["size"] = nil,
	["hasLeading"] = nil,
	["setHasLeading"] = nil,
	["hoverOpenPath"] = nil,
	["hoverOpenAtDepth"] = nil,
	["hoverCloseAtDepth"] = nil,
	["hoverReset"] = nil,
	["depth"] = 1,
	["maxHeight"] = nil,
	["size"] = v4.Medium,
	["hoverOpenPath"] = {}
})