-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.StudioPanels.PluginPopoverParentContext
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.React)
local v4 = require(v1.Utility.Flags)
local v5 = v3.createContext(v4.FoundationPopoverPluginOverlayMeasurement and {
	["id"] = nil,
	["ready"] = true
} or nil)
v5.displayName = "PluginPopoverParentContext"
return v5