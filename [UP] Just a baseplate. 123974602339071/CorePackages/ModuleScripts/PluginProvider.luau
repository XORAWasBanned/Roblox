-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Plugin.PluginProvider
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.React)
local v_u_3 = require(script.Parent.PluginContext)
return function(p4) -- name: PluginProvider
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	return v_u_2.createElement(v_u_3.Provider, {
		["value"] = p4.plugin or v_u_2.None
	}, p4.children)
end