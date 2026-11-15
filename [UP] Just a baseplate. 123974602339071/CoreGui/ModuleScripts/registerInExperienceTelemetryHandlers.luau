-- Path: CoreGui.RobloxGui.Modules.ServerDrivenUi.registerInExperienceTelemetryHandlers
local v_u_1 = game:GetService("CorePackages")
return function() -- name: registerInExperienceTelemetryHandlers
	-- upvalues: (copy) v_u_1
	local v2 = require(v_u_1.Workspace.Packages.ServerDrivenUi)
	v2.registerDiscoveryImpressions()
	v2.registerDiscoveryActionTelemetryHandlers()
end