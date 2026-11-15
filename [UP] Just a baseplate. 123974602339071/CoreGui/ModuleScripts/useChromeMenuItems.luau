-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Hooks.useChromeMenuItems
local v1 = script:FindFirstAncestor("ChromeShared")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v1.Service)
require(v2.Workspace.Packages.Chrome)
local v_u_4 = require(v1.Hooks.useObservableValue)
return function()
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	return v_u_4(v_u_3:menuList()) or {}
end