-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Unibar.ComponentHosts.NineDotNotificationBadge
local v1 = script:FindFirstAncestor("ChromeShared")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v_u_4 = require(v1.Service)
require(v2.Workspace.Packages.Chrome)
local v_u_5 = require(v1.Hooks.useObservableValue)
return function(p6) -- name: NineDotNotificationBadge
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_3
	local v7 = table.clone(p6.iconHostProps)
	v7.showNineDotActivityIndicator = v_u_5(v_u_4:nineDotActivityIndicatorVisible()) == true
	return v_u_3.createElement(p6.NotificationBadge, v7)
end