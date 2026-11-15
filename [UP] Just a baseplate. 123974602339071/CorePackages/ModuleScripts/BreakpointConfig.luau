-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.Responsive.BreakpointConfig
local v1 = script:FindFirstAncestor("Foundation")
local v2 = require(v1.Enums.Breakpoint)
local v3 = require(v1.Enums.BreakpointShortName)
return {
	["shortNames"] = {
		[v2.XSmall] = v3.xs,
		[v2.Small] = v3.sm,
		[v2.Medium] = v3.md,
		[v2.Large] = v3.lg,
		[v2.XLarge] = v3.xl,
		[v2.XXLarge] = v3.xxl
	},
	["widths"] = {
		[v2.XSmall] = 360,
		[v2.Small] = 600,
		[v2.Medium] = 1140,
		[v2.Large] = 1520,
		[v2.XLarge] = 1920,
		[v2.XXLarge] = (1 / 0)
	},
	["order"] = {
		v2.XSmall,
		v2.Small,
		v2.Medium,
		v2.Large,
		v2.XLarge,
		v2.XXLarge
	}
}