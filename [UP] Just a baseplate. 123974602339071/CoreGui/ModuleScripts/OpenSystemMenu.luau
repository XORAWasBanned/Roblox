-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Thunks.OpenSystemMenu
local v_u_1 = game:GetService("GuiService")
local v2 = script.Parent.Parent
local v_u_3 = require(v2.Actions.SetMenuOpen)
local v_u_4 = require(v2.Utility.SendAnalytics)
local v_u_5 = require(v2.Resources.Constants)
local v_u_6 = require(v2.Actions.SetCurrentPage)
local v_u_7 = require(v2.Actions.SetMenuIconTooltipOpen)
return function(p_u_8)
	-- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_6, (copy) v_u_5, (copy) v_u_7, (copy) v_u_4
	return function(p9)
		-- upvalues: (ref) v_u_1, (ref) v_u_3, (ref) v_u_6, (ref) v_u_5, (ref) v_u_7, (ref) v_u_4, (copy) p_u_8
		v_u_1:SetMenuIsOpen(true, "InGameMenu")
		p9:dispatch(v_u_3(true))
		p9:dispatch(v_u_6(v_u_5.MainPagePageKey))
		if p9:getState().nativeClosePrompt.menuIconTooltipOpen then
			p9:dispatch(v_u_7(false))
		end
		local v10 = {
			["source"] = p_u_8
		}
		v_u_4(v_u_5.AnalyticsMenuOpenName, v_u_5.AnalyticsMenuActionName, v10)
	end
end