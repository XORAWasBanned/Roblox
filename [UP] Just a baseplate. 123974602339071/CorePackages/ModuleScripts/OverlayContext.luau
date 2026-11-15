-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Overlay.OverlayContext
local v1 = script:FindFirstAncestor("Foundation").Parent
return require(v1.React).createContext({
	["requestOverlay"] = nil,
	["instance"] = nil,
	["screen"] = nil,
	["requestOverlay"] = function() -- name: requestOverlay end
})