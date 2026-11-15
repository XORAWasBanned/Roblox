-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.MockId
local v_u_1 = 0
return function()
	-- upvalues: (ref) v_u_1
	v_u_1 = v_u_1 + 1
	return ("MOCK-%d"):format(v_u_1)
end