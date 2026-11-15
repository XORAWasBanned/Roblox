-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Plugin.usePlugin
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.React)
local v_u_3 = v_u_2.useContext
local v_u_4 = require(script.Parent.PluginContext)
local v_u_5 = require(script.Parent.isPluginElevated)
return function() -- name: usePlugin
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_2, (copy) v_u_5
	local v6 = v_u_3(v_u_4)
	if v6 and v6 ~= v_u_2.None then
		return v6, v_u_5(v6)
	else
		return nil, false
	end
end