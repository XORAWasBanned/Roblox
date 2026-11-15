-- Path: CoreGui.RobloxGui.Modules.SelfView.publicApi
local v1 = game:GetService("CoreGui").RobloxGui.Modules
local v_u_2 = require(v1.SelfView.selfViewVisibilityUpdatedSignal)
local v_u_3 = false
return {
	["getSelfViewIsOpenAndVisible"] = function() -- name: getSelfViewIsOpenAndVisible
		-- upvalues: (ref) v_u_3
		return v_u_3
	end,
	["setSelfViewIsOpenAndVisible"] = function(p4) -- name: setSelfViewIsOpenAndVisible
		-- upvalues: (ref) v_u_3, (copy) v_u_2
		v_u_3 = p4
		v_u_2:fire()
	end
}