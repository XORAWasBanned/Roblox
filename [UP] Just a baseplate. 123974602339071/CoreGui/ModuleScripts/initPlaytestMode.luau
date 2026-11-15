-- Path: CoreGui.RobloxGui.Modules.TopBar.initPlaytestMode
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("Players")
local v4 = v2:WaitForChild("RobloxGui")
local v_u_5 = require(v1.Workspace.Packages.CoreScriptsRoactCommon.GetPlaytestModeStore)
local v_u_6 = require(v4.Modules.PlayerPermissionsModule)
return function() -- name: initPlaytestMode
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_3
	local v_u_7 = v_u_5(false)
	task.spawn(function()
		-- upvalues: (copy) v_u_7, (ref) v_u_6, (ref) v_u_3
		v_u_7.setHasEditAccess(v_u_6.CanPlayerManagePlaceAsync(v_u_3.LocalPlayer))
	end)
end