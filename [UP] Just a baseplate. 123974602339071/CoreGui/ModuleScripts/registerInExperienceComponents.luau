-- Path: CoreGui.RobloxGui.Modules.ServerDrivenUi.registerInExperienceComponents
local v_u_1 = game:GetService("CorePackages")
return function() -- name: registerInExperienceComponents
	-- upvalues: (copy) v_u_1
	require(v_u_1.Workspace.Packages.SduiSharedContent).registerSharedUiComponents()
	require(v_u_1.Workspace.Packages.SduiFoundation).registerFoundationComponents()
	require(v_u_1.Workspace.Packages.ServerDrivenUi).registerDiscoveryUiComponents()
end