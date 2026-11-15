-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Thunks.SendCounter
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Thunk)
local v_u_3 = require(v1.Services.Analytics)
local v_u_4 = { v_u_3 }
return function(p_u_5) -- name: SendCounter
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
	return v_u_2.new(script.Name, v_u_4, function(_, p6)
		-- upvalues: (ref) v_u_3, (copy) p_u_5
		p6[v_u_3].sendCounter(p_u_5)
	end)
end