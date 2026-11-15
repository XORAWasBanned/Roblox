-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Plugin.isPluginElevated
return function(p_u_1) -- name: isPluginElevated
	return pcall(function()
		-- upvalues: (copy) p_u_1
		return p_u_1:GetPluginComponent("Panels")
	end)
end