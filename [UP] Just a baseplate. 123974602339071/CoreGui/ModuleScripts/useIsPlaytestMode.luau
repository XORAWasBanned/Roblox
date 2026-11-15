-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Hooks.useIsPlaytestMode
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.SignalsReact)
local v_u_3 = require(v1.Workspace.Packages.CoreScriptsRoactCommon.GetPlaytestModeStore)
return function() -- name: useIsPlaytestMode
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v4 = v_u_3(false)
	return v_u_2.useSignalState(v4.getIsPlaytestMode)
end