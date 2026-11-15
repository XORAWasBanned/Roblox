-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Responsive.Hooks.useViewportBreakpoint
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Enums.Breakpoint)
local v_u_2 = require(v1.Providers.Responsive.Hooks.useBreakpoint)
local v_u_3 = require(v1.Providers.Overlay.useScreen)
return function() -- name: useViewportBreakpoint
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	return v_u_2((v_u_3()))
end