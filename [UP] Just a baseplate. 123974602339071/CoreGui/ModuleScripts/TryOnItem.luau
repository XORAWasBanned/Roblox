-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Thunks.TryOnItem
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Thunk)
local v_u_3 = require(v1.Services.Analytics)
local v_u_4 = require(v1.Actions.SetTryingOnInfo)
local v_u_5 = require(v1.Thunks.SendCounter)
local v_u_6 = require(v1.Constants)
local v_u_7 = { v_u_3 }
return function(p_u_8, p_u_9, p_u_10, p_u_11, p_u_12) -- name: TryOnItem
	-- upvalues: (copy) v_u_2, (copy) v_u_7, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6
	return v_u_2.new(script.Name, v_u_7, function(p13, p14)
		-- upvalues: (ref) v_u_3, (copy) p_u_11, (copy) p_u_12, (copy) p_u_9, (ref) v_u_4, (copy) p_u_8, (copy) p_u_10, (ref) v_u_5, (ref) v_u_6
		local v15 = p14[v_u_3]
		local v16, v17
		if p_u_11 then
			v16 = p_u_12
			v17 = "Bundle"
		else
			v16 = p_u_9
			v17 = "Asset"
		end
		v15.reportTryOnButtonClicked(v17, v16)
		p13:dispatch(v_u_4(p_u_8, p_u_9, p_u_10))
		p13:dispatch(v_u_5(v_u_6.Counters.TryOnButtonClicked))
	end)
end