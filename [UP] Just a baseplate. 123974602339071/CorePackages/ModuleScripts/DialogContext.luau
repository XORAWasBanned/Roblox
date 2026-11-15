-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Dialog.DialogContext
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v1.Enums.DialogSize)
return require(v2.React).createContext({
	["size"] = nil,
	["responsiveSize"] = nil,
	["setResponsiveSize"] = nil,
	["hasHeroMedia"] = false,
	["setHasHeroMedia"] = nil,
	["testId"] = "",
	["closeAffordanceRef"] = nil,
	["contentStartRef"] = nil,
	["setContentStartRef"] = nil,
	["size"] = v3.Small,
	["responsiveSize"] = v3.Small,
	["setResponsiveSize"] = function(_) -- name: setResponsiveSize end,
	["setHasHeroMedia"] = function(_) -- name: setHasHeroMedia end,
	["setContentStartRef"] = function(_) -- name: setContentStartRef end
})