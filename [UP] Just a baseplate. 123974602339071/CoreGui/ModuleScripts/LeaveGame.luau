-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Utility.LeaveGame
local v_u_1 = game:GetService("RunService")
local v_u_2 = game:GetService("GuiService")
local v3 = game:GetService("CorePackages")
local v4 = script.Parent.Parent
local v_u_5 = require(v3.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local v_u_6 = require(v4.Utility.SendAnalytics)
local v_u_7 = require(v4.Resources.Constants)
return function()
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_2, (copy) v_u_1, (copy) v_u_5
	v_u_6(v_u_7.AnalyticsInGameMenuName, v_u_7.AnalyticsLeaveGameName, {
		["confirmed"] = v_u_7.AnalyticsConfirmedName
	})
	v_u_2.SelectedCoreObject = nil
	v_u_1.RenderStepped:Wait()
	v_u_1.RenderStepped:Wait()
	game:Shutdown()
	settings().Rendering.QualityLevel = v_u_5()
end