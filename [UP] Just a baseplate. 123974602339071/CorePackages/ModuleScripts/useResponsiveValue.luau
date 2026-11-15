-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Responsive.Hooks.useResponsiveValue
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Enums.Breakpoint)
require(v1.Providers.Responsive.ResponsiveContext)
require(v1.Components.Types)
local v_u_2 = require(script.Parent.useBreakpoint)
local v_u_3 = require(v1.Providers.Responsive.useResponsive)
return function(p4, p5) -- name: useResponsiveValue
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v6 = v_u_2(p4)
	return p5[v_u_3().config.breakpoint.shortNames[v6]]
end