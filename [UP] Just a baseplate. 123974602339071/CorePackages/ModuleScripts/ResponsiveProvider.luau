-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Responsive.ResponsiveProvider
local v1 = script.Parent
local v2 = script:FindFirstAncestor("Foundation")
local v3 = v2.Parent
local v_u_4 = require(v3.React)
local v5 = require(v2.Utility.Responsive.BreakpointConfig)
local v6 = require(v2.Utility.Responsive.GridConfig)
local v_u_7 = require(v1.ResponsiveContext)
local v_u_8 = require(v2.Utility.withDefaults)
local v_u_9 = {
	["config"] = {
		["breakpoint"] = v5,
		["grid"] = v6
	}
}
return function(p_u_10) -- name: ResponsiveProvider
	-- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_9, (copy) v_u_7
	local v11 = {
		["value"] = v_u_4.useMemo(function()
			-- upvalues: (ref) v_u_8, (copy) p_u_10, (ref) v_u_9
			return {
				["config"] = v_u_8(p_u_10.config or {}, v_u_9.config)
			}
		end, { p_u_10.config })
	}
	return v_u_4.createElement(v_u_7.Provider, v11, p_u_10.children)
end