-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Thunks.ReportPurchaseSuccessUnifiedEvent
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Thunk)
local v_u_3 = require(v1.Services.Analytics)
local v_u_4 = require(v1.Selectors.GetPurchaseAnalyticsOptions)
local v_u_5 = { v_u_3 }
return function(p_u_6, p_u_7, p_u_8) -- name: ReportPurchaseSuccessUnifiedEvent
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_3, (copy) v_u_4
	return v_u_2.new(script.Name, v_u_5, function(p9, p10)
		-- upvalues: (ref) v_u_3, (copy) p_u_7, (copy) p_u_6, (ref) v_u_4, (copy) p_u_8
		p10[v_u_3].reportPurchaseSuccessUnifiedEvent(p_u_7, p_u_6, v_u_4(p9:getState(), p_u_6, p_u_7, p_u_8))
	end)
end