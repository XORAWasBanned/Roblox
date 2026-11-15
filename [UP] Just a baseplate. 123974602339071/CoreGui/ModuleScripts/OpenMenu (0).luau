-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Thunks.OpenMenu
local v_u_1 = game:GetService("GuiService")
local v2 = script.Parent.Parent
local v_u_3 = require(v2.Actions.SetMenuOpen)
local v_u_4 = require(v2.Utility.SendAnalytics)
local v_u_5 = require(v2.Resources.Constants)
local v_u_6 = require(v2.Actions.SetCurrentPage)
local v_u_7 = { v_u_5.ReportDialogKey }
return function(p_u_8, p_u_9)
	-- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_1, (copy) v_u_3, (copy) v_u_6, (copy) v_u_4
	return function(p10)
		-- upvalues: (ref) p_u_9, (ref) v_u_5, (ref) v_u_7, (ref) v_u_1, (ref) v_u_3, (ref) v_u_6, (ref) v_u_4, (copy) p_u_8
		if not p_u_9 then
			p_u_9 = v_u_5.defaultPageKey
		end
		if not table.find(v_u_7, p_u_9) then
			if p_u_9 ~= v_u_5.InitalPageKey then
				v_u_1:SetMenuIsOpen(true, "InGameMenu")
			end
			p10:dispatch(v_u_3(true))
			p10:dispatch(v_u_6(p_u_9))
		end
		local v11 = {
			["source"] = p_u_8
		}
		v_u_4(v_u_5.AnalyticsMenuOpenName, v_u_5.AnalyticsMenuActionName, v11)
	end
end