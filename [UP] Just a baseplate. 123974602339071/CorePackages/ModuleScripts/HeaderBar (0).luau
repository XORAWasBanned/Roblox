-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.HeaderBar.HeaderBar
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = require(v1.Enums.Breakpoint)
local v_u_5 = require(v1.Components.HeaderBar.HeaderBarContext)
require(v1.Components.Types)
local v_u_6 = require(v1.Components.View)
local v_u_7 = require(v1.Providers.Responsive.Hooks.useViewportBreakpoint)
local v_u_8 = require(v1.Utility.withCommonProps)
local v_u_9 = require(v1.Utility.withDefaults)
local v_u_10 = {
	[v4.XSmall] = "size-full-1400",
	[v4.Small] = "size-full-1400",
	[v4.Medium] = "size-full-1600",
	[v4.Large] = "size-full-1600",
	[v4.XLarge] = "size-full-1800",
	[v4.XXLarge] = "size-full-1800"
}
local v_u_11 = {
	["hasBackground"] = true,
	["testId"] = "--foundation-header-bar"
}
return v_u_3.memo(function(p12) -- name: HeaderBar
	-- upvalues: (copy) v_u_9, (copy) v_u_11, (copy) v_u_7, (copy) v_u_3, (copy) v_u_6, (copy) v_u_8, (copy) v_u_10, (copy) v_u_5
	local v13 = v_u_9(p12, v_u_11)
	local v14 = v_u_7()
	local v15 = v_u_3.createElement
	local v16 = v_u_6
	local v17 = v_u_8
	local v18 = {
		["tag"] = {
			["row flex-between gap-small padding-medium"] = true,
			["bg-surface-0"] = v13.hasBackground,
			[v_u_10[v14]] = true
		}
	}
	return v15(v16, v17(v13, v18), v_u_3.createElement(v_u_5.Provider, {
		["testId"] = v13.testId
	}, v13.children))
end)