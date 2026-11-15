-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Thunks.CloseMenu
local v_u_1 = game:GetService("GuiService")
local v2 = script.Parent.Parent
local v_u_3 = require(v2.Actions.SetMenuOpen)
local v_u_4 = require(v2.Utility.SendAnalytics)
local v_u_5 = require(v2.Resources.Constants)
local v_u_6 = require(v2.Actions.SetCurrentPage)
return function(p7)
	-- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4
	v_u_1:SetMenuIsOpen(false, "InGameMenu")
	v_u_1.SelectedCoreObject = nil
	p7:dispatch(v_u_3(false))
	p7:dispatch(v_u_6(v_u_5.InitalPageKey))
	v_u_4(v_u_5.AnalyticsMenuCloseName, v_u_5.AnalyticsMenuActionName, {})
end