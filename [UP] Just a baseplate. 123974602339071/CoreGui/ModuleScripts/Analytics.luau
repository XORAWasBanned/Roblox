-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Analytics
local v1 = script:FindFirstAncestor("ChromeShared")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v1.Service.ViewportUtil)
local v_u_4 = require(v1.Hooks.useObservableValue)
local v_u_5 = require(script.ChromeAnalytics)
local v_u_6 = require(v2.Packages.React)
local v_u_7 = require(v2.Workspace.Packages.SharedFlags).GetFFlagUnibarLuaOcclusionMetrics()
local v_u_8 = require(script.OcclusionMetricsManager)
return function(_) -- name: ChromeAnalyticsListener
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_3, (copy) v_u_7, (copy) v_u_6, (copy) v_u_8
	v_u_5.default:setScreenSize((v_u_4(v_u_3.screenSize)))
	if v_u_7 then
		return v_u_6.createElement(v_u_8)
	else
		return nil
	end
end