-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.MenuIconContext
local v1 = game:GetService("CorePackages")
return require(v1.Packages.React).createContext({
	["menuIconRef"] = nil,
	["replacesAgeRating"] = false
})