-- Path: CoreGui.RobloxGui.Modules.Common.Hooks.useLocalPlayer
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1.Workspace.Packages.GuiObjectUtils).useProperty
return function() -- name: useLocalPlayer
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	return v_u_3(v_u_2, "LocalPlayer")
end