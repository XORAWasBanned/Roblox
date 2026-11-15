-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Responsive.ResponsiveContext
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v1.Utility.Responsive.BreakpointConfig)
local v4 = require(v1.Utility.Responsive.GridConfig)
local v5 = {
	["config"] = {
		["breakpoint"] = v3,
		["grid"] = v4
	}
}
return require(v2.React).createContext(v5)