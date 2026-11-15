-- Path: CoreGui.RobloxGui.Modules.ServerDrivenUi.registerInExperienceActions
local v_u_1 = game:GetService("CorePackages")
return function() -- name: registerInExperienceActions
	-- upvalues: (copy) v_u_1
	require(v_u_1.Workspace.Packages.SduiSharedContent).registerSharedActions()
	require(v_u_1.Workspace.Packages.ServerDrivenUi).registerDiscoveryActions()
end