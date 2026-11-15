-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.Responsive.GridConfig
local v1 = script:FindFirstAncestor("Foundation")
local v2 = require(v1.Enums.Breakpoint)
return {
	["columns"] = {
		[v2.XSmall] = 3,
		[v2.Small] = 6,
		[v2.Medium] = 12,
		[v2.Large] = 12,
		[v2.XLarge] = 12,
		[v2.XXLarge] = 12
	},
	["margins"] = {
		[v2.XSmall] = 12,
		[v2.Small] = 20,
		[v2.Medium] = 24,
		[v2.Large] = 24,
		[v2.XLarge] = 32,
		[v2.XXLarge] = 48
	},
	["gutters"] = {
		[v2.XSmall] = 8,
		[v2.Small] = 12,
		[v2.Medium] = 16,
		[v2.Large] = 16,
		[v2.XLarge] = 20,
		[v2.XXLarge] = 20
	},
	["gaps"] = {
		[v2.XSmall] = 8,
		[v2.Small] = 12,
		[v2.Medium] = 16,
		[v2.Large] = 16,
		[v2.XLarge] = 20,
		[v2.XXLarge] = 20
	}
}